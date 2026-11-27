# 科研数据中心统计 API

## 1. 基本信息

- Controller：`ResearchStatisticsController`
- Base path：`/medical-search-admin/research/statistics`
- Elasticsearch：兼容项目当前 ES 7.x RestHighLevelClient（目标集群为 ES 7.6.2）
- 认证：沿用 Shiro 当前 OAuth2 用户认证；不复用患者检索接口的共享 `X-API-Token`
- 所有接口只返回聚合结果，不返回患者明细或个人标识。

## 2. 通用查询参数

| 参数 | 类型 | 默认值 | 说明 |
|---|---|---|---|
| startDate | yyyy-MM-dd | 不限 | 开始日期，包含当天 |
| endDate | yyyy-MM-dd | 不限 | 结束日期，包含当天 |
| interval | day/week/month | month | 趋势聚合粒度 |
| topSize | 1-50 | 10 | Top N 聚合数量 |

开始日期不能晚于结束日期。日期区间统一按业务时区 Asia/Shanghai 解释，结束日期通过次日零点作为排他上界。

## 3. 接口清单

| 方法 | 路径 | 主要数据源 |
|---|---|---|
| GET | `/overview` | patient、ms_visit_record、各业务索引更新时间 |
| GET | `/visit-trend` | ms_visit_record |
| GET | `/patient-profile` | patient |
| GET | `/empi-operations` | patient |
| GET | `/outpatient-summary` | 门诊挂号、就诊、诊断、处方、收费、结算索引 |
| GET | `/inpatient-summary` | 住院入院、出院、病案首页、诊断、费用索引 |
| GET | `/disease-distribution` | cdr_mz_diagnose_detail、cdr_zy_diagnose_detail |
| GET | `/medical-tech-summary` | 检验、检查、手术、输血、危急值、不良事件、生命体征索引 |

## 4. 统计口径

### overview

- `totalPatients`：`patient.empi_id.keyword` Cardinality 去重。
- `totalVisits`：`ms_visit_record.visit_no.keyword` Cardinality 去重；传入日期范围时按 `visit_date` 过滤。
- `visitStartDate` / `visitEndDate`：就诊主表 `visit_date` 最小/最大值。
- `hospitalCount`：`patient.hospital_id.keyword` Cardinality 去重，不代表接入系统数量。
- `fieldCount`：现有字段元数据中有效、启用展示且未删除的字段数量。
- `lastDataUpdateTime`：已登记业务索引的 `last_update_time` 最大值。

患者总数是全量当前患者口径；总就诊数和时间跨度会受传入日期范围影响。

### visit-trend

按 `ms_visit_record.visit_date` 做 Date Histogram；每个桶分别统计 `visit_no` 和 `patient_id` 的 Cardinality，并按 `visit_type.keyword` 分组。

### patient-profile

以 `patient` 为数据源，过滤 `delete_flag != 1` 且存在 `empi_id`。按性别、所在省市、民族、婚姻状况、职业、医保类型分组，并在每个分组内按 `empi_id` 去重。

当前 `ms_visit_record.age` 是 text，患者索引主要提供 `birth_time` 日期字段，因此本版本不对年龄文本做数值区间聚合；返回 `ageDistributionNote` 说明限制。

### empi-operations

使用 `patient.operate_type` 和 `operate_time`，类型编码为：1 初次导入、2 增量导入、3 创建患者、4 更新患者、5 合并患者、6 拆分患者、7 疑似确认、8 疑似解除。

是否代表历史操作次数取决于 patient 索引是否保留每次操作的历史事件文档；若仅保留患者当前文档，该接口只能反映当前文档中的操作类型分布。

### outpatient-summary

- 挂号：`cdr_mz_register_detail`，按 `register_refund_time` 过滤，展示 `refund_flag` 类型分布。
- 接诊：`cdr_mz_visit_detail`，按 `visit_time` 过滤并排除 `delete_flag=1`；统计 `return_visit`、`visit_status_code`。
- 诊断：`cdr_mz_diagnose_detail`，按 `record_time` 过滤并排除撤销记录。
- 处方：`cdr_mz_recipel_info`，按 `record_time` 过滤，排除 `detail_delete_flag=1`；分别对 `recipel_id` 和 `detail_recipel_detailid` 去重。
- 收费：`cdr_mz_charge_detail`，按 `charge_happentime` 过滤并排除撤销记录；`charge_status=2` 汇总已缴金额，`charge_status=3` 单独展示退费金额。
- 结算：`cdr_mz_settle_detail`，按 `settle_time` 过滤；`settle_status=1` 和 `2` 分别统计收费和退费金额。

### inpatient-summary

- 入院：`cdr_zy_admission_detail.in_hospital_date`。
- 出院：`cdr_zy_dischargereg.out_hospital_date`。
- 病案首页：`cdr_emr_firstpage_medicalrecord` 按出院日期过滤，统计平均住院天数、平均费用、费用总额、ICU、同病种再入院标志、死亡及手术并发症。
- 诊断：`cdr_zy_diagnose_detail.record_time`。
- 住院费用：`cdr_zy_charge_detail.charge_happentime`，已缴金额按 `charge_status=2` 汇总。

平均住院天数和费用以病案首页记录为统计粒度；`same_diag_in=1` 是数据源标记，不等同于基于患者完整就诊轨迹重新计算的再入院率。

### disease-distribution

门诊和住院诊断分开查询，按 `diagnosis_code.keyword` 分组；分别统计诊断名称、`patient_id` 去重患者数、`visit_no` 去重病例数及诊断记录数。两类索引结果不直接相加，避免跨索引患者重复。

### medical-tech-summary

- 检验报告：`cdr_laboratory_report`，按 `report_date` 统计。
- 检验项目异常：`cdr_laboratory_report_detail.abnormal_tips`。
- 检查报告：`cdr_check_report.item_result_flag`。
- 手术：`cdr_surgery_his`，按 `operation_date` 统计，并统计手术级别和并发症。
- 输血：`cdr_emr_blood_transrecord.blood_trans_date`，统计 ABO/Rh 血型分布。
- 危急值：`cdr_criticalvalue_report`，按 `send_time` 统计并分组 `process_step`。
- 不良事件：`cdr_aers_reportcard`，按 `happen_time` 统计并分组 `class_code`。
- 生命体征：`cdr_emr_vitalsigns_measurerecord.record_createdate`，统计体温、脉率、收缩压的测量记录均值。

当前 `transfusion_volume` 是 text，不做输血总量数值汇总。生命体征均值是测量记录均值，不是患者级均值。

## 5. 精度和性能说明

- 首页及分组展示使用 ES Cardinality 聚合，`precision_threshold=40000`，属于近似去重，不能作为要求绝对精确的科研队列最终人数。
- 本版本不把患者 ID 拉回 Java 内存做跨索引关联；门诊、住院分别聚合。
- 所有请求使用 `size=0`，只返回聚合数据。
- 统计使用原始业务索引；不使用 `cdr_medical_search_all*` 综合检索索引，避免 nested 结构及日期字段类型不一致带来的统计偏差。
- 删除标志统一按当前字段定义排除 `delete_flag=1`；各业务状态按对应索引的业务编码分别统计。
- 若需要精确去重，应增加 Composite Aggregation 分页统计接口，或建设科研统计预聚合数据集。

## 6. 后续需要数据侧确认的事项

1. patient 索引是否保存每次 EMPI 操作的历史事件文档。
2. `patient.empi_id` 是否已完成历史合并后的归一化，及空值比例。
3. 业务索引的 `patient_id` 到 `empi_id` 映射如何维护。
4. 如需年龄分布、输血总量、检验结果均值，需要补充数值化字段或标准化数据层。
5. 如需统计 ES 实际入库增量，建议在入库链路统一写入 `_ingested_at`；`last_update_time` 不能替代 ES 入库时间。

