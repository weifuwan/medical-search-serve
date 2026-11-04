



create table CDR_AERS_REPORTCARD
(
    group_code             VARCHAR2(20) not null,
    organization_code      VARCHAR2(20) not null,
    domain_id              VARCHAR2(2) not null,
    unicode                VARCHAR2(30) not null,
    creattime              DATE,
    patient_id             VARCHAR2(20),
    outpatient_no          VARCHAR2(20),
    inpatient_no           VARCHAR2(20),
    visit_times            NUMBER(3),
    visit_no               VARCHAR2(20),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    department_code        VARCHAR2(20),
    department             VARCHAR2(50),
    ward_code              VARCHAR2(20),
    ward                   VARCHAR2(50),
    sickroom_no            VARCHAR2(10),
    bed_no                 VARCHAR2(36),
    report_id              VARCHAR2(100),
    class_code             NUMBER,
    report_time            DATE,
    report_dept_code       VARCHAR2(20),
    report_dept_name       VARCHAR2(50),
    report_ward_code       VARCHAR2(20),
    report_ward_name       VARCHAR2(50),
    reporter_code          VARCHAR2(20),
    reporter_name          VARCHAR2(50),
    duty_nurse_code        VARCHAR2(20),
    duty_nurse_name        VARCHAR2(50),
    happen_time            DATE,
    happen_address         VARCHAR2(200),
    happen_reason          VARCHAR2(1000),
    note                   VARCHAR2(2000),
    nursing_method         VARCHAR2(2000),
    head_nurse_code        VARCHAR2(20),
    head_nurse_name        VARCHAR2(50),
    head_nurse_record      VARCHAR2(400),
    dept_head_nurse_code   VARCHAR2(20),
    dept_head_nurse_name   VARCHAR2(50),
    dept_head_nurse_record VARCHAR2(400),
    verify_oper_code       VARCHAR2(20),
    verify_oper_name       VARCHAR2(50),
    verify_time            DATE,
    oper_time              DATE,
    delete_flag            NUMBER(1),
    last_update_time       DATE,
    extubation_type        VARCHAR2(100)
)
 ;
comment on column CDR_AERS_REPORTCARD.group_code
  is '集团编码';
comment on column CDR_AERS_REPORTCARD.organization_code
  is '组织编码';
comment on column CDR_AERS_REPORTCARD.domain_id
  is '系统域标识';
comment on column CDR_AERS_REPORTCARD.unicode
  is '唯一键';
comment on column CDR_AERS_REPORTCARD.creattime
  is '创建时间';
comment on column CDR_AERS_REPORTCARD.patient_id
  is '患者ID';
comment on column CDR_AERS_REPORTCARD.outpatient_no
  is '门急诊号';
comment on column CDR_AERS_REPORTCARD.inpatient_no
  is '住院号';
comment on column CDR_AERS_REPORTCARD.visit_times
  is '就诊次数';
comment on column CDR_AERS_REPORTCARD.visit_no
  is '就诊流水号';
comment on column CDR_AERS_REPORTCARD.patient_name
  is '患者姓名';
comment on column CDR_AERS_REPORTCARD.age
  is '年龄';
comment on column CDR_AERS_REPORTCARD.department_code
  is '科室编码';
comment on column CDR_AERS_REPORTCARD.department
  is '科室名称';
comment on column CDR_AERS_REPORTCARD.ward_code
  is '病区编码';
comment on column CDR_AERS_REPORTCARD.ward
  is '病区名称';
comment on column CDR_AERS_REPORTCARD.sickroom_no
  is '病房编码';
comment on column CDR_AERS_REPORTCARD.bed_no
  is '病床编码';
comment on column CDR_AERS_REPORTCARD.report_id
  is '报告编码';
comment on column CDR_AERS_REPORTCARD.class_code
  is '不良事件类别代码 1输血相关事件 2药物相关事件 3手术相关事件 4麻醉相关事件 5院内感染事件 6其他医护差错 7医疗设备机械事件 8跌倒事件 9公共意外事件 10治安事件';
comment on column CDR_AERS_REPORTCARD.report_time
  is '上报时间';
comment on column CDR_AERS_REPORTCARD.report_dept_code
  is '上报科室编码';
comment on column CDR_AERS_REPORTCARD.report_dept_name
  is '上报科室名称';
comment on column CDR_AERS_REPORTCARD.report_ward_code
  is '上报病区编码';
comment on column CDR_AERS_REPORTCARD.report_ward_name
  is '上报病区名称';
comment on column CDR_AERS_REPORTCARD.reporter_code
  is '上报人代码';
comment on column CDR_AERS_REPORTCARD.reporter_name
  is '上报人名称';
comment on column CDR_AERS_REPORTCARD.duty_nurse_code
  is '责任护士编码';
comment on column CDR_AERS_REPORTCARD.duty_nurse_name
  is '责任护士名称';
comment on column CDR_AERS_REPORTCARD.happen_time
  is '发生时间';
comment on column CDR_AERS_REPORTCARD.happen_address
  is '发生地点';
comment on column CDR_AERS_REPORTCARD.happen_reason
  is '发生原因';
comment on column CDR_AERS_REPORTCARD.note
  is '事件描述';
comment on column CDR_AERS_REPORTCARD.nursing_method
  is '护理措施及处理方法';
comment on column CDR_AERS_REPORTCARD.head_nurse_code
  is '护士长代码';
comment on column CDR_AERS_REPORTCARD.head_nurse_name
  is '护士长名称';
comment on column CDR_AERS_REPORTCARD.head_nurse_record
  is '护士长记录';
comment on column CDR_AERS_REPORTCARD.dept_head_nurse_code
  is '科护士长编码';
comment on column CDR_AERS_REPORTCARD.dept_head_nurse_name
  is '科护士长名称';
comment on column CDR_AERS_REPORTCARD.dept_head_nurse_record
  is '科护士长记录';
comment on column CDR_AERS_REPORTCARD.verify_oper_code
  is '审核人代码';
comment on column CDR_AERS_REPORTCARD.verify_oper_name
  is '审核人名称';
comment on column CDR_AERS_REPORTCARD.verify_time
  is '审核时间';
comment on column CDR_AERS_REPORTCARD.oper_time
  is '操作时间';
comment on column CDR_AERS_REPORTCARD.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_AERS_REPORTCARD.last_update_time
  is '最后更新时间';
comment on column CDR_AERS_REPORTCARD.extubation_type
  is '拔管类型';

create table CDR_AERS_REPORTCARD_RECORDS
(
    group_code             VARCHAR2(20) not null,
    organization_code      VARCHAR2(20) not null,
    domain_id              VARCHAR2(2) not null,
    unicode                VARCHAR2(30) not null,
    creattime              DATE,
    patient_id             VARCHAR2(20),
    outpatient_no          VARCHAR2(20),
    inpatient_no           VARCHAR2(20),
    visit_times            NUMBER(3),
    visit_no               VARCHAR2(20),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    department_code        VARCHAR2(20),
    department             VARCHAR2(50),
    ward_code              VARCHAR2(20),
    ward                   VARCHAR2(50),
    sickroom_no            VARCHAR2(10),
    bed_no                 VARCHAR2(36),
    report_id              VARCHAR2(100),
    class_code             NUMBER,
    report_time            DATE,
    report_dept_code       VARCHAR2(20),
    report_dept_name       VARCHAR2(50),
    report_ward_code       VARCHAR2(20),
    report_ward_name       VARCHAR2(50),
    reporter_code          VARCHAR2(20),
    reporter_name          VARCHAR2(50),
    duty_nurse_code        VARCHAR2(20),
    duty_nurse_name        VARCHAR2(50),
    happen_time            DATE,
    happen_address         VARCHAR2(200),
    happen_reason          VARCHAR2(1000),
    note                   VARCHAR2(2000),
    nursing_method         VARCHAR2(2000),
    head_nurse_code        VARCHAR2(20),
    head_nurse_name        VARCHAR2(50),
    head_nurse_record      VARCHAR2(400),
    dept_head_nurse_code   VARCHAR2(20),
    dept_head_nurse_name   VARCHAR2(50),
    dept_head_nurse_record VARCHAR2(400),
    verify_oper_code       VARCHAR2(20),
    verify_oper_name       VARCHAR2(50),
    verify_time            DATE,
    oper_time              DATE,
    delete_flag            NUMBER(1),
    last_update_time       DATE,
    extubation_type        VARCHAR2(100)
)
 ;





create table CDR_ALLERGYINFOQUERY
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(10),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(30) not null,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    bedno                 VARCHAR2(20),
    allergic_id           VARCHAR2(10),
    record_doc_code       VARCHAR2(20),
    record_doc            VARCHAR2(50),
    record_dept_code      VARCHAR2(20),
    record_dept           VARCHAR2(50),
    order_id              VARCHAR2(10),
    record_time           DATE,
    allergic_startdate    DATE,
    allergic_enddate      DATE,
    family_allergic       NUMBER,
    allergen_diagnos_code VARCHAR2(20),
    allergen_diagnos      VARCHAR2(200),
    allergencode          VARCHAR2(20),
    allergictype          NUMBER(1),
    memo                  VARCHAR2(200),
    seriousness           NUMBER(1),
    delete_flag           NUMBER(1),
    last_update_time      DATE
)
 ;
comment on column CDR_ALLERGYINFOQUERY.group_code
  is '集团编码';
comment on column CDR_ALLERGYINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_ALLERGYINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_ALLERGYINFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ALLERGYINFOQUERY.patient_id
  is '患者ID';
comment on column CDR_ALLERGYINFOQUERY.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_ALLERGYINFOQUERY.inpatient_no
  is '住院号标识';
comment on column CDR_ALLERGYINFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_ALLERGYINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_ALLERGYINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_ALLERGYINFOQUERY.age
  is '年龄';
comment on column CDR_ALLERGYINFOQUERY.department_code
  is '病人所在科室编码';
comment on column CDR_ALLERGYINFOQUERY.department
  is '病人所在科室';
comment on column CDR_ALLERGYINFOQUERY.ward_code
  is '病人所在病区编码';
comment on column CDR_ALLERGYINFOQUERY.ward
  is '病人所在病区';
comment on column CDR_ALLERGYINFOQUERY.bedno
  is '床号';
comment on column CDR_ALLERGYINFOQUERY.allergic_id
  is '过敏记录ID';
comment on column CDR_ALLERGYINFOQUERY.record_doc_code
  is '记录医生编码';
comment on column CDR_ALLERGYINFOQUERY.record_doc
  is '记录医生';
comment on column CDR_ALLERGYINFOQUERY.record_dept_code
  is '记录科室编码';
comment on column CDR_ALLERGYINFOQUERY.record_dept
  is '记录科室';
comment on column CDR_ALLERGYINFOQUERY.order_id
  is '医嘱号';
comment on column CDR_ALLERGYINFOQUERY.record_time
  is '记录时间';
comment on column CDR_ALLERGYINFOQUERY.allergic_startdate
  is '过敏开始时间';
comment on column CDR_ALLERGYINFOQUERY.allergic_enddate
  is '过敏结束时间';
comment on column CDR_ALLERGYINFOQUERY.family_allergic
  is '是否家族史 0.否，1，是';
comment on column CDR_ALLERGYINFOQUERY.allergen_diagnos_code
  is '过敏诊断编码';
comment on column CDR_ALLERGYINFOQUERY.allergen_diagnos
  is '过敏诊断名称';
comment on column CDR_ALLERGYINFOQUERY.allergencode
  is '过敏原编码';
comment on column CDR_ALLERGYINFOQUERY.allergictype
  is '过敏类型编码 1药物2食物3环境4混合性过敏源5其他过敏源';
comment on column CDR_ALLERGYINFOQUERY.memo
  is '过敏备注';
comment on column CDR_ALLERGYINFOQUERY.seriousness
  is '过敏严重程度编码 1轻度2中度3重度';
comment on column CDR_ALLERGYINFOQUERY.delete_flag
  is '修改标志 0：正常1：撤销';
comment on column CDR_ALLERGYINFOQUERY.last_update_time
  is '最后修改时间';





create table CDR_APPOINTMENT_INFOQUERY
(
    group_code            VARCHAR2(20) not null,
    organization_code     VARCHAR2(20) not null,
    domain_id             VARCHAR2(2) not null,
    inpatient_no          VARCHAR2(36),
    visit_times           NUMBER(3) not null,
    visit_no              VARCHAR2(36) not null,
    patient_id            VARCHAR2(36) not null,
    patient_name          VARCHAR2(20) not null,
    department_code       VARCHAR2(20) not null,
    department            VARCHAR2(50) not null,
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    room_no               VARCHAR2(50),
    bed_no                VARCHAR2(10),
    list_unicode          VARCHAR2(50) not null,
    appoint_type          NUMBER(2) not null,
    applicationno         VARCHAR2(20) not null,
    order_id              VARCHAR2(20) not null,
    appoint_check_name    VARCHAR2(800) not null,
    appoint_time          DATE not null,
    appoint_no            VARCHAR2(50) not null,
    appoint_sortno        VARCHAR2(50) not null,
    appoint_checktime     DATE not null,
    appoint_equip_code    VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept_code     VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    appoint_operator_id   VARCHAR2(50) not null,
    appoint_operator_name VARCHAR2(50) not null,
    appoint_status        NUMBER(1) not null,
    remark                VARCHAR2(100),
    delete_flag           NUMBER(1) not null,
    outpatient_no         VARCHAR2(36),
    last_update_time      DATE
)
 ;
comment on column CDR_APPOINTMENT_INFOQUERY.group_code
  is '集团编码';
comment on column CDR_APPOINTMENT_INFOQUERY.organization_code
  is '组织编码';
comment on column CDR_APPOINTMENT_INFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_APPOINTMENT_INFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_APPOINTMENT_INFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_APPOINTMENT_INFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_APPOINTMENT_INFOQUERY.patient_id
  is '患者id';
comment on column CDR_APPOINTMENT_INFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_APPOINTMENT_INFOQUERY.department_code
  is '病人所在科室编码';
comment on column CDR_APPOINTMENT_INFOQUERY.department
  is '病人所在科室';
comment on column CDR_APPOINTMENT_INFOQUERY.ward_code
  is '病人所在病区编码';
comment on column CDR_APPOINTMENT_INFOQUERY.ward
  is '病人所在病区';
comment on column CDR_APPOINTMENT_INFOQUERY.room_no
  is '病房号';
comment on column CDR_APPOINTMENT_INFOQUERY.bed_no
  is '床位';
comment on column CDR_APPOINTMENT_INFOQUERY.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_type
  is '预约场景 1挂号2手术3检查4检验5收费结算';
comment on column CDR_APPOINTMENT_INFOQUERY.applicationno
  is '申请单号';
comment on column CDR_APPOINTMENT_INFOQUERY.order_id
  is '对应医嘱号';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_check_name
  is '预约项目名称';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_time
  is '预约时间';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_no
  is '预约单流水号';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_sortno
  is '预约排序号';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_checktime
  is '预约检查时间';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_equip_code
  is '预约设备编码';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_equip
  is '预约设备名称';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_dept_code
  is '预约诊室编码';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_dept
  is '预约诊室名称';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_operator_id
  is '预约登记人员编码';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_operator_name
  is '预约登记人员名称';
comment on column CDR_APPOINTMENT_INFOQUERY.appoint_status
  is '预约状态 1未预约 2预约完成 3取消预约 ';
comment on column CDR_APPOINTMENT_INFOQUERY.remark
  is '备注';
comment on column CDR_APPOINTMENT_INFOQUERY.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_APPOINTMENT_INFOQUERY.outpatient_no
  is '门诊号';









create table CDR_BEDCHANGEINFOQUERY
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    inpatient_no      VARCHAR2(36),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(36),
    patient_id        VARCHAR2(36),
    patient_name      VARCHAR2(20),
    current_doctorid  VARCHAR2(20),
    current_doctor    VARCHAR2(50),
    trans_date        DATE,
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    orgbed_code       VARCHAR2(20),
    currentbed_code   VARCHAR2(20),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;
comment on column CDR_BEDCHANGEINFOQUERY.group_code
  is '集团编码';
comment on column CDR_BEDCHANGEINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_BEDCHANGEINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_BEDCHANGEINFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_BEDCHANGEINFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_BEDCHANGEINFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_BEDCHANGEINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_BEDCHANGEINFOQUERY.patient_id
  is '患者id';
comment on column CDR_BEDCHANGEINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_BEDCHANGEINFOQUERY.current_doctorid
  is '操作人工号';
comment on column CDR_BEDCHANGEINFOQUERY.current_doctor
  is '操作人';
comment on column CDR_BEDCHANGEINFOQUERY.trans_date
  is '操作时间';
comment on column CDR_BEDCHANGEINFOQUERY.department_code
  is '病人所在科室编码';
comment on column CDR_BEDCHANGEINFOQUERY.department
  is '病人所在科室';
comment on column CDR_BEDCHANGEINFOQUERY.ward_code
  is '病人所在病区编码';
comment on column CDR_BEDCHANGEINFOQUERY.ward
  is '病人所在病区';
comment on column CDR_BEDCHANGEINFOQUERY.orgbed_code
  is '换前床号';
comment on column CDR_BEDCHANGEINFOQUERY.currentbed_code
  is '换后床号';
comment on column CDR_BEDCHANGEINFOQUERY.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_BEDCHANGEINFOQUERY.last_update_time
  is '最后修改时间';





create table CDR_BEDCHANGEINFOQUERY_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    inpatient_no      VARCHAR2(36),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(36),
    patient_id        VARCHAR2(36),
    patient_name      VARCHAR2(20),
    current_doctorid  VARCHAR2(20),
    current_doctor    VARCHAR2(50),
    trans_date        DATE,
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    orgbed_code       VARCHAR2(20),
    currentbed_code   VARCHAR2(20),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;





create table CDR_BED_EMR
(
    ward_code         NUMBER(18) not null,
    bed_no            VARCHAR2(30) not null,
    room_no           VARCHAR2(30),
    dept_code         NUMBER(18),
    bed_approved_type VARCHAR2(30),
    bed_sex_type      VARCHAR2(30),
    bed_class         VARCHAR2(240),
    bed_status        VARCHAR2(12),
    bed_label         VARCHAR2(153),
    local_bed_code    VARCHAR2(153),
    last_update_time  DATE
)   ;
comment on column CDR_BED_EMR.last_update_time
  is '最后修改时间';





create table CDR_BLOODTRANS_APPINFOQUERY
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    outpatient_no           VARCHAR2(20),
    inpatient_no            VARCHAR2(40),
    patient_id              VARCHAR2(20),
    visit_times             NUMBER(3),
    visit_no                VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              VARCHAR2(1),
    age                     VARCHAR2(30),
    bed_no                  VARCHAR2(50),
    room_no                 VARCHAR2(50),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    diagnosis_code          VARCHAR2(20),
    diagnosis               VARCHAR2(250),
    pressure_systolic       NUMBER,
    pressure_diastolic      NUMBER,
    temperature             NUMBER(2,1),
    pulse                   NUMBER,
    pregnant_no             NUMBER,
    borned_no               NUMBER,
    abo_blood_type          VARCHAR2(10),
    rh_blood_type           VARCHAR2(10),
    illness_current         VARCHAR2(500),
    transfusion_history     VARCHAR2(500),
    applicationno           VARCHAR2(20),
    apply_desc              VARCHAR2(100),
    check_apply_time        DATE,
    author_time             DATE,
    apply_doc_id            VARCHAR2(20),
    apply_doc_name          VARCHAR2(50),
    apply_dept_code         VARCHAR2(20),
    apply_dept              VARCHAR2(50),
    assigned_time           DATE,
    assigned_doc_id         VARCHAR2(20),
    assigned_doc            VARCHAR2(50),
    abo_blood_apply_type    VARCHAR2(10),
    abo_blood_apply         VARCHAR2(50),
    rh_blood_apply_type     VARCHAR2(10),
    rh_blood_apply          VARCHAR2(50),
    blood_collect_location  NUMBER(3),
    transfusion_location    VARCHAR2(36),
    transfusion_purpose     VARCHAR2(36),
    transfusion_urgentflag  NUMBER(3),
    notice                  VARCHAR2(100),
    transfusion_volume_unit VARCHAR2(20),
    transfusion_volume      NUMBER(3),
    exec_statuscode         NUMBER(3),
    delete_flag             NUMBER(1),
    last_update_time        DATE
)
 ;
comment on column CDR_BLOODTRANS_APPINFOQUERY.group_code
  is '集团编码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_BLOODTRANS_APPINFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_BLOODTRANS_APPINFOQUERY.outpatient_no
  is '门急诊号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.patient_id
  is '患者ID';
comment on column CDR_BLOODTRANS_APPINFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_BLOODTRANS_APPINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_BLOODTRANS_APPINFOQUERY.gendercode
  is '性别代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.age
  is '年龄';
comment on column CDR_BLOODTRANS_APPINFOQUERY.bed_no
  is '病床号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.room_no
  is '病房号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.department_code
  is '科室代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.department
  is '科室';
comment on column CDR_BLOODTRANS_APPINFOQUERY.ward_code
  is '病区代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.ward
  is '病区';
comment on column CDR_BLOODTRANS_APPINFOQUERY.diagnosis_code
  is '疾病编码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.diagnosis
  is '疾病名称';
comment on column CDR_BLOODTRANS_APPINFOQUERY.pressure_systolic
  is '患者收缩压';
comment on column CDR_BLOODTRANS_APPINFOQUERY.pressure_diastolic
  is '患者舒张压';
comment on column CDR_BLOODTRANS_APPINFOQUERY.temperature
  is '患者体温';
comment on column CDR_BLOODTRANS_APPINFOQUERY.pulse
  is '患者脉搏';
comment on column CDR_BLOODTRANS_APPINFOQUERY.pregnant_no
  is '孕次';
comment on column CDR_BLOODTRANS_APPINFOQUERY.borned_no
  is '产次';
comment on column CDR_BLOODTRANS_APPINFOQUERY.abo_blood_type
  is '患者ABO血型代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.rh_blood_type
  is '患者RH血型代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.illness_current
  is '病史信息';
comment on column CDR_BLOODTRANS_APPINFOQUERY.transfusion_history
  is '输血史';
comment on column CDR_BLOODTRANS_APPINFOQUERY.applicationno
  is '申请单号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.apply_desc
  is '申请单详细信息';
comment on column CDR_BLOODTRANS_APPINFOQUERY.check_apply_time
  is '申请日期时间';
comment on column CDR_BLOODTRANS_APPINFOQUERY.author_time
  is '开单时间';
comment on column CDR_BLOODTRANS_APPINFOQUERY.apply_doc_id
  is '开单医生工号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.apply_doc_name
  is '开单医生';
comment on column CDR_BLOODTRANS_APPINFOQUERY.apply_dept_code
  is '申请科室编码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.apply_dept
  is '申请科室';
comment on column CDR_BLOODTRANS_APPINFOQUERY.assigned_time
  is '审核日期时间';
comment on column CDR_BLOODTRANS_APPINFOQUERY.assigned_doc_id
  is '审核医生工号';
comment on column CDR_BLOODTRANS_APPINFOQUERY.assigned_doc
  is '审核医生';
comment on column CDR_BLOODTRANS_APPINFOQUERY.abo_blood_apply_type
  is '申请ABO血型代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.abo_blood_apply
  is '申请ABO血型';
comment on column CDR_BLOODTRANS_APPINFOQUERY.rh_blood_apply_type
  is '申请RH血型代码';
comment on column CDR_BLOODTRANS_APPINFOQUERY.rh_blood_apply
  is '申请RH血型';
comment on column CDR_BLOODTRANS_APPINFOQUERY.blood_collect_location
  is '采血标记 0：否/1：是';
comment on column CDR_BLOODTRANS_APPINFOQUERY.transfusion_location
  is '输血地点';
comment on column CDR_BLOODTRANS_APPINFOQUERY.transfusion_purpose
  is '输血目的';
comment on column CDR_BLOODTRANS_APPINFOQUERY.transfusion_urgentflag
  is '输血紧急标志 0：否/1：是';
comment on column CDR_BLOODTRANS_APPINFOQUERY.notice
  is '备注';
comment on column CDR_BLOODTRANS_APPINFOQUERY.transfusion_volume_unit
  is '申请血量单位';
comment on column CDR_BLOODTRANS_APPINFOQUERY.transfusion_volume
  is '申请血量';
comment on column CDR_BLOODTRANS_APPINFOQUERY.exec_statuscode
  is '执行状态 1“已申请”，2“已确认”，3“已备血”，4“科室领用”，5“开始输血”，6“输血结束”，7“退还”，8“撤销”';
comment on column CDR_BLOODTRANS_APPINFOQUERY.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_BLOODTRANS_APPINFOQUERY.last_update_time
  is '最后修改时间';






create table CDR_BLOODTRANS_APPINFOQUERY_RECORDS
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    outpatient_no           VARCHAR2(20),
    inpatient_no            VARCHAR2(40),
    patient_id              VARCHAR2(20),
    visit_times             NUMBER(3),
    visit_no                VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              VARCHAR2(1),
    age                     VARCHAR2(30),
    bed_no                  VARCHAR2(50),
    room_no                 VARCHAR2(50),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    diagnosis_code          VARCHAR2(20),
    diagnosis               VARCHAR2(250),
    pressure_systolic       NUMBER,
    pressure_diastolic      NUMBER,
    temperature             NUMBER(2,1),
    pulse                   NUMBER,
    pregnant_no             NUMBER,
    borned_no               NUMBER,
    abo_blood_type          VARCHAR2(10),
    rh_blood_type           VARCHAR2(10),
    illness_current         VARCHAR2(500),
    transfusion_history     VARCHAR2(500),
    applicationno           VARCHAR2(20),
    apply_desc              VARCHAR2(100),
    check_apply_time        DATE,
    author_time             DATE,
    apply_doc_id            VARCHAR2(20),
    apply_doc_name          VARCHAR2(50),
    apply_dept_code         VARCHAR2(20),
    apply_dept              VARCHAR2(50),
    assigned_time           DATE,
    assigned_doc_id         VARCHAR2(20),
    assigned_doc            VARCHAR2(50),
    abo_blood_apply_type    VARCHAR2(10),
    abo_blood_apply         VARCHAR2(50),
    rh_blood_apply_type     VARCHAR2(10),
    rh_blood_apply          VARCHAR2(50),
    blood_collect_location  NUMBER(3),
    transfusion_location    VARCHAR2(36),
    transfusion_purpose     VARCHAR2(36),
    transfusion_urgentflag  NUMBER(3),
    notice                  VARCHAR2(100),
    transfusion_volume_unit VARCHAR2(20),
    transfusion_volume      NUMBER(3),
    exec_statuscode         NUMBER(3),
    delete_flag             NUMBER(1),
    last_update_time        DATE
) ;





create table CDR_BLOODTRANS_STATUS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30),
    creattime         DATE,
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    applicationno     VARCHAR2(20),
    exec_statuscode   VARCHAR2(20),
    exec_date         DATE,
    exec_doc_code     VARCHAR2(10),
    exec_doc          VARCHAR2(50),
    exec_dept_code    VARCHAR2(50),
    exec_dept         VARCHAR2(50),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;
comment on column CDR_BLOODTRANS_STATUS.group_code
  is '集团编码';
comment on column CDR_BLOODTRANS_STATUS.organization_code
  is '组织编码';
comment on column CDR_BLOODTRANS_STATUS.domain_id
  is '系统域标识';
comment on column CDR_BLOODTRANS_STATUS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_BLOODTRANS_STATUS.creattime
  is '创建时间';
comment on column CDR_BLOODTRANS_STATUS.patient_id
  is '患者ID';
comment on column CDR_BLOODTRANS_STATUS.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_BLOODTRANS_STATUS.inpatient_no
  is '住院号标识';
comment on column CDR_BLOODTRANS_STATUS.visit_times
  is '就诊次数';
comment on column CDR_BLOODTRANS_STATUS.visit_no
  is '就诊流水号';
comment on column CDR_BLOODTRANS_STATUS.patient_name
  is '患者姓名';
comment on column CDR_BLOODTRANS_STATUS.age
  is '年龄';
comment on column CDR_BLOODTRANS_STATUS.department_code
  is '病人所在科室编码';
comment on column CDR_BLOODTRANS_STATUS.department
  is '病人所在科室';
comment on column CDR_BLOODTRANS_STATUS.ward_code
  is '病人所在病区编码';
comment on column CDR_BLOODTRANS_STATUS.ward
  is '病人所在病区';
comment on column CDR_BLOODTRANS_STATUS.sickroom_no
  is '病房编号';
comment on column CDR_BLOODTRANS_STATUS.bed_no
  is '病床号';
comment on column CDR_BLOODTRANS_STATUS.applicationno
  is '用血申请单号';
comment on column CDR_BLOODTRANS_STATUS.exec_statuscode
  is '执行状态 1“已申请”，2“已确认”，3“已备血”，4“科室领用”，5“开始输血”，6“输血结束”，7“退还”，8“撤销”';
comment on column CDR_BLOODTRANS_STATUS.exec_date
  is '执行时间';
comment on column CDR_BLOODTRANS_STATUS.exec_doc_code
  is '执行医生工号';
comment on column CDR_BLOODTRANS_STATUS.exec_doc
  is '执行医生';
comment on column CDR_BLOODTRANS_STATUS.exec_dept_code
  is '执行科室编码';
comment on column CDR_BLOODTRANS_STATUS.exec_dept
  is '执行科室';
comment on column CDR_BLOODTRANS_STATUS.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_BLOODTRANS_STATUS.last_update_time
  is '最后修改时间';





create table CDR_BLOOD_GLUCOSE
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    inpatient_no      VARCHAR2(36),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(36),
    patient_id        VARCHAR2(36),
    patient_name      VARCHAR2(20),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    room_no           VARCHAR2(50),
    bed_no            VARCHAR2(10),
    measure_value     VARCHAR2(50),
    measure_date      VARCHAR2(50),
    measure_time      DATE,
    oprator_id        VARCHAR2(50),
    oprator_name      VARCHAR2(50),
    operate_state     NUMBER(4),
    operate_type      NUMBER(4),
    remark            VARCHAR2(100),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;
comment on column CDR_BLOOD_GLUCOSE.group_code
  is '集团编码';
comment on column CDR_BLOOD_GLUCOSE.organization_code
  is '组织编码';
comment on column CDR_BLOOD_GLUCOSE.domain_id
  is '系统域标识01门诊，02住院，03体检，04急诊';
comment on column CDR_BLOOD_GLUCOSE.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_BLOOD_GLUCOSE.inpatient_no
  is '住院号';
comment on column CDR_BLOOD_GLUCOSE.visit_times
  is '就诊次数';
comment on column CDR_BLOOD_GLUCOSE.visit_no
  is '就诊流水号';
comment on column CDR_BLOOD_GLUCOSE.patient_id
  is '患者ID';
comment on column CDR_BLOOD_GLUCOSE.patient_name
  is '患者姓名';
comment on column CDR_BLOOD_GLUCOSE.department_code
  is '病人所在科室编码';
comment on column CDR_BLOOD_GLUCOSE.department
  is '病人所在科室';
comment on column CDR_BLOOD_GLUCOSE.ward_code
  is '病人所在病区编码';
comment on column CDR_BLOOD_GLUCOSE.ward
  is '病人所在病区';
comment on column CDR_BLOOD_GLUCOSE.room_no
  is '病房号';
comment on column CDR_BLOOD_GLUCOSE.bed_no
  is '床位';
comment on column CDR_BLOOD_GLUCOSE.measure_value
  is '测量值';
comment on column CDR_BLOOD_GLUCOSE.measure_date
  is '测量时段';
comment on column CDR_BLOOD_GLUCOSE.measure_time
  is '测量时间';
comment on column CDR_BLOOD_GLUCOSE.oprator_id
  is '测量人ID';
comment on column CDR_BLOOD_GLUCOSE.oprator_name
  is '测量人姓名';
comment on column CDR_BLOOD_GLUCOSE.operate_state
  is '操作状态 0:未操作1:已操作';
comment on column CDR_BLOOD_GLUCOSE.operate_type
  is '操作类型 1:增加2:修改3:删除';
comment on column CDR_BLOOD_GLUCOSE.remark
  is '备注';
comment on column CDR_BLOOD_GLUCOSE.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_BLOOD_GLUCOSE.last_update_time
  is '最后修改时间';





create table CDR_BLOOD_GLUCOSE_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    inpatient_no      VARCHAR2(36),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(36),
    patient_id        VARCHAR2(36),
    patient_name      VARCHAR2(20),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    room_no           VARCHAR2(50),
    bed_no            VARCHAR2(10),
    measure_value     VARCHAR2(50),
    measure_date      VARCHAR2(50),
    measure_time      DATE,
    oprator_id        VARCHAR2(50),
    oprator_name      VARCHAR2(50),
    operate_state     NUMBER(4),
    operate_type      NUMBER(4),
    remark            VARCHAR2(100),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;





create table CDR_CHECK_APPLYINFO
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    gendercode            VARCHAR2(1),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(500),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    apply_time            DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(80),
    order_id              VARCHAR2(20),
    check_item_code       VARCHAR2(20),
    check_item_name       VARCHAR2(100),
    check_typecode        VARCHAR2(5),
    check_type            VARCHAR2(50),
    check_exec_time       DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    urgentflag            NUMBER,
    charge_status         NUMBER(1),
    apply_state           VARCHAR2(20),
    charge_fee            NUMBER(14,2),
    delete_flag           NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER(1),
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50),
    order_note            VARCHAR2(100),
    observation_no        VARCHAR2(50)
);




















comment on column CDR_CHECK_APPLYINFO.group_code
  is '集团编码';
comment on column CDR_CHECK_APPLYINFO.organization_code
  is '组织编码';
comment on column CDR_CHECK_APPLYINFO.domain_id
  is '系统域标识';
comment on column CDR_CHECK_APPLYINFO.outpatient_no
  is '门急诊号';
comment on column CDR_CHECK_APPLYINFO.inpatient_no
  is '住院号';
comment on column CDR_CHECK_APPLYINFO.patient_id
  is '患者ID';
comment on column CDR_CHECK_APPLYINFO.visit_times
  is '就诊次数';
comment on column CDR_CHECK_APPLYINFO.visit_no
  is '就诊流水号';
comment on column CDR_CHECK_APPLYINFO.patient_name
  is '患者姓名';
comment on column CDR_CHECK_APPLYINFO.age
  is '年龄';
comment on column CDR_CHECK_APPLYINFO.gendercode
  is '性别代码';
comment on column CDR_CHECK_APPLYINFO.bed_no
  is '病床号';
comment on column CDR_CHECK_APPLYINFO.room_no
  is '病房号';
comment on column CDR_CHECK_APPLYINFO.department_code
  is '科室代码';
comment on column CDR_CHECK_APPLYINFO.department
  is '科室';
comment on column CDR_CHECK_APPLYINFO.ward_code
  is '病区代码';
comment on column CDR_CHECK_APPLYINFO.ward
  is '病区';
comment on column CDR_CHECK_APPLYINFO.diagnosis_code
  is '疾病编码';
comment on column CDR_CHECK_APPLYINFO.diagnosis
  is '疾病名称';
comment on column CDR_CHECK_APPLYINFO.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CHECK_APPLYINFO.applicationno
  is '电子申请单编号';
comment on column CDR_CHECK_APPLYINFO.apply_desc
  is '申请单详细内容';
comment on column CDR_CHECK_APPLYINFO.apply_effective_b
  is '申请单有效日期上限';
comment on column CDR_CHECK_APPLYINFO.apply_effective_e
  is '申请单有效日期下限';
comment on column CDR_CHECK_APPLYINFO.apply_time
  is '申请时间';
comment on column CDR_CHECK_APPLYINFO.apply_doc_id
  is '申请医生工号';
comment on column CDR_CHECK_APPLYINFO.apply_doc
  is '申请医生';
comment on column CDR_CHECK_APPLYINFO.apply_dept_code
  is '申请科室编码';
comment on column CDR_CHECK_APPLYINFO.apply_dept
  is '申请科室';
comment on column CDR_CHECK_APPLYINFO.order_id
  is '医嘱ID';
comment on column CDR_CHECK_APPLYINFO.check_item_code
  is '检查类项目编码';
comment on column CDR_CHECK_APPLYINFO.check_item_name
  is '检查项目名称';
comment on column CDR_CHECK_APPLYINFO.check_typecode
  is '检查类型编码';
comment on column CDR_CHECK_APPLYINFO.check_type
  is '检查类型名称';
comment on column CDR_CHECK_APPLYINFO.check_exec_time
  is '执行时间';
comment on column CDR_CHECK_APPLYINFO.exec_dept_code
  is '执行科室编码';
comment on column CDR_CHECK_APPLYINFO.exec_dept
  is '执行科室';
comment on column CDR_CHECK_APPLYINFO.urgentflag
  is '加急标志0:否/1：是';
comment on column CDR_CHECK_APPLYINFO.charge_status
  is '收费状态 1未缴费2已缴费3退费';
comment on column CDR_CHECK_APPLYINFO.apply_state
  is '申请单状态 0,''待检'',1,登记'',2,''已出报告,3,拒绝执行4，取消执行';
comment on column CDR_CHECK_APPLYINFO.charge_fee
  is '检查申请项目费用';
comment on column CDR_CHECK_APPLYINFO.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_CHECK_APPLYINFO.last_update_time
  is '最后修改时间';
comment on column CDR_CHECK_APPLYINFO.appoint_time
  is '预约时间（进行预约的当前时间）';
comment on column CDR_CHECK_APPLYINFO.appoint_operator_id
  is '预约登记人员编码';
comment on column CDR_CHECK_APPLYINFO.appoint_operator_name
  is '预约登记人员名称';
comment on column CDR_CHECK_APPLYINFO.appoint_status
  is '预约状态编码（1未预约 2预约完成 3取消预约  ）';
comment on column CDR_CHECK_APPLYINFO.appoint_checktime
  is '预约检查时间';
comment on column CDR_CHECK_APPLYINFO.appoint_no
  is '预约流水号';
comment on column CDR_CHECK_APPLYINFO.appoint_sortno
  is '预约排序号';
comment on column CDR_CHECK_APPLYINFO.appoint_equip
  is '预约设备名称';
comment on column CDR_CHECK_APPLYINFO.appoint_dept
  is '预约诊室名称（例如:彩超室一，彩超室二）';
comment on column CDR_CHECK_APPLYINFO.ehealth_card
  is '电子健康卡号';
comment on column CDR_CHECK_APPLYINFO.appoint_dept_code
  is '预约诊室编码';
comment on column CDR_CHECK_APPLYINFO.order_note
  is '备注信息';
comment on column CDR_CHECK_APPLYINFO.observation_no
  is '留观号';






create table CDR_CHECK_APPLYINFO_BF
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    gendercode            VARCHAR2(1),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(200),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    apply_time            DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(80),
    order_id              VARCHAR2(20),
    check_item_code       VARCHAR2(20),
    check_item_name       VARCHAR2(100),
    check_typecode        VARCHAR2(5),
    check_type            VARCHAR2(50),
    check_exec_time       DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    urgentflag            NUMBER,
    charge_status         NUMBER(1),
    apply_state           VARCHAR2(20),
    charge_fee            NUMBER(14,2),
    delete_flag           NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER(1),
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100)
)
 ;





create table CDR_CHECK_APPLYINFO_DETAILS
(
    patient_id       VARCHAR2(20),
    applicationno    VARCHAR2(20),
    apply_time       DATE,
    check_item_name  VARCHAR2(150),
    check_site_code  VARCHAR2(30),
    check_site       VARCHAR2(50),
    notice           VARCHAR2(100),
    check_method     VARCHAR2(100),
    last_update_time DATE,
    site_unicode     VARCHAR2(50) not null
);




















comment on column CDR_CHECK_APPLYINFO_DETAILS.patient_id
  is '患者ID';
comment on column CDR_CHECK_APPLYINFO_DETAILS.applicationno
  is '电子申请单编号';
comment on column CDR_CHECK_APPLYINFO_DETAILS.apply_time
  is '申请时间';
comment on column CDR_CHECK_APPLYINFO_DETAILS.check_item_name
  is '检查项目名称';
comment on column CDR_CHECK_APPLYINFO_DETAILS.check_site_code
  is '检查部位编码';
comment on column CDR_CHECK_APPLYINFO_DETAILS.check_site
  is '检查部位名称';
comment on column CDR_CHECK_APPLYINFO_DETAILS.notice
  is '注意事项';
comment on column CDR_CHECK_APPLYINFO_DETAILS.check_method
  is '检查方法，一个部位对应一个方法';
comment on column CDR_CHECK_APPLYINFO_DETAILS.last_update_time
  is '最后修改时间';
comment on column CDR_CHECK_APPLYINFO_DETAILS.site_unicode
  is '唯一行';






create table CDR_CHECK_APPLYINFO_DETAILS_BF
(
    patient_id       VARCHAR2(20),
    applicationno    VARCHAR2(20),
    apply_time       DATE,
    check_item_name  VARCHAR2(150),
    check_site_code  VARCHAR2(30),
    check_site       VARCHAR2(50),
    notice           VARCHAR2(100),
    check_method     VARCHAR2(100),
    last_update_time DATE,
    site_unicode     VARCHAR2(50) not null
)
 ;





create table CDR_CHECK_APPLYINFO_LT_BAK_20240514
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    gendercode            VARCHAR2(1),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(500),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    apply_time            DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(80),
    order_id              VARCHAR2(20),
    check_item_code       VARCHAR2(20),
    check_item_name       VARCHAR2(100),
    check_typecode        VARCHAR2(5),
    check_type            VARCHAR2(50),
    check_exec_time       DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    urgentflag            NUMBER,
    charge_status         NUMBER(1),
    apply_state           VARCHAR2(20),
    charge_fee            NUMBER(14,2),
    delete_flag           NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER(1),
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50),
    order_note            VARCHAR2(100),
    observation_no        VARCHAR2(50)
)
 ;





create table CDR_CHECK_APPLYINFO_RECORDS
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    gendercode            VARCHAR2(1),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(500),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    apply_time            DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(80),
    order_id              VARCHAR2(20),
    check_item_code       VARCHAR2(20),
    check_item_name       VARCHAR2(100),
    check_typecode        VARCHAR2(5),
    check_type            VARCHAR2(50),
    check_exec_time       DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    urgentflag            NUMBER,
    charge_status         NUMBER(1),
    apply_state           VARCHAR2(20),
    charge_fee            NUMBER(14,2),
    delete_flag           NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER(1),
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50),
    order_note            VARCHAR2(100),
    observation_no        VARCHAR2(50)
)
 ;





create table CDR_CHECK_REPORT
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    creattime          DATE,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    sickroom_no        VARCHAR2(10),
    bed_no             VARCHAR2(36),
    applicationno      VARCHAR2(20),
    apply_doc_id       VARCHAR2(20),
    apply_doc          VARCHAR2(50),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    apply_time         DATE,
    report_date        DATE,
    report_doc_code    VARCHAR2(20),
    report_doc         VARCHAR2(50),
    review_doc_code    VARCHAR2(20),
    review_doc         VARCHAR2(50),
    report_no          VARCHAR2(50),
    image_content      CLOB,
    report_order_id    VARCHAR2(50),
    check_item_code    VARCHAR2(20),
    check_item_name    VARCHAR2(800),
    check_typecode     VARCHAR2(20),
    check_type         VARCHAR2(50),
    report_memo        VARCHAR2(200),
    total_times        NUMBER,
    imaging_finding    VARCHAR2(2000),
    imaging_conclusion VARCHAR2(2000),
    diagnosis_code     VARCHAR2(64),
    diagnosis          VARCHAR2(100),
    check_method       VARCHAR2(100),
    exam_doc_code      VARCHAR2(20),
    exam_doc           VARCHAR2(50),
    exam_dept_code     VARCHAR2(20),
    exam_dept          VARCHAR2(50),
    manufacture_rcode  VARCHAR2(20),
    item_result_flag   NUMBER(1),
    item_remarks       VARCHAR2(500),
    delete_flag        NUMBER(1),
    last_update_time   DATE
);




















comment on column CDR_CHECK_REPORT.group_code
  is '集团编码';
comment on column CDR_CHECK_REPORT.organization_code
  is '组织编码';
comment on column CDR_CHECK_REPORT.domain_id
  is '系统域标识';
comment on column CDR_CHECK_REPORT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CHECK_REPORT.creattime
  is '创建时间';
comment on column CDR_CHECK_REPORT.patient_id
  is '患者ID';
comment on column CDR_CHECK_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_CHECK_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_CHECK_REPORT.visit_times
  is '就诊次数';
comment on column CDR_CHECK_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_CHECK_REPORT.patient_name
  is '患者姓名';
comment on column CDR_CHECK_REPORT.age
  is '年龄';
comment on column CDR_CHECK_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_CHECK_REPORT.department
  is '病人所在科室';
comment on column CDR_CHECK_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_CHECK_REPORT.ward
  is '病人所在病区';
comment on column CDR_CHECK_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_CHECK_REPORT.bed_no
  is '病床号';
comment on column CDR_CHECK_REPORT.applicationno
  is '电子申请单编号';
comment on column CDR_CHECK_REPORT.apply_doc_id
  is '申请医生工号';
comment on column CDR_CHECK_REPORT.apply_doc
  is '申请医生';
comment on column CDR_CHECK_REPORT.apply_dept_code
  is '申请科室编码';
comment on column CDR_CHECK_REPORT.apply_dept
  is '申请科室';
comment on column CDR_CHECK_REPORT.apply_time
  is '申请时间';
comment on column CDR_CHECK_REPORT.report_date
  is '报告时间';
comment on column CDR_CHECK_REPORT.report_doc_code
  is '报告医生编码';
comment on column CDR_CHECK_REPORT.report_doc
  is '报告医生';
comment on column CDR_CHECK_REPORT.review_doc_code
  is '审核医生编码';
comment on column CDR_CHECK_REPORT.review_doc
  is '审核医生';
comment on column CDR_CHECK_REPORT.report_no
  is '报告号';
comment on column CDR_CHECK_REPORT.image_content
  is '整张报告图片信息';
comment on column CDR_CHECK_REPORT.report_order_id
  is '检查号';
comment on column CDR_CHECK_REPORT.check_item_code
  is '检查项目编码';
comment on column CDR_CHECK_REPORT.check_item_name
  is '检查项目名称';
comment on column CDR_CHECK_REPORT.check_typecode
  is '检查类型编码';
comment on column CDR_CHECK_REPORT.check_type
  is '检查类型名称';
comment on column CDR_CHECK_REPORT.report_memo
  is '检查备注';
comment on column CDR_CHECK_REPORT.total_times
  is '总测量次数';
comment on column CDR_CHECK_REPORT.imaging_finding
  is '客观所见内容';
comment on column CDR_CHECK_REPORT.imaging_conclusion
  is '主观提示内容';
comment on column CDR_CHECK_REPORT.diagnosis_code
  is '临床诊断代码（主要诊断)';
comment on column CDR_CHECK_REPORT.diagnosis
  is '临床诊断名称（主要诊断）';
comment on column CDR_CHECK_REPORT.check_method
  is '检查方法名称';
comment on column CDR_CHECK_REPORT.exam_doc_code
  is '检查医生编码';
comment on column CDR_CHECK_REPORT.exam_doc
  is '检查医生名称';
comment on column CDR_CHECK_REPORT.exam_dept_code
  is '检查科室编码';
comment on column CDR_CHECK_REPORT.exam_dept
  is '检查科室名称';
comment on column CDR_CHECK_REPORT.manufacture_rcode
  is '仪器型号';
comment on column CDR_CHECK_REPORT.item_result_flag
  is '检查结果标志 1,正常;2,异常9,不确定';
comment on column CDR_CHECK_REPORT.item_remarks
  is '说明';
comment on column CDR_CHECK_REPORT.delete_flag
  is '删除标志 0：正常（选填默认）1：撤销';
comment on column CDR_CHECK_REPORT.last_update_time
  is '最后修改时间';







create table CDR_CHECK_REPORT_BASE64
(
    report_no        VARCHAR2(100),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)
 ;
comment on column CDR_CHECK_REPORT_BASE64.last_update_time
  is '最后修改时间';






create table CDR_CHECK_REPORT_BF
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    creattime          DATE,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    sickroom_no        VARCHAR2(10),
    bed_no             VARCHAR2(36),
    applicationno      VARCHAR2(20),
    apply_doc_id       VARCHAR2(20),
    apply_doc          VARCHAR2(50),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    apply_time         DATE,
    report_date        DATE,
    report_doc_code    VARCHAR2(20),
    report_doc         VARCHAR2(50),
    review_doc_code    VARCHAR2(20),
    review_doc         VARCHAR2(50),
    report_no          VARCHAR2(50),
    image_content      CLOB,
    report_order_id    VARCHAR2(50),
    check_item_code    VARCHAR2(20),
    check_item_name    VARCHAR2(300),
    check_typecode     VARCHAR2(20),
    check_type         VARCHAR2(50),
    report_memo        VARCHAR2(200),
    total_times        NUMBER,
    imaging_finding    VARCHAR2(2000),
    imaging_conclusion VARCHAR2(2000),
    diagnosis_code     VARCHAR2(64),
    diagnosis          VARCHAR2(50),
    check_method       VARCHAR2(100),
    exam_doc_code      VARCHAR2(20),
    exam_doc           VARCHAR2(50),
    exam_dept_code     VARCHAR2(20),
    exam_dept          VARCHAR2(50),
    manufacture_rcode  VARCHAR2(20),
    item_result_flag   NUMBER(1),
    item_remarks       VARCHAR2(500),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;





create table CDR_CHECK_REPORT_RECORDS
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    creattime          DATE,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    sickroom_no        VARCHAR2(10),
    bed_no             VARCHAR2(36),
    applicationno      VARCHAR2(20),
    apply_doc_id       VARCHAR2(20),
    apply_doc          VARCHAR2(50),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    apply_time         DATE,
    report_date        DATE,
    report_doc_code    VARCHAR2(20),
    report_doc         VARCHAR2(50),
    review_doc_code    VARCHAR2(20),
    review_doc         VARCHAR2(50),
    report_no          VARCHAR2(50),
    image_content      CLOB,
    report_order_id    VARCHAR2(50),
    check_item_code    VARCHAR2(20),
    check_item_name    VARCHAR2(800),
    check_typecode     VARCHAR2(20),
    check_type         VARCHAR2(50),
    report_memo        VARCHAR2(200),
    total_times        NUMBER,
    imaging_finding    VARCHAR2(2000),
    imaging_conclusion VARCHAR2(2000),
    diagnosis_code     VARCHAR2(64),
    diagnosis          VARCHAR2(100),
    check_method       VARCHAR2(100),
    exam_doc_code      VARCHAR2(20),
    exam_doc           VARCHAR2(50),
    exam_dept_code     VARCHAR2(20),
    exam_dept          VARCHAR2(50),
    manufacture_rcode  VARCHAR2(20),
    item_result_flag   NUMBER(1),
    item_remarks       VARCHAR2(500),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;





create table CDR_CHECK_STATUS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    creattime         DATE,
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    list_unicode      VARCHAR2(30) not null,
    applicationno     VARCHAR2(20),
    apply_status      VARCHAR2(20),
    modify_date       DATE,
    modify_doc_code   VARCHAR2(10),
    modify_doc        VARCHAR2(50),
    check_doc_code    VARCHAR2(10),
    check_doc         VARCHAR2(50),
    check_date        DATE,
    modify_dept_code  VARCHAR2(10),
    modify_dept       VARCHAR2(50),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;
comment on column CDR_CHECK_STATUS.group_code
  is '集团编码';
comment on column CDR_CHECK_STATUS.organization_code
  is '组织编码';
comment on column CDR_CHECK_STATUS.domain_id
  is '系统域标识';
comment on column CDR_CHECK_STATUS.creattime
  is '创建时间';
comment on column CDR_CHECK_STATUS.patient_id
  is '患者ID';
comment on column CDR_CHECK_STATUS.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_CHECK_STATUS.inpatient_no
  is '住院号标识';
comment on column CDR_CHECK_STATUS.visit_times
  is '就诊次数';
comment on column CDR_CHECK_STATUS.visit_no
  is '就诊流水号';
comment on column CDR_CHECK_STATUS.patient_name
  is '患者姓名';
comment on column CDR_CHECK_STATUS.age
  is '年龄';
comment on column CDR_CHECK_STATUS.department_code
  is '病人所在科室编码';
comment on column CDR_CHECK_STATUS.department
  is '病人所在科室';
comment on column CDR_CHECK_STATUS.ward_code
  is '病人所在病区编码';
comment on column CDR_CHECK_STATUS.ward
  is '病人所在病区';
comment on column CDR_CHECK_STATUS.sickroom_no
  is '病房编号';
comment on column CDR_CHECK_STATUS.bed_no
  is '病床号';
comment on column CDR_CHECK_STATUS.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CHECK_STATUS.applicationno
  is '申请单号';
comment on column CDR_CHECK_STATUS.apply_status
  is '检查状态0 待检 1登记 2已出报告 3拒绝执行 4取消执行';
comment on column CDR_CHECK_STATUS.modify_date
  is '登记日期';
comment on column CDR_CHECK_STATUS.modify_doc_code
  is '登记医生工号';
comment on column CDR_CHECK_STATUS.modify_doc
  is '登记医生';
comment on column CDR_CHECK_STATUS.check_doc_code
  is '检查医生工号';
comment on column CDR_CHECK_STATUS.check_doc
  is '检查医生';
comment on column CDR_CHECK_STATUS.check_date
  is '检查日期';
comment on column CDR_CHECK_STATUS.modify_dept_code
  is '执行科室编码';
comment on column CDR_CHECK_STATUS.modify_dept
  is '执行科室';
comment on column CDR_CHECK_STATUS.delete_flag
  is '修改标志 0正常 1撤销';
comment on column CDR_CHECK_STATUS.last_update_time
  is '最后修改时间';








create table CDR_CLINIC_PATH
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    creattime          DATE,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    sickroom_no        VARCHAR2(10),
    bed_no             VARCHAR2(36),
    path_no            VARCHAR2(20),
    path_name          VARCHAR2(50),
    operation_code     VARCHAR2(20),
    operation_name     VARCHAR2(50),
    in_path_time       DATE,
    out_path_time      DATE,
    exit_time          DATE,
    exit_reason        VARCHAR2(100),
    aberration_time    DATE,
    aberration_reason  VARCHAR2(100),
    evaluation_time    DATE,
    evaluation_results VARCHAR2(100),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;
comment on column CDR_CLINIC_PATH.group_code
  is '集团编码';
comment on column CDR_CLINIC_PATH.organization_code
  is '组织编码';
comment on column CDR_CLINIC_PATH.domain_id
  is '系统域标识';
comment on column CDR_CLINIC_PATH.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CLINIC_PATH.creattime
  is '创建时间';
comment on column CDR_CLINIC_PATH.patient_id
  is '患者ID';
comment on column CDR_CLINIC_PATH.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_CLINIC_PATH.inpatient_no
  is '住院号标识';
comment on column CDR_CLINIC_PATH.visit_times
  is '就诊次数';
comment on column CDR_CLINIC_PATH.visit_no
  is '就诊流水号';
comment on column CDR_CLINIC_PATH.patient_name
  is '患者姓名';
comment on column CDR_CLINIC_PATH.age
  is '年龄';
comment on column CDR_CLINIC_PATH.department_code
  is '病人所在科室编码';
comment on column CDR_CLINIC_PATH.department
  is '病人所在科室';
comment on column CDR_CLINIC_PATH.ward_code
  is '病人所在病区编码';
comment on column CDR_CLINIC_PATH.ward
  is '病人所在病区';
comment on column CDR_CLINIC_PATH.sickroom_no
  is '病房编号';
comment on column CDR_CLINIC_PATH.bed_no
  is '病床号';
comment on column CDR_CLINIC_PATH.path_no
  is '路径ID';
comment on column CDR_CLINIC_PATH.path_name
  is '路径名称';
comment on column CDR_CLINIC_PATH.operation_code
  is '操作医生编码';
comment on column CDR_CLINIC_PATH.operation_name
  is '操作医生名称';
comment on column CDR_CLINIC_PATH.in_path_time
  is '入径时间';
comment on column CDR_CLINIC_PATH.out_path_time
  is '完成时间';
comment on column CDR_CLINIC_PATH.exit_time
  is '退出时间';
comment on column CDR_CLINIC_PATH.exit_reason
  is '退出原因';
comment on column CDR_CLINIC_PATH.aberration_time
  is '变异时间';
comment on column CDR_CLINIC_PATH.aberration_reason
  is '变异原因';
comment on column CDR_CLINIC_PATH.evaluation_time
  is '评估时间';
comment on column CDR_CLINIC_PATH.evaluation_results
  is '评估结果';
comment on column CDR_CLINIC_PATH.delete_flag
  is '修改标志0正常 1撤销';
comment on column CDR_CLINIC_PATH.last_update_time
  is '最后修改时间';





create table CDR_CLINIC_PATH_RECORDS
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    creattime          DATE,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    sickroom_no        VARCHAR2(10),
    bed_no             VARCHAR2(36),
    path_no            VARCHAR2(20),
    path_name          VARCHAR2(50),
    operation_code     VARCHAR2(20),
    operation_name     VARCHAR2(50),
    in_path_time       DATE,
    out_path_time      DATE,
    exit_time          DATE,
    exit_reason        VARCHAR2(100),
    aberration_time    DATE,
    aberration_reason  VARCHAR2(100),
    evaluation_time    DATE,
    evaluation_results VARCHAR2(100),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;





create table CDR_CONFIGURATION
(
    id               NUMBER generated always as identity,
    key              VARCHAR2(50) not null,
    value            VARCHAR2(100) not null,
    create_time      DATE not null,
    update_time      DATE,
    name             VARCHAR2(50),
    type             VARCHAR2(50),
    config_type      VARCHAR2(50),
    description      VARCHAR2(50),
    last_update_time DATE
)   ;
comment on column CDR_CONFIGURATION.id
  is '主键id';
comment on column CDR_CONFIGURATION.key
  is 'key';
comment on column CDR_CONFIGURATION.value
  is 'value';
comment on column CDR_CONFIGURATION.create_time
  is '创建时间';
comment on column CDR_CONFIGURATION.update_time
  is '修改时间';
comment on column CDR_CONFIGURATION.name
  is '属性';
comment on column CDR_CONFIGURATION.type
  is '类型';
comment on column CDR_CONFIGURATION.config_type
  is '字段类型';
comment on column CDR_CONFIGURATION.description
  is '描述';
comment on column CDR_CONFIGURATION.last_update_time
  is '最后修改时间';
 





create table CDR_CONSULTATION_INFOQUERY
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(50),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    bed_no             VARCHAR2(20),
    applicationno      VARCHAR2(20),
    order_id           VARCHAR2(20),
    ordercode          VARCHAR2(20),
    consultation_type  NUMBER(1),
    urgency_code       NUMBER(1),
    illness_descipt    VARCHAR2(100),
    reason             VARCHAR2(500),
    request_time       DATE,
    apply_doc_code     VARCHAR2(20),
    apply_doc          VARCHAR2(50),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    apply_statuscode   NUMBER(1),
    consultation_place VARCHAR2(20),
    consult_org_code   VARCHAR2(20),
    consult_org_name   VARCHAR2(60),
    consult_dept_code  VARCHAR2(20),
    consult_dept       VARCHAR2(50),
    consult_doc_code   VARCHAR2(20),
    consult_doc        VARCHAR2(50),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;
comment on column CDR_CONSULTATION_INFOQUERY.group_code
  is '集团编码';
comment on column CDR_CONSULTATION_INFOQUERY.organization_code
  is '组织编码';
comment on column CDR_CONSULTATION_INFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_CONSULTATION_INFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CONSULTATION_INFOQUERY.patient_id
  is '患者ID';
comment on column CDR_CONSULTATION_INFOQUERY.outpatient_no
  is '门急诊号';
comment on column CDR_CONSULTATION_INFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_CONSULTATION_INFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_CONSULTATION_INFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_CONSULTATION_INFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_CONSULTATION_INFOQUERY.age
  is '年龄';
comment on column CDR_CONSULTATION_INFOQUERY.department_code
  is '科室代码';
comment on column CDR_CONSULTATION_INFOQUERY.department
  is '科室';
comment on column CDR_CONSULTATION_INFOQUERY.ward_code
  is '病区代码';
comment on column CDR_CONSULTATION_INFOQUERY.ward
  is '病区';
comment on column CDR_CONSULTATION_INFOQUERY.bed_no
  is '床号';
comment on column CDR_CONSULTATION_INFOQUERY.applicationno
  is '会诊申请单号';
comment on column CDR_CONSULTATION_INFOQUERY.order_id
  is '会诊医嘱号';
comment on column CDR_CONSULTATION_INFOQUERY.ordercode
  is '医嘱类别编码';
comment on column CDR_CONSULTATION_INFOQUERY.consultation_type
  is '申请类型编码 1、门诊会诊，2、病房会诊，3、急诊会诊，4、院内会诊，5、院外会诊';
comment on column CDR_CONSULTATION_INFOQUERY.urgency_code
  is '紧急程度编码 1,常规会诊，2、急会诊';
comment on column CDR_CONSULTATION_INFOQUERY.illness_descipt
  is '病情简要描述';
comment on column CDR_CONSULTATION_INFOQUERY.reason
  is '申请会诊目的';
comment on column CDR_CONSULTATION_INFOQUERY.request_time
  is '申请时间';
comment on column CDR_CONSULTATION_INFOQUERY.apply_doc_code
  is '申请医生编码';
comment on column CDR_CONSULTATION_INFOQUERY.apply_doc
  is '申请医生';
comment on column CDR_CONSULTATION_INFOQUERY.apply_dept_code
  is '申请科室编码';
comment on column CDR_CONSULTATION_INFOQUERY.apply_dept
  is '申请科室';
comment on column CDR_CONSULTATION_INFOQUERY.apply_statuscode
  is '状态编码 0已申请,1已接受,2完成会诊';
comment on column CDR_CONSULTATION_INFOQUERY.consultation_place
  is '会诊地点';
comment on column CDR_CONSULTATION_INFOQUERY.consult_org_code
  is '接受会诊医院编码';
comment on column CDR_CONSULTATION_INFOQUERY.consult_org_name
  is '接受会诊医院名称';
comment on column CDR_CONSULTATION_INFOQUERY.consult_dept_code
  is '接受会诊科室编码';
comment on column CDR_CONSULTATION_INFOQUERY.consult_dept
  is '接受会诊科室';
comment on column CDR_CONSULTATION_INFOQUERY.consult_doc_code
  is '接受会诊医生编码';
comment on column CDR_CONSULTATION_INFOQUERY.consult_doc
  is '接受会诊医生';
comment on column CDR_CONSULTATION_INFOQUERY.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_CONSULTATION_INFOQUERY.last_update_time
  is '最后修改时间';






create table CDR_CONSULTATION_INFOQUERY_RECORDS
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(50),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    bed_no             VARCHAR2(20),
    applicationno      VARCHAR2(20),
    order_id           VARCHAR2(20),
    ordercode          VARCHAR2(20),
    consultation_type  NUMBER(1),
    urgency_code       NUMBER(1),
    illness_descipt    VARCHAR2(100),
    reason             VARCHAR2(500),
    request_time       DATE,
    apply_doc_code     VARCHAR2(20),
    apply_doc          VARCHAR2(50),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    apply_statuscode   NUMBER(1),
    consultation_place VARCHAR2(20),
    consult_org_code   VARCHAR2(20),
    consult_org_name   VARCHAR2(60),
    consult_dept_code  VARCHAR2(20),
    consult_dept       VARCHAR2(50),
    consult_doc_code   VARCHAR2(20),
    consult_doc        VARCHAR2(50),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;





create table CDR_CONSULTATION_STATUS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30),
    creattime         DATE,
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    applicationno     VARCHAR2(20),
    modify_dept_code  VARCHAR2(10),
    modify_ddept      VARCHAR2(50),
    modify_doc_code   VARCHAR2(10),
    modify_doc        VARCHAR2(50),
    exec_statuscode   NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;
comment on column CDR_CONSULTATION_STATUS.group_code
  is '集团编码';
comment on column CDR_CONSULTATION_STATUS.organization_code
  is '组织编码';
comment on column CDR_CONSULTATION_STATUS.domain_id
  is '系统域标识';
comment on column CDR_CONSULTATION_STATUS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CONSULTATION_STATUS.creattime
  is '创建时间';
comment on column CDR_CONSULTATION_STATUS.patient_id
  is '患者ID';
comment on column CDR_CONSULTATION_STATUS.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_CONSULTATION_STATUS.inpatient_no
  is '住院号标识';
comment on column CDR_CONSULTATION_STATUS.visit_times
  is '就诊次数';
comment on column CDR_CONSULTATION_STATUS.visit_no
  is '就诊流水号';
comment on column CDR_CONSULTATION_STATUS.patient_name
  is '患者姓名';
comment on column CDR_CONSULTATION_STATUS.age
  is '年龄';
comment on column CDR_CONSULTATION_STATUS.department_code
  is '病人所在科室编码';
comment on column CDR_CONSULTATION_STATUS.department
  is '病人所在科室';
comment on column CDR_CONSULTATION_STATUS.ward_code
  is '病人所在病区编码';
comment on column CDR_CONSULTATION_STATUS.ward
  is '病人所在病区';
comment on column CDR_CONSULTATION_STATUS.sickroom_no
  is '病房编号';
comment on column CDR_CONSULTATION_STATUS.bed_no
  is '病床号';
comment on column CDR_CONSULTATION_STATUS.applicationno
  is '会诊申请单号';
comment on column CDR_CONSULTATION_STATUS.modify_dept_code
  is '应答科室编码';
comment on column CDR_CONSULTATION_STATUS.modify_ddept
  is '应答科室';
comment on column CDR_CONSULTATION_STATUS.modify_doc_code
  is '应答医生工号';
comment on column CDR_CONSULTATION_STATUS.modify_doc
  is '应答医生';
comment on column CDR_CONSULTATION_STATUS.exec_statuscode
  is '状态编码 0已申请,1已接受,2完成会诊';
comment on column CDR_CONSULTATION_STATUS.delete_flag
  is '修改标志 0正常 1撤销';
comment on column CDR_CONSULTATION_STATUS.last_update_time
  is '最后修改时间';





create table CDR_CRITICALLY_ILL_PATIENT
(
    patient_id       VARCHAR2(15),
    visit_no         VARCHAR2(15),
    medical_orderid  VARCHAR2(15),
    order_deptcode   VARCHAR2(50),
    order_deptname   VARCHAR2(50),
    exec_statuscode  VARCHAR2(2),
    exec_status      VARCHAR2(30),
    order_creattime  DATE,
    order_stoptime   DATE,
    item_date        INTEGER,
    data_write_time  DATE,
    order_content    VARCHAR2(200),
    order_code       VARCHAR2(10),
    unicode          VARCHAR2(30) not null,
    last_update_time DATE
)   ;
comment on column CDR_CRITICALLY_ILL_PATIENT.patient_id
  is '患者ID';
comment on column CDR_CRITICALLY_ILL_PATIENT.visit_no
  is '就诊流水号';
comment on column CDR_CRITICALLY_ILL_PATIENT.medical_orderid
  is '医嘱号';
comment on column CDR_CRITICALLY_ILL_PATIENT.order_deptcode
  is '医嘱开立科室';
comment on column CDR_CRITICALLY_ILL_PATIENT.order_deptname
  is '医嘱开立科室名称';
comment on column CDR_CRITICALLY_ILL_PATIENT.exec_statuscode
  is '执行状态编码';
comment on column CDR_CRITICALLY_ILL_PATIENT.exec_status
  is '执行状态';
comment on column CDR_CRITICALLY_ILL_PATIENT.order_creattime
  is '医嘱开始时间';
comment on column CDR_CRITICALLY_ILL_PATIENT.order_stoptime
  is '医嘱停止时间';
comment on column CDR_CRITICALLY_ILL_PATIENT.item_date
  is '日期';
comment on column CDR_CRITICALLY_ILL_PATIENT.data_write_time
  is '数据记录时间';
comment on column CDR_CRITICALLY_ILL_PATIENT.order_content
  is '医嘱内容';
comment on column CDR_CRITICALLY_ILL_PATIENT.order_code
  is '医嘱编码';
comment on column CDR_CRITICALLY_ILL_PATIENT.last_update_time
  is '最后修改时间';
        

create table CDR_CRITICALVALUE_REPORT
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    creattime         DATE,
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    content           VARCHAR2(2000),
    send_time         DATE,
    user_id           VARCHAR2(10),
    user_name         VARCHAR2(50),
    incept_dept_code  VARCHAR2(10),
    incept_dept       VARCHAR2(50),
    incept_ward_code  VARCHAR2(10),
    incept_ward       VARCHAR2(50),
    user_group        NUMBER(1),
    message_level     VARCHAR2(5),
    appilicationno    VARCHAR2(50),
    lreport_id        VARCHAR2(50),
    message_type      VARCHAR2(50),
    sender_dept_code  VARCHAR2(10),
    sender_dept       VARCHAR2(50),
    sender_ward_code  VARCHAR2(10),
    sender_ward       VARCHAR2(50),
    process_method    VARCHAR2(200),
    writeemr_flag     NUMBER(1),
    writeyizhu_flag   NUMBER(1),
    process_step      NUMBER(1),
    process_userid    VARCHAR2(10),
    process_user      VARCHAR2(50),
    process_date      DATE,
    incept_type       NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    exam_type         VARCHAR2(50)
)
 ;
comment on column CDR_CRITICALVALUE_REPORT.group_code
  is '集团编码';
comment on column CDR_CRITICALVALUE_REPORT.organization_code
  is '组织编码';
comment on column CDR_CRITICALVALUE_REPORT.domain_id
  is '系统域标识';
comment on column CDR_CRITICALVALUE_REPORT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_CRITICALVALUE_REPORT.creattime
  is '创建时间';
comment on column CDR_CRITICALVALUE_REPORT.patient_id
  is '患者ID';
comment on column CDR_CRITICALVALUE_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_CRITICALVALUE_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_CRITICALVALUE_REPORT.visit_times
  is '就诊次数';
comment on column CDR_CRITICALVALUE_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_CRITICALVALUE_REPORT.patient_name
  is '患者姓名';
comment on column CDR_CRITICALVALUE_REPORT.age
  is '年龄';
comment on column CDR_CRITICALVALUE_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_CRITICALVALUE_REPORT.department
  is '病人所在科室';
comment on column CDR_CRITICALVALUE_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_CRITICALVALUE_REPORT.ward
  is '病人所在病区';
comment on column CDR_CRITICALVALUE_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_CRITICALVALUE_REPORT.bed_no
  is '病床号';
comment on column CDR_CRITICALVALUE_REPORT.content
  is '危急值内容';
comment on column CDR_CRITICALVALUE_REPORT.send_time
  is '发送时间';
comment on column CDR_CRITICALVALUE_REPORT.user_id
  is '接受者ID';
comment on column CDR_CRITICALVALUE_REPORT.user_name
  is '接收者姓名';
comment on column CDR_CRITICALVALUE_REPORT.incept_dept_code
  is '接收者科室编码';
comment on column CDR_CRITICALVALUE_REPORT.incept_dept
  is '接收者科室名称';
comment on column CDR_CRITICALVALUE_REPORT.incept_ward_code
  is '接收者病区编码';
comment on column CDR_CRITICALVALUE_REPORT.incept_ward
  is '接收者病区名称';
comment on column CDR_CRITICALVALUE_REPORT.user_group
  is '用户是否群体 1 是群发  0不是群发';
comment on column CDR_CRITICALVALUE_REPORT.message_level
  is '消息级别 低 中 高';
comment on column CDR_CRITICALVALUE_REPORT.appilicationno
  is '检验/检查申请单号';
comment on column CDR_CRITICALVALUE_REPORT.lreport_id
  is '报告ID';
comment on column CDR_CRITICALVALUE_REPORT.message_type
  is '消息类型';
comment on column CDR_CRITICALVALUE_REPORT.sender_dept_code
  is '发送者科室编码';
comment on column CDR_CRITICALVALUE_REPORT.sender_dept
  is '发送者科室名称';
comment on column CDR_CRITICALVALUE_REPORT.sender_ward_code
  is '发送者病区编码';
comment on column CDR_CRITICALVALUE_REPORT.sender_ward
  is '发送者病区名称';
comment on column CDR_CRITICALVALUE_REPORT.process_method
  is '处理内容';
comment on column CDR_CRITICALVALUE_REPORT.writeemr_flag
  is '是否写EMR 0:未写；1：已写';
comment on column CDR_CRITICALVALUE_REPORT.writeyizhu_flag
  is '是否写医嘱 0:未写；1：已写';
comment on column CDR_CRITICALVALUE_REPORT.process_step
  is '处理阶段 0:未发送，1：已发送，2:已处理';
comment on column CDR_CRITICALVALUE_REPORT.process_userid
  is '处理人编码';
comment on column CDR_CRITICALVALUE_REPORT.process_user
  is '处理人名称';
comment on column CDR_CRITICALVALUE_REPORT.process_date
  is '处理时间  ';
comment on column CDR_CRITICALVALUE_REPORT.incept_type
  is '接收人类型 0,医生 1,护士';
comment on column CDR_CRITICALVALUE_REPORT.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_CRITICALVALUE_REPORT.last_update_time
  is '最后修改时间';
comment on column CDR_CRITICALVALUE_REPORT.exam_type
  is '检查系统类型';





create table CDR_CRITICALVALUE_REPORT_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    creattime         DATE,
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    content           VARCHAR2(2000),
    send_time         DATE,
    user_id           VARCHAR2(10),
    user_name         VARCHAR2(50),
    incept_dept_code  VARCHAR2(10),
    incept_dept       VARCHAR2(50),
    incept_ward_code  VARCHAR2(10),
    incept_ward       VARCHAR2(50),
    user_group        NUMBER(1),
    message_level     VARCHAR2(5),
    appilicationno    VARCHAR2(50),
    lreport_id        VARCHAR2(50),
    message_type      VARCHAR2(50),
    sender_dept_code  VARCHAR2(10),
    sender_dept       VARCHAR2(50),
    sender_ward_code  VARCHAR2(10),
    sender_ward       VARCHAR2(50),
    process_method    VARCHAR2(200),
    writeemr_flag     NUMBER(1),
    writeyizhu_flag   NUMBER(1),
    process_step      NUMBER(1),
    process_userid    VARCHAR2(10),
    process_user      VARCHAR2(50),
    process_date      DATE,
    incept_type       NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    exam_type         VARCHAR2(50)
)
 ;





create table CDR_DESEN_RULES
(
    id              NUMBER generated always as identity,
    decryption_name VARCHAR2(50),
    decryption_code VARCHAR2(50)
)
 ;
comment on column CDR_DESEN_RULES.id
  is '主键id';
comment on column CDR_DESEN_RULES.decryption_name
  is '脱密名称';
comment on column CDR_DESEN_RULES.decryption_code
  is '脱密编码';





create table CDR_DEVICE_REQUISITION_MANAGEMENT
(
    unicode               VARCHAR2(50) not null,
    medication_department VARCHAR2(50),
    amount_money          NUMBER(12,4),
    filling_person        VARCHAR2(50),
    filling_date          DATE,
    check_person          VARCHAR2(50),
    check_date            DATE,
    accounting_date       DATE,
    check_period          VARCHAR2(14),
    abstract              VARCHAR2(500),
    no                    VARCHAR2(50)
)
 ;
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.unicode
  is '唯一主键';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.medication_department
  is '领药部门';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.amount_money
  is '金额';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.filling_person
  is '填制人';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.filling_date
  is '填制时间';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.check_person
  is '审核人';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.check_date
  is '审核时间';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.accounting_date
  is '会计日期';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.check_period
  is '审核期间';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.abstract
  is '摘要';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT.no
  is '领用单号';








create table CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL
(
    unicode            VARCHAR2(50) not null,
    no                 VARCHAR2(50),
    device_information VARCHAR2(200),
    specifications     VARCHAR2(200),
    producer           VARCHAR2(100),
    unit               VARCHAR2(10),
    fill_quantity      NUMBER(8,4),
    actual_quantity    NUMBER(8,4),
    unit_price         NUMBER(12,4),
    amount_money       NUMBER(12,4)
)
 ;
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.unicode
  is '唯一主键';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.no
  is '领用单号和主表进行关联';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.device_information
  is '设备信息';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.specifications
  is '规格';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.producer
  is '生产商';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.unit
  is '单位';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.fill_quantity
  is '填写数量';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.actual_quantity
  is '实际数量';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.unit_price
  is '单价';
comment on column CDR_DEVICE_REQUISITION_MANAGEMENT_DETAIL.amount_money
  is '金额';








create table CDR_DIAGNOSIS_COINCIDENCE
(
    patient_id                    VARCHAR2(20) not null,
    visit_times                   NUMBER,
    diagnostic_compliance_onp     NUMBER,
    diagnostic_compliance_inp     NUMBER,
    diagnostic_compliance_dr      NUMBER,
    diagnostic_compliance_pat     NUMBER,
    diagnostic_compliance_autopsy NUMBER,
    diagnostic_compliance_surgery NUMBER,
    department                    VARCHAR2(50),
    rescuefrequency               NUMBER,
    successtimes                  NUMBER
)   ;
comment on column CDR_DIAGNOSIS_COINCIDENCE.patient_id
  is '患者id';
comment on column CDR_DIAGNOSIS_COINCIDENCE.visit_times
  is '就诊次数';
comment on column CDR_DIAGNOSIS_COINCIDENCE.diagnostic_compliance_onp
  is '门诊与出院 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_DIAGNOSIS_COINCIDENCE.diagnostic_compliance_inp
  is '入院与出院 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_DIAGNOSIS_COINCIDENCE.diagnostic_compliance_dr
  is '放射与病理 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_DIAGNOSIS_COINCIDENCE.diagnostic_compliance_pat
  is '临床与病理 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_DIAGNOSIS_COINCIDENCE.diagnostic_compliance_autopsy
  is '临床与尸检 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_DIAGNOSIS_COINCIDENCE.diagnostic_compliance_surgery
  is '术前与术后 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_DIAGNOSIS_COINCIDENCE.department
  is '科室名称';
comment on column CDR_DIAGNOSIS_COINCIDENCE.rescuefrequency
  is '抢救次数';
comment on column CDR_DIAGNOSIS_COINCIDENCE.successtimes
  is '成功次数';


create table CDR_DOCUMENTREGISTER_MRCLASS
(
    mr_class_code        VARCHAR2(54) not null,
    mr_class_name        VARCHAR2(120),
    mr_class_type        NUMBER(1),
    mr_class_show_order  NUMBER(2),
    parent_mr_class_code VARCHAR2(54),
    ds_code              VARCHAR2(33),
    mr_class_flag        NUMBER(1),
    one_file_flag        NUMBER(1),
    share_file           NUMBER(1),
    master_templet_code  VARCHAR2(75),
    line_space           NUMBER(1),
    font_size            VARCHAR2(30),
    ismr_monitor         NUMBER(1),
    last_update_time     DATE
)    ;
comment on column CDR_DOCUMENTREGISTER_MRCLASS.last_update_time
  is '最后修改时间';





create table CDR_DOCUMENT_REGISTER
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(60) not null,
    creattime             DATE,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    visit_times           NUMBER,
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    sickroom_no           VARCHAR2(10),
    bed_no                VARCHAR2(36),
    file_order_num        VARCHAR2(50),
    file_name             VARCHAR2(100),
    creator_id            VARCHAR2(20),
    creator               VARCHAR2(50),
    mr_class_code         VARCHAR2(20),
    mr_class              VARCHAR2(50),
    doc_base              CLOB,
    create_time           DATE,
    last_modify_doc_code  VARCHAR2(20),
    last_modify_doc       VARCHAR2(50),
    last_modify_date_time DATE,
    delete_flag           NUMBER,
    last_update_time      DATE
);





comment on column CDR_DOCUMENT_REGISTER.group_code
  is '集团编码';
comment on column CDR_DOCUMENT_REGISTER.organization_code
  is '组织编码';
comment on column CDR_DOCUMENT_REGISTER.domain_id
  is '系统域标识，01门诊
02住院
03体检
04急诊';
comment on column CDR_DOCUMENT_REGISTER.unicode
  is '主键';
comment on column CDR_DOCUMENT_REGISTER.creattime
  is '创建时间';
comment on column CDR_DOCUMENT_REGISTER.patient_id
  is '患者ID';
comment on column CDR_DOCUMENT_REGISTER.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_DOCUMENT_REGISTER.inpatient_no
  is '住院号标识';
comment on column CDR_DOCUMENT_REGISTER.visit_times
  is '就诊次数';
comment on column CDR_DOCUMENT_REGISTER.visit_no
  is '就诊流水号';
comment on column CDR_DOCUMENT_REGISTER.patient_name
  is '患者姓名';
comment on column CDR_DOCUMENT_REGISTER.age
  is '年龄， 大于1岁，填写X岁；大于1月不足1岁填写X月X天；
大于1天不足1月填写X天X小时；
不足1天填写X小时X分钟';
comment on column CDR_DOCUMENT_REGISTER.department_code
  is '病人所在科室编码';
comment on column CDR_DOCUMENT_REGISTER.department
  is '病人所在科室';
comment on column CDR_DOCUMENT_REGISTER.ward_code
  is '病人所在病区编码';
comment on column CDR_DOCUMENT_REGISTER.ward
  is '病人所在病区';
comment on column CDR_DOCUMENT_REGISTER.sickroom_no
  is '病房编号';
comment on column CDR_DOCUMENT_REGISTER.bed_no
  is '病床号';
comment on column CDR_DOCUMENT_REGISTER.file_order_num
  is '病历个人排列序号';
comment on column CDR_DOCUMENT_REGISTER.file_name
  is '病历名称';
comment on column CDR_DOCUMENT_REGISTER.creator_id
  is '病历创建人编码';
comment on column CDR_DOCUMENT_REGISTER.creator
  is '病历创建人';
comment on column CDR_DOCUMENT_REGISTER.mr_class_code
  is '病历分类代码';
comment on column CDR_DOCUMENT_REGISTER.mr_class
  is '病历分类名称';
comment on column CDR_DOCUMENT_REGISTER.doc_base
  is 'BASE64编码原始文件';
comment on column CDR_DOCUMENT_REGISTER.create_time
  is '创建时间';
comment on column CDR_DOCUMENT_REGISTER.last_modify_doc_code
  is '最后修改人编码';
comment on column CDR_DOCUMENT_REGISTER.last_modify_doc
  is '最后修改人';
comment on column CDR_DOCUMENT_REGISTER.last_modify_date_time
  is '病历最后修时间';
comment on column CDR_DOCUMENT_REGISTER.delete_flag
  is '修改标志0正常 1撤销';
comment on column CDR_DOCUMENT_REGISTER.last_update_time
  is '最后修改时间';





create table CDR_DOCUMENT_REGISTER_20240126
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(60) not null,
    creattime             DATE,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    visit_times           NUMBER,
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(50),
    age                   VARCHAR2(30),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    sickroom_no           VARCHAR2(10),
    bed_no                VARCHAR2(36),
    file_order_num        VARCHAR2(50),
    file_name             VARCHAR2(100),
    creator_id            VARCHAR2(20),
    creator               VARCHAR2(50),
    mr_class_code         VARCHAR2(20),
    mr_class              VARCHAR2(50),
    doc_base              CLOB,
    create_time           DATE,
    last_modify_doc_code  VARCHAR2(20),
    last_modify_doc       VARCHAR2(50),
    last_modify_date_time DATE,
    delete_flag           NUMBER,
    last_update_time      DATE
)
 ;


create table CDR_DOCUMENT_REGISTER_20240617
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(60) not null,
    creattime             DATE,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    visit_times           NUMBER,
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    sickroom_no           VARCHAR2(10),
    bed_no                VARCHAR2(36),
    file_order_num        VARCHAR2(50),
    file_name             VARCHAR2(100),
    creator_id            VARCHAR2(20),
    creator               VARCHAR2(50),
    mr_class_code         VARCHAR2(20),
    mr_class              VARCHAR2(50),
    doc_base              CLOB,
    create_time           DATE,
    last_modify_doc_code  VARCHAR2(20),
    last_modify_doc       VARCHAR2(50),
    last_modify_date_time DATE,
    delete_flag           NUMBER,
    last_update_time      DATE
)
 ;


create table CDR_DOCUMENT_REGISTER_RECORDS
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(60) not null,
    creattime             DATE,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    visit_times           NUMBER,
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    sickroom_no           VARCHAR2(10),
    bed_no                VARCHAR2(36),
    file_order_num        VARCHAR2(50),
    file_name             VARCHAR2(100),
    creator_id            VARCHAR2(20),
    creator               VARCHAR2(50),
    mr_class_code         VARCHAR2(20),
    mr_class              VARCHAR2(50),
    doc_base              CLOB,
    create_time           DATE,
    last_modify_doc_code  VARCHAR2(20),
    last_modify_doc       VARCHAR2(50),
    last_modify_date_time DATE,
    delete_flag           NUMBER,
    last_update_time      DATE
)
 ;





create table CDR_DRUGINFOQUERY
(
    group_code         VARCHAR2(10),
    organization_code  VARCHAR2(10),
    domain_id          VARCHAR2(2),
    drugin_id          VARCHAR2(10),
    prescription_no    VARCHAR2(20),
    dispenser_id       VARCHAR2(20),
    dispenser          VARCHAR2(50),
    confirmperson_id   VARCHAR2(20),
    confirmperson      VARCHAR2(50),
    confirm_time       DATE,
    dispense_dept_code VARCHAR2(20),
    dispense_dept      VARCHAR2(50),
    list_unicode       VARCHAR2(30) not null,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    last_update_time   DATE
);


comment on column CDR_DRUGINFOQUERY.group_code
  is '集团编码';
comment on column CDR_DRUGINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_DRUGINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_DRUGINFOQUERY.drugin_id
  is '发药记录ID';
comment on column CDR_DRUGINFOQUERY.prescription_no
  is '发药单号';
comment on column CDR_DRUGINFOQUERY.dispenser_id
  is '配药医生编码';
comment on column CDR_DRUGINFOQUERY.dispenser
  is '配药医生';
comment on column CDR_DRUGINFOQUERY.confirmperson_id
  is '发药确认人编码';
comment on column CDR_DRUGINFOQUERY.confirmperson
  is '发药确认人';
comment on column CDR_DRUGINFOQUERY.confirm_time
  is '发药确认时间';
comment on column CDR_DRUGINFOQUERY.dispense_dept_code
  is '发药库房编码';
comment on column CDR_DRUGINFOQUERY.dispense_dept
  is '发药库房';
comment on column CDR_DRUGINFOQUERY.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_DRUGINFOQUERY.patient_id
  is '患者个人信息标识';
comment on column CDR_DRUGINFOQUERY.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_DRUGINFOQUERY.inpatient_no
  is '住院号标识';
comment on column CDR_DRUGINFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_DRUGINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_DRUGINFOQUERY.last_update_time
  is '最后修改时间';




create table CDR_DRUGINFOQUERY_DETAILS
(
    drugin_id        VARCHAR2(10),
    prescription_no  VARCHAR2(20),
    patient_id       VARCHAR2(20),
    confirm_time     DATE,
    druglist_unicode VARCHAR2(30),
    order_id         VARCHAR2(20),
    drug_code        VARCHAR2(20),
    drug_name        VARCHAR2(80),
    batch_no         VARCHAR2(20),
    quantity         NUMBER(10),
    unit             VARCHAR2(20),
    delete_flag      NUMBER(1),
    last_update_time DATE
);



comment on column CDR_DRUGINFOQUERY_DETAILS.drugin_id
  is '发药记录ID';
comment on column CDR_DRUGINFOQUERY_DETAILS.prescription_no
  is '发药单号';
comment on column CDR_DRUGINFOQUERY_DETAILS.patient_id
  is '患者个人信息标识';
comment on column CDR_DRUGINFOQUERY_DETAILS.confirm_time
  is '发药确认时间';
comment on column CDR_DRUGINFOQUERY_DETAILS.druglist_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_DRUGINFOQUERY_DETAILS.order_id
  is '医嘱明细ID/处方明细ID';
comment on column CDR_DRUGINFOQUERY_DETAILS.drug_code
  is '药物编码';
comment on column CDR_DRUGINFOQUERY_DETAILS.drug_name
  is '药物名称';
comment on column CDR_DRUGINFOQUERY_DETAILS.batch_no
  is '批次号';
comment on column CDR_DRUGINFOQUERY_DETAILS.quantity
  is '领药量';
comment on column CDR_DRUGINFOQUERY_DETAILS.unit
  is '药量单位';
comment on column CDR_DRUGINFOQUERY_DETAILS.delete_flag
  is '修改标志0正常 1撤销';
comment on column CDR_DRUGINFOQUERY_DETAILS.last_update_time
  is '最后修改时间';









create table CDR_DRUGINFOQUERY_DETAILS_RECORDS
(
    drugin_id        VARCHAR2(10),
    prescription_no  VARCHAR2(20),
    patient_id       VARCHAR2(20),
    confirm_time     DATE,
    druglist_unicode VARCHAR2(30),
    order_id         VARCHAR2(20),
    drug_code        VARCHAR2(20),
    drug_name        VARCHAR2(80),
    batch_no         VARCHAR2(20),
    quantity         NUMBER(10),
    unit             VARCHAR2(20),
    delete_flag      NUMBER(1),
    last_update_time DATE
)
 ;





create table CDR_DRUGINFOQUERY_RECORDS
(
    group_code         VARCHAR2(10),
    organization_code  VARCHAR2(10),
    domain_id          VARCHAR2(2),
    drugin_id          VARCHAR2(10),
    prescription_no    VARCHAR2(20),
    dispenser_id       VARCHAR2(20),
    dispenser          VARCHAR2(50),
    confirmperson_id   VARCHAR2(20),
    confirmperson      VARCHAR2(50),
    confirm_time       DATE,
    dispense_dept_code VARCHAR2(20),
    dispense_dept      VARCHAR2(50),
    list_unicode       VARCHAR2(30) not null,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    last_update_time   DATE
)
 ;





create table CDR_DRUG_PROCUREMENT_WAREHOUSING
(
    unicode                 VARCHAR2(50) not null,
    no                      VARCHAR2(50),
    supplier                VARCHAR2(100),
    cost_amount             NUMBER(10,2),
    price_amount            NUMBER(10,2),
    price_difference_amount NUMBER(10,2),
    filling_person          VARCHAR2(50),
    filling_date            DATE,
    modify_person           VARCHAR2(50),
    modify_date             DATE,
    check_person            VARCHAR2(50),
    check_date              DATE,
    document_description    VARCHAR2(100),
    abstract                VARCHAR2(100),
    procurement_channels    VARCHAR2(100)
)
 ;
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.unicode
  is '唯一值主键';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.no
  is '入库编号';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.supplier
  is '供应商';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.cost_amount
  is '成本金额';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.price_amount
  is '售价金额';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.price_difference_amount
  is '差价金额';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.filling_person
  is '填制人';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.filling_date
  is '填制时间';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.modify_person
  is '修改人';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.modify_date
  is '修改时间';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.check_person
  is '审核人';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.check_date
  is '审核时间';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.document_description
  is '单据说明';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.abstract
  is '摘要';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING.procurement_channels
  is '采购途径';









create table CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL
(
    unicode             VARCHAR2(100) not null,
    payment_standards   VARCHAR2(100),
    drug_information    VARCHAR2(200),
    country_code        VARCHAR2(200),
    trade_name          VARCHAR2(200),
    drug_source         VARCHAR2(500),
    essential_medicines VARCHAR2(500),
    specifications      VARCHAR2(500),
    producer            VARCHAR2(500),
    batch_number        VARCHAR2(500),
    lose_efficacy_date  DATE,
    amont               NUMBER(12,4),
    unit                VARCHAR2(500),
    cost_price          NUMBER(12,4),
    cost_amount         NUMBER(12,4),
    discount            NUMBER(3),
    price               NUMBER(12,4),
    price_amount        NUMBER(12,4),
    price_difference    NUMBER(8,2),
    approval_number     VARCHAR2(200),
    invoice_number      VARCHAR2(200),
    invoice_code        VARCHAR2(200),
    invoice_date        DATE,
    invoice_value       NUMBER(8,2),
    lading_number       VARCHAR2(100),
    lading_date         DATE,
    no                  VARCHAR2(200)
)
 ;
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.unicode
  is '唯一主键';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.payment_standards
  is '付款标准';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.drug_information
  is '药品信息';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.country_code
  is '国家编码';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.trade_name
  is '商品名';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.drug_source
  is '药品来源';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.essential_medicines
  is '基本药物';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.specifications
  is '规格';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.producer
  is '生产商';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.batch_number
  is '批号';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.lose_efficacy_date
  is '失效期';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.amont
  is '数量';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.unit
  is '单位';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.cost_price
  is '成本价';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.cost_amount
  is '成本金额';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.discount
  is '扣率';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.price
  is '售价';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.price_amount
  is '售价金额';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.price_difference
  is '差价';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.approval_number
  is '批准文号';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.invoice_number
  is '发票号';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.invoice_code
  is '发票代码';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.invoice_date
  is '发票日期';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.invoice_value
  is '发票金额';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.lading_number
  is '随货单号';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.lading_date
  is '随货日期';
comment on column CDR_DRUG_PROCUREMENT_WAREHOUSING_DETAIL.no
  is '入库单号和主表进行关联';



create table CDR_DRUG_PROCUREMENT_WAREHOUSING_RECORDS
(
    unicode                 VARCHAR2(50) not null,
    no                      VARCHAR2(50),
    supplier                VARCHAR2(100),
    cost_amount             NUMBER(10,2),
    price_amount            NUMBER(10,2),
    price_difference_amount NUMBER(10,2),
    filling_person          VARCHAR2(50),
    filling_date            DATE,
    modify_person           VARCHAR2(50),
    modify_date             DATE,
    check_person            VARCHAR2(50),
    check_date              DATE,
    document_description    VARCHAR2(100),
    abstract                VARCHAR2(100),
    procurement_channels    VARCHAR2(100)
)
 ;





create table CDR_DRUG_REQUISITION_MANAGE
(
    unicode               VARCHAR2(50) not null,
    no                    VARCHAR2(50),
    medication_department VARCHAR2(50),
    cost_amount           NUMBER(12,4),
    price_amount          NUMBER(12,4),
    price_difference      NUMBER(8,2),
    filling_person        VARCHAR2(50),
    filling_date          DATE,
    modify_person         VARCHAR2(50),
    modify_date           DATE,
    check_person          VARCHAR2(50),
    check_date            DATE,
    abstract              VARCHAR2(500),
    medication_method     VARCHAR2(100)
)
 ;
comment on column CDR_DRUG_REQUISITION_MANAGE.unicode
  is '唯一主键';
comment on column CDR_DRUG_REQUISITION_MANAGE.no
  is '单号';
comment on column CDR_DRUG_REQUISITION_MANAGE.medication_department
  is '领药部门';
comment on column CDR_DRUG_REQUISITION_MANAGE.cost_amount
  is '成本金额';
comment on column CDR_DRUG_REQUISITION_MANAGE.price_amount
  is '销售金额';
comment on column CDR_DRUG_REQUISITION_MANAGE.price_difference
  is '差价金额';
comment on column CDR_DRUG_REQUISITION_MANAGE.filling_person
  is '填制人';
comment on column CDR_DRUG_REQUISITION_MANAGE.filling_date
  is '填制时间';
comment on column CDR_DRUG_REQUISITION_MANAGE.modify_person
  is '修改人';
comment on column CDR_DRUG_REQUISITION_MANAGE.modify_date
  is '修改时间';
comment on column CDR_DRUG_REQUISITION_MANAGE.check_person
  is '审核人';
comment on column CDR_DRUG_REQUISITION_MANAGE.check_date
  is '审核时间';
comment on column CDR_DRUG_REQUISITION_MANAGE.abstract
  is '摘要';
comment on column CDR_DRUG_REQUISITION_MANAGE.medication_method
  is '领药方式';








create table CDR_DRUG_REQUISITION_MANAGE_DETAIL
(
    unicode             VARCHAR2(50) not null,
    drug_information    VARCHAR2(200),
    country_code        VARCHAR2(100),
    trade_name          VARCHAR2(100),
    drug_source         VARCHAR2(100),
    essential_medicines VARCHAR2(50),
    specifications      VARCHAR2(200),
    producer            VARCHAR2(100),
    country_origin      VARCHAR2(100),
    batch_number        VARCHAR2(50),
    lose_efficacy_date  DATE,
    fill_quantity       NUMBER(8,4),
    actual_quantity     NUMBER(8,4),
    unit                VARCHAR2(10),
    cost_price          NUMBER(12,4),
    cost_amount         NUMBER(12,4),
    price               NUMBER(12,4),
    price_amount        NUMBER(12,4),
    price_difference    NUMBER(8,2),
    warehouse_location  VARCHAR2(20),
    no                  VARCHAR2(50)
)
 ;
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.unicode
  is '明细表主键，唯一值';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.drug_information
  is '药品信息';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.country_code
  is '国家编码';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.trade_name
  is '商品名';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.drug_source
  is '药品来源';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.essential_medicines
  is '基本药物';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.specifications
  is '规格';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.producer
  is '生产商';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.country_origin
  is '原产地';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.batch_number
  is '批号';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.lose_efficacy_date
  is '失效期';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.fill_quantity
  is '填写数量';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.actual_quantity
  is '实际数量';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.unit
  is '单位';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.cost_price
  is '成本价';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.cost_amount
  is '成本金额';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.price
  is '售价';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.price_amount
  is '售价金额';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.price_difference
  is '差价';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.warehouse_location
  is '库房货位';
comment on column CDR_DRUG_REQUISITION_MANAGE_DETAIL.no
  is '编号，和主表进行关联';








create table CDR_DRUG_REQUISITION_MANAGE_RECORDS
(
    unicode               VARCHAR2(50) not null,
    no                    VARCHAR2(50),
    medication_department VARCHAR2(50),
    cost_amount           NUMBER(12,4),
    price_amount          NUMBER(12,4),
    price_difference      NUMBER(8,2),
    filling_person        VARCHAR2(50),
    filling_date          DATE,
    modify_person         VARCHAR2(50),
    modify_date           DATE,
    check_person          VARCHAR2(50),
    check_date            DATE,
    abstract              VARCHAR2(500),
    medication_method     VARCHAR2(100)
)
 ;





create table CDR_ELECTROCARDIOGRAM_REPORT
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    creattime          DATE,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    sickroom_no        VARCHAR2(10),
    bed_no             VARCHAR2(36),
    applicationno      VARCHAR2(20),
    apply_doc_id       VARCHAR2(20),
    apply_doc          VARCHAR2(50),
    apply_dept_code    VARCHAR2(20),
    apply_deptment     VARCHAR2(50),
    apply_time         DATE,
    register_time      DATE,
    register_id        VARCHAR2(20),
    register           VARCHAR2(50),
    check_exec_time    DATE,
    report_date        DATE,
    report_doc_code    VARCHAR2(20),
    report_doc_name    VARCHAR2(50),
    review_doc_code    VARCHAR2(20),
    review_doc_name    VARCHAR2(50),
    report_no          VARCHAR2(50),
    image_content      LONG,
    report_order_id    VARCHAR2(50),
    take_medicine      VARCHAR2(20),
    check_item_code    VARCHAR2(20),
    check_item_name    VARCHAR2(100),
    check_typecode     VARCHAR2(20),
    check_type         VARCHAR2(50),
    report_memo        VARCHAR2(200),
    imaging_finding    VARCHAR2(500),
    imaging_conclusion VARCHAR2(500),
    diagnosis_code     VARCHAR2(64),
    diagnosis          VARCHAR2(50),
    diag_doc_code      VARCHAR2(20),
    diag_doc_name      VARCHAR2(50),
    diag_info          VARCHAR2(200),
    check_method       VARCHAR2(100),
    exam_doc_code      VARCHAR2(20),
    exam_doc_name      VARCHAR2(50),
    exam_dept          VARCHAR2(20),
    exam_dept_name     VARCHAR2(50),
    exam_date          DATE,
    manufacture_rcode  VARCHAR2(20),
    item_result_flag   NUMBER(1),
    item_remarks       VARCHAR2(500),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;
comment on column CDR_ELECTROCARDIOGRAM_REPORT.group_code
  is '集团编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.organization_code
  is '组织编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.domain_id
  is '系统域标识';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.creattime
  is '创建时间';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.patient_id
  is '患者ID';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.visit_times
  is '就诊次数';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.patient_name
  is '患者姓名';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.age
  is '年龄';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.department
  is '病人所在科室';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.ward
  is '病人所在病区';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.bed_no
  is '病床号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.applicationno
  is '电子申请·单编号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.apply_doc_id
  is '申请医生工号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.apply_doc
  is '申请医生';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.apply_dept_code
  is '申请科室编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.apply_deptment
  is '申请科室';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.apply_time
  is '申请时间';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.register_time
  is '检查登记时间';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.register_id
  is '检查登记人编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.register
  is '检查登记人';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.check_exec_time
  is '执行时间';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.report_date
  is '报告时间';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.report_doc_code
  is '报告医生编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.report_doc_name
  is '报告医生';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.review_doc_code
  is '审核医生编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.review_doc_name
  is '审核医生';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.report_no
  is '报告号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.image_content
  is '整张报告图片信息';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.report_order_id
  is '检查号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.take_medicine
  is '服用降压药情况';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.check_item_code
  is '检查项目编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.check_item_name
  is '检查项目名称';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.check_typecode
  is '检查类型编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.check_type
  is '检查类型名称';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.report_memo
  is '检查备注';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.imaging_finding
  is '客观所见内容';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.imaging_conclusion
  is '主观提示内容';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.diagnosis_code
  is '临床诊断代码（主要诊断)';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.diagnosis
  is '临床诊断名称（主要诊断）';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.diag_doc_code
  is '诊断医生编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.diag_doc_name
  is '诊断医生';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.diag_info
  is '其它诊断意见';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.check_method
  is '检查方法名称';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.exam_doc_code
  is '检查医生编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.exam_doc_name
  is '检查医生名称';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.exam_dept
  is '检查科室编码';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.exam_dept_name
  is '检查科室名称';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.exam_date
  is '检查时间';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.manufacture_rcode
  is '仪器型号';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.item_result_flag
  is '检查结果标志 1,正常;2,异常9,不确定';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.item_remarks
  is '说明';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.delete_flag
  is '删除标志 0：正常（选填默认）1：撤销';
comment on column CDR_ELECTROCARDIOGRAM_REPORT.last_update_time
  is '最后修改时间';






create table CDR_ELECTROCARDIOGRAM_REPORT_BASE64
(
    report_no        VARCHAR2(100),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)
 ;
comment on column CDR_ELECTROCARDIOGRAM_REPORT_BASE64.last_update_time
  is '最后修改时间';






create table CDR_EMR_ADMISSIONRECORD
(
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    unicode                  VARCHAR2(50) not null,
    patient_id               VARCHAR2(36),
    visit_no                 VARCHAR2(36),
    visittimes               INTEGER,
    inpatient_no             VARCHAR2(36),
    patient_name             VARCHAR2(20),
    age                      VARCHAR2(20),
    bed_no                   VARCHAR2(20),
    room_no                  VARCHAR2(20),
    dept_no                  VARCHAR2(20),
    dept_name                VARCHAR2(50),
    ward_no                  VARCHAR2(20),
    ward_name                VARCHAR2(50),
    record_createdate        DATE,
    record_personid          VARCHAR2(20),
    record_person            VARCHAR2(50),
    address                  VARCHAR2(150),
    addr_road                VARCHAR2(200),
    addr_street              VARCHAR2(100),
    addr_area                VARCHAR2(100),
    addr_city                VARCHAR2(100),
    addr_province            VARCHAR2(100),
    gendercode               INTEGER,
    marrystatuscode          VARCHAR2(2),
    marrystatus              VARCHAR2(50),
    nation_code              VARCHAR2(2),
    nation                   VARCHAR2(20),
    country_code             VARCHAR2(5),
    country                  VARCHAR2(20),
    occupationcode           VARCHAR2(4),
    occupation               VARCHAR2(50),
    agent_sign               VARCHAR2(36),
    agent_relationship       VARCHAR2(100),
    agent_relationship_code  VARCHAR2(4),
    doctor_directorid        VARCHAR2(12),
    doctor_director          VARCHAR2(36),
    record_auditor           VARCHAR2(36),
    record_auditor_id        VARCHAR2(12),
    inpatient_doctorid       VARCHAR2(12),
    inpatient_doctor         VARCHAR2(36),
    charge_doctor_id         VARCHAR2(12),
    charge_doctor            VARCHAR2(36),
    in_hospital_date         DATE,
    illness                  VARCHAR2(1000),
    illness_current          VARCHAR2(4000),
    is_healthy               NUMBER(3),
    disease_history          VARCHAR2(4000),
    is_infection             NUMBER(3),
    infection_history        VARCHAR2(1000),
    marry_histoyr            VARCHAR2(1000),
    allergies                VARCHAR2(1000),
    operation_history        VARCHAR2(2000),
    vaccination_history      VARCHAR2(1000),
    transfusion_history      VARCHAR2(1000),
    group_code               VARCHAR2(20),
    personal_history         VARCHAR2(1000),
    menstrual_history        VARCHAR2(600),
    family_history           VARCHAR2(500),
    temperature              NUMBER(5,1),
    pulse                    NUMBER(10),
    rate_respiratory         NUMBER(10),
    pressure_systolic        NUMBER(10),
    pressure_diastolic       NUMBER(10),
    height                   NUMBER(10),
    height_unit              VARCHAR2(4),
    weight                   NUMBER(10),
    weight_unit              VARCHAR2(2),
    exam_general             VARCHAR2(4000),
    exam_skin_mucosa         VARCHAR2(2000),
    exam_lymphaden           VARCHAR2(2000),
    exam_head                VARCHAR2(2000),
    exam_neck                VARCHAR2(2000),
    exam_chest               VARCHAR2(2000),
    exam_abdomen             VARCHAR2(4000),
    exam_anus                VARCHAR2(2000),
    exam_external_genitalia  VARCHAR2(2000),
    exam_spine               VARCHAR2(2000),
    exam_arms_legs           VARCHAR2(2000),
    exam_nervous_system      VARCHAR2(3000),
    specialty_situation      VARCHAR2(3000),
    examination_auxiliary    VARCHAR2(4000),
    is_statement_true        NUMBER(3),
    finalradvice_reviewer    VARCHAR2(30),
    modify_date              DATE,
    final_modify_date        DATE,
    last_update_time         DATE,
    rehabilitation_diagnosis VARCHAR2(2000),
    firststep_diagnosis      VARCHAR2(2000)
)
 ;
comment on column CDR_EMR_ADMISSIONRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_ADMISSIONRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_ADMISSIONRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ADMISSIONRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_ADMISSIONRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ADMISSIONRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_ADMISSIONRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_ADMISSIONRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_ADMISSIONRECORD.age
  is '年龄';
comment on column CDR_EMR_ADMISSIONRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_ADMISSIONRECORD.room_no
  is '病房号';
comment on column CDR_EMR_ADMISSIONRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ADMISSIONRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ADMISSIONRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ADMISSIONRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ADMISSIONRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ADMISSIONRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ADMISSIONRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_ADMISSIONRECORD.address
  is '患者详细住址';
comment on column CDR_EMR_ADMISSIONRECORD.addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_ADMISSIONRECORD.addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_ADMISSIONRECORD.addr_area
  is '地址-县（区）';
comment on column CDR_EMR_ADMISSIONRECORD.addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_ADMISSIONRECORD.addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_ADMISSIONRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_ADMISSIONRECORD.marrystatuscode
  is '婚姻状况代码';
comment on column CDR_EMR_ADMISSIONRECORD.marrystatus
  is '婚姻状况';
comment on column CDR_EMR_ADMISSIONRECORD.nation_code
  is '民族代码';
comment on column CDR_EMR_ADMISSIONRECORD.nation
  is '民族';
comment on column CDR_EMR_ADMISSIONRECORD.country_code
  is '国家代码';
comment on column CDR_EMR_ADMISSIONRECORD.country
  is '国家名称';
comment on column CDR_EMR_ADMISSIONRECORD.occupationcode
  is '职业代码';
comment on column CDR_EMR_ADMISSIONRECORD.occupation
  is '职业';
comment on column CDR_EMR_ADMISSIONRECORD.agent_sign
  is '病史陈述者姓名';
comment on column CDR_EMR_ADMISSIONRECORD.agent_relationship
  is '病史陈述者与患者关系';
comment on column CDR_EMR_ADMISSIONRECORD.agent_relationship_code
  is '关系代码';
comment on column CDR_EMR_ADMISSIONRECORD.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_ADMISSIONRECORD.doctor_director
  is '主任医师';
comment on column CDR_EMR_ADMISSIONRECORD.record_auditor
  is '接诊医师';
comment on column CDR_EMR_ADMISSIONRECORD.record_auditor_id
  is '接诊医师编码';
comment on column CDR_EMR_ADMISSIONRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_ADMISSIONRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_ADMISSIONRECORD.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_ADMISSIONRECORD.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_ADMISSIONRECORD.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_ADMISSIONRECORD.illness
  is '主诉';
comment on column CDR_EMR_ADMISSIONRECORD.illness_current
  is '现病史';
comment on column CDR_EMR_ADMISSIONRECORD.is_healthy
  is '一般健康状况标志';
comment on column CDR_EMR_ADMISSIONRECORD.disease_history
  is '疾病史（含外伤）';
comment on column CDR_EMR_ADMISSIONRECORD.is_infection
  is '患者传染性标志';
comment on column CDR_EMR_ADMISSIONRECORD.infection_history
  is '传染病史';
comment on column CDR_EMR_ADMISSIONRECORD.marry_histoyr
  is '婚育史';
comment on column CDR_EMR_ADMISSIONRECORD.allergies
  is '过敏史';
comment on column CDR_EMR_ADMISSIONRECORD.operation_history
  is '手术史';
comment on column CDR_EMR_ADMISSIONRECORD.vaccination_history
  is '预防接种史';
comment on column CDR_EMR_ADMISSIONRECORD.transfusion_history
  is '输血史';
comment on column CDR_EMR_ADMISSIONRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_ADMISSIONRECORD.personal_history
  is '个人史';
comment on column CDR_EMR_ADMISSIONRECORD.menstrual_history
  is '月经史';
comment on column CDR_EMR_ADMISSIONRECORD.family_history
  is '家族史';
comment on column CDR_EMR_ADMISSIONRECORD.temperature
  is '体温';
comment on column CDR_EMR_ADMISSIONRECORD.pulse
  is '脉率';
comment on column CDR_EMR_ADMISSIONRECORD.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_ADMISSIONRECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_ADMISSIONRECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_ADMISSIONRECORD.height
  is '身高';
comment on column CDR_EMR_ADMISSIONRECORD.height_unit
  is '身高单位';
comment on column CDR_EMR_ADMISSIONRECORD.weight
  is '体重';
comment on column CDR_EMR_ADMISSIONRECORD.weight_unit
  is '体重单位，如kg';
comment on column CDR_EMR_ADMISSIONRECORD.exam_general
  is '体格检查';
comment on column CDR_EMR_ADMISSIONRECORD.exam_skin_mucosa
  is '体格检查-皮肤和黏膜检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_lymphaden
  is '体格检查-全身浅表淋巴结检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_head
  is '体格检查-头部及其器官检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_neck
  is '体格检查-颈部检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_chest
  is '体格检查-胸部检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_abdomen
  is '体格检查-腹部检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_anus
  is '体格检查-肛门指诊检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_external_genitalia
  is '体格检查-外生殖器检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_spine
  is '体格检查-脊柱检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_arms_legs
  is '体格检查-四肢检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.exam_nervous_system
  is '体格检查-神经系统检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.specialty_situation
  is '专科情况';
comment on column CDR_EMR_ADMISSIONRECORD.examination_auxiliary
  is '辅助检查结果';
comment on column CDR_EMR_ADMISSIONRECORD.is_statement_true
  is '陈述内容可靠标志';
comment on column CDR_EMR_ADMISSIONRECORD.finalradvice_reviewer
  is '最终审核者签名';
comment on column CDR_EMR_ADMISSIONRECORD.modify_date
  is '签名时间';
comment on column CDR_EMR_ADMISSIONRECORD.final_modify_date
  is '最后修改时间';
comment on column CDR_EMR_ADMISSIONRECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_ADMISSIONRECORD.rehabilitation_diagnosis
  is '康复诊断';
comment on column CDR_EMR_ADMISSIONRECORD.firststep_diagnosis
  is '初步诊断';


create table CDR_EMR_ADMISSION_ASSESSMENT
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    unicode                    VARCHAR2(50) not null,
    patient_id                 VARCHAR2(36),
    visit_no                   VARCHAR2(36),
    visittimes                 INTEGER,
    inpatient_no               VARCHAR2(36),
    patient_name               VARCHAR2(20),
    gendercode                 INTEGER,
    age                        VARCHAR2(20),
    bed_no                     VARCHAR2(20),
    room_no                    VARCHAR2(20),
    dept_no                    VARCHAR2(20),
    dept_name                  VARCHAR2(50),
    ward_no                    VARCHAR2(20),
    ward_name                  VARCHAR2(50),
    record_createdate          DATE,
    record_personid            VARCHAR2(20),
    record_person              VARCHAR2(50),
    respons_nurse_signtime     DATE,
    respons_nurse_code         VARCHAR2(20),
    respons_nurse_name         VARCHAR2(50),
    in_hospital_type_code      NUMBER(2),
    in_hospital_type           VARCHAR2(50),
    in_ward_type               VARCHAR2(20),
    main_symptom               VARCHAR2(1000),
    temperature                NUMBER(3,1),
    pulse                      INTEGER,
    rate_respiratory           INTEGER,
    pressure_systolic          INTEGER,
    pressure_diastolic         INTEGER,
    weight                     NUMBER(3,2),
    weight_unit                VARCHAR2(20),
    growth_degree_code         NUMBER,
    growth_degree              VARCHAR2(20),
    mentalstate                NUMBER,
    sleep_situation            VARCHAR2(50),
    special_conditions         VARCHAR2(50),
    psychologic_situation_code NUMBER,
    psychologic_situation      VARCHAR2(50),
    nutrition_situation_code   NUMBER,
    nutrition_situation        VARCHAR2(50),
    self_care_ability_code     NUMBER,
    self_care_ability          VARCHAR2(50),
    smoking_flag               NUMBER,
    smoking_situa_code         NUMBER,
    smoking_situa              VARCHAR2(50),
    daily_smoking              INTEGER,
    daily_smoking_unit         VARCHAR2(20),
    stop_smoking_day           INTEGER,
    drinking_flag              NUMBER,
    drinking_freq_code         NUMBER,
    drinking_freq              VARCHAR2(20),
    daily_drinking             INTEGER,
    diet_satutrtion_code       NUMBER,
    diet_satutrtion            VARCHAR2(20),
    nurse_observed_item        VARCHAR2(50),
    nurse_observed_resulit     VARCHAR2(50),
    evaluate_time              DATE,
    last_update_time           DATE
)
 ;
comment on column CDR_EMR_ADMISSION_ASSESSMENT.group_code
  is '集团编码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.organization_code
  is '组织编码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.gendercode
  is '性别代码代码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.age
  is '年龄';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.bed_no
  is '床位号';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.room_no
  is '病房号';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.record_person
  is '文档作者';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.respons_nurse_signtime
  is '责任护士签署日期时间';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.respons_nurse_code
  is '责任护士编码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.respons_nurse_name
  is '责任护士名称';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.in_hospital_type_code
  is '入院途径代码 ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.in_hospital_type
  is '入院途径，如：门诊';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.in_ward_type
  is '入病房方式';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.main_symptom
  is '主要症状名称';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.temperature
  is '体温';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.pulse
  is '脉率   ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.weight
  is '体重';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.weight_unit
  is '体重(单位)  ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.growth_degree_code
  is '发育程度代码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.growth_degree
  is '发育程度，如：正力型';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.mentalstate
  is '精神状态正常标志';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.sleep_situation
  is '睡眠状况';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.special_conditions
  is '身体特殊情况';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.psychologic_situation_code
  is '心理状态代码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.psychologic_situation
  is '心理状态';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.nutrition_situation_code
  is '营养状态代码';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.nutrition_situation
  is '营养状态';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.self_care_ability_code
  is '自理能力代码 ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.self_care_ability
  is '自理能力，如：完全自理';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.smoking_flag
  is '吸烟标志 ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.smoking_situa_code
  is '吸烟状况代码, ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.smoking_situa
  is '吸烟状况';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.daily_smoking
  is '日吸烟量';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.daily_smoking_unit
  is '日吸烟量单位';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.stop_smoking_day
  is '停止吸烟天数';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.drinking_flag
  is '饮酒标志(False/True),';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.drinking_freq_code
  is '饮酒频率代码, ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.drinking_freq
  is '饮酒频率';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.daily_drinking
  is '日饮酒量（mL）';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.diet_satutrtion_code
  is '饮食情况代码  ';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.diet_satutrtion
  is '饮食情况，如：良好';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.nurse_observed_item
  is '护理观察项目名称';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.nurse_observed_resulit
  is '护理观察结果';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.evaluate_time
  is '评估日期时间';
comment on column CDR_EMR_ADMISSION_ASSESSMENT.last_update_time
  is '最后修改时间';



create table CDR_EMR_ADMISSION_DEATH_IN24HRECORD
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(36),
    visit_no                      VARCHAR2(36),
    visittimes                    INTEGER,
    inpatient_no                  VARCHAR2(36),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    age                           VARCHAR2(20),
    bed_no                        VARCHAR2(20),
    room_no                       VARCHAR2(20),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(50),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(20),
    record_person                 VARCHAR2(50),
    address                       VARCHAR2(100),
    addr_road                     VARCHAR2(50),
    addr_street                   VARCHAR2(50),
    addr_area                     VARCHAR2(50),
    addr_city                     VARCHAR2(50),
    addr_province                 VARCHAR2(50),
    agent_sign                    VARCHAR2(36),
    agent_relationship            VARCHAR2(20),
    agent_relationship_code       VARCHAR2(20),
    doctor_directorid             VARCHAR2(12),
    doctor_director               VARCHAR2(36),
    record_auditor                VARCHAR2(36),
    record_auditor_id             VARCHAR2(12),
    inpatient_doctorid            VARCHAR2(12),
    inpatient_doctor              VARCHAR2(36),
    charge_doctor_id              VARCHAR2(12),
    charge_doctor                 VARCHAR2(36),
    in_hospital_date              DATE,
    out_hospital_date             DATE,
    illness                       VARCHAR2(100),
    is_statement_true             NUMBER,
    tcm_observations              VARCHAR2(4000),
    admidiag_wm                   VARCHAR2(100),
    admidiag_tcm                  VARCHAR2(100),
    admidiag_tcm_syndromename     VARCHAR2(100),
    admidiag_tcm_syndromecode     VARCHAR2(10),
    admission_hospital_state      VARCHAR2(4000),
    treatment_process_description VARCHAR2(4000),
    death_date                    DATE,
    death_reason                  VARCHAR2(500),
    deathdiag_wm                  VARCHAR2(100),
    deathdiag_wm_code             VARCHAR2(50),
    deathdiag_tcm_code            VARCHAR2(50),
    deathdiag_tcm                 VARCHAR2(100),
    deathdiag_tcm_syndromename    VARCHAR2(100),
    deathdiag_tcm_syndromecode    VARCHAR2(50),
    last_update_time              DATE,
    admidiag_wm_code              VARCHAR2(100)
)
 ;
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.age
  is '年龄';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.room_no
  is '病房号';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.address
  is '患者详细住址';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.addr_area
  is '地址-县（区）';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.agent_sign
  is '病史陈述者姓名';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.agent_relationship
  is '病史陈述者与患者关系';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.agent_relationship_code
  is '关系代码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.doctor_director
  is '主任医师';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.record_auditor
  is '接诊医师';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.record_auditor_id
  is '接诊医师编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.out_hospital_date
  is '出院日期时间';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.illness
  is '主诉';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.is_statement_true
  is '陈述内容可靠标志';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.tcm_observations
  is '中医“四诊”观察结果';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.admidiag_wm
  is '入院诊断-西医诊断名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.admidiag_tcm
  is '入院诊断-中医病名';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.admidiag_tcm_syndromename
  is '入院诊断-中医证候名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.admidiag_tcm_syndromecode
  is '入院诊断-中医证候代码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.admission_hospital_state
  is '入院情况';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.death_date
  is '死亡日期时间';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.death_reason
  is '死亡原因';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.deathdiag_wm
  is '死亡诊断-西医诊断名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.deathdiag_wm_code
  is '死亡诊断-西医诊断编码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.deathdiag_tcm_code
  is '死亡诊断-中医病名代码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.deathdiag_tcm
  is '死亡诊断-中医病名';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.deathdiag_tcm_syndromename
  is '死亡诊断-中医证候名称';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.deathdiag_tcm_syndromecode
  is '死亡诊断-中医证候代码';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_ADMISSION_DEATH_IN24HRECORD.admidiag_wm_code
  is '入院诊断-西医诊断代码';






create table CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD
(
    group_code                     VARCHAR2(20),
    organization_code              VARCHAR2(20),
    domain_id                      VARCHAR2(2),
    unicode                        VARCHAR2(50) not null,
    patient_id                     VARCHAR2(36),
    visit_no                       VARCHAR2(36),
    visittimes                     INTEGER,
    inpatient_no                   VARCHAR2(36),
    patient_name                   VARCHAR2(20),
    gendercode                     INTEGER,
    age                            VARCHAR2(20),
    bed_no                         VARCHAR2(20),
    room_no                        VARCHAR2(20),
    dept_no                        VARCHAR2(20),
    dept_name                      VARCHAR2(50),
    ward_no                        VARCHAR2(20),
    ward_name                      VARCHAR2(50),
    record_createdate              DATE,
    record_personid                VARCHAR2(20),
    record_person                  VARCHAR2(50),
    address                        VARCHAR2(80),
    addr_road                      VARCHAR2(50),
    addr_street                    VARCHAR2(50),
    addr_area                      VARCHAR2(50),
    addr_city                      VARCHAR2(50),
    addr_province                  VARCHAR2(50),
    agent_sign                     VARCHAR2(36),
    agent_relationship             VARCHAR2(16),
    agent_relationship_code        VARCHAR2(4),
    is_statement_true              NUMBER,
    doctor_directorid              VARCHAR2(12),
    doctor_director                VARCHAR2(36),
    record_auditor                 VARCHAR2(36),
    record_auditor_id              VARCHAR2(12),
    inpatient_doctorid             VARCHAR2(12),
    inpatient_doctor               VARCHAR2(36),
    charge_doctor_id               VARCHAR2(12),
    charge_doctor                  VARCHAR2(36),
    in_hospital_date               DATE,
    illness                        VARCHAR2(4000),
    illness_current                VARCHAR2(4000),
    main_symptom                   VARCHAR2(3000),
    main_symptom_desc              VARCHAR2(500),
    admidiag_wm                    VARCHAR2(100),
    admidiag_wm_code               VARCHAR2(100),
    admidiag_tcm                   VARCHAR2(100),
    admidiag_tcm_syndromename      VARCHAR2(100),
    therapeutic_principleandmethod VARCHAR2(500),
    admission_hospital_state       VARCHAR2(500),
    treatment_process_description  VARCHAR2(4000),
    discharge_hospital_state       VARCHAR2(500),
    dischdiag_wm                   VARCHAR2(100),
    dischdiag_wm_code              VARCHAR2(50),
    dischdiag_tcm_code             VARCHAR2(10),
    dischdiag_tcm                  VARCHAR2(100),
    dischdiag_tcm_syndromename     VARCHAR2(100),
    dischdiag_tcm_syndromecode     VARCHAR2(10),
    discharge_advice               VARCHAR2(200),
    discharge_advice_date          DATE,
    last_update_time               DATE
);



comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.age
  is '年龄';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.room_no
  is '病房号';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.address
  is '患者详细住址';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.addr_area
  is '地址-县（区）';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.agent_sign
  is '病史陈述者姓名';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.agent_relationship
  is '病史陈述者与患者关系';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.agent_relationship_code
  is '关系代码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.is_statement_true
  is '陈述内容可靠标志';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.doctor_director
  is '主任医师';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.record_auditor
  is '接诊医师';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.record_auditor_id
  is '接诊医师编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.illness
  is '主诉';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.illness_current
  is '现病史';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.main_symptom
  is '症状名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.main_symptom_desc
  is '症状描述';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.admidiag_wm
  is '入院诊断-西医诊断名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.admidiag_wm_code
  is '入院诊断-西医诊断编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.admidiag_tcm
  is '入院诊断-中医病名';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.admidiag_tcm_syndromename
  is '入院诊断-中医证候名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.therapeutic_principleandmethod
  is '治则治法';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.admission_hospital_state
  is '入院情况 1	危2	急9	一般';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.discharge_hospital_state
  is '出院情况 1	治愈
2	好转
3	稳定
4	恶化
5	死亡
9	其他
';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dischdiag_wm
  is '出院诊断-西医诊断名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dischdiag_wm_code
  is '出院诊断-西医诊断编码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dischdiag_tcm_code
  is '出院诊断-中医病名代码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dischdiag_tcm
  is '出院诊断-中医病名';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dischdiag_tcm_syndromename
  is '出院诊断-中医证候名称';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.dischdiag_tcm_syndromecode
  is '出院诊断-中医证候代码';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.discharge_advice
  is '出院医嘱';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.discharge_advice_date
  is '出院医嘱开立日期';
comment on column CDR_EMR_ADMISSION_DISCHARGE_IN24HRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_AESAREAN_SECTIONRECORD
(
    group_code                       VARCHAR2(20),
    organization_code                VARCHAR2(20),
    domain_id                        VARCHAR2(2),
    unicode                          VARCHAR2(30) not null,
    patient_id                       VARCHAR2(36),
    visit_no                         VARCHAR2(36),
    intraoperative_medication_volume NUMBER,
    abdominal_exploration            VARCHAR2(200),
    abdominal_exploration_uterrus    VARCHAR2(200),
    is_abdominal_abnormal            NUMBER,
    is_abdominal_myoma               NUMBER,
    abdominal_exploration_manage     VARCHAR2(200),
    operating_puerpera_situation     VARCHAR2(200),
    bleeding_volume                  NUMBER,
    blood_transfusion_ingredients    VARCHAR2(200),
    blood_transfusion_volume         NUMBER,
    infusion_volume                  NUMBER,
    oxygen_supply_time               INTEGER,
    visittimes                       INTEGER,
    inpatient_no                     VARCHAR2(36),
    patient_name                     VARCHAR2(20),
    gendercode                       INTEGER,
    age                              VARCHAR2(20),
    bed_no                           VARCHAR2(20),
    room_no                          VARCHAR2(20),
    dept_no                          VARCHAR2(20),
    dept_name                        VARCHAR2(50),
    ward_no                          VARCHAR2(20),
    ward_name                        VARCHAR2(50),
    record_createdate                DATE,
    record_personid                  VARCHAR2(20),
    record_person                    VARCHAR2(50),
    operation_doctorid               VARCHAR2(20),
    operation_doctor                 VARCHAR2(50),
    anesthesia_doctorid              VARCHAR2(20),
    anesthesia_doctor_name           VARCHAR2(50),
    nurse_instrumentid               VARCHAR2(20),
    nurse_instrument_name            VARCHAR2(50),
    midwifery_assistant_id           VARCHAR2(20),
    midwifery_assistant_name         VARCHAR2(50),
    other_medication                 VARCHAR2(200),
    other_situation                  VARCHAR2(200),
    operation_enddate                DATE,
    operation_fulltime_spent         INTEGER,
    fetal_position_code              VARCHAR2(3),
    postpartum_diagnosis             VARCHAR2(200),
    postpartum_observations_date     DATE,
    postpartum_inspection_date       VARCHAR2(20),
    pressure_systolic                INTEGER,
    pressure_diastolic               INTEGER,
    postpartum_pulse                 INTEGER,
    postpartum_rate_heart            INTEGER,
    postpartum_bleeding_volume       INTEGER,
    postpartum_contractions          VARCHAR2(20),
    baby_protectorid                 VARCHAR2(20),
    baby_protector_name              VARCHAR2(50),
    expect_born_date                 DATE,
    is_fetal_membranes_intact        NUMBER,
    umbilical_cord_length            INTEGER,
    nuchal_cord                      INTEGER,
    preborn_diagnosis                VARCHAR2(200),
    surgical_indications             VARCHAR2(100),
    operation_code                   VARCHAR2(20),
    operation_name                   VARCHAR2(50),
    operation_begindate              DATE,
    anesthesia_type                  VARCHAR2(10),
    anesthesia_type_code             VARCHAR2(20),
    anesthesia_site                  VARCHAR2(20),
    anesthesia_effect                VARCHAR2(50),
    postpartum_uterus_loc            NUMBER(3,1),
    bdby_sex_id                      NUMBER,
    bdby_sex                         VARCHAR2(10),
    bdby_weight                      INTEGER,
    bdby_weight_unit                 NUMBER,
    bdby_height                      NUMBER(3,1),
    scalp_edema_size                 VARCHAR2(200),
    scalp_edema_site                 VARCHAR2(200),
    apgar_rating_interval            VARCHAR2(20),
    apgar_score                      INTEGER,
    birthing_result_code             NUMBER,
    baby_abnormal_code               NUMBER,
    caesarean_process                VARCHAR2(2000),
    condition_womb                   VARCHAR2(200),
    delivery_mode                    VARCHAR2(50),
    placenta_yellow_stained          VARCHAR2(50),
    membranes_yellow_stained         VARCHAR2(50),
    cord_winding                     VARCHAR2(50),
    umbilical_cord                   INTEGER,
    save_cord_blood                  NUMBER,
    uterine_wall_suture              VARCHAR2(50),
    oxytocin                         VARCHAR2(200),
    oxytocin_usage                   VARCHAR2(20),
    intraoperative_medication        VARCHAR2(200),
    last_update_time                 DATE
)
 ;
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.intraoperative_medication_volume
  is '手术用药量';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.abdominal_exploration
  is '腹腔探查附件';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.abdominal_exploration_uterrus
  is '腹腔探查子宫';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.is_abdominal_abnormal
  is '宫腔探查异常情况标志';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.is_abdominal_myoma
  is '宫腔探查肌瘤标志';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.abdominal_exploration_manage
  is '宫腔探查处理情况';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operating_puerpera_situation
  is '手术时产妇情况';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bleeding_volume
  is '出血量';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.blood_transfusion_ingredients
  is '输血成分';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.blood_transfusion_volume
  is '输血量（mL）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.infusion_volume
  is '输液量（mL）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.oxygen_supply_time
  is '供氧时间（min）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.age
  is '年龄';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.room_no
  is '病房号';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_doctor
  is '手术医生名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.anesthesia_doctorid
  is '麻醉医师编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.anesthesia_doctor_name
  is '麻醉医师姓名';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.nurse_instrumentid
  is '器械护士编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.nurse_instrument_name
  is '器械护士名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.midwifery_assistant_id
  is '助手编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.midwifery_assistant_name
  is '助手姓名';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.other_medication
  is '其他用药';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.other_situation
  is '其他情况';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_enddate
  is '手术结束日期时间';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_fulltime_spent
  is '手术全程时间（min）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.fetal_position_code
  is '胎方位代码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_diagnosis
  is '产后诊断';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_observations_date
  is '产后观察日期时间';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_inspection_date
  is '产后检查时间（min）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_pulse
  is '产后脉搏（次/min ）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_rate_heart
  is '产后心率（次/min ）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_bleeding_volume
  is '产后出血量（mL）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_contractions
  is '产后宫缩';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.baby_protectorid
  is '护婴者编码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.baby_protector_name
  is '护婴者姓名';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.expect_born_date
  is '待产日期时间';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.is_fetal_membranes_intact
  is '胎膜完整情况标志';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.umbilical_cord_length
  is '脐带长度（cm）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.nuchal_cord
  is '绕颈身（周）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.preborn_diagnosis
  is '产前诊断名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.surgical_indications
  is '手术指征';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_code
  is '手术代码，手术(操作)代码表(ICD-9-CM)';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_name
  is '手术名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.operation_begindate
  is '手术开始日期时间';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.anesthesia_type
  is '麻醉方法代码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.anesthesia_type_code
  is '麻醉方法';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.anesthesia_site
  is '麻醉体位';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.anesthesia_effect
  is '麻醉效果';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.postpartum_uterus_loc
  is '产后宫底高度（cm）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bdby_sex_id
  is '新生儿性别代码代码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bdby_sex
  is '新生儿性别代码';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bdby_weight
  is '新生儿出生体重（g）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bdby_weight_unit
  is '新生儿出生体重单位（g）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.bdby_height
  is '新生儿出生身长（cm）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.scalp_edema_size
  is '产瘤大小';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.scalp_edema_site
  is '产瘤部位';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.apgar_rating_interval
  is 'Apgar评分间隔时间';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.apgar_score
  is 'Apgar评分值';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.birthing_result_code
  is '分娩结局';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.baby_abnormal_code
  is '新生儿异常情况， ';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.caesarean_process
  is '剖宫产手术过程';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.condition_womb
  is '子宫情况';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.delivery_mode
  is '胎儿娩出方式';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.placenta_yellow_stained
  is '胎盘黄染';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.membranes_yellow_stained
  is '胎膜黄染';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.cord_winding
  is '脐带缠绕情况';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.umbilical_cord
  is '脐带扭转（周）';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.save_cord_blood
  is '存脐带血情况标志';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.uterine_wall_suture
  is '子宫壁缝合情况';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.oxytocin
  is '宫缩剂名称';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.oxytocin_usage
  is '宫缩剂使用方法';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.intraoperative_medication
  is '手术用药';
comment on column CDR_EMR_AESAREAN_SECTIONRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_ANESTHESIARECORD
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    unicode                    VARCHAR2(30) not null,
    patient_id                 VARCHAR2(36),
    visit_no                   VARCHAR2(36),
    visittimes                 INTEGER,
    inpatient_no               VARCHAR2(36),
    patient_name               VARCHAR2(20),
    gendercode                 INTEGER,
    age                        VARCHAR2(20),
    bed_no                     VARCHAR2(20),
    room_no                    VARCHAR2(20),
    dept_no                    VARCHAR2(20),
    dept_name                  VARCHAR2(50),
    ward_no                    VARCHAR2(20),
    ward_name                  VARCHAR2(50),
    record_createdate          DATE,
    record_personid            VARCHAR2(20),
    record_person              VARCHAR2(50),
    weight                     NUMBER(5,1),
    temperature                NUMBER(5,1),
    pulse                      INTEGER,
    rate_respiratory           INTEGER,
    pressure_systolic          INTEGER,
    pressure_diastolic         INTEGER,
    blood_oxygen_saturation    NUMBER(5,1),
    blood_name                 VARCHAR2(10),
    preoperative_diagnosis     VARCHAR2(200),
    postoperative_diagnosis    VARCHAR2(200),
    operator_code              VARCHAR2(10),
    operator_name              VARCHAR2(36),
    first_assistantid          VARCHAR2(20),
    first_assistant_name       VARCHAR2(50),
    secend_assistantid         VARCHAR2(20),
    secend_assistant_name      VARCHAR2(50),
    nurse_instrumentid         VARCHAR2(20),
    nurse_instrument_name      VARCHAR2(50),
    nurse_patrolid             VARCHAR2(20),
    nurse_patrol_name          VARCHAR2(50),
    operation_room_number      VARCHAR2(100),
    operation_dept_name        VARCHAR2(50),
    operation_platform         VARCHAR2(20),
    anesthesia_doctorid        VARCHAR2(20),
    anesthesia_doctor_name     VARCHAR2(50),
    operation_site_code        VARCHAR2(20),
    operation_site_name        VARCHAR2(50),
    blood_transfusion_datetime DATE,
    blood_kind                 VARCHAR2(20),
    blood_transfusion_volume   NUMBER,
    blood_transfusion_unit     VARCHAR2(20),
    infusion_volume            NUMBER,
    infusion_volume_unit       VARCHAR2(20),
    bleeding_volume            NUMBER,
    measure_unit               VARCHAR2(20),
    anesthesia_type            VARCHAR2(100),
    anesthesia_begintime       DATE,
    anesthesia_endtime         DATE,
    asa_grading_code           VARCHAR2(20),
    intubation_classification  VARCHAR2(20),
    routine_monitoring_items   VARCHAR2(100),
    routine_monitoring_result  VARCHAR2(500),
    special_monitoring_items   VARCHAR2(200),
    special_monitoring_result  VARCHAR2(500),
    last_update_time           DATE,
    urine_measure              VARCHAR2(20),
    autologous_blood           VARCHAR2(50),
    platelet                   VARCHAR2(50),
    anesthetic_drugs           VARCHAR2(200),
    request_no                 VARCHAR2(50)
)
 ;
comment on column CDR_EMR_ANESTHESIARECORD.group_code
  is '集团编码';
comment on column CDR_EMR_ANESTHESIARECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_ANESTHESIARECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_ANESTHESIARECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ANESTHESIARECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_ANESTHESIARECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ANESTHESIARECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_ANESTHESIARECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_ANESTHESIARECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_ANESTHESIARECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_ANESTHESIARECORD.age
  is '年龄';
comment on column CDR_EMR_ANESTHESIARECORD.bed_no
  is '床位号';
comment on column CDR_EMR_ANESTHESIARECORD.room_no
  is '病房号';
comment on column CDR_EMR_ANESTHESIARECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ANESTHESIARECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ANESTHESIARECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ANESTHESIARECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ANESTHESIARECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ANESTHESIARECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ANESTHESIARECORD.record_person
  is '文档作者';
comment on column CDR_EMR_ANESTHESIARECORD.weight
  is '体重';
comment on column CDR_EMR_ANESTHESIARECORD.temperature
  is '体温';
comment on column CDR_EMR_ANESTHESIARECORD.pulse
  is '脉率   ';
comment on column CDR_EMR_ANESTHESIARECORD.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_ANESTHESIARECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_ANESTHESIARECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_ANESTHESIARECORD.blood_oxygen_saturation
  is '血氧饱和度';
comment on column CDR_EMR_ANESTHESIARECORD.blood_name
  is '血型';
comment on column CDR_EMR_ANESTHESIARECORD.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_ANESTHESIARECORD.postoperative_diagnosis
  is '术后诊断';
comment on column CDR_EMR_ANESTHESIARECORD.operator_code
  is '主刀医生工号';
comment on column CDR_EMR_ANESTHESIARECORD.operator_name
  is '主刀医生名称';
comment on column CDR_EMR_ANESTHESIARECORD.first_assistantid
  is '第一助手编码';
comment on column CDR_EMR_ANESTHESIARECORD.first_assistant_name
  is '第一助手姓名';
comment on column CDR_EMR_ANESTHESIARECORD.secend_assistantid
  is '第二助手编码';
comment on column CDR_EMR_ANESTHESIARECORD.secend_assistant_name
  is '第二助手姓名';
comment on column CDR_EMR_ANESTHESIARECORD.nurse_instrumentid
  is '器械护士编码';
comment on column CDR_EMR_ANESTHESIARECORD.nurse_instrument_name
  is '器械护士名称';
comment on column CDR_EMR_ANESTHESIARECORD.nurse_patrolid
  is '巡台护士编码';
comment on column CDR_EMR_ANESTHESIARECORD.nurse_patrol_name
  is '巡台护士名称';
comment on column CDR_EMR_ANESTHESIARECORD.operation_room_number
  is '手术间编号';
comment on column CDR_EMR_ANESTHESIARECORD.operation_dept_name
  is '手术室名称';
comment on column CDR_EMR_ANESTHESIARECORD.operation_platform
  is '手术台编码';
comment on column CDR_EMR_ANESTHESIARECORD.anesthesia_doctorid
  is '麻醉医生编码';
comment on column CDR_EMR_ANESTHESIARECORD.anesthesia_doctor_name
  is '麻醉医生姓名';
comment on column CDR_EMR_ANESTHESIARECORD.operation_site_code
  is '手术体位代码';
comment on column CDR_EMR_ANESTHESIARECORD.operation_site_name
  is '手术体位名称';
comment on column CDR_EMR_ANESTHESIARECORD.blood_transfusion_datetime
  is '输血日期时间';
comment on column CDR_EMR_ANESTHESIARECORD.blood_kind
  is '输血品种';
comment on column CDR_EMR_ANESTHESIARECORD.blood_transfusion_volume
  is '输血量';
comment on column CDR_EMR_ANESTHESIARECORD.blood_transfusion_unit
  is '输血量计量单位';
comment on column CDR_EMR_ANESTHESIARECORD.infusion_volume
  is '输液量';
comment on column CDR_EMR_ANESTHESIARECORD.infusion_volume_unit
  is '输液量计量单位';
comment on column CDR_EMR_ANESTHESIARECORD.bleeding_volume
  is '出血量';
comment on column CDR_EMR_ANESTHESIARECORD.measure_unit
  is '出血量计量单位';
comment on column CDR_EMR_ANESTHESIARECORD.anesthesia_type
  is '麻醉方法';
comment on column CDR_EMR_ANESTHESIARECORD.anesthesia_begintime
  is '麻醉开始时间';
comment on column CDR_EMR_ANESTHESIARECORD.anesthesia_endtime
  is '麻醉结束时间';
comment on column CDR_EMR_ANESTHESIARECORD.asa_grading_code
  is 'ASA分级标准代码';
comment on column CDR_EMR_ANESTHESIARECORD.intubation_classification
  is '气管插管分类';
comment on column CDR_EMR_ANESTHESIARECORD.routine_monitoring_items
  is '常规监测项目名称';
comment on column CDR_EMR_ANESTHESIARECORD.routine_monitoring_result
  is '常规监测项目结果';
comment on column CDR_EMR_ANESTHESIARECORD.special_monitoring_items
  is '特殊监测项目名称';
comment on column CDR_EMR_ANESTHESIARECORD.special_monitoring_result
  is '特殊监测项目结果';
comment on column CDR_EMR_ANESTHESIARECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_ANESTHESIARECORD.urine_measure
  is '尿量';
comment on column CDR_EMR_ANESTHESIARECORD.autologous_blood
  is '自体血';
comment on column CDR_EMR_ANESTHESIARECORD.platelet
  is '血小板';
comment on column CDR_EMR_ANESTHESIARECORD.anesthetic_drugs
  is '麻醉用药';
comment on column CDR_EMR_ANESTHESIARECORD.request_no
  is '申请单号';






create table CDR_EMR_ANESTHESIA_INFORMEDCONSENT
(
    group_code                      VARCHAR2(20),
    organization_code               VARCHAR2(20),
    domain_id                       VARCHAR2(2),
    unicode                         VARCHAR2(50) not null,
    patient_id                      VARCHAR2(36),
    visit_no                        VARCHAR2(36),
    visittimes                      INTEGER,
    inpatient_no                    VARCHAR2(36),
    patient_name                    VARCHAR2(20),
    gendercode                      INTEGER,
    age                             VARCHAR2(20),
    bed_no                          VARCHAR2(20),
    room_no                         VARCHAR2(20),
    dept_no                         VARCHAR2(20),
    dept_name                       VARCHAR2(50),
    ward_no                         VARCHAR2(20),
    ward_name                       VARCHAR2(50),
    author_sign_date                DATE,
    author_doc_code                 VARCHAR2(10),
    author_doc_name                 VARCHAR2(50),
    anesthesia_sign_time            DATE,
    anesthesia_code                 VARCHAR2(10),
    anesthesia_name                 VARCHAR2(20),
    assigned_time                   DATE,
    assigned_doc_id                 VARCHAR2(110),
    assigned_doc_name               VARCHAR2(50),
    patient_sign_tiem               DATE,
    patient_sign                    VARCHAR2(36),
    agent_signdate                  DATE,
    agent_sign                      VARCHAR2(36),
    agent_relationship              VARCHAR2(10),
    agent_relationship_code         VARCHAR2(2),
    preoperative_diagnosis          VARCHAR2(1000),
    anesthesia_type_code_plan       VARCHAR2(2),
    anesthesia_type_plan            VARCHAR2(50),
    anesthesia_datetime_paln        DATE,
    operation_code_plan             VARCHAR2(10),
    operation_name_plan             VARCHAR2(200),
    invasive_type_plan              VARCHAR2(2000),
    basic_illness_affect_anesthesia VARCHAR2(100),
    basic_illness                   VARCHAR2(100),
    narcotic_analgesics_flag        NUMBER,
    anesthesia_safety_flag          NUMBER,
    operation_org_advice            VARCHAR2(100),
    patient_option                  VARCHAR2(2000),
    anesthesia_risk                 VARCHAR2(2000),
    last_update_time                DATE,
    record_createdate               DATE
)
 ;
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.group_code
  is '集团编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.organization_code
  is '组织编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.gendercode
  is '性别代码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.age
  is '年龄';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.bed_no
  is '床位号';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.room_no
  is '病房号';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.author_sign_date
  is '知情同意书文档书写签署日期';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.author_doc_code
  is '知情同意书文档作者编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.author_doc_name
  is '知情同意书文档作者名称';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_sign_time
  is '麻醉医师签名时间';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_code
  is '麻醉医师编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_name
  is '麻醉医师姓名';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.assigned_time
  is '审核日期时间';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.assigned_doc_id
  is '审核医生编码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.assigned_doc_name
  is '审核医生姓名';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.patient_sign_tiem
  is '患者签名日期时间';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.patient_sign
  is '患者签名';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.agent_signdate
  is '患者代理人签名时间';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.agent_sign
  is '患者代理人签名';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.agent_relationship
  is '患者代理人关系';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.agent_relationship_code
  is '患者代理人关系代码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_type_code_plan
  is '拟麻醉方式代码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_type_plan
  is '拟麻醉方式';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_datetime_paln
  is '拟麻醉日期时间';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.operation_code_plan
  is '拟实施手术代码';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.operation_name_plan
  is '拟实施手术名称';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.invasive_type_plan
  is '拟行有创操作和检测方法';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.basic_illness_affect_anesthesia
  is '基础疾病影响';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.basic_illness
  is '患者基础疾病';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.narcotic_analgesics_flag
  is '使用麻醉镇痛汞标志';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_safety_flag
  is '参加麻醉安全保险标志';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.operation_org_advice
  is '医疗机构的意见';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.patient_option
  is '患者的意见';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.anesthesia_risk
  is '麻醉中，麻醉后可能产发生的意外及并发症';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_ANESTHESIA_INFORMEDCONSENT.record_createdate
  is '记录创建日期';






create table CDR_EMR_ANESTHESIA_POSTRECORD
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visittimes              INTEGER,
    inpatient_no            VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              INTEGER,
    age                     VARCHAR2(20),
    bed_no                  VARCHAR2(20),
    room_no                 VARCHAR2(20),
    dept_no                 VARCHAR2(20),
    dept_name               VARCHAR2(50),
    ward_no                 VARCHAR2(20),
    ward_name               VARCHAR2(50),
    record_createdate       DATE,
    record_personid         VARCHAR2(20),
    record_person           VARCHAR2(50),
    preoperative_diagnosis  VARCHAR2(200),
    postoperative_diagnosis VARCHAR2(200),
    anesthesia_type         VARCHAR2(200),
    anesthesia_adapt        VARCHAR2(200),
    anesthesia_recovery     VARCHAR2(200),
    anesthesia_awake_date   DATE,
    special_conditions      VARCHAR2(200),
    general_inspection      VARCHAR2(2000),
    last_update_time        DATE
)
 ;
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.age
  is '年龄';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.room_no
  is '病房号';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.postoperative_diagnosis
  is '术后诊断';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.anesthesia_type
  is '麻醉方法';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.anesthesia_adapt
  is '麻醉适应症';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.anesthesia_recovery
  is '麻醉恢复情况';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.anesthesia_awake_date
  is '清醒日期时间';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.special_conditions
  is '特殊情况';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.general_inspection
  is '一般状况检查结果';
comment on column CDR_EMR_ANESTHESIA_POSTRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_ANESTHESIA_PRERECORD
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    unicode                     VARCHAR2(30) not null,
    patient_id                  VARCHAR2(36),
    visit_no                    VARCHAR2(36),
    visittimes                  INTEGER,
    inpatient_no                VARCHAR2(36),
    patient_name                VARCHAR2(20),
    gendercode                  INTEGER,
    age                         VARCHAR2(20),
    bed_no                      VARCHAR2(20),
    room_no                     VARCHAR2(20),
    dept_no                     VARCHAR2(20),
    dept_name                   VARCHAR2(50),
    ward_no                     VARCHAR2(20),
    ward_name                   VARCHAR2(50),
    record_createdate           DATE,
    record_personid             VARCHAR2(20),
    record_person               VARCHAR2(50),
    abo_blood_type              VARCHAR2(20),
    abo_blood_name              VARCHAR2(50),
    rh_blood_type               VARCHAR2(20),
    rh_blood_name               VARCHAR2(50),
    preoperative_diagnosis      VARCHAR2(200),
    postoperative_diagnosis     VARCHAR2(200),
    illness_history_summary     VARCHAR2(500),
    allergies                   VARCHAR2(500),
    general_inspection          VARCHAR2(500),
    mentalstate                 NUMBER,
    heart_auscultation          VARCHAR2(500),
    lung_auscultation           VARCHAR2(500),
    extremities_examination     VARCHAR2(500),
    spinal_examination          VARCHAR2(500),
    abdomen_examination         VARCHAR2(500),
    trachea_examination         VARCHAR2(500),
    tooth_examination           VARCHAR2(500),
    ecg_examination             VARCHAR2(500),
    chest_x_examination         VARCHAR2(500),
    ct_examination              VARCHAR2(500),
    b_ultrasound                VARCHAR2(500),
    mri_examination             VARCHAR2(500),
    lung_founction__examination VARCHAR2(500),
    bloodrout_examination       VARCHAR2(500),
    urinerout_examination       VARCHAR2(500),
    coagulation_examination     VARCHAR2(500),
    liverfunction_examination   VARCHAR2(500),
    bloodgas_examination        VARCHAR2(500),
    anesthesia_adapt            VARCHAR2(500),
    anesthesia_precaution       VARCHAR2(500),
    anesthesia_type_code        VARCHAR2(20),
    anesthesia_type             VARCHAR2(50),
    last_update_time            DATE
)
 ;
comment on column CDR_EMR_ANESTHESIA_PRERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.age
  is '年龄';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.room_no
  is '病房号';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.abo_blood_type
  is 'ABO血型代码，ABO血型代码表';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.abo_blood_name
  is 'ABO血型';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.rh_blood_type
  is 'Rh血型代码，Rh血型代码表';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.rh_blood_name
  is 'Rh血型';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.postoperative_diagnosis
  is '术后诊断';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.illness_history_summary
  is '简要病史';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.allergies
  is '过敏史描述';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.general_inspection
  is '一般检查情况';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.mentalstate
  is '精神状态正常标志 ';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.heart_auscultation
  is '心脏听诊结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.lung_auscultation
  is '肺部听诊结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.extremities_examination
  is '四肢检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.spinal_examination
  is '脊柱检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.abdomen_examination
  is '腹部检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.trachea_examination
  is '气管检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.tooth_examination
  is '牙齿检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.ecg_examination
  is '心电检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.chest_x_examination
  is '胸部X线检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.ct_examination
  is 'CT检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.b_ultrasound
  is 'B超检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.mri_examination
  is 'MRI检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.lung_founction__examination
  is '肺功能检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.bloodrout_examination
  is '血常规检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.urinerout_examination
  is '尿常规检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.coagulation_examination
  is '凝血功能检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.liverfunction_examination
  is '肝功能检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.bloodgas_examination
  is '血气分析检查结果';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.anesthesia_adapt
  is '麻醉适应症';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.anesthesia_precaution
  is '注意事项';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.anesthesia_type_code
  is '拟行麻醉方式代码';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.anesthesia_type
  is '拟行麻醉方式';
comment on column CDR_EMR_ANESTHESIA_PRERECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_AWAITING_DELIVERYRECORD
(
    group_code                VARCHAR2(20),
    organization_code         VARCHAR2(20),
    domain_id                 VARCHAR2(2),
    unicode                   VARCHAR2(30) not null,
    patient_id                VARCHAR2(36),
    visit_no                  VARCHAR2(36),
    visittimes                INTEGER,
    inpatient_no              VARCHAR2(36),
    patient_name              VARCHAR2(20),
    gendercode                INTEGER,
    age                       VARCHAR2(20),
    bed_no                    VARCHAR2(20),
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20),
    dept_name                 VARCHAR2(50),
    ward_no                   VARCHAR2(20),
    ward_name                 VARCHAR2(50),
    record_createdate         DATE,
    record_personid           VARCHAR2(20),
    record_person             VARCHAR2(50),
    born_before_checker       VARCHAR2(50),
    born_before_checkdate     DATE,
    expect_born_date          DATE,
    pregant_no                INTEGER,
    borned_no                 INTEGER,
    predict_born_date         DATE,
    pressure_systolic         INTEGER,
    pressure_diastolic        INTEGER,
    temperature               NUMBER(2,1),
    pulse                     INTEGER,
    rate_respiratory          INTEGER,
    abdominal_circumference   NUMBER(3,1),
    fetal_position            VARCHAR2(200),
    fetal_rate_heart          INTEGER,
    contractions              VARCHAR2(500),
    cervical_thickness        VARCHAR2(200),
    miyaguchi_actions         VARCHAR2(500),
    fetal_membranes           VARCHAR2(100),
    first_out_loc             VARCHAR2(200),
    amniotic_fluid_condition  VARCHAR2(200),
    check_bef_born_t          VARCHAR2(200),
    gestation_action          VARCHAR2(500),
    plan_childbirth_type_code VARCHAR2(500),
    last_update_time          DATE
)
 ;
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.age
  is '年龄';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.room_no
  is '病房号';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.born_before_checker
  is '产程检查医生';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.born_before_checkdate
  is '产程检查日期';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.expect_born_date
  is '待产日期';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.pregant_no
  is '孕次';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.borned_no
  is '产次';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.predict_born_date
  is '预产期';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.temperature
  is '体温';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.pulse
  is '脉率   ';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.abdominal_circumference
  is '腹围';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.fetal_position
  is '胎方位';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.fetal_rate_heart
  is '胎心率';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.contractions
  is '宫缩情况';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.cervical_thickness
  is '宫颈厚度';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.miyaguchi_actions
  is '宫口情况';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.fetal_membranes
  is '胎膜情况，如“已破”';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.first_out_loc
  is '先露位置，如“头先露出”';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.amniotic_fluid_condition
  is '羊水情况';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.check_bef_born_t
  is '产前检查异常情况';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.gestation_action
  is '此次妊娠特殊情况';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.plan_childbirth_type_code
  is '计划分娩方式';
comment on column CDR_EMR_AWAITING_DELIVERYRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_BASE64
(
    file_id          VARCHAR2(50),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)   ;
comment on column CDR_EMR_BASE64.file_id
  is '文件索引id';
comment on column CDR_EMR_BASE64.base64
  is 'base64编码';
comment on column CDR_EMR_BASE64.create_time
  is '创建时间';
comment on column CDR_EMR_BASE64.last_update_time
  is '最后修改时间';
 





create table CDR_EMR_BLOOD_TRANSRECORD
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(50) not null,
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visittimes              INTEGER,
    inpatient_no            VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              INTEGER,
    age                     VARCHAR2(20),
    bed_no                  VARCHAR2(20),
    room_no                 VARCHAR2(20),
    dept_no                 VARCHAR2(20),
    dept_name               VARCHAR2(50),
    ward_no                 VARCHAR2(20),
    ward_name               VARCHAR2(50),
    record_createdate       DATE,
    record_personid         VARCHAR2(20),
    record_person           VARCHAR2(50),
    abo_blood_type          VARCHAR2(20),
    abo_blood_name          VARCHAR2(50),
    rh_blood_type           VARCHAR2(20),
    rh_blood_name           VARCHAR2(50),
    blood_trans_date        DATE,
    blood_trans_record      VARCHAR2(2000),
    last_update_time        DATE,
    transfusion_exec_name   VARCHAR2(200),
    transfusion_volume      VARCHAR2(100),
    transfusion_volume_unit VARCHAR2(20),
    applicationno           VARCHAR2(20)
)
 ;
comment on column CDR_EMR_BLOOD_TRANSRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_BLOOD_TRANSRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_BLOOD_TRANSRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_BLOOD_TRANSRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_BLOOD_TRANSRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_BLOOD_TRANSRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_BLOOD_TRANSRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_BLOOD_TRANSRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_BLOOD_TRANSRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_BLOOD_TRANSRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_BLOOD_TRANSRECORD.age
  is '年龄';
comment on column CDR_EMR_BLOOD_TRANSRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_BLOOD_TRANSRECORD.room_no
  is '病房号';
comment on column CDR_EMR_BLOOD_TRANSRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_BLOOD_TRANSRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_BLOOD_TRANSRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_BLOOD_TRANSRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_BLOOD_TRANSRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_BLOOD_TRANSRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_BLOOD_TRANSRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_BLOOD_TRANSRECORD.abo_blood_type
  is '患者ABO血型代码，ABO血型代码表';
comment on column CDR_EMR_BLOOD_TRANSRECORD.abo_blood_name
  is '患者ABO血型';
comment on column CDR_EMR_BLOOD_TRANSRECORD.rh_blood_type
  is '患者Rh血型代码，Rh血型代码表';
comment on column CDR_EMR_BLOOD_TRANSRECORD.rh_blood_name
  is '患者Rh血型';
comment on column CDR_EMR_BLOOD_TRANSRECORD.blood_trans_date
  is '输血时间';
comment on column CDR_EMR_BLOOD_TRANSRECORD.blood_trans_record
  is '输血过程详细记录';
comment on column CDR_EMR_BLOOD_TRANSRECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_BLOOD_TRANSRECORD.transfusion_exec_name
  is '输血执行人';
comment on column CDR_EMR_BLOOD_TRANSRECORD.transfusion_volume
  is '输血量';
comment on column CDR_EMR_BLOOD_TRANSRECORD.transfusion_volume_unit
  is '输血量单位';
comment on column CDR_EMR_BLOOD_TRANSRECORD.applicationno
  is '电子申请单号';






create table CDR_EMR_CAREPLAN
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(50) not null,
    patient_id           VARCHAR2(36),
    visit_no             VARCHAR2(36),
    visittimes           INTEGER,
    inpatient_no         VARCHAR2(36),
    patient_name         VARCHAR2(20),
    gendercode           INTEGER,
    age                  VARCHAR2(20),
    bed_no               VARCHAR2(20),
    room_no              VARCHAR2(20),
    dept_no              VARCHAR2(20),
    dept_name            VARCHAR2(50),
    ward_no              VARCHAR2(20),
    ward_name            VARCHAR2(50),
    record_createdate    DATE,
    record_personid      VARCHAR2(20),
    record_person        VARCHAR2(50),
    record_audit_date    DATE,
    record_auditor       VARCHAR2(20),
    record_auditor_id    VARCHAR2(50),
    nurse_level_code     NUMBER,
    nurse_level          VARCHAR2(50),
    nurse_type_code      NUMBER,
    nurse_type           VARCHAR2(50),
    nursing_problem      VARCHAR2(50),
    nurse_operate_name   VARCHAR2(50),
    nurse_operate_item   VARCHAR2(50),
    nurse_operate_result VARCHAR2(50),
    catheter_nurse       VARCHAR2(50),
    posture_nurse        VARCHAR2(50),
    skin_nurse           VARCHAR2(50),
    trachea_nurse_code   NUMBER,
    trachea_nurse        VARCHAR2(50),
    safety_nurse_code    NUMBER,
    safety_nurse         VARCHAR2(50),
    diet_guide_code      VARCHAR2(2),
    diet_guide           VARCHAR2(50),
    last_update_time     DATE
)
 ;
comment on column CDR_EMR_CAREPLAN.group_code
  is '集团编码';
comment on column CDR_EMR_CAREPLAN.organization_code
  is '组织编码';
comment on column CDR_EMR_CAREPLAN.domain_id
  is '系统域标识';
comment on column CDR_EMR_CAREPLAN.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_CAREPLAN.patient_id
  is '个人标识号';
comment on column CDR_EMR_CAREPLAN.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_CAREPLAN.visittimes
  is '就诊次数';
comment on column CDR_EMR_CAREPLAN.inpatient_no
  is '住院号';
comment on column CDR_EMR_CAREPLAN.patient_name
  is '患者姓名';
comment on column CDR_EMR_CAREPLAN.gendercode
  is '性别代码代码';
comment on column CDR_EMR_CAREPLAN.age
  is '年龄';
comment on column CDR_EMR_CAREPLAN.bed_no
  is '床位号';
comment on column CDR_EMR_CAREPLAN.room_no
  is '病房号';
comment on column CDR_EMR_CAREPLAN.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_CAREPLAN.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_CAREPLAN.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_CAREPLAN.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_CAREPLAN.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_CAREPLAN.record_personid
  is '文档作者编码';
comment on column CDR_EMR_CAREPLAN.record_person
  is '文档作者';
comment on column CDR_EMR_CAREPLAN.record_audit_date
  is '记录审核日期';
comment on column CDR_EMR_CAREPLAN.record_auditor
  is '记录审核人';
comment on column CDR_EMR_CAREPLAN.record_auditor_id
  is '记录审核人编码';
comment on column CDR_EMR_CAREPLAN.nurse_level_code
  is '护理等级代码， ';
comment on column CDR_EMR_CAREPLAN.nurse_level
  is '护理等级 ';
comment on column CDR_EMR_CAREPLAN.nurse_type_code
  is '护理类型代码， ';
comment on column CDR_EMR_CAREPLAN.nurse_type
  is '护理类型';
comment on column CDR_EMR_CAREPLAN.nursing_problem
  is '护理问题';
comment on column CDR_EMR_CAREPLAN.nurse_operate_name
  is '护理操作名称';
comment on column CDR_EMR_CAREPLAN.nurse_operate_item
  is '护理操作项目类目名称';
comment on column CDR_EMR_CAREPLAN.nurse_operate_result
  is '护理操作结果';
comment on column CDR_EMR_CAREPLAN.catheter_nurse
  is '导管护理描述';
comment on column CDR_EMR_CAREPLAN.posture_nurse
  is '体位护理描述';
comment on column CDR_EMR_CAREPLAN.skin_nurse
  is '皮肤护理描述';
comment on column CDR_EMR_CAREPLAN.trachea_nurse_code
  is '气管护理代码';
comment on column CDR_EMR_CAREPLAN.trachea_nurse
  is '气管护理,如：翻身，拍背';
comment on column CDR_EMR_CAREPLAN.safety_nurse_code
  is '安全护理代码  ';
comment on column CDR_EMR_CAREPLAN.safety_nurse
  is '安全护理';
comment on column CDR_EMR_CAREPLAN.diet_guide_code
  is '饮食指导代码 ';
comment on column CDR_EMR_CAREPLAN.diet_guide
  is '饮食指导，如：普通饮食';
comment on column CDR_EMR_CAREPLAN.last_update_time
  is '最后修改时间';






create table CDR_EMR_CONSULTATIONRECORD
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(20),
    inpatient_no                  VARCHAR2(20),
    visit_times                   NUMBER(3),
    visit_no                      VARCHAR2(20),
    patient_name                  VARCHAR2(20),
    age                           VARCHAR2(30),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(200),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(200),
    room_no                       VARCHAR2(10),
    bed_no                        VARCHAR2(36),
    applicationno                 VARCHAR2(20),
    urgencycode                   NUMBER(1),
    request_time                  DATE,
    apply_doc_code                VARCHAR2(20),
    illness_descipt               VARCHAR2(4000),
    reason                        VARCHAR2(2000),
    consultationplacename         VARCHAR2(500),
    reply_doc_code                VARCHAR2(10),
    reply_doc                     VARCHAR2(100),
    reply_dept_code               VARCHAR2(10),
    reply_dept                    VARCHAR2(500),
    consult_opinion               VARCHAR2(4000),
    consult_tieme                 DATE,
    delete_flag                   NUMBER(1),
    last_update_time              DATE,
    gendercode                    INTEGER,
    apply_doc                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(50),
    record_person                 VARCHAR2(50),
    apply_dept_code               VARCHAR2(50),
    apply_dept                    VARCHAR2(200),
    examination_auxiliary         VARCHAR2(2000),
    treatment_process_description VARCHAR2(2000),
    medical_records_summary       VARCHAR2(2000),
    diagnosis                     VARCHAR2(2000)
)
 ;
comment on column CDR_EMR_CONSULTATIONRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_CONSULTATIONRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_CONSULTATIONRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_CONSULTATIONRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_CONSULTATIONRECORD.patient_id
  is '患者ID';
comment on column CDR_EMR_CONSULTATIONRECORD.inpatient_no
  is '住院号标识';
comment on column CDR_EMR_CONSULTATIONRECORD.visit_times
  is '就诊次数';
comment on column CDR_EMR_CONSULTATIONRECORD.visit_no
  is '就诊流水号';
comment on column CDR_EMR_CONSULTATIONRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_CONSULTATIONRECORD.age
  is '年龄';
comment on column CDR_EMR_CONSULTATIONRECORD.dept_no
  is '病人所在科室编码';
comment on column CDR_EMR_CONSULTATIONRECORD.dept_name
  is '病人所在科室';
comment on column CDR_EMR_CONSULTATIONRECORD.ward_no
  is '病人所在病区编码';
comment on column CDR_EMR_CONSULTATIONRECORD.ward_name
  is '病人所在病区';
comment on column CDR_EMR_CONSULTATIONRECORD.room_no
  is '病房编号';
comment on column CDR_EMR_CONSULTATIONRECORD.bed_no
  is '病床号';
comment on column CDR_EMR_CONSULTATIONRECORD.applicationno
  is '会诊申请单号';
comment on column CDR_EMR_CONSULTATIONRECORD.urgencycode
  is '紧急程度编码 1,常规会诊，2、急会诊';
comment on column CDR_EMR_CONSULTATIONRECORD.request_time
  is '申请时间';
comment on column CDR_EMR_CONSULTATIONRECORD.apply_doc_code
  is '申请医生编码';
comment on column CDR_EMR_CONSULTATIONRECORD.illness_descipt
  is '病情简要描述';
comment on column CDR_EMR_CONSULTATIONRECORD.reason
  is '申请会诊目的';
comment on column CDR_EMR_CONSULTATIONRECORD.consultationplacename
  is '会诊地点';
comment on column CDR_EMR_CONSULTATIONRECORD.reply_doc_code
  is '会诊应答人编码';
comment on column CDR_EMR_CONSULTATIONRECORD.reply_doc
  is '会诊应答人';
comment on column CDR_EMR_CONSULTATIONRECORD.reply_dept_code
  is '应答科室编码';
comment on column CDR_EMR_CONSULTATIONRECORD.reply_dept
  is '应答科室';
comment on column CDR_EMR_CONSULTATIONRECORD.consult_opinion
  is '会诊意见';
comment on column CDR_EMR_CONSULTATIONRECORD.consult_tieme
  is '会诊时间';
comment on column CDR_EMR_CONSULTATIONRECORD.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_EMR_CONSULTATIONRECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_CONSULTATIONRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_CONSULTATIONRECORD.apply_doc
  is '申请医生姓名';
comment on column CDR_EMR_CONSULTATIONRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_CONSULTATIONRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_CONSULTATIONRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_CONSULTATIONRECORD.apply_dept_code
  is '申请科室编码';
comment on column CDR_EMR_CONSULTATIONRECORD.apply_dept
  is '申请科室';
comment on column CDR_EMR_CONSULTATIONRECORD.examination_auxiliary
  is '辅助检查结果';
comment on column CDR_EMR_CONSULTATIONRECORD.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_CONSULTATIONRECORD.medical_records_summary
  is '病历摘要';
comment on column CDR_EMR_CONSULTATIONRECORD.diagnosis
  is '会诊诊断';







create table CDR_EMR_CONSULTATIONRECORD_BAK
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(20),
    inpatient_no                  VARCHAR2(20),
    visit_times                   NUMBER(3),
    visit_no                      VARCHAR2(20),
    patient_name                  VARCHAR2(20),
    age                           VARCHAR2(30),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(200),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(200),
    room_no                       VARCHAR2(10),
    bed_no                        VARCHAR2(36),
    applicationno                 VARCHAR2(20),
    urgencycode                   NUMBER(1),
    request_time                  DATE,
    apply_doc_code                VARCHAR2(20),
    illness_descipt               VARCHAR2(4000),
    reason                        VARCHAR2(2000),
    consultationplacename         VARCHAR2(200),
    reply_doc_code                VARCHAR2(10),
    reply_doc                     VARCHAR2(100),
    reply_dept_code               VARCHAR2(10),
    reply_dept                    VARCHAR2(200),
    consult_opinion               VARCHAR2(4000),
    consult_tieme                 DATE,
    delete_flag                   NUMBER(1),
    last_update_time              DATE,
    gendercode                    INTEGER,
    apply_doc                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(50),
    record_person                 VARCHAR2(50),
    apply_dept_code               VARCHAR2(50),
    apply_dept                    VARCHAR2(200),
    examination_auxiliary         VARCHAR2(2000),
    treatment_process_description VARCHAR2(2000),
    medical_records_summary       VARCHAR2(2000),
    diagnosis                     VARCHAR2(2000)
)
 ;





create table CDR_EMR_CONTENT
(
    search_category       VARCHAR2(60),
    topic                 VARCHAR2(240),
    instruments_type      VARCHAR2(60),
    mr_class_code         VARCHAR2(36),
    mr_name               VARCHAR2(240),
    mr_code               VARCHAR2(150),
    caption_date_time     DATE,
    file_unique_id        VARCHAR2(144),
    file_flag             VARCHAR2(3),
    mr_content_html       BLOB,
    mr_content_text       BLOB,
    last_modify_date_time DATE,
    create_date_time      DATE,
    patient_id            VARCHAR2(96),
    inpatient_no          VARCHAR2(48) not null,
    visit_time            NUMBER(4) not null,
    admission_date_time   DATE,
    id_card               VARCHAR2(60),
    patient_name          VARCHAR2(90),
    org_code              CHAR(30),
    org_name              CHAR(48),
    department            VARCHAR2(96),
    department_code       VARCHAR2(48),
    creator_id            VARCHAR2(4000),
    creator_name          VARCHAR2(90),
    delete_flag           NUMBER(1),
    last_update_time      DATE,
    unicode               VARCHAR2(2000) not null
)   ;
comment on column CDR_EMR_CONTENT.last_update_time
  is '最后修改时间';








create table CDR_EMR_DAILYRECORD
(
    group_code                         VARCHAR2(20),
    organization_code                  VARCHAR2(20),
    domain_id                          VARCHAR2(2),
    unicode                            VARCHAR2(50) not null,
    patient_id                         VARCHAR2(36),
    visit_no                           VARCHAR2(36),
    visittimes                         INTEGER,
    inpatient_no                       VARCHAR2(36),
    patient_name                       VARCHAR2(20),
    gendercode                         INTEGER,
    age                                VARCHAR2(20),
    bed_no                             VARCHAR2(20),
    room_no                            VARCHAR2(20),
    dept_no                            VARCHAR2(20),
    dept_name                          VARCHAR2(50),
    ward_no                            VARCHAR2(20),
    ward_name                          VARCHAR2(50),
    record_createdate                  DATE,
    record_personid                    VARCHAR2(20),
    record_person                      VARCHAR2(50),
    doctor_directorid                  VARCHAR2(12),
    doctor_director                    VARCHAR2(50),
    doctor_director_signdate           DATE,
    pro_duty_category                  VARCHAR2(16),
    pro_duty_categorycode              VARCHAR2(4),
    hospitalization_process            VARCHAR2(4000),
    tcm_observations                   VARCHAR2(4000),
    doctoradvice                       VARCHAR2(1000),
    treatment_plan                     VARCHAR2(500),
    syndrome_differentiation_treatment VARCHAR2(500),
    tcm_decocting_ways                 VARCHAR2(16),
    tcm_medication                     VARCHAR2(16),
    last_update_time                   DATE
)
 ;
comment on column CDR_EMR_DAILYRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_DAILYRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_DAILYRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_DAILYRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_DAILYRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_DAILYRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_DAILYRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_DAILYRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_DAILYRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_DAILYRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_DAILYRECORD.age
  is '年龄';
comment on column CDR_EMR_DAILYRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_DAILYRECORD.room_no
  is '病房号';
comment on column CDR_EMR_DAILYRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_DAILYRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_DAILYRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_DAILYRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_DAILYRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_DAILYRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_DAILYRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_DAILYRECORD.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_DAILYRECORD.doctor_director
  is '主任医师';
comment on column CDR_EMR_DAILYRECORD.doctor_director_signdate
  is '主任医师签字日期';
comment on column CDR_EMR_DAILYRECORD.pro_duty_category
  is '专业技术职务类别';
comment on column CDR_EMR_DAILYRECORD.pro_duty_categorycode
  is '专业技术职务类别代码';
comment on column CDR_EMR_DAILYRECORD.hospitalization_process
  is '住院病程';
comment on column CDR_EMR_DAILYRECORD.tcm_observations
  is '中医“四诊”观察结果';
comment on column CDR_EMR_DAILYRECORD.doctoradvice
  is '医嘱内容';
comment on column CDR_EMR_DAILYRECORD.treatment_plan
  is '诊疗计划';
comment on column CDR_EMR_DAILYRECORD.syndrome_differentiation_treatment
  is '辨证论治';
comment on column CDR_EMR_DAILYRECORD.tcm_decocting_ways
  is '中药饮片煎煮法';
comment on column CDR_EMR_DAILYRECORD.tcm_medication
  is '中药用药方法';
comment on column CDR_EMR_DAILYRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_DEATH_DISCUSSIONRECORDS
(
    group_code                VARCHAR2(20),
    organization_code         VARCHAR2(20),
    domain_id                 VARCHAR2(2),
    unicode                   VARCHAR2(50) not null,
    patient_id                VARCHAR2(36),
    visit_no                  VARCHAR2(36),
    visittimes                INTEGER,
    inpatient_no              VARCHAR2(36),
    patient_name              VARCHAR2(20),
    gendercode                INTEGER,
    age                       VARCHAR2(20),
    bed_no                    VARCHAR2(20),
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20),
    dept_name                 VARCHAR2(50),
    ward_no                   VARCHAR2(20),
    ward_name                 VARCHAR2(50),
    record_createdate         DATE,
    record_personid           VARCHAR2(20),
    record_person             VARCHAR2(50),
    doctor_directorid         VARCHAR2(20),
    doctor_director           VARCHAR2(50),
    doctor_director_signdate  DATE,
    inpatient_doctorid        VARCHAR2(20),
    inpatient_doctor          VARCHAR2(50),
    inpatient_doctor_signdate DATE,
    charge_doctor_id          VARCHAR2(20),
    charge_doctor             VARCHAR2(50),
    charge_doctor_signdate    DATE,
    participants              VARCHAR2(500),
    meeting_chair             VARCHAR2(50),
    meeting_chair_id          VARCHAR2(20),
    death_reason              VARCHAR2(2000),
    deathdiag                 VARCHAR2(2000),
    discussion_record         LONG,
    discussion_summary        VARCHAR2(4000),
    discussion_sign_name      VARCHAR2(50),
    last_update_time          DATE
)
 ;
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.group_code
  is '集团编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.organization_code
  is '组织编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.domain_id
  is '系统域标识';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.patient_id
  is '个人标识号';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.visittimes
  is '就诊次数';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.inpatient_no
  is '住院号';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.patient_name
  is '患者姓名';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.gendercode
  is '性别代码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.age
  is '年龄';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.bed_no
  is '床位号';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.room_no
  is '病房号';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.record_personid
  is '文档作者编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.record_person
  is '文档作者';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.doctor_director
  is '主任医师';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.doctor_director_signdate
  is '主任医师签字日期';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.inpatient_doctor_signdate
  is '住院医师签字日期时间';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.charge_doctor_signdate
  is '主治医师签字日期';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.participants
  is '参会人员';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.meeting_chair
  is '主持人';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.meeting_chair_id
  is '主持人员编码';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.death_reason
  is '死亡原因';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.deathdiag
  is '死亡诊断-诊断名称';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.discussion_record
  is '死亡讨论记录';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.discussion_summary
  is '主持人总结意见';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.discussion_sign_name
  is '主持人签名';
comment on column CDR_EMR_DEATH_DISCUSSIONRECORDS.last_update_time
  is '最后修改时间';






create table CDR_EMR_DEATH_RECORDS
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(100) not null,
    patient_id                    VARCHAR2(36),
    visit_no                      VARCHAR2(36),
    visittimes                    INTEGER,
    inpatient_no                  VARCHAR2(36),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    age                           VARCHAR2(20),
    bed_no                        VARCHAR2(20),
    room_no                       VARCHAR2(20),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(50),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(20),
    record_person                 VARCHAR2(50),
    doctor_directorid             VARCHAR2(20),
    doctor_director               VARCHAR2(50),
    doctor_director_signdate      DATE,
    inpatient_doctorid            VARCHAR2(20),
    inpatient_doctor              VARCHAR2(50),
    inpatient_doctor_signdate     DATE,
    charge_doctor_id              VARCHAR2(20),
    charge_doctor                 VARCHAR2(50),
    charge_doctor_signdate        DATE,
    admission_hospital_state      VARCHAR2(2000),
    admidiag                      VARCHAR2(200),
    in_hospital_date              DATE,
    treatment_process_description VARCHAR2(4000),
    death_date                    DATE,
    death_reason                  VARCHAR2(2000),
    deathdiag                     VARCHAR2(2000),
    complication                  VARCHAR2(2000),
    is_autopsy                    NUMBER,
    last_update_time              DATE,
    admidiag_code                 VARCHAR2(200),
    deathdiag_code                VARCHAR2(200)
)
 ;
comment on column CDR_EMR_DEATH_RECORDS.group_code
  is '集团编码';
comment on column CDR_EMR_DEATH_RECORDS.organization_code
  is '组织编码';
comment on column CDR_EMR_DEATH_RECORDS.domain_id
  is '系统域标识';
comment on column CDR_EMR_DEATH_RECORDS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_DEATH_RECORDS.patient_id
  is '个人标识号';
comment on column CDR_EMR_DEATH_RECORDS.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_DEATH_RECORDS.visittimes
  is '就诊次数';
comment on column CDR_EMR_DEATH_RECORDS.inpatient_no
  is '住院号';
comment on column CDR_EMR_DEATH_RECORDS.patient_name
  is '患者姓名';
comment on column CDR_EMR_DEATH_RECORDS.gendercode
  is '性别代码';
comment on column CDR_EMR_DEATH_RECORDS.age
  is '年龄';
comment on column CDR_EMR_DEATH_RECORDS.bed_no
  is '床位号';
comment on column CDR_EMR_DEATH_RECORDS.room_no
  is '病房号';
comment on column CDR_EMR_DEATH_RECORDS.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_DEATH_RECORDS.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_DEATH_RECORDS.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_DEATH_RECORDS.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_DEATH_RECORDS.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_DEATH_RECORDS.record_personid
  is '文档作者编码';
comment on column CDR_EMR_DEATH_RECORDS.record_person
  is '文档作者';
comment on column CDR_EMR_DEATH_RECORDS.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_DEATH_RECORDS.doctor_director
  is '主任医师';
comment on column CDR_EMR_DEATH_RECORDS.doctor_director_signdate
  is '主任医师签字日期';
comment on column CDR_EMR_DEATH_RECORDS.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_DEATH_RECORDS.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_DEATH_RECORDS.inpatient_doctor_signdate
  is '住院医师签字日期时间';
comment on column CDR_EMR_DEATH_RECORDS.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_DEATH_RECORDS.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_DEATH_RECORDS.charge_doctor_signdate
  is '主治医师签字日期';
comment on column CDR_EMR_DEATH_RECORDS.admission_hospital_state
  is '入院情况';
comment on column CDR_EMR_DEATH_RECORDS.admidiag
  is '入院诊断-诊断名称';
comment on column CDR_EMR_DEATH_RECORDS.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_DEATH_RECORDS.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_DEATH_RECORDS.death_date
  is '死亡日期时间';
comment on column CDR_EMR_DEATH_RECORDS.death_reason
  is '死亡原因';
comment on column CDR_EMR_DEATH_RECORDS.deathdiag
  is '死亡诊断-诊断名称';
comment on column CDR_EMR_DEATH_RECORDS.complication
  is '并发症';
comment on column CDR_EMR_DEATH_RECORDS.is_autopsy
  is '家属是否同意尸体解剖标志';
comment on column CDR_EMR_DEATH_RECORDS.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_DEATH_RECORDS.admidiag_code
  is '入院诊断-诊断编码';
comment on column CDR_EMR_DEATH_RECORDS.deathdiag_code
  is '死亡诊断-诊断编码';






create table CDR_EMR_DISCHARGED_BRIEFRECORD
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(36) not null,
    patient_id                    VARCHAR2(36),
    visit_no                      VARCHAR2(36),
    visittimes                    INTEGER,
    inpatient_no                  VARCHAR2(36),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    age                           VARCHAR2(20),
    bed_no                        VARCHAR2(20),
    room_no                       VARCHAR2(20),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(50),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(20),
    record_person                 VARCHAR2(50),
    doctor_director_signdate      DATE,
    doctor_director               VARCHAR2(50),
    inpatient_doctor_signdate     DATE,
    inpatient_doctorid            VARCHAR2(20),
    inpatient_doctor              VARCHAR2(50),
    admission_hospital_state      VARCHAR2(500),
    admidiag_wm                   VARCHAR2(200),
    examination                   VARCHAR2(4000),
    treatment_process_description VARCHAR2(4000),
    dischdiag_symptom_physical    VARCHAR2(4000),
    discharge_hospital_state      VARCHAR2(4000),
    dischdiag_wm                  VARCHAR2(200),
    discharge_advice              VARCHAR2(4000),
    last_update_time              DATE
)
 ;
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.age
  is '年龄';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.room_no
  is '病房号';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.doctor_director_signdate
  is '上级医师签字时间';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.doctor_director
  is '上级医师名称';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.inpatient_doctor_signdate
  is '住院医师签字时间';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.admission_hospital_state
  is '入院情况';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.admidiag_wm
  is '入院诊断-西医诊断名称';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.examination
  is '院内检查';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.dischdiag_symptom_physical
  is '出院时症状与体征';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.discharge_hospital_state
  is '出院情况';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.dischdiag_wm
  is '出院诊断-西医诊断名称';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.discharge_advice
  is '出院医嘱';
comment on column CDR_EMR_DISCHARGED_BRIEFRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_DISCHARGE_ASSESSMENT
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(36),
    visit_no                      VARCHAR2(36),
    visittimes                    INTEGER,
    inpatient_no                  VARCHAR2(36),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    age                           VARCHAR2(20),
    bed_no                        VARCHAR2(20),
    room_no                       VARCHAR2(20),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(50),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(20),
    record_person                 VARCHAR2(50),
    record_auditdate              DATE,
    record_auditor                VARCHAR2(20),
    record_auditor_id             VARCHAR2(50),
    out_hospital_date             DATE,
    outhospital_status            VARCHAR2(50),
    outhospital_way_code          INTEGER,
    outhospital_way               VARCHAR2(100),
    diet_guide_code               VARCHAR2(2),
    diet_guide                    VARCHAR2(200),
    guide_life_attitude           VARCHAR2(200),
    contents_education_propaganda VARCHAR2(200),
    guide_revisiting              VARCHAR2(200),
    guide_medication              VARCHAR2(200),
    diet_satutrtion_code          INTEGER,
    diet_satutrtion               VARCHAR2(200),
    self_care_ability_code        INTEGER,
    self_care_ability             VARCHAR2(200),
    last_update_time              DATE
)
 ;
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.group_code
  is '集团编码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.organization_code
  is '组织编码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.gendercode
  is '性别代码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.age
  is '年龄';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.bed_no
  is '床位号';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.room_no
  is '病房号';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.record_personid
  is '文档作者编码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.record_person
  is '文档作者';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.record_auditdate
  is '记录审核日期';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.record_auditor
  is '记录审核人';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.record_auditor_id
  is '记录审核人编码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.out_hospital_date
  is '出院日期时间';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.outhospital_status
  is '出院情况';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.outhospital_way_code
  is '离院方式代码 ';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.outhospital_way
  is '离院方式,如医嘱离院';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.diet_guide_code
  is '饮食指导代码，饮食指导代码表';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.diet_guide
  is '饮食指导，如：普通饮食';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.guide_life_attitude
  is '生活方式指导  ';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.contents_education_propaganda
  is '宣教内容, ';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.guide_revisiting
  is '复诊指导';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.guide_medication
  is '用药指导  ';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.diet_satutrtion_code
  is '饮食情况代码';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.diet_satutrtion
  is '饮食情况，如：良好';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.self_care_ability_code
  is '自理能力代码 ';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.self_care_ability
  is '自理能力,如：完全自理';
comment on column CDR_EMR_DISCHARGE_ASSESSMENT.last_update_time
  is '最后修改时间';






create table CDR_EMR_DISCHARGE_RECORDS
(
    group_code                     VARCHAR2(20),
    organization_code              VARCHAR2(20),
    domain_id                      VARCHAR2(2),
    unicode                        VARCHAR2(50) not null,
    patient_id                     VARCHAR2(36),
    visit_no                       VARCHAR2(36),
    visittimes                     INTEGER,
    inpatient_no                   VARCHAR2(36),
    patient_name                   VARCHAR2(20),
    gendercode                     INTEGER,
    age                            VARCHAR2(20),
    bed_no                         VARCHAR2(20),
    room_no                        VARCHAR2(20),
    dept_no                        VARCHAR2(20),
    dept_name                      VARCHAR2(50),
    ward_no                        VARCHAR2(20),
    ward_name                      VARCHAR2(50),
    record_createdate              DATE,
    record_personid                VARCHAR2(20),
    record_person                  VARCHAR2(50),
    doctor_directorid              VARCHAR2(20),
    doctor_director                VARCHAR2(50),
    doctor_director_signdate       DATE,
    inpatient_doctorid             VARCHAR2(20),
    inpatient_doctor               VARCHAR2(50),
    inpatient_doctor_signdate      DATE,
    charge_doctor_id               VARCHAR2(20),
    charge_doctor                  VARCHAR2(50),
    charge_doctor_signdate         DATE,
    in_hospital_date               DATE,
    admission_hospital_state       VARCHAR2(2000),
    admidiag_wm                    VARCHAR2(200),
    treatment_process_description  VARCHAR2(4000),
    examination_auxiliary          VARCHAR2(500),
    tcm_observations               VARCHAR2(200),
    therapeutic_principleandmethod VARCHAR2(100),
    out_hospital_date              DATE,
    outhospital_status             VARCHAR2(2000),
    dischdiag_name                 VARCHAR2(200),
    discharge_advice               VARCHAR2(4000),
    dischdiag_symptom_physical     VARCHAR2(4000),
    note                           VARCHAR2(200),
    last_update_time               DATE,
    dischdiag_code                 VARCHAR2(200),
    admidiag_wm_code               VARCHAR2(200),
    "CHARGE_DOCTOR_ SIGNDATE"      DATE,
    "DOCTOR_DIRECTOR_ SIGNDATE"    DATE
)
 ;
comment on column CDR_EMR_DISCHARGE_RECORDS.group_code
  is '集团编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.organization_code
  is '组织编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.domain_id
  is '系统域标识';
comment on column CDR_EMR_DISCHARGE_RECORDS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_DISCHARGE_RECORDS.patient_id
  is '个人标识号';
comment on column CDR_EMR_DISCHARGE_RECORDS.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_DISCHARGE_RECORDS.visittimes
  is '就诊次数';
comment on column CDR_EMR_DISCHARGE_RECORDS.inpatient_no
  is '住院号';
comment on column CDR_EMR_DISCHARGE_RECORDS.patient_name
  is '患者姓名';
comment on column CDR_EMR_DISCHARGE_RECORDS.gendercode
  is '性别代码';
comment on column CDR_EMR_DISCHARGE_RECORDS.age
  is '年龄';
comment on column CDR_EMR_DISCHARGE_RECORDS.bed_no
  is '床位号';
comment on column CDR_EMR_DISCHARGE_RECORDS.room_no
  is '病房号';
comment on column CDR_EMR_DISCHARGE_RECORDS.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_DISCHARGE_RECORDS.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_DISCHARGE_RECORDS.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_DISCHARGE_RECORDS.record_personid
  is '文档作者编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.record_person
  is '文档作者';
comment on column CDR_EMR_DISCHARGE_RECORDS.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_DISCHARGE_RECORDS.doctor_director
  is '主任医师';
comment on column CDR_EMR_DISCHARGE_RECORDS.doctor_director_signdate
  is '主任医师签字日期';
comment on column CDR_EMR_DISCHARGE_RECORDS.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_DISCHARGE_RECORDS.inpatient_doctor_signdate
  is '住院医师签字日期时间';
comment on column CDR_EMR_DISCHARGE_RECORDS.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_DISCHARGE_RECORDS.charge_doctor_signdate
  is '主治医师签字日期';
comment on column CDR_EMR_DISCHARGE_RECORDS.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_DISCHARGE_RECORDS.admission_hospital_state
  is '入院情况';
comment on column CDR_EMR_DISCHARGE_RECORDS.admidiag_wm
  is '入院诊断-西医诊断名称';
comment on column CDR_EMR_DISCHARGE_RECORDS.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_DISCHARGE_RECORDS.examination_auxiliary
  is '辅助检查结果';
comment on column CDR_EMR_DISCHARGE_RECORDS.tcm_observations
  is '中医“四诊”观察结果';
comment on column CDR_EMR_DISCHARGE_RECORDS.therapeutic_principleandmethod
  is '治则治法';
comment on column CDR_EMR_DISCHARGE_RECORDS.out_hospital_date
  is '出院日期时间';
comment on column CDR_EMR_DISCHARGE_RECORDS.outhospital_status
  is '出院情况';
comment on column CDR_EMR_DISCHARGE_RECORDS.dischdiag_name
  is '出院诊断-西医诊断名称';
comment on column CDR_EMR_DISCHARGE_RECORDS.discharge_advice
  is '出院医嘱';
comment on column CDR_EMR_DISCHARGE_RECORDS.dischdiag_symptom_physical
  is '出院时症状与体征';
comment on column CDR_EMR_DISCHARGE_RECORDS.note
  is '备注';
comment on column CDR_EMR_DISCHARGE_RECORDS.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_DISCHARGE_RECORDS.dischdiag_code
  is '出院诊断-西医诊断编码';
comment on column CDR_EMR_DISCHARGE_RECORDS.admidiag_wm_code
  is '入院诊断-西医诊断编码';
comment on column CDR_EMR_DISCHARGE_RECORDS."CHARGE_DOCTOR_ SIGNDATE"
  is '主治医师签字日期';
comment on column CDR_EMR_DISCHARGE_RECORDS."DOCTOR_DIRECTOR_ SIGNDATE"
  is '主任医师签字日期';






create table CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(100) not null,
    patient_id            VARCHAR2(36),
    visit_no              VARCHAR2(36),
    visittimes            INTEGER,
    outpatient_no         VARCHAR2(36),
    patient_name          VARCHAR2(20),
    gendercode            INTEGER,
    age                   VARCHAR2(20),
    record_createdate     DATE,
    record_personid       VARCHAR2(20),
    record_person         VARCHAR2(50),
    department_id         VARCHAR2(20),
    department            VARCHAR2(50),
    visit_date            DATE,
    in_observatroom_time  DATE,
    author_assigned_id    VARCHAR2(20),
    author_assigned       VARCHAR2(50),
    allergies_flar        NUMBER,
    allergies             VARCHAR2(100),
    illness               VARCHAR2(500),
    illness_current       VARCHAR2(500),
    illness_history       VARCHAR2(500),
    examination_physique  VARCHAR2(500),
    exam_auxiliary_item   VARCHAR2(100),
    examination_auxiliary VARCHAR2(100),
    rescue_begindate      DATE,
    rescue_enddate        DATE,
    rescue_processdesc    VARCHAR2(200),
    rescuer               VARCHAR2(100),
    medical_record        LONG,
    medical_record_date   DATE,
    medical_record_desc   VARCHAR2(200),
    notices               VARCHAR2(200),
    direction             VARCHAR2(50),
    recorde_time          DATE,
    revoke_time           DATE,
    last_modify_time      DATE,
    delete_flag           NUMBER,
    last_update_time      DATE
)
 ;
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.outpatient_no
  is '门诊号';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.age
  is '年龄';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.record_createdate
  is '记录日期';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.department_id
  is '科室编码';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.department
  is '科室名称';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.visit_date
  is '就诊日期时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.in_observatroom_time
  is '收人观察室日期时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.author_assigned_id
  is '就诊医师编码';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.author_assigned
  is '就诊医师';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.allergies_flar
  is '过敏标志';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.allergies
  is '过敏史描述';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.illness
  is '主诉';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.illness_current
  is '现病史';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.illness_history
  is '既往史';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.examination_physique
  is '体格检查结果';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.exam_auxiliary_item
  is '辅助检查项目';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.examination_auxiliary
  is '辅助检查结果';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.rescue_begindate
  is '抢救开始时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.rescue_enddate
  is '抢救结束时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.rescue_processdesc
  is '抢救记录描述';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.rescuer
  is '参加抢救人员名单';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.medical_record
  is '急诊留观病程记录';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.medical_record_date
  is '急诊留观病程记录时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.medical_record_desc
  is '急诊留观病程记录描述';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.notices
  is '注意事项';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.direction
  is '患者去向';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.recorde_time
  is '记录时间，';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.revoke_time
  is '撤销时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.last_modify_time
  is '编辑时间';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.delete_flag
  is '修改标志';
comment on column CDR_EMR_EMERGENCY_OBSERV_MEDICALRECORD.last_update_time
  is '最后修改时间';





create table CDR_EMR_EXPENSIVEMEDICON_USAGERECORD
(
    group_code                VARCHAR2(20),
    organization_code         VARCHAR2(20),
    domain_id                 VARCHAR2(2),
    unicode                   VARCHAR2(30) not null,
    patient_id                VARCHAR2(36),
    visit_no                  VARCHAR2(36),
    visittimes                INTEGER,
    inpatient_no              VARCHAR2(36),
    patient_name              VARCHAR2(20),
    gendercode                INTEGER,
    age                       VARCHAR2(20),
    bed_no                    VARCHAR2(20),
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20),
    dept_name                 VARCHAR2(50),
    ward_no                   VARCHAR2(20),
    ward_name                 VARCHAR2(50),
    record_createdate         DATE,
    record_personid           VARCHAR2(20),
    record_person             VARCHAR2(50),
    haigh_consumables_usetype VARCHAR2(50),
    haigh_cons_using_quantity INTEGER,
    haigh_consumables_unit    VARCHAR2(20),
    haigh_consumables_code    VARCHAR2(50),
    haigh_consumables_name    VARCHAR2(100),
    manufacturer              VARCHAR2(100),
    supplier                  VARCHAR2(100),
    isimplantability          NUMBER,
    last_update_time          DATE
)
 ;
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.age
  is '年龄';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.room_no
  is '病房号';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.haigh_consumables_usetype
  is '高值耗材使用途径';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.haigh_cons_using_quantity
  is '耗材使用数量';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.haigh_consumables_unit
  is '使用数量单位';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.haigh_consumables_code
  is '耗材编码';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.haigh_consumables_name
  is '材料名称';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.manufacturer
  is '生产厂家';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.supplier
  is '供应商';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.isimplantability
  is '可植入性耗材标志';
comment on column CDR_EMR_EXPENSIVEMEDICON_USAGERECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_FIRSTPAGE_MEDICALRECORD
(
    disease_state                 VARCHAR2(50),
    critically_ill_flag           NUMBER,
    isdrug_antibact               NUMBER,
    continu_hours                 INTEGER,
    combination_medical           NUMBER,
    clinical_pathway_flag         NUMBER,
    clinical_pathway_code         NUMBER,
    finish_clinical_path          NUMBER,
    abort_clinical_path           VARCHAR2(50),
    mutat_clinical_path           NUMBER,
    mutat_reason                  NUMBER,
    used_tcm_preparation          NUMBER,
    used_tcm_drug                 NUMBER,
    used_tcm_technology           VARCHAR2(50),
    used_tcm_datt                 VARCHAR2(50),
    dialect_nurse                 NUMBER,
    rescue_times                  INTEGER,
    rescue_success_time           INTEGER,
    is_illness_case               NUMBER,
    follow_up_flag                NUMBER,
    follow_up_year                INTEGER,
    follow_up_mon                 INTEGER,
    follow_up_day                 INTEGER,
    damage_poisoning_reason       VARCHAR2(200),
    damage_pois_reason_code       VARCHAR2(50),
    damage_pois_reason_name       VARCHAR2(200),
    brain_injury_coma_d           NUMBER,
    brain_injury_coma_h           NUMBER,
    brain_injury_coma_min         NUMBER,
    brain_injury_coma_in_d        NUMBER,
    brain_injury_coma_in_h        NUMBER,
    brain_injury_coma_in_min      NUMBER,
    trans_dept_reason             VARCHAR2(200),
    trans_dept_time               DATE,
    trans_dept_code               VARCHAR2(50),
    trans_dept_name               VARCHAR2(200),
    trans_ward_code               VARCHAR2(50),
    trans_ward_name               VARCHAR2(200),
    admission_diagnosis_code      VARCHAR2(100),
    admission_diagnosis           VARCHAR2(100),
    bloodtrans_red_cell           NUMBER,
    bloodtrans_platelet           NUMBER,
    bloodtrans_plasma             NUMBER,
    bloodtrans_wholeblood         NUMBER,
    bloodtrans_autologousblood    NUMBER,
    bloodtrans_albumin            NUMBER,
    bloodtrans_cryoprecipitate    NUMBER,
    bloodtrans_other              NUMBER,
    bloodtrans_reaction           VARCHAR2(200),
    main_diag_name_out1           VARCHAR2(200),
    main_diag_conftime_out        DATE,
    main_diag_code_out1           VARCHAR2(200),
    out_hospital_method_code      VARCHAR2(2),
    out_hospital_method           VARCHAR2(50),
    outhospital_status1           INTEGER,
    plan_accept_hospital          VARCHAR2(50),
    check_ct                      INTEGER,
    check_pect                    INTEGER,
    check_doublect                INTEGER,
    check_b                       INTEGER,
    check_x                       INTEGER,
    check_echo                    INTEGER,
    check_mri                     INTEGER,
    check_isotope                 INTEGER,
    drug_allergies_flar           NUMBER,
    allergy_drug                  VARCHAR2(200),
    abo_blood_type                VARCHAR2(10),
    abo_blood_name                VARCHAR2(20),
    rh_blood_type                 VARCHAR2(10),
    rh_blood_name                 VARCHAR2(20),
    isemergency_op                NUMBER,
    operation_code                VARCHAR2(20),
    operation_date                DATE,
    operator_code                 VARCHAR2(20),
    operator_name                 VARCHAR2(50),
    first_assistantid             VARCHAR2(20),
    first_assistant_name          VARCHAR2(50),
    secend_assistantid            VARCHAR2(20),
    secend_assistant_name         VARCHAR2(50),
    operation_name                VARCHAR2(200),
    operation_level_code          NUMBER,
    operation_level               VARCHAR2(50),
    incision_level_code           INTEGER,
    incision_level                VARCHAR2(50),
    incision_heal_level_code      INTEGER,
    incision_heal_level           VARCHAR2(50),
    anesthesia_type_code          VARCHAR2(50),
    anesthesia_type               VARCHAR2(200),
    anesthesia_code               VARCHAR2(20),
    anesthesia_name               VARCHAR2(50),
    isoptional_dateop             NUMBER,
    preparedate                   DATE,
    operation_begindate           DATE,
    operation_enddate             DATE,
    antdurg_date                  DATE,
    anesthe_begdate               DATE,
    anesthe_enddate               DATE,
    asa_anesthe_level             VARCHAR2(50),
    incision_site                 VARCHAR2(200),
    incision_infect_flag          NUMBER,
    is_opcomplicate               NUMBER,
    opcomplicate_name             VARCHAR2(200),
    in_visit_times                INTEGER,
    in_visit_days                 INTEGER,
    out_hospital_time             DATE,
    out_ward_no                   VARCHAR2(20),
    out_ward_name                 VARCHAR2(50),
    out_dept_no                   VARCHAR2(20),
    out_dept_name                 VARCHAR2(50),
    death_autopsy_flag            NUMBER,
    medical_record_qua_code       INTEGER,
    medical_record_qua            VARCHAR2(200),
    quality_ctrl_doc_code         VARCHAR2(20),
    quality_ctrl_doc              VARCHAR2(100),
    quality_ctrl_nur_code         VARCHAR2(20),
    quality_ctrl_nur              VARCHAR2(100),
    quality_ctrl_date             DATE,
    out_in_falg                   NUMBER,
    out_in_reason                 VARCHAR2(200),
    same_diag_in                  NUMBER,
    days_bet_last_visit           INTEGER,
    syphilis_screen_flag          NUMBER,
    antibacterial_use_act         INTEGER,
    antdurg_names                 VARCHAR2(200),
    infusion_reaction_code        VARCHAR2(200),
    infusion_react_drug           VARCHAR2(200),
    infusion_reaction_desc        VARCHAR2(200),
    is_pressure_sore              NUMBER,
    is_press_sore_hospital        NUMBER,
    pressure_sore_stage           VARCHAR2(60),
    in_icu_flag                   NUMBER,
    main_diag_condition_out15     VARCHAR2(200),
    main_diag_code_out15          VARCHAR2(60),
    outhospital_status15          INTEGER,
    main_diag_name_out16          VARCHAR2(200),
    main_diag_condition_out16     VARCHAR2(200),
    main_diag_code_out16          VARCHAR2(60),
    outhospital_status16          INTEGER,
    main_diag_name_out17          VARCHAR2(200),
    main_diag_condition_out17     VARCHAR2(200),
    main_diag_code_out17          VARCHAR2(60),
    outhospital_status17          INTEGER,
    main_diag_name_out18          VARCHAR2(200),
    main_diag_condition_out18     VARCHAR2(200),
    main_diag_code_out18          VARCHAR2(60),
    outhospital_status18          INTEGER,
    main_diag_name_out19          VARCHAR2(200),
    main_diag_condition_out19     VARCHAR2(200),
    main_diag_code_out19          VARCHAR2(60),
    outhospital_status19          INTEGER,
    main_diag_name_out20          VARCHAR2(200),
    main_diag_condition_out20     VARCHAR2(200),
    main_diag_code_out20          VARCHAR2(60),
    outhospital_status20          INTEGER,
    main_diag_name_out21          VARCHAR2(200),
    main_diag_condition_out21     VARCHAR2(200),
    main_diag_code_out21          VARCHAR2(60),
    outhospital_status21          INTEGER,
    main_diag_name_out22          VARCHAR2(200),
    main_diag_condition_out22     VARCHAR2(200),
    main_diag_code_out22          VARCHAR2(60),
    outhospital_status22          INTEGER,
    in_visit_frequency            INTEGER,
    death_time                    DATE,
    mobilization_autopsy          VARCHAR2(20),
    max_diag_basis                VARCHAR2(200),
    graduate_practice_doctor      VARCHAR2(60),
    icu_type1                     VARCHAR2(200),
    in_icu_time1                  DATE,
    out_icu_time1                 DATE,
    return_icu1                   INTEGER,
    return_icu_reason1            VARCHAR2(200),
    icu_type2                     VARCHAR2(60),
    in_icu_time2                  DATE,
    out_icu_time2                 DATE,
    return_icu2                   INTEGER,
    return_icu_reason2            VARCHAR2(200),
    icu_type3                     VARCHAR2(60),
    in_icu_time3                  DATE,
    out_icu_time3                 DATE,
    return_icu3                   INTEGER,
    return_icu_reason3            VARCHAR2(200),
    icu_type4                     VARCHAR2(60),
    in_icu_time4                  DATE,
    out_icu_time4                 DATE,
    return_icu4                   INTEGER,
    return_icu_reason4            VARCHAR2(200),
    icu_type5                     VARCHAR2(60),
    in_icu_time5                  DATE,
    out_icu_time5                 DATE,
    return_icu5                   INTEGER,
    return_icu_reason5            VARCHAR2(200),
    icu_type6                     VARCHAR2(60),
    in_icu_time6                  DATE,
    out_icu_time6                 DATE,
    return_icu6                   INTEGER,
    return_icu_reason6            VARCHAR2(200),
    inicu_instru_type1            VARCHAR2(100),
    inicu_instru_begintime1       DATE,
    inicu_instru_endtime1         DATE,
    inicu_instru_infect1          INTEGER,
    inicu_instru_infect_time1     INTEGER,
    inicu_instru_type2            VARCHAR2(100),
    inicu_instru_begintime2       DATE,
    inicu_instru_endtime2         DATE,
    inicu_instru_infect2          INTEGER,
    inicu_instru_infect_time2     INTEGER,
    inicu_instru_type3            VARCHAR2(100),
    inicu_instru_begintime3       DATE,
    inicu_instru_endtime3         DATE,
    inicu_instru_infect3          INTEGER,
    inicu_instru_infect_time3     INTEGER,
    inicu_instru_type4            VARCHAR2(100),
    inicu_instru_begintime4       DATE,
    inicu_instru_endtime4         DATE,
    isfall_down                   NUMBER,
    inicu_instru_infect_time10    INTEGER,
    superior_nursing_days         INTEGER,
    first_nursing_days            INTEGER,
    second_nursing_days           INTEGER,
    third_nursing_days            INTEGER,
    icu_nursing_days              INTEGER,
    inicu_instru_infect4          INTEGER,
    ccu_nursing_days              INTEGER,
    ventilater_time               INTEGER,
    item_before_transfu           INTEGER,
    insurance_card                VARCHAR2(50),
    insurance_type                VARCHAR2(50),
    insurance_name                VARCHAR2(50),
    insurance_visit_no            VARCHAR2(50),
    inicu_instru_infect_time4     INTEGER,
    inicu_instru_type5            VARCHAR2(100),
    inicu_instru_begintime5       DATE,
    inicu_instru_endtime5         DATE,
    inicu_instru_infect5          INTEGER,
    inicu_instru_infect_time5     INTEGER,
    inicu_instru_type6            VARCHAR2(100),
    inicu_instru_begintime6       DATE,
    inicu_instru_endtime6         DATE,
    inicu_instru_infect6          INTEGER,
    inicu_instru_infect_time6     INTEGER,
    inicu_instru_type7            VARCHAR2(100),
    inicu_instru_begintime7       DATE,
    inicu_instru_endtime7         DATE,
    inicu_instru_infect7          INTEGER,
    inicu_instru_infect_time7     INTEGER,
    inicu_instru_type8            VARCHAR2(100),
    inicu_instru_begintime8       DATE,
    inicu_instru_endtime8         DATE,
    inicu_instru_infect8          INTEGER,
    inicu_instru_infect_time8     INTEGER,
    inicu_instru_type9            VARCHAR2(100),
    inicu_instru_begintime9       DATE,
    inicu_instru_endtime9         DATE,
    inicu_instru_infect9          INTEGER,
    inicu_instru_infect_time9     INTEGER,
    inicu_instru_type10           VARCHAR2(100),
    inicu_instru_begintime10      DATE,
    inicu_instru_endtime10        DATE,
    inicu_instru_infect10         INTEGER,
    fall_down                     INTEGER,
    fall_down_reason              INTEGER,
    is_physical_rest              NUMBER,
    hospital_infect_flag          NUMBER,
    infectbyop                    NUMBER,
    infectbyinvadop               NUMBER,
    is_in_icu                     NUMBER,
    inicu_instrument              VARCHAR2(200),
    accumulate_ddd                NUMBER,
    consultation_station          NUMBER,
    consultation_inpital          INTEGER,
    consultation_outpital         INTEGER,
    consultation_other            INTEGER,
    in_icutype                    VARCHAR2(100),
    in_icudate                    DATE,
    out_icudate                   DATE,
    hospital_infect_site          VARCHAR2(200),
    hospital_infect_name          VARCHAR2(200),
    pay_type_code                 VARCHAR2(50),
    pay_type                      VARCHAR2(100),
    total_fee                     NUMBER(12,4),
    self_pay_fee                  NUMBER(12,4),
    other_pay_fee                 NUMBER(12,4),
    common_medic_fee              NUMBER(12,4),
    common_treat_fee              NUMBER(12,4),
    common_nur_fee                NUMBER(12,4),
    common_other_fee              NUMBER(12,4),
    pathology_dia_fee             NUMBER(12,4),
    lis_dia_fee                   NUMBER(12,4),
    iconography_fee               NUMBER(12,4),
    clinic_dia_fee                NUMBER(12,4),
    nop_treat_fee                 NUMBER(12,4),
    nop_physcical_treat_fee       NUMBER(12,4),
    op_treat_fee                  NUMBER,
    op_treat_anesthesia_fee       NUMBER(12,4),
    op_treat_operat_fee           NUMBER(12,4),
    recure_fee                    NUMBER(12,4),
    tcm_diag_fee                  NUMBER(12,4),
    tcm_treat_fee                 NUMBER(12,4),
    tcm_diag_fee_external         NUMBER(12,4),
    tcm_diag_fee_bone             NUMBER(12,4),
    tcm_diag_fee_acupuncture      NUMBER(12,4),
    tcm_diag_fee_massage          NUMBER(12,4),
    tcm_diag_fee_anorectal        NUMBER(12,4),
    tcm_diag_fee_special          NUMBER(12,4),
    tcm_treat_fee_other           NUMBER(12,4),
    tcm_other_fee                 NUMBER(12,4),
    tcm_treat_fee_diet            NUMBER(12,4),
    drug_fee                      NUMBER(12,4),
    drug_antibact_fee             NUMBER(12,4),
    ctm_drug_fee                  NUMBER(12,4),
    herb_medicine_fee             NUMBER(12,4),
    herb_madedrug_fee             NUMBER(12,4),
    blood_fee                     NUMBER(12,4),
    albumin_fee                   NUMBER(12,4),
    globulin_fee                  NUMBER(12,4),
    cruor_fee                     NUMBER(12,4),
    cytokine_fee                  NUMBER(12,4),
    materials_check_fee           NUMBER(12,4),
    materials_treat_fee           NUMBER(12,4),
    materials_opreat_fee          NUMBER(12,4),
    others_fee                    NUMBER(12,4),
    delete_flag                   NUMBER(1),
    main_diag_condition_out1      VARCHAR2(200),
    main_diag_name_out2           VARCHAR2(200),
    main_diag_condition_out2      VARCHAR2(200),
    main_diag_code_out2           VARCHAR2(60),
    outhospital_status2           INTEGER,
    main_diag_name_out3           VARCHAR2(200),
    main_diag_condition_out3      VARCHAR2(200),
    main_diag_code_out3           VARCHAR2(100),
    outhospital_status3           INTEGER,
    main_diag_name_out4           VARCHAR2(200),
    main_diag_condition_out4      VARCHAR2(200),
    main_diag_code_out4           VARCHAR2(60),
    outhospital_status4           INTEGER,
    main_diag_name_out5           VARCHAR2(200),
    main_diag_condition_out5      VARCHAR2(200),
    main_diag_code_out5           VARCHAR2(60),
    outhospital_status5           INTEGER,
    main_diag_name_out6           VARCHAR2(200),
    main_diag_condition_out6      VARCHAR2(200),
    main_diag_code_out6           VARCHAR2(60),
    outhospital_status6           INTEGER,
    main_diag_name_out7           VARCHAR2(200),
    main_diag_condition_out7      VARCHAR2(200),
    main_diag_code_out7           VARCHAR2(60),
    outhospital_status7           INTEGER,
    main_diag_name_out8           VARCHAR2(200),
    main_diag_condition_out8      VARCHAR2(200),
    main_diag_code_out8           VARCHAR2(60),
    outhospital_status8           INTEGER,
    main_diag_name_out9           VARCHAR2(200),
    main_diag_condition_out9      VARCHAR2(200),
    main_diag_code_out9           VARCHAR2(60),
    outhospital_status9           INTEGER,
    main_diag_name_out10          VARCHAR2(200),
    main_diag_condition_out10     VARCHAR2(200),
    main_diag_code_out10          VARCHAR2(60),
    outhospital_status10          INTEGER,
    main_diag_name_out11          VARCHAR2(200),
    main_diag_condition_out11     VARCHAR2(200),
    main_diag_code_out11          VARCHAR2(60),
    outhospital_status11          INTEGER,
    main_diag_name_out12          VARCHAR2(200),
    main_diag_condition_out12     VARCHAR2(200),
    main_diag_code_out12          VARCHAR2(60),
    outhospital_status12          INTEGER,
    main_diag_name_out13          VARCHAR2(200),
    main_diag_condition_out13     VARCHAR2(200),
    main_diag_code_out13          VARCHAR2(60),
    outhospital_status13          INTEGER,
    main_diag_name_out14          VARCHAR2(200),
    main_diag_condition_out14     VARCHAR2(200),
    main_diag_code_out14          VARCHAR2(60),
    outhospital_status14          INTEGER,
    main_diag_name_out15          VARCHAR2(200),
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    createtime                    DATE,
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(50) not null,
    visittimes                    INTEGER not null,
    visit_no                      VARCHAR2(20) not null,
    health_card                   VARCHAR2(20),
    inpatient_no                  VARCHAR2(20) not null,
    medical_record_no             VARCHAR2(18),
    address                       VARCHAR2(200),
    addr_road                     VARCHAR2(200),
    addr_street                   VARCHAR2(200),
    addr_area                     VARCHAR2(200),
    addr_city                     VARCHAR2(200),
    addr_province                 VARCHAR2(50),
    addr_zip                      VARCHAR2(10),
    addr_tel                      VARCHAR2(20),
    id_card                       VARCHAR2(18),
    card_type_code                VARCHAR2(5),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    gendername                    VARCHAR2(50),
    marrystatuscode               VARCHAR2(2),
    marrystatus                   VARCHAR2(20),
    nation_code                   VARCHAR2(10),
    nation                        VARCHAR2(50),
    born_address                  VARCHAR2(200),
    born_addr_road                VARCHAR2(200),
    born_addr_street              VARCHAR2(200),
    born_addr_area                VARCHAR2(200),
    born_addr_city                VARCHAR2(200),
    born_addr_province            VARCHAR2(200),
    born_addr_zip                 VARCHAR2(50),
    country_code                  VARCHAR2(50),
    country                       VARCHAR2(50),
    age                           VARCHAR2(50),
    age_unit                      VARCHAR2(50),
    work_address                  VARCHAR2(200),
    work_addr_road                VARCHAR2(200),
    work_addr_street              VARCHAR2(200),
    work_addr_area                VARCHAR2(200),
    work_addr_city                VARCHAR2(200),
    work_addr_province            VARCHAR2(50),
    work_addr_zip                 VARCHAR2(50),
    work_tel                      VARCHAR2(50),
    house_address                 VARCHAR2(200),
    house_addr_road               VARCHAR2(200),
    house_addr_street             VARCHAR2(200),
    house_addr_area               VARCHAR2(200),
    house_addr_city               VARCHAR2(200),
    house_addr_province           VARCHAR2(200),
    house_addr_zip                VARCHAR2(6),
    native_addr_area              VARCHAR2(200),
    native_addr_city              VARCHAR2(200),
    native_addr_province          VARCHAR2(200),
    occupationcode                VARCHAR2(2),
    occupation                    VARCHAR2(100),
    provide_orgnizationcode       VARCHAR2(50),
    provide_orgnization           VARCHAR2(50),
    author_sign_date              DATE,
    author_doc_code               VARCHAR2(20),
    author_doc_name               VARCHAR2(100),
    deptdirectorid                VARCHAR2(20),
    deptdirector                  VARCHAR2(100),
    doctor_director               VARCHAR2(50),
    doctor_directorid             VARCHAR2(50),
    charge_doctor_id              VARCHAR2(50),
    charge_doctor                 VARCHAR2(50),
    visit_dector_code             VARCHAR2(20),
    visit_dector_name             VARCHAR2(50),
    inpatient_doctorid            VARCHAR2(20),
    inpatient_doctor              VARCHAR2(50),
    respons_nurse_code            VARCHAR2(20),
    respons_nurse_name            VARCHAR2(50),
    matron_code                   VARCHAR2(20),
    matron_name                   VARCHAR2(50),
    advanced_studies_docid        VARCHAR2(20),
    advanced_studies_doc          VARCHAR2(50),
    practice_doctorid             VARCHAR2(20),
    practice_doctor               VARCHAR2(50),
    coding_doctorid               VARCHAR2(20),
    coding_doctor                 VARCHAR2(50),
    relation_code                 VARCHAR2(100),
    relation                      VARCHAR2(50),
    relation_address              VARCHAR2(200),
    relation_road                 VARCHAR2(200),
    relation_street               VARCHAR2(200),
    relation_area                 VARCHAR2(200),
    relation_city                 VARCHAR2(200),
    relation_province             VARCHAR2(200),
    relation_zip                  VARCHAR2(50),
    relation_phone                VARCHAR2(12),
    relation_name                 VARCHAR2(32),
    in_hospital_type_code         VARCHAR2(100),
    in_hospital_type              VARCHAR2(50),
    in_hos_other_hospitalname     VARCHAR2(50),
    in_hospital_date              DATE,
    out_hospital_date             DATE,
    admission_condition           NUMBER,
    rooom_no                      VARCHAR2(100),
    ward_no                       VARCHAR2(50),
    ward_name                     VARCHAR2(50),
    dept_no                       VARCHAR2(50),
    dept_name                     VARCHAR2(50),
    bdby_in_weight                INTEGER,
    bdby_in_weight_unit           VARCHAR2(10),
    bdby_weight                   INTEGER,
    bdby_weight_unit              VARCHAR2(10),
    bdby_weight_second            INTEGER,
    bdby_weight_second_unit       VARCHAR2(10),
    bdby_sex_id                   VARCHAR2(1),
    bdby_sex                      VARCHAR2(10),
    bdby_sex_id_second            VARCHAR2(1),
    bdby_sex_second               VARCHAR2(10),
    diagnosis_mz                  VARCHAR2(200),
    diagnosis_code_mz             VARCHAR2(200),
    pathology_code                VARCHAR2(200),
    pathology_name                VARCHAR2(200),
    pathology_no                  VARCHAR2(50),
    tnm_period                    VARCHAR2(50),
    diagnostic_compliance_surgery NUMBER,
    diagnostic_compliance_onp     NUMBER,
    diagnostic_compliance_inp     NUMBER,
    diagnostic_compliance_dr      NUMBER,
    diagnostic_compliance_pat     NUMBER,
    diagnostic_compl_daiganddr    NUMBER,
    diagnostic_compl_banddiag     NUMBER,
    condition_told_flag           NUMBER,
    last_update_time              DATE,
    pathogen1                     VARCHAR2(50),
    sample_check_time1            DATE,
    pathogen_sample1              VARCHAR2(50),
    pathogen_sample2              VARCHAR2(50),
    pathogen2                     VARCHAR2(50),
    sample_check_time2            DATE,
    pathogen_sample3              VARCHAR2(50),
    pathogen3                     VARCHAR2(50),
    sample_check_time3            DATE,
    pathogen_sample4              VARCHAR2(50),
    pathogen4                     VARCHAR2(50),
    sample_check_time4            DATE,
    pathogen_sample5              VARCHAR2(50),
    pathogen5                     VARCHAR2(50),
    sample_check_time5            DATE,
    pathogen_sample6              VARCHAR2(50),
    pathogen6                     VARCHAR2(50),
    sample_check_time6            DATE,
    pathogen_sample7              VARCHAR2(50),
    pathogen7                     VARCHAR2(50),
    sample_check_time7            DATE,
    pathogen_sample8              VARCHAR2(50),
    pathogen8                     VARCHAR2(50),
    sample_check_time8            DATE,
    pathogen_sample9              VARCHAR2(50),
    pathogen9                     VARCHAR2(50),
    sample_check_time9            DATE,
    pathogen_sample10             VARCHAR2(50),
    pathogen10                    VARCHAR2(50),
    sample_check_time10           DATE,
    pathogen_check                VARCHAR2(50)
)
 ;
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.disease_state
  is '疾病状态 危急、严重、一般
不适用、其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.critically_ill_flag
  is '是否病危病重  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.isdrug_antibact
  is 'I 类手术切口预防性应用抗菌药物  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.continu_hours
  is '使用持续时间,小时';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.combination_medical
  is '联合用药  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.clinical_pathway_flag
  is '是否实施临床路径管理  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.clinical_pathway_code
  is '实施临床路径标志代码   0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.finish_clinical_path
  is '是否完成临床路径  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.abort_clinical_path
  is '退出临床路径原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.mutat_clinical_path
  is '是否变异  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.mutat_reason
  is '变异原因 1.系统因素 2.服务人员因素 3.病人因素 4.正性变异 5.负性变异 6. 不可控变异 7.其他退出';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.used_tcm_preparation
  is '是否使用医疗机构中药制剂 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.used_tcm_drug
  is '是否辩证使用中成药 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.used_tcm_technology
  is '使用中医诊疗设备';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.used_tcm_datt
  is '使用中医诊疗技术';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.dialect_nurse
  is '辨证施护 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.rescue_times
  is '抢救次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.rescue_success_time
  is '成功次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.is_illness_case
  is '是否疑难、病危、病重病例 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.follow_up_flag
  is '是否随诊 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.follow_up_year
  is '随诊期限-年';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.follow_up_mon
  is '随诊期限-月';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.follow_up_day
  is '随诊期限-日';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.damage_poisoning_reason
  is '损伤中毒的外部原因描述';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.damage_pois_reason_code
  is '损伤中毒的外部原因-疾病编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.damage_pois_reason_name
  is '损伤中毒的外部原因，如：肺炎';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.brain_injury_coma_d
  is '颅脑损伤患者入院前昏迷时间-d';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.brain_injury_coma_h
  is '颅脑损伤患者入院前昏迷时间-h';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.brain_injury_coma_min
  is '颅脑损伤患者入院前昏迷时间-min';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.brain_injury_coma_in_d
  is '颅脑损伤患者入院后昏迷时间-d';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.brain_injury_coma_in_h
  is '颅脑损伤患者入院后昏迷时间-h';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.brain_injury_coma_in_min
  is '颅脑损伤患者入院后昏迷时间-min';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.trans_dept_reason
  is '转科原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.trans_dept_time
  is '转科时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.trans_dept_code
  is '转科科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.trans_dept_name
  is '转科科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.trans_ward_code
  is '转科病区编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.trans_ward_name
  is '转科病区名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.admission_diagnosis_code
  is '入院诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.admission_diagnosis
  is '入院诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_red_cell
  is '输血品种-红细胞（U）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_platelet
  is '输血品种-血小板治疗量';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_plasma
  is '输血品种-血浆（ml）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_wholeblood
  is '输血品种-全血（ml）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_autologousblood
  is '输血品种-自体血回输（ml）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_albumin
  is '输血品种-白蛋白（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_cryoprecipitate
  is '输血品种-冷沉淀（U）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_other
  is '输血品种-其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bloodtrans_reaction
  is '输血品种-输血反应';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out1
  is '出院诊断一-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_conftime_out
  is '出院诊断-主要诊断确诊时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out1
  is '出院诊断一-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_hospital_method_code
  is '离院方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_hospital_method
  is '离院方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status1
  is '出院诊断一-出院情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.plan_accept_hospital
  is '拟接受医疗机构名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_ct
  is '检查情况-CT 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_pect
  is '检查情况-PETCT 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_doublect
  is '检查情况-双源CT 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_b
  is '检查情况-B超 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_x
  is '检查情况-X片 1.阳性 2.阴性 3.未做 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_echo
  is '检查情况-超声心动图 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_mri
  is '检查情况-MRI 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.check_isotope
  is '检查情况-同位素检查 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.drug_allergies_flar
  is '药物过敏标志 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.allergy_drug
  is '过敏药物名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.abo_blood_type
  is 'ABO血型代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.abo_blood_name
  is 'ABO血型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.rh_blood_type
  is 'Rh血型代码，';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.rh_blood_name
  is 'Rh血型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.isemergency_op
  is '是否急诊手术 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_code
  is '手术代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_date
  is '手术日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operator_code
  is '手术医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operator_name
  is '手术医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.first_assistantid
  is '第一助手编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.first_assistant_name
  is '第一助手姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.secend_assistantid
  is '第二助手编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.secend_assistant_name
  is '第二助手姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_name
  is '手术名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_level_code
  is '手术级别代码 1.一级手术 2.二级手术 3.三级手术 4.四级手术 0.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_level
  is '手术级别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.incision_level_code
  is '手术切口类别代码 1 0类切口2	Ⅰ类切口 3 Ⅱ类切口 4	Ⅲ类切口';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.incision_level
  is '手术切口类别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.incision_heal_level_code
  is '手术切口愈合等级，1甲 2乙 3丙 9其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.incision_heal_level
  is '手术切口愈合等级';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.anesthesia_type_code
  is '麻醉方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.anesthesia_type
  is '麻醉方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.anesthesia_code
  is '麻醉医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.anesthesia_name
  is '麻醉医师姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.isoptional_dateop
  is '是否择期手术 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.preparedate
  is '术前准备时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_begindate
  is '手术开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.operation_enddate
  is '手术结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.antdurg_date
  is '术前抗菌药物给药时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.anesthe_begdate
  is '麻醉开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.anesthe_enddate
  is '麻醉结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.asa_anesthe_level
  is 'ASA麻醉分级代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.incision_site
  is '切口部位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.incision_infect_flag
  is '切口部位是否感染 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.is_opcomplicate
  is '是否有手术并发症 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.opcomplicate_name
  is '手术并发症名称，多个用“,”分割';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_visit_times
  is '住院次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_visit_days
  is '实际住院天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_hospital_time
  is '出院时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_ward_no
  is '患者出院病区编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_ward_name
  is '患者出院病区名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_dept_no
  is '患者出院科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_dept_name
  is '患者出院科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.death_autopsy_flag
  is '死亡患者尸检标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.medical_record_qua_code
  is '病案质量代码 病案质量等级表，1.甲 2.乙 3.丙';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.medical_record_qua
  is '病案质量';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.quality_ctrl_doc_code
  is '质控医生编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.quality_ctrl_doc
  is '质控医生';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.quality_ctrl_nur_code
  is '质控护士编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.quality_ctrl_nur
  is '质控护士';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.quality_ctrl_date
  is '质控日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_in_falg
  is '出院31天内再住院标志 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_in_reason
  is '出院31天内再住院目的';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.same_diag_in
  is '是否因同一病种再入院 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.days_bet_last_visit
  is '与上次出院日期间隔天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.syphilis_screen_flag
  is '是否妊娠梅毒筛查 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.antibacterial_use_act
  is '抗菌药物使用情况 1	Ⅰ联
2	Ⅱ联
3	Ⅲ联
4	Ⅳ联
5	>Ⅳ联';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.antdurg_names
  is '抗菌药物名称，多个用“,”分割';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.infusion_reaction_code
  is '输液反应 0：未输；1：无；2：有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.infusion_react_drug
  is '引发反应的药物';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.infusion_reaction_desc
  is '输液反应临床表现';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.is_pressure_sore
  is '是否发生压疮 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.is_press_sore_hospital
  is '是否住院期间发生压疮 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pressure_sore_stage
  is '压疮分期 1. 1期 2. 2期 3. 3期 4. 4期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_flag
  is '入住重症监护病房';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out15
  is '出院诊断十五-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out15
  is '出院诊断十五-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status15
  is '出院诊断十五-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out16
  is '出院诊断十六-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out16
  is '出院诊断十六-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out16
  is '出院诊断十六-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status16
  is '出院诊断十六-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out17
  is '出院诊断十七-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out17
  is '出院诊断十七-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out17
  is '出院诊断十七-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status17
  is '出院诊断十七-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out18
  is '出院诊断十八-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out18
  is '出院诊断十八-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out18
  is '出院诊断十八-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status18
  is '出院诊断十八-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out19
  is '出院诊断十九-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out19
  is '出院诊断十九-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out19
  is '出院诊断十九-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status19
  is '出院诊断十九-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out20
  is '出院诊断二十-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out20
  is '出院诊断二十-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out20
  is '出院诊断二十-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status20
  is '出院诊断二十-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out21
  is '出院诊断二十一-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out21
  is '出院诊断二十一-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out21
  is '出院诊断二十一-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status21
  is '出院诊断二十一-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out22
  is '出院诊断二十二-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out22
  is '出院诊断二十二-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out22
  is '出院诊断二十二-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status22
  is '出院诊断二十二-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_visit_frequency
  is '住院次数-第几次住院';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.death_time
  is '死亡时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.mobilization_autopsy
  is '动员尸检 0否 1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.max_diag_basis
  is '最高诊断依据 1:临床,2:X线、CT、超声波、内窥镜等,3:手术,4:生化、免疫,5:细胞学、血片,6:病理（继发）,7:病理（原发）,8:尸检（有病理）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.graduate_practice_doctor
  is '研究生实习医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_type1
  is '患者入住重症监护病房情况一-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_time1
  is '患者入住重症监护病房情况一-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icu_time1
  is '患者入住重症监护病房情况一-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu1
  is '患者入住重症监护病房情况一-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu_reason1
  is '患者入住重症监护病房情况一-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_type2
  is '患者入住重症监护病房情况二-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_time2
  is '患者入住重症监护病房情况二-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icu_time2
  is '患者入住重症监护病房情况二-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu2
  is '患者入住重症监护病房情况二-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu_reason2
  is '患者入住重症监护病房情况二-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_type3
  is '患者入住重症监护病房情况三-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_time3
  is '患者入住重症监护病房情况三-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icu_time3
  is '患者入住重症监护病房情况三-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu3
  is '患者入住重症监护病房情况三-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu_reason3
  is '患者入住重症监护病房情况三-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_type4
  is '患者入住重症监护病房情况四-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_time4
  is '患者入住重症监护病房情况四-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icu_time4
  is '患者入住重症监护病房情况四-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu4
  is '患者入住重症监护病房情况四-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu_reason4
  is '患者入住重症监护病房情况四-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_type5
  is '患者入住重症监护病房情况五-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_time5
  is '患者入住重症监护病房情况五-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icu_time5
  is '患者入住重症监护病房情况五-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu5
  is '患者入住重症监护病房情况五-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu_reason5
  is '患者入住重症监护病房情况五-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_type6
  is '患者入住重症监护病房情况六-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icu_time6
  is '患者入住重症监护病房情况六-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icu_time6
  is '患者入住重症监护病房情况六-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu6
  is '患者入住重症监护病房情况六-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.return_icu_reason6
  is '患者入住重症监护病房情况六-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type1
  is '患者入住重症监护室期间器械使用情况一-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime1
  is '患者入住重症监护室期间器械使用情况一-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime1
  is '患者入住重症监护室期间器械使用情况一-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect1
  is '患者入住重症监护室期间器械使用情况一-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time1
  is '患者入住重症监护室期间器械使用情况一-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type2
  is '患者入住重症监护室期间器械使用情况二-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime2
  is '患者入住重症监护室期间器械使用情况二-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime2
  is '患者入住重症监护室期间器械使用情况二-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect2
  is '患者入住重症监护室期间器械使用情况二-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time2
  is '患者入住重症监护室期间器械使用情况二-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type3
  is '患者入住重症监护室期间器械使用情况三-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime3
  is '患者入住重症监护室期间器械使用情况三-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime3
  is '患者入住重症监护室期间器械使用情况三-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect3
  is '患者入住重症监护室期间器械使用情况三-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time3
  is '患者入住重症监护室期间器械使用情况三-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type4
  is '患者入住重症监护室期间器械使用情况四-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime4
  is '患者入住重症监护室期间器械使用情况四-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime4
  is '患者入住重症监护室期间器械使用情况四-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.isfall_down
  is '住院期间有无跌倒或坠床 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time10
  is '患者入住重症监护室期间器械使用情况十-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.superior_nursing_days
  is '特级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.first_nursing_days
  is '一级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.second_nursing_days
  is '二级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.third_nursing_days
  is '三级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.icu_nursing_days
  is 'ICU护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect4
  is '患者入住重症监护室期间器械使用情况四-是否发生感染';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.ccu_nursing_days
  is 'CCU护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.ventilater_time
  is '有创呼吸机使用时间（分钟）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.item_before_transfu
  is '输血前9项检查 0是1否';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.insurance_card
  is '医保卡号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.insurance_type
  is '医保卡类型编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.insurance_name
  is '医保卡类型名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.insurance_visit_no
  is '医保结算流水号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time4
  is '患者入住重症监护室期间器械使用情况四-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type5
  is '患者入住重症监护室期间器械使用情况五-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime5
  is '患者入住重症监护室期间器械使用情况五-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime5
  is '患者入住重症监护室期间器械使用情况五-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect5
  is '患者入住重症监护室期间器械使用情况五-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time5
  is '患者入住重症监护室期间器械使用情况五-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type6
  is '患者入住重症监护室期间器械使用情况六-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime6
  is '患者入住重症监护室期间器械使用情况六-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime6
  is '患者入住重症监护室期间器械使用情况六-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect6
  is '患者入住重症监护室期间器械使用情况六-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time6
  is '患者入住重症监护室期间器械使用情况六-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type7
  is '患者入住重症监护室期间器械使用情况七-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime7
  is '患者入住重症监护室期间器械使用情况七-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime7
  is '患者入住重症监护室期间器械使用情况七-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect7
  is '患者入住重症监护室期间器械使用情况七-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time7
  is '患者入住重症监护室期间器械使用情况七-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type8
  is '患者入住重症监护室期间器械使用情况八-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime8
  is '患者入住重症监护室期间器械使用情况八-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime8
  is '患者入住重症监护室期间器械使用情况八-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect8
  is '患者入住重症监护室期间器械使用情况八-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time8
  is '患者入住重症监护室期间器械使用情况八-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type9
  is '患者入住重症监护室期间器械使用情况九-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime9
  is '患者入住重症监护室期间器械使用情况九-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime9
  is '患者入住重症监护室期间器械使用情况九-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect9
  is '患者入住重症监护室期间器械使用情况九-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect_time9
  is '患者入住重症监护室期间器械使用情况九-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_type10
  is '患者入住重症监护室期间器械使用情况十-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_begintime10
  is '患者入住重症监护室期间器械使用情况十-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_endtime10
  is '患者入住重症监护室期间器械使用情况十-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instru_infect10
  is '患者入住重症监护室期间器械使用情况十-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.fall_down
  is '住院有无跌倒或坠床及伤害程度 1. 一级 2.二级 3.三级 4.未造成伤害';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.fall_down_reason
  is '跌倒或坠床原因 1	健康原因
2	治疗、药物、麻醉原因
3	环境因素
9  其他原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.is_physical_rest
  is '住院期间身体约束情况 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.hospital_infect_flag
  is '医院感染情况 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.infectbyop
  is '医院感染是否与手术相关 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.infectbyinvadop
  is '医院感染是否与侵入性操作相关 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.is_in_icu
  is '住院期间是否入住重症监护病房 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inicu_instrument
  is '入住重症监护病房期间器械使用情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.accumulate_ddd
  is '累积DDD数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.consultation_station
  is '是否会诊   0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.consultation_inpital
  is '院内会诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.consultation_outpital
  is '院外会诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.consultation_other
  is '其它会诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icutype
  is '患者入住重症病房-ICU类型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_icudate
  is '患者入住重症病房时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_icudate
  is '患者转出重症病房时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.hospital_infect_site
  is '感染部位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.hospital_infect_name
  is '医院感染名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pay_type_code
  is '医疗付费方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pay_type
  is '医疗付费方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.total_fee
  is '住院总费用,元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.self_pay_fee
  is '住院总费用-自付金额（元）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.other_pay_fee
  is '住院总费用-其它支付（元）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.common_medic_fee
  is '综合医疗服务费-一般医疗服务费,元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.common_treat_fee
  is '综合医疗服务费-一般治疗操作费,元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.common_nur_fee
  is '综合医疗服务费-护理费，元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.common_other_fee
  is '综合医疗服务费-其他费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathology_dia_fee
  is '诊断-病理诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.lis_dia_fee
  is '诊断-实验室诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.iconography_fee
  is '诊断-影像学诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.clinic_dia_fee
  is '临床诊断项目费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.nop_treat_fee
  is '非手术治疗项目费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.nop_physcical_treat_fee
  is '非手术治疗项目费-临床物理治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.op_treat_fee
  is '手术治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.op_treat_anesthesia_fee
  is '手术治疗费-麻醉费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.op_treat_operat_fee
  is '手术治疗费-手术费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.recure_fee
  is '康复费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee
  is '中医诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_treat_fee
  is '中医治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee_external
  is '中医外治费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee_bone
  is '中医骨伤费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee_acupuncture
  is '针刺与灸法费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee_massage
  is '中医推拿治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee_anorectal
  is '中医肛肠治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_diag_fee_special
  is '中医特殊治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_treat_fee_other
  is '中医其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_other_fee
  is '中药特殊调配加工费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tcm_treat_fee_diet
  is '辩证施膳';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.drug_fee
  is '西药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.drug_antibact_fee
  is '西药费-抗菌药物费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.ctm_drug_fee
  is '中成药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.herb_medicine_fee
  is '中草药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.herb_madedrug_fee
  is '医疗机构中药制剂费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.blood_fee
  is '血费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.albumin_fee
  is '白蛋白类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.globulin_fee
  is '球蛋白类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.cruor_fee
  is '凝血因子类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.cytokine_fee
  is '细胞因子类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.materials_check_fee
  is '一次性医用材料费-检查用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.materials_treat_fee
  is '一次性医用材料费-治疗用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.materials_opreat_fee
  is '一次性医用材料费-手术用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.others_fee
  is '其他费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out1
  is '出院诊断一-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out2
  is '出院诊断二-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out2
  is '出院诊断二-入院病情  1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out2
  is '出院诊断二-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status2
  is '出院诊断二-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out3
  is '出院诊断三-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out3
  is '出院诊断三-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out3
  is '出院诊断三-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status3
  is '出院诊断三-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out4
  is '出院诊断四-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out4
  is '出院诊断四-入院病情1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out4
  is '出院诊断四-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status4
  is '出院诊断四-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out5
  is '出院诊断五-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out5
  is '出院诊断五-入院病情1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out5
  is '出院诊断五-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status5
  is '出院诊断五-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out6
  is '出院诊断六-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out6
  is '出院诊断六-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out6
  is '出院诊断六-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status6
  is '出院诊断六-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out7
  is '出院诊断七-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out7
  is '出院诊断七-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out7
  is '出院诊断七-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status7
  is '出院诊断七-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out8
  is '出院诊断八-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out8
  is '出院诊断八-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out8
  is '出院诊断八-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status8
  is '出院诊断八-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out9
  is '出院诊断九-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out9
  is '出院诊断九-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out9
  is '出院诊断九-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status9
  is '出院诊断九-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out10
  is '出院诊断十-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out10
  is '出院诊断十-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out10
  is '出院诊断十-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status10
  is '出院诊断十-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out11
  is '出院诊断十一-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out11
  is '出院诊断十一-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out11
  is '出院诊断十一-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status11
  is '出院诊断十一-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out12
  is '出院诊断十二-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out12
  is '出院诊断十二-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out12
  is '出院诊断十二-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status12
  is '出院诊断十二-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out13
  is '出院诊断十三-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out13
  is '出院诊断十三-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out13
  is '出院诊断十三-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status13
  is '出院诊断十三-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out14
  is '出院诊断十四-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_condition_out14
  is '出院诊断十四-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_code_out14
  is '出院诊断十四-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.outhospital_status14
  is '出院诊断十四-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.main_diag_name_out15
  is '出院诊断十五-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.domain_id
  is '系统域标识，01门诊02住院03体检';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.createtime
  is '创建时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.unicode
  is '数据唯一记录号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.patient_id
  is '患者ID';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.visit_no
  is '就诊流水号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.health_card
  is '健康卡号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.medical_record_no
  is '病案号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.address
  is '患者详细住址,现住址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.addr_tel
  is '家庭电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.id_card
  is '身份证号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.card_type_code
  is '证件类型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.gendername
  is '性别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.marrystatuscode
  is '婚姻状况代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.marrystatus
  is '婚姻状况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.nation_code
  is '民族代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.nation
  is '民族';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_address
  is '患者详细住址，出生地';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.born_addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.country_code
  is '国家代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.country
  is '国家名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.age
  is '年龄';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.age_unit
  is '年龄单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_address
  is '患者详细住址，工作单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_addr_road
  is '工作单位地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_addr_street
  is '工作单位地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_addr_area
  is '工作单位地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_addr_city
  is '工作单位地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_addr_province
  is '工作单位地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_addr_zip
  is '工作单位邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.work_tel
  is '工作单位联系电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_address
  is '患者详细住址，户口地址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_addr_road
  is '户口地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_addr_street
  is '户口地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_addr_area
  is '户口地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_addr_city
  is '户口地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_addr_province
  is '户口地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.house_addr_zip
  is '户口地址邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.native_addr_area
  is '籍贯-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.native_addr_city
  is '籍贯-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.native_addr_province
  is '籍贯-省(自治区、直辖市)';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.occupationcode
  is '职业代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.occupation
  is '职业';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.provide_orgnizationcode
  is '医院代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.provide_orgnization
  is '医院名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.author_sign_date
  is '首页文档作者签署日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.author_doc_code
  is '首页文档作者编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.author_doc_name
  is '首页文档作者名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.deptdirectorid
  is '科主任编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.deptdirector
  is '科主任名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.doctor_director
  is '主任(副主任)医师姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.doctor_directorid
  is '主任(副主任)医师编号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.visit_dector_code
  is '主诊医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.visit_dector_name
  is '主诊医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.respons_nurse_code
  is '责任护士编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.respons_nurse_name
  is '责任护士名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.matron_code
  is '护士长编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.matron_name
  is '护士长';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.advanced_studies_docid
  is '进修医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.advanced_studies_doc
  is '进修医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.practice_doctorid
  is '实习医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.practice_doctor
  is '实习医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.coding_doctorid
  is '编码医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.coding_doctor
  is '编码医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_code
  is '联系人关系代码（ GB/T 4761-2008）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation
  is '联系人关系名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_address
  is '联系人详细住址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_phone
  is '联系人电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.relation_name
  is '联系人姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_hospital_type_code
  is '入院途径代码，CV09,00,403';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_hospital_type
  is '入院途径，如：门诊';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_hos_other_hospitalname
  is '入院途径之其它医疗机构转入-医疗机构名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.out_hospital_date
  is '出院日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.admission_condition
  is '入院情况代码，1：危；2：急；9：一般';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.rooom_no
  is '患者所在病房';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_in_weight
  is '新生儿入院体重（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_in_weight_unit
  is '新生儿入院体重单位（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_weight
  is '新生儿出生体重（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_weight_unit
  is '新生儿出生体重单位（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_weight_second
  is '新生儿出生体重2（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_weight_second_unit
  is '新生儿出生体重2单位（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_sex_id
  is '新生儿性别代码代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_sex
  is '新生性别代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_sex_id_second
  is '新生儿性别代码代码2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.bdby_sex_second
  is '新生儿性别代码2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnosis_mz
  is '门诊疾病诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnosis_code_mz
  is '门诊疾病诊断编码，ICD-10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathology_code
  is '病理诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathology_name
  is '病理诊断编码，ICD-10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathology_no
  is '病理号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.tnm_period
  is 'TNM分期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compliance_surgery
  is '术前与术后诊断符合 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compliance_onp
  is '门诊诊断与出院诊断是否符合 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compliance_inp
  is '入院诊断与出院诊断是否符合 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compliance_dr
  is '放射与病理符合情况 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compliance_pat
  is '病理检查与临床诊断符合情况 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compl_daiganddr
  is '放射与临床诊断符合情况 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.diagnostic_compl_banddiag
  is 'B超与临床诊断符合情况 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.condition_told_flag
  is '住院期间是否相关之情告知 0.未做 1.符合 2.不符合 3.不确定';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.last_update_time
  is '最后更新时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen1
  is '病原学1  01:假单胞菌 02:革兰式阴性菌
03:变形杆菌 04:霉菌
05:幽门螺旋杆菌
06:大肠埃希氏菌
07:鲍蔓氏不动杆菌
08:葡萄球菌 09:白色念珠菌
10:溶血葡萄糖球菌
11:流杆嗜血杆菌
12:亚历桑那沙内氏菌
13:阴沟杆菌 14:肺炎克雷伯菌
15:绿色链球菌
16:志贺氏菌 17:绿脓杆菌 18:酵母样菌 19:疟原虫
20:热带念珠菌
21:结核菌
22:平面球菌 23:摩氏摩根菌
24:白假丝酵母
25:甲型副伤寒沙门氏菌 26:抗酸杆菌 27:大肠杆菌 28:鲍曼醋酸钙复合不动杆菌
29:厌氧菌 30:琼氏不动杆菌 31:
铜绿假单胞菌 32:阴道加德纳氏菌
33:沙门氏菌 34:肺炎链球菌
35:臭鼻克雷伯菌
36:粪肠球菌 37:假百喉棒状杆菌
38:粘质沙雷菌
39:粘质沙雷菌
40:弗氏柠檬酸杆菌复合型 41:尿克雷伯氏菌
42:鲁氏不动杆菌
43:非白念的其他念珠菌 44:奇异多形杆菌 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time1
  is '标本1送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample1
  is '病原菌标本1 01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample2
  is '病原菌标本2 01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen2
  is '病原学2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time2
  is '标本2送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample3
  is '病原菌标本3  01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen3
  is '病原学3';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time3
  is '标本3送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample4
  is '病原菌标本4  01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen4
  is '病原学4';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time4
  is '标本4送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample5
  is '病原菌标本5  01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen5
  is '病原学5';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time5
  is '标本5送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample6
  is '病原菌标本6  01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen6
  is '病原学6';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time6
  is '标本6送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample7
  is '病原菌标本7 01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen7
  is '病原学7';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time7
  is '标本7送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample8
  is '病原菌标本8 01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen8
  is '病原学8';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time8
  is '标本8送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample9
  is '病原菌标本9 01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen9
  is '病原学9';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time9
  is '标本9送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen_sample10
  is '病原菌标本10 01血液
02尿液
03痰液';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.pathogen10
  is '病原学10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD.sample_check_time10
  is '标本10送检日期';






create table CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM
(
    disease_state                 VARCHAR2(50),
    critically_ill_flag           NUMBER,
    isdrug_antibact               NUMBER,
    continu_hours                 INTEGER,
    combination_medical           NUMBER,
    clinical_pathway_flag         NUMBER,
    clinical_pathway_code         NUMBER,
    finish_clinical_path          NUMBER,
    abort_clinical_path           VARCHAR2(50),
    mutat_clinical_path           NUMBER,
    mutat_reason                  NUMBER,
    used_tcm_preparation          NUMBER,
    used_tcm_drug                 NUMBER,
    used_tcm_technology           VARCHAR2(50),
    used_tcm_datt                 VARCHAR2(50),
    dialect_nurse                 NUMBER,
    rescue_times                  INTEGER,
    rescue_success_time           INTEGER,
    is_illness_case               NUMBER,
    follow_up_flag                NUMBER,
    follow_up_year                INTEGER,
    follow_up_mon                 INTEGER,
    follow_up_day                 INTEGER,
    damage_poisoning_reason       VARCHAR2(200),
    damage_pois_reason_code       VARCHAR2(50),
    damage_pois_reason_name       VARCHAR2(200),
    brain_injury_coma_d           NUMBER,
    brain_injury_coma_h           NUMBER,
    brain_injury_coma_min         NUMBER,
    brain_injury_coma_in_d        NUMBER,
    brain_injury_coma_in_h        NUMBER,
    brain_injury_coma_in_min      NUMBER,
    trans_dept_reason             VARCHAR2(200),
    trans_dept_time               DATE,
    trans_dept_code               VARCHAR2(50),
    trans_dept_name               VARCHAR2(200),
    trans_ward_code               VARCHAR2(50),
    trans_ward_name               VARCHAR2(200),
    admission_diagnosis_code      VARCHAR2(100),
    admission_diagnosis           VARCHAR2(100),
    bloodtrans_red_cell           NUMBER,
    bloodtrans_platelet           NUMBER,
    bloodtrans_plasma             NUMBER,
    bloodtrans_wholeblood         NUMBER,
    bloodtrans_autologousblood    NUMBER,
    bloodtrans_albumin            NUMBER,
    bloodtrans_cryoprecipitate    NUMBER,
    bloodtrans_other              NUMBER,
    bloodtrans_reaction           VARCHAR2(200),
    main_diag_name_out1           VARCHAR2(200),
    main_diag_conftime_out        DATE,
    main_diag_code_out1           VARCHAR2(200),
    out_hospital_method_code      VARCHAR2(2),
    out_hospital_method           VARCHAR2(50),
    outhospital_status1           INTEGER,
    plan_accept_hospital          VARCHAR2(50),
    check_ct                      INTEGER,
    check_pect                    INTEGER,
    check_doublect                INTEGER,
    check_b                       INTEGER,
    check_x                       INTEGER,
    check_echo                    INTEGER,
    check_mri                     INTEGER,
    check_isotope                 INTEGER,
    drug_allergies_flar           NUMBER,
    allergy_drug                  VARCHAR2(200),
    abo_blood_type                VARCHAR2(10),
    abo_blood_name                VARCHAR2(20),
    rh_blood_type                 VARCHAR2(10),
    rh_blood_name                 VARCHAR2(20),
    isemergency_op                NUMBER,
    operation_code                VARCHAR2(20),
    operation_date                DATE,
    operator_code                 VARCHAR2(20),
    operator_name                 VARCHAR2(50),
    first_assistantid             VARCHAR2(20),
    first_assistant_name          VARCHAR2(50),
    secend_assistantid            VARCHAR2(20),
    secend_assistant_name         VARCHAR2(50),
    operation_name                VARCHAR2(200),
    operation_level_code          NUMBER,
    operation_level               VARCHAR2(50),
    incision_level_code           INTEGER,
    incision_level                VARCHAR2(50),
    incision_heal_level_code      INTEGER,
    incision_heal_level           VARCHAR2(50),
    anesthesia_type_code          VARCHAR2(50),
    anesthesia_type               VARCHAR2(200),
    anesthesia_code               VARCHAR2(20),
    anesthesia_name               VARCHAR2(50),
    isoptional_dateop             NUMBER,
    preparedate                   DATE,
    operation_begindate           DATE,
    operation_enddate             DATE,
    antdurg_date                  DATE,
    anesthe_begdate               DATE,
    anesthe_enddate               DATE,
    asa_anesthe_level             VARCHAR2(50),
    incision_site                 VARCHAR2(200),
    incision_infect_flag          NUMBER,
    is_opcomplicate               NUMBER,
    opcomplicate_name             VARCHAR2(200),
    in_visit_times                INTEGER,
    in_visit_days                 INTEGER,
    out_hospital_time             DATE,
    out_ward_no                   VARCHAR2(20),
    out_ward_name                 VARCHAR2(50),
    out_dept_no                   VARCHAR2(20),
    out_dept_name                 VARCHAR2(50),
    death_autopsy_flag            NUMBER,
    medical_record_qua_code       INTEGER,
    medical_record_qua            VARCHAR2(200),
    quality_ctrl_doc_code         VARCHAR2(20),
    quality_ctrl_doc              VARCHAR2(100),
    quality_ctrl_nur_code         VARCHAR2(20),
    quality_ctrl_nur              VARCHAR2(100),
    quality_ctrl_date             DATE,
    out_in_falg                   NUMBER,
    out_in_reason                 VARCHAR2(200),
    same_diag_in                  NUMBER,
    days_bet_last_visit           INTEGER,
    syphilis_screen_flag          NUMBER,
    antibacterial_use_act         INTEGER,
    antdurg_names                 VARCHAR2(200),
    infusion_reaction_code        VARCHAR2(200),
    infusion_react_drug           VARCHAR2(200),
    infusion_reaction_desc        VARCHAR2(200),
    is_pressure_sore              NUMBER,
    is_press_sore_hospital        NUMBER,
    pressure_sore_stage           INTEGER,
    in_icu_flag                   NUMBER,
    main_diag_condition_out15     VARCHAR2(200),
    main_diag_code_out15          VARCHAR2(60),
    outhospital_status15          INTEGER,
    main_diag_name_out16          VARCHAR2(200),
    main_diag_condition_out16     VARCHAR2(200),
    main_diag_code_out16          VARCHAR2(60),
    outhospital_status16          INTEGER,
    main_diag_name_out17          VARCHAR2(200),
    main_diag_condition_out17     VARCHAR2(200),
    main_diag_code_out17          VARCHAR2(60),
    outhospital_status17          INTEGER,
    main_diag_name_out18          VARCHAR2(200),
    main_diag_condition_out18     VARCHAR2(200),
    main_diag_code_out18          VARCHAR2(60),
    outhospital_status18          INTEGER,
    main_diag_name_out19          VARCHAR2(200),
    main_diag_condition_out19     VARCHAR2(200),
    main_diag_code_out19          VARCHAR2(60),
    outhospital_status19          INTEGER,
    main_diag_name_out20          VARCHAR2(200),
    main_diag_condition_out20     VARCHAR2(200),
    main_diag_code_out20          VARCHAR2(60),
    outhospital_status20          INTEGER,
    main_diag_name_out21          VARCHAR2(200),
    main_diag_condition_out21     VARCHAR2(200),
    main_diag_code_out21          VARCHAR2(60),
    outhospital_status21          INTEGER,
    main_diag_name_out22          VARCHAR2(200),
    main_diag_condition_out22     VARCHAR2(200),
    main_diag_code_out22          VARCHAR2(60),
    outhospital_status22          INTEGER,
    in_visit_frequency            INTEGER,
    death_time                    DATE,
    mobilization_autopsy          VARCHAR2(20),
    max_diag_basis                VARCHAR2(200),
    graduate_practice_doctor      VARCHAR2(60),
    icu_type1                     VARCHAR2(200),
    in_icu_time1                  DATE,
    out_icu_time1                 DATE,
    return_icu1                   INTEGER,
    return_icu_reason1            VARCHAR2(200),
    icu_type2                     VARCHAR2(60),
    in_icu_time2                  DATE,
    out_icu_time2                 DATE,
    return_icu2                   INTEGER,
    return_icu_reason2            VARCHAR2(200),
    icu_type3                     VARCHAR2(60),
    in_icu_time3                  DATE,
    out_icu_time3                 DATE,
    return_icu3                   INTEGER,
    return_icu_reason3            VARCHAR2(200),
    icu_type4                     VARCHAR2(60),
    in_icu_time4                  DATE,
    out_icu_time4                 DATE,
    return_icu4                   INTEGER,
    return_icu_reason4            VARCHAR2(200),
    icu_type5                     VARCHAR2(60),
    in_icu_time5                  DATE,
    out_icu_time5                 DATE,
    return_icu5                   INTEGER,
    return_icu_reason5            VARCHAR2(200),
    icu_type6                     VARCHAR2(60),
    in_icu_time6                  DATE,
    out_icu_time6                 DATE,
    return_icu6                   INTEGER,
    return_icu_reason6            VARCHAR2(200),
    inicu_instru_type1            VARCHAR2(100),
    inicu_instru_begintime1       DATE,
    inicu_instru_endtime1         DATE,
    inicu_instru_infect1          INTEGER,
    inicu_instru_infect_time1     INTEGER,
    inicu_instru_type2            VARCHAR2(100),
    inicu_instru_begintime2       DATE,
    inicu_instru_endtime2         DATE,
    inicu_instru_infect2          INTEGER,
    inicu_instru_infect_time2     INTEGER,
    inicu_instru_type3            VARCHAR2(100),
    inicu_instru_begintime3       DATE,
    inicu_instru_endtime3         DATE,
    inicu_instru_infect3          INTEGER,
    inicu_instru_infect_time3     INTEGER,
    inicu_instru_type4            VARCHAR2(100),
    inicu_instru_begintime4       DATE,
    inicu_instru_endtime4         DATE,
    isfall_down                   NUMBER,
    inicu_instru_infect_time10    INTEGER,
    superior_nursing_days         INTEGER,
    first_nursing_days            INTEGER,
    second_nursing_days           INTEGER,
    third_nursing_days            INTEGER,
    icu_nursing_days              INTEGER,
    inicu_instru_infect4          INTEGER,
    ccu_nursing_days              INTEGER,
    ventilater_time               INTEGER,
    item_before_transfu           INTEGER,
    insurance_card                VARCHAR2(50),
    insurance_type                VARCHAR2(2),
    insurance_name                VARCHAR2(50),
    insurance_visit_no            VARCHAR2(50),
    inicu_instru_infect_time4     INTEGER,
    inicu_instru_type5            VARCHAR2(100),
    inicu_instru_begintime5       DATE,
    inicu_instru_endtime5         DATE,
    inicu_instru_infect5          INTEGER,
    inicu_instru_infect_time5     INTEGER,
    inicu_instru_type6            VARCHAR2(100),
    inicu_instru_begintime6       DATE,
    inicu_instru_endtime6         DATE,
    inicu_instru_infect6          INTEGER,
    inicu_instru_infect_time6     INTEGER,
    inicu_instru_type7            VARCHAR2(100),
    inicu_instru_begintime7       DATE,
    inicu_instru_endtime7         DATE,
    inicu_instru_infect7          INTEGER,
    inicu_instru_infect_time7     INTEGER,
    inicu_instru_type8            VARCHAR2(100),
    inicu_instru_begintime8       DATE,
    inicu_instru_endtime8         DATE,
    inicu_instru_infect8          INTEGER,
    inicu_instru_infect_time8     INTEGER,
    inicu_instru_type9            VARCHAR2(100),
    inicu_instru_begintime9       DATE,
    inicu_instru_endtime9         DATE,
    inicu_instru_infect9          INTEGER,
    inicu_instru_infect_time9     INTEGER,
    inicu_instru_type10           VARCHAR2(100),
    inicu_instru_begintime10      DATE,
    inicu_instru_endtime10        DATE,
    inicu_instru_infect10         INTEGER,
    fall_down                     INTEGER,
    fall_down_reason              INTEGER,
    is_physical_rest              NUMBER,
    hospital_infect_flag          NUMBER,
    infectbyop                    NUMBER,
    infectbyinvadop               NUMBER,
    is_in_icu                     NUMBER,
    inicu_instrument              VARCHAR2(200),
    accumulate_ddd                NUMBER,
    consultation_station          NUMBER,
    consultation_inpital          INTEGER,
    consultation_outpital         INTEGER,
    consultation_other            INTEGER,
    in_icutype                    VARCHAR2(100),
    in_icudate                    DATE,
    out_icudate                   DATE,
    hospital_infect_site          VARCHAR2(200),
    hospital_infect_name          VARCHAR2(200),
    pay_type_code                 VARCHAR2(50),
    pay_type                      VARCHAR2(100),
    total_fee                     NUMBER(12,4),
    self_pay_fee                  NUMBER(12,4),
    other_pay_fee                 NUMBER(12,4),
    common_medic_fee              NUMBER(12,4),
    common_treat_fee              NUMBER(12,4),
    common_nur_fee                NUMBER(12,4),
    common_other_fee              NUMBER(12,4),
    pathology_dia_fee             NUMBER(12,4),
    lis_dia_fee                   NUMBER(12,4),
    iconography_fee               NUMBER(12,4),
    clinic_dia_fee                NUMBER(12,4),
    nop_treat_fee                 NUMBER(12,4),
    nop_physcical_treat_fee       NUMBER(12,4),
    op_treat_fee                  NUMBER,
    op_treat_anesthesia_fee       NUMBER(12,4),
    op_treat_operat_fee           NUMBER(12,4),
    recure_fee                    NUMBER(12,4),
    tcm_diag_fee                  NUMBER(12,4),
    tcm_treat_fee                 NUMBER(12,4),
    tcm_diag_fee_external         NUMBER(12,4),
    tcm_diag_fee_bone             NUMBER(12,4),
    tcm_diag_fee_acupuncture      NUMBER(12,4),
    tcm_diag_fee_massage          NUMBER(12,4),
    tcm_diag_fee_anorectal        NUMBER(12,4),
    tcm_diag_fee_special          NUMBER(12,4),
    tcm_treat_fee_other           NUMBER(12,4),
    tcm_other_fee                 NUMBER(12,4),
    tcm_treat_fee_diet            NUMBER(12,4),
    drug_fee                      NUMBER(12,4),
    drug_antibact_fee             NUMBER(12,4),
    ctm_drug_fee                  NUMBER(12,4),
    herb_medicine_fee             NUMBER(12,4),
    herb_madedrug_fee             NUMBER(12,4),
    blood_fee                     NUMBER(12,4),
    albumin_fee                   NUMBER(12,4),
    globulin_fee                  NUMBER(12,4),
    cruor_fee                     NUMBER(12,4),
    cytokine_fee                  NUMBER(12,4),
    materials_check_fee           NUMBER(12,4),
    materials_treat_fee           NUMBER(12,4),
    materials_opreat_fee          NUMBER(12,4),
    others_fee                    NUMBER(12,4),
    delete_flag                   NUMBER(1),
    main_diag_condition_out1      VARCHAR2(200),
    main_diag_name_out2           VARCHAR2(200),
    main_diag_condition_out2      VARCHAR2(200),
    main_diag_code_out2           VARCHAR2(60),
    outhospital_status2           INTEGER,
    main_diag_name_out3           VARCHAR2(200),
    main_diag_condition_out3      VARCHAR2(200),
    main_diag_code_out3           VARCHAR2(100),
    outhospital_status3           INTEGER,
    main_diag_name_out4           VARCHAR2(200),
    main_diag_condition_out4      VARCHAR2(200),
    main_diag_code_out4           VARCHAR2(60),
    outhospital_status4           INTEGER,
    main_diag_name_out5           VARCHAR2(200),
    main_diag_condition_out5      VARCHAR2(200),
    main_diag_code_out5           VARCHAR2(60),
    outhospital_status5           INTEGER,
    main_diag_name_out6           VARCHAR2(200),
    main_diag_condition_out6      VARCHAR2(200),
    main_diag_code_out6           VARCHAR2(60),
    outhospital_status6           INTEGER,
    main_diag_name_out7           VARCHAR2(200),
    main_diag_condition_out7      VARCHAR2(200),
    main_diag_code_out7           VARCHAR2(60),
    outhospital_status7           INTEGER,
    main_diag_name_out8           VARCHAR2(200),
    main_diag_condition_out8      VARCHAR2(200),
    main_diag_code_out8           VARCHAR2(60),
    outhospital_status8           INTEGER,
    main_diag_name_out9           VARCHAR2(200),
    main_diag_condition_out9      VARCHAR2(200),
    main_diag_code_out9           VARCHAR2(60),
    outhospital_status9           INTEGER,
    main_diag_name_out10          VARCHAR2(200),
    main_diag_condition_out10     VARCHAR2(200),
    main_diag_code_out10          VARCHAR2(60),
    outhospital_status10          INTEGER,
    main_diag_name_out11          VARCHAR2(200),
    main_diag_condition_out11     VARCHAR2(200),
    main_diag_code_out11          VARCHAR2(60),
    outhospital_status11          INTEGER,
    main_diag_name_out12          VARCHAR2(200),
    main_diag_condition_out12     VARCHAR2(200),
    main_diag_code_out12          VARCHAR2(60),
    outhospital_status12          INTEGER,
    main_diag_name_out13          VARCHAR2(200),
    main_diag_condition_out13     VARCHAR2(200),
    main_diag_code_out13          VARCHAR2(60),
    outhospital_status13          INTEGER,
    main_diag_name_out14          VARCHAR2(200),
    main_diag_condition_out14     VARCHAR2(200),
    main_diag_code_out14          VARCHAR2(60),
    outhospital_status14          INTEGER,
    main_diag_name_out15          VARCHAR2(200),
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    createtime                    DATE,
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(50),
    visittimes                    INTEGER,
    visit_no                      VARCHAR2(20),
    health_card                   VARCHAR2(20),
    inpatient_no                  VARCHAR2(20),
    medical_record_no             VARCHAR2(18),
    address                       VARCHAR2(200),
    addr_road                     VARCHAR2(200),
    addr_street                   VARCHAR2(200),
    addr_area                     VARCHAR2(200),
    addr_city                     VARCHAR2(200),
    addr_province                 VARCHAR2(50),
    addr_zip                      VARCHAR2(10),
    addr_tel                      VARCHAR2(20),
    id_card                       VARCHAR2(18),
    card_type_code                VARCHAR2(5),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    gendername                    VARCHAR2(50),
    marrystatuscode               VARCHAR2(2),
    marrystatus                   VARCHAR2(20),
    nation_code                   VARCHAR2(10),
    nation                        VARCHAR2(50),
    born_address                  VARCHAR2(200),
    born_addr_road                VARCHAR2(200),
    born_addr_street              VARCHAR2(200),
    born_addr_area                VARCHAR2(200),
    born_addr_city                VARCHAR2(200),
    born_addr_province            VARCHAR2(200),
    born_addr_zip                 VARCHAR2(50),
    country_code                  VARCHAR2(50),
    country                       VARCHAR2(50),
    age                           INTEGER,
    age_unit                      VARCHAR2(50),
    work_address                  VARCHAR2(200),
    work_addr_road                VARCHAR2(200),
    work_addr_street              VARCHAR2(200),
    work_addr_area                VARCHAR2(200),
    work_addr_city                VARCHAR2(200),
    work_addr_province            VARCHAR2(50),
    work_addr_zip                 VARCHAR2(50),
    work_tel                      VARCHAR2(50),
    house_address                 VARCHAR2(200),
    house_addr_road               VARCHAR2(100),
    house_addr_street             VARCHAR2(100),
    house_addr_area               VARCHAR2(200),
    house_addr_city               VARCHAR2(200),
    house_addr_province           VARCHAR2(200),
    house_addr_zip                VARCHAR2(6),
    native_addr_area              VARCHAR2(200),
    native_addr_city              VARCHAR2(200),
    native_addr_province          VARCHAR2(200),
    occupationcode                VARCHAR2(2),
    occupation                    VARCHAR2(100),
    provide_orgnizationcode       VARCHAR2(50),
    provide_orgnization           VARCHAR2(50),
    author_sign_date              DATE,
    author_doc_code               VARCHAR2(20),
    author_doc_name               VARCHAR2(100),
    deptdirectorid                VARCHAR2(20),
    deptdirector                  VARCHAR2(100),
    doctor_director               VARCHAR2(50),
    doctor_directorid             VARCHAR2(50),
    charge_doctor_id              VARCHAR2(50),
    charge_doctor                 VARCHAR2(50),
    visit_dector_code             VARCHAR2(20),
    visit_dector_name             VARCHAR2(50),
    inpatient_doctorid            VARCHAR2(20),
    inpatient_doctor              VARCHAR2(50),
    respons_nurse_code            VARCHAR2(20),
    respons_nurse_name            VARCHAR2(50),
    matron_code                   VARCHAR2(20),
    matron_name                   VARCHAR2(50),
    advanced_studies_docid        VARCHAR2(20),
    advanced_studies_doc          VARCHAR2(50),
    practice_doctorid             VARCHAR2(20),
    practice_doctor               VARCHAR2(50),
    coding_doctorid               VARCHAR2(20),
    coding_doctor                 VARCHAR2(50),
    relation_code                 VARCHAR2(100),
    relation                      VARCHAR2(50),
    relation_address              VARCHAR2(200),
    relation_road                 VARCHAR2(50),
    relation_street               VARCHAR2(50),
    relation_area                 VARCHAR2(50),
    relation_city                 VARCHAR2(50),
    relation_province             VARCHAR2(50),
    relation_zip                  VARCHAR2(50),
    relation_phone                VARCHAR2(12),
    relation_name                 VARCHAR2(32),
    in_hospital_type_code         VARCHAR2(100),
    in_hospital_type              VARCHAR2(50),
    in_hos_other_hospitalname     VARCHAR2(50),
    in_hospital_date              DATE,
    out_hospital_date             DATE,
    admission_condition           NUMBER,
    rooom_no                      VARCHAR2(100),
    ward_no                       VARCHAR2(50),
    ward_name                     VARCHAR2(50),
    dept_no                       VARCHAR2(50),
    dept_name                     VARCHAR2(50),
    bdby_in_weight                INTEGER,
    bdby_in_weight_unit           VARCHAR2(10),
    bdby_weight                   INTEGER,
    bdby_weight_unit              VARCHAR2(10),
    bdby_weight_second            INTEGER,
    bdby_weight_second_unit       VARCHAR2(10),
    bdby_sex_id                   VARCHAR2(1),
    bdby_sex                      VARCHAR2(10),
    bdby_sex_id_second            VARCHAR2(1),
    bdby_sex_second               VARCHAR2(10),
    diagnosis_mz                  VARCHAR2(200),
    diagnosis_code_mz             VARCHAR2(200),
    pathology_code                VARCHAR2(50),
    pathology_name                VARCHAR2(200),
    pathology_no                  VARCHAR2(20),
    tnm_period                    VARCHAR2(1),
    diagnostic_compliance_surgery NUMBER,
    diagnostic_compliance_onp     NUMBER,
    diagnostic_compliance_inp     NUMBER,
    diagnostic_compliance_dr      NUMBER,
    diagnostic_compliance_pat     NUMBER,
    diagnostic_compl_daiganddr    NUMBER,
    diagnostic_compl_banddiag     NUMBER,
    condition_told_flag           NUMBER,
    last_update_time              DATE,
    pathogen1                     VARCHAR2(50),
    sample_check_time1            DATE,
    pathogen_sample1              VARCHAR2(50),
    pathogen_sample2              VARCHAR2(50),
    pathogen2                     VARCHAR2(50),
    sample_check_time2            DATE,
    pathogen_sample3              VARCHAR2(50),
    pathogen3                     VARCHAR2(50),
    sample_check_time3            DATE,
    pathogen_samnple4             VARCHAR2(50),
    pathogen4                     VARCHAR2(50),
    sample_check_time4            DATE,
    pathogen_samnple5             VARCHAR2(50),
    pathogen5                     VARCHAR2(50),
    sample_check_time5            DATE,
    pathogen_sample6              VARCHAR2(50),
    pathogen6                     VARCHAR2(50),
    sample_check_time6            DATE,
    pathogen_sample7              VARCHAR2(50),
    pathogen7                     VARCHAR2(50),
    sample_check_time7            DATE,
    pathogen_sample8              VARCHAR2(50),
    pathogen8                     VARCHAR2(50),
    sample_check_time8            DATE,
    pathogen_sample9              VARCHAR2(50),
    pathogen9                     VARCHAR2(50),
    sample_check_time9            DATE,
    pathogen_sample10             VARCHAR2(50),
    pathogen10                    VARCHAR2(50),
    sample_check_time10           DATE,
    complie_time                  DATE not null,
    mr_no                         VARCHAR2(50),
    pathogen_check                NUMBER
)
 ;
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.disease_state
  is '疾病状态 危急、严重、一般
不适用、其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.critically_ill_flag
  is '是否病危病重  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.isdrug_antibact
  is 'I 类手术切口预防性应用抗菌药物  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.continu_hours
  is '使用持续时间,小时';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.combination_medical
  is '联合用药  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.clinical_pathway_flag
  is '是否实施临床路径管理  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.clinical_pathway_code
  is '实施临床路径标志代码   0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.finish_clinical_path
  is '是否完成临床路径  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.abort_clinical_path
  is '退出临床路径原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.mutat_clinical_path
  is '是否变异  0否 ,1是 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.mutat_reason
  is '变异原因 1.系统因素 2.服务人员因素 3.病人因素 4.正性变异 5.负性变异 6. 不可控变异 7.其他退出';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.used_tcm_preparation
  is '是否使用医疗机构中药制剂 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.used_tcm_drug
  is '是否辩证使用中成药 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.used_tcm_technology
  is '使用中医诊疗设备';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.used_tcm_datt
  is '使用中医诊疗技术';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.dialect_nurse
  is '辨证施护 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.rescue_times
  is '抢救次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.rescue_success_time
  is '成功次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.is_illness_case
  is '是否疑难、病危、病重病例 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.follow_up_flag
  is '是否随诊 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.follow_up_year
  is '随诊期限-年';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.follow_up_mon
  is '随诊期限-月';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.follow_up_day
  is '随诊期限-日';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.damage_poisoning_reason
  is '损伤中毒的外部原因描述';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.damage_pois_reason_code
  is '损伤中毒的外部原因-疾病编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.damage_pois_reason_name
  is '损伤中毒的外部原因，如：肺炎';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.brain_injury_coma_d
  is '颅脑损伤患者入院前昏迷时间-d';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.brain_injury_coma_h
  is '颅脑损伤患者入院前昏迷时间-h';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.brain_injury_coma_min
  is '颅脑损伤患者入院前昏迷时间-min';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.brain_injury_coma_in_d
  is '颅脑损伤患者入院后昏迷时间-d';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.brain_injury_coma_in_h
  is '颅脑损伤患者入院后昏迷时间-h';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.brain_injury_coma_in_min
  is '颅脑损伤患者入院后昏迷时间-min';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.trans_dept_reason
  is '转科原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.trans_dept_time
  is '转科时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.trans_dept_code
  is '转科科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.trans_dept_name
  is '转科科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.trans_ward_code
  is '转科病区编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.trans_ward_name
  is '转科病区名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.admission_diagnosis_code
  is '入院诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.admission_diagnosis
  is '入院诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_red_cell
  is '输血品种-红细胞（U）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_platelet
  is '输血品种-血小板治疗量';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_plasma
  is '输血品种-血浆（ml）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_wholeblood
  is '输血品种-全血（ml）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_autologousblood
  is '输血品种-自体血回输（ml）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_albumin
  is '输血品种-白蛋白（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_cryoprecipitate
  is '输血品种-冷沉淀（U）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_other
  is '输血品种-其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bloodtrans_reaction
  is '输血品种-输血反应';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out1
  is '出院诊断一-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_conftime_out
  is '出院诊断-主要诊断确诊时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out1
  is '出院诊断一-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_hospital_method_code
  is '离院方式编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_hospital_method
  is '离院方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status1
  is '出院诊断一-出院情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.plan_accept_hospital
  is '拟接受医疗机构名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_ct
  is '检查情况-CT 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_pect
  is '检查情况-PETCT 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_doublect
  is '检查情况-双源CT 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_b
  is '检查情况-B超 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_x
  is '检查情况-X片 1.阳性 2.阴性 3.未做 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_echo
  is '检查情况-超声心动图 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_mri
  is '检查情况-MRI 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.check_isotope
  is '检查情况-同位素检查 1.阳性 2.阴性 3.未做';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.drug_allergies_flar
  is '药物过敏标志 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.allergy_drug
  is '过敏药物名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.abo_blood_type
  is 'ABO血型代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.abo_blood_name
  is 'ABO血型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.rh_blood_type
  is 'Rh血型代码，';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.rh_blood_name
  is 'Rh血型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.isemergency_op
  is '是否急诊手术 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_code
  is '手术代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_date
  is '手术日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operator_code
  is '手术医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operator_name
  is '手术医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.first_assistantid
  is '第一助手编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.first_assistant_name
  is '第一助手名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.secend_assistantid
  is '第二助手编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.secend_assistant_name
  is '第二助手名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_name
  is '手术名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_level_code
  is '手术级别代码 1.一级手术 2.二级手术 3.三级手术 4.四级手术 0.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_level
  is '手术级别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.incision_level_code
  is '手术切口类别代码 1 0类切口2	Ⅰ类切口 3 Ⅱ类切口 4	Ⅲ类切口';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.incision_level
  is '手术切口类别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.incision_heal_level_code
  is '手术切口愈合等级，1甲 2乙 3丙 9其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.incision_heal_level
  is '手术切口愈合等级';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.anesthesia_type_code
  is '麻醉方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.anesthesia_type
  is '麻醉方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.anesthesia_code
  is '麻醉医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.anesthesia_name
  is '麻醉医师姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.isoptional_dateop
  is '是否择期手术 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.preparedate
  is '术前准备时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_begindate
  is '手术开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.operation_enddate
  is '手术结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.antdurg_date
  is '术前抗菌药物给药时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.anesthe_begdate
  is '麻醉开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.anesthe_enddate
  is '麻醉结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.asa_anesthe_level
  is 'ASA麻醉分级代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.incision_site
  is '切口部位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.incision_infect_flag
  is '切口部位是否感染 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.is_opcomplicate
  is '是否有手术并发症 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.opcomplicate_name
  is '手术并发症名称，多个用“,”分割';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_visit_times
  is '住院次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_visit_days
  is '实际住院天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_hospital_time
  is '出院时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_ward_no
  is '患者出院病区编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_ward_name
  is '患者出院病区名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_dept_no
  is '患者出院科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_dept_name
  is '患者出院科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.death_autopsy_flag
  is '死亡患者尸检标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.medical_record_qua_code
  is '病案质量代码 病案质量等级表，1.甲 2.乙 3.丙';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.medical_record_qua
  is '病案质量';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.quality_ctrl_doc_code
  is '质控医生编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.quality_ctrl_doc
  is '质控医生';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.quality_ctrl_nur_code
  is '质控护士编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.quality_ctrl_nur
  is '质控护士';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.quality_ctrl_date
  is '质控日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_in_falg
  is '出院31天内再住院标志 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_in_reason
  is '出院31天内再住院目的';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.same_diag_in
  is '是否因同一病种再入院 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.days_bet_last_visit
  is '与上次出院日期间隔天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.syphilis_screen_flag
  is '是否妊娠梅毒筛查 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.antibacterial_use_act
  is '抗菌药物使用情况 1	Ⅰ联
2	Ⅱ联
3	Ⅲ联
4	Ⅳ联
5	>Ⅳ联';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.antdurg_names
  is '抗菌药物名称，多个用“,”分割';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.infusion_reaction_code
  is '输液反应 0：未输；1：无；2：有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.infusion_react_drug
  is '引发反应的药物';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.infusion_reaction_desc
  is '输液反应临床表现';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.is_pressure_sore
  is '是否发生压疮 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.is_press_sore_hospital
  is '是否住院期间发生压疮 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pressure_sore_stage
  is '压疮分期 1. 1期 2. 2期 3. 3期 4. 4期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_flag
  is '入住重症监护病房';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out15
  is '出院诊断十五-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out15
  is '出院诊断十五-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status15
  is '出院诊断十五-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out16
  is '出院诊断十六-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out16
  is '出院诊断十六-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out16
  is '出院诊断十六-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status16
  is '出院诊断十六-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out17
  is '出院诊断十七-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out17
  is '出院诊断十七-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out17
  is '出院诊断十七-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status17
  is '出院诊断十七-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out18
  is '出院诊断十八-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out18
  is '出院诊断十八-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out18
  is '出院诊断十八-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status18
  is '出院诊断十八-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out19
  is '出院诊断十九-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out19
  is '出院诊断十九-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out19
  is '出院诊断十九-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status19
  is '出院诊断十九-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out20
  is '出院诊断二十-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out20
  is '出院诊断二十-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out20
  is '出院诊断二十-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status20
  is '出院诊断二十-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out21
  is '出院诊断二十一-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out21
  is '出院诊断二十一-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out21
  is '出院诊断二十一-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status21
  is '出院诊断二十一-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out22
  is '出院诊断二十二-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out22
  is '出院诊断二十二-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out22
  is '出院诊断二十二-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status22
  is '出院诊断二十二-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_visit_frequency
  is '住院次数-第几次住院';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.death_time
  is '死亡时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.mobilization_autopsy
  is '动员尸检 0否 1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.max_diag_basis
  is '最高诊断依据 1:临床,2:X线、CT、超声波、内窥镜等,3:手术,4:生化、免疫,5:细胞学、血片,6:病理（继发）,7:病理（原发）,8:尸检（有病理）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.graduate_practice_doctor
  is '研究生实习医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_type1
  is '患者入住重症监护病房情况一-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_time1
  is '患者入住重症监护病房情况一-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icu_time1
  is '患者入住重症监护病房情况一-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu1
  is '患者入住重症监护病房情况一-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu_reason1
  is '患者入住重症监护病房情况一-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_type2
  is '患者入住重症监护病房情况二-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_time2
  is '患者入住重症监护病房情况二-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icu_time2
  is '患者入住重症监护病房情况二-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu2
  is '患者入住重症监护病房情况二-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu_reason2
  is '患者入住重症监护病房情况二-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_type3
  is '患者入住重症监护病房情况三-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_time3
  is '患者入住重症监护病房情况三-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icu_time3
  is '患者入住重症监护病房情况三-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu3
  is '患者入住重症监护病房情况三-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu_reason3
  is '患者入住重症监护病房情况三-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_type4
  is '患者入住重症监护病房情况四-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_time4
  is '患者入住重症监护病房情况四-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icu_time4
  is '患者入住重症监护病房情况四-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu4
  is '患者入住重症监护病房情况四-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu_reason4
  is '患者入住重症监护病房情况四-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_type5
  is '患者入住重症监护病房情况五-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_time5
  is '患者入住重症监护病房情况五-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icu_time5
  is '患者入住重症监护病房情况五-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu5
  is '患者入住重症监护病房情况五-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu_reason5
  is '患者入住重症监护病房情况五-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_type6
  is '患者入住重症监护病房情况六-类型 1.EICU 2.CCU 3.RICU 4.NICU 5.PICU 6.SICU 7.综合ICU ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icu_time6
  is '患者入住重症监护病房情况六-入住时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icu_time6
  is '患者入住重症监护病房情况六-转出时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu6
  is '患者入住重症监护病房情况六-有无再次入住重症监护病房情况计划 0无 1 有';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.return_icu_reason6
  is '患者入住重症监护病房情况六-再次入住重症监护病房情况原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type1
  is '患者入住重症监护室期间器械使用情况一-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime1
  is '患者入住重症监护室期间器械使用情况一-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime1
  is '患者入住重症监护室期间器械使用情况一-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect1
  is '患者入住重症监护室期间器械使用情况一-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time1
  is '患者入住重症监护室期间器械使用情况一-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type2
  is '患者入住重症监护室期间器械使用情况二-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime2
  is '患者入住重症监护室期间器械使用情况二-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime2
  is '患者入住重症监护室期间器械使用情况二-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect2
  is '患者入住重症监护室期间器械使用情况二-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time2
  is '患者入住重症监护室期间器械使用情况二-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type3
  is '患者入住重症监护室期间器械使用情况三-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime3
  is '患者入住重症监护室期间器械使用情况三-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime3
  is '患者入住重症监护室期间器械使用情况三-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect3
  is '患者入住重症监护室期间器械使用情况三-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time3
  is '患者入住重症监护室期间器械使用情况三-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type4
  is '患者入住重症监护室期间器械使用情况四-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime4
  is '患者入住重症监护室期间器械使用情况四-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime4
  is '患者入住重症监护室期间器械使用情况四-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.isfall_down
  is '住院期间有无跌倒或坠床 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time10
  is '患者入住重症监护室期间器械使用情况十-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.superior_nursing_days
  is '特级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.first_nursing_days
  is '一级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.second_nursing_days
  is '二级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.third_nursing_days
  is '三级护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.icu_nursing_days
  is 'ICU护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect4
  is '患者入住重症监护室期间器械使用情况四-是否发生感染';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.ccu_nursing_days
  is 'CCU护理天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.ventilater_time
  is '有创呼吸机使用时间（分钟）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.item_before_transfu
  is '输血前9项检查 0否1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.insurance_card
  is '医保卡号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.insurance_type
  is '医保卡类型编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.insurance_name
  is '医保卡类型名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.insurance_visit_no
  is '医保结算流水号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time4
  is '患者入住重症监护室期间器械使用情况四-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type5
  is '患者入住重症监护室期间器械使用情况五-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime5
  is '患者入住重症监护室期间器械使用情况五-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime5
  is '患者入住重症监护室期间器械使用情况五-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect5
  is '患者入住重症监护室期间器械使用情况五-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time5
  is '患者入住重症监护室期间器械使用情况五-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type6
  is '患者入住重症监护室期间器械使用情况六-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime6
  is '患者入住重症监护室期间器械使用情况六-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime6
  is '患者入住重症监护室期间器械使用情况六-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect6
  is '患者入住重症监护室期间器械使用情况六-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time6
  is '患者入住重症监护室期间器械使用情况六-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type7
  is '患者入住重症监护室期间器械使用情况七-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime7
  is '患者入住重症监护室期间器械使用情况七-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime7
  is '患者入住重症监护室期间器械使用情况七-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect7
  is '患者入住重症监护室期间器械使用情况七-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time7
  is '患者入住重症监护室期间器械使用情况七-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type8
  is '患者入住重症监护室期间器械使用情况八-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime8
  is '患者入住重症监护室期间器械使用情况八-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime8
  is '患者入住重症监护室期间器械使用情况八-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect8
  is '患者入住重症监护室期间器械使用情况八-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time8
  is '患者入住重症监护室期间器械使用情况八-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type9
  is '患者入住重症监护室期间器械使用情况九-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime9
  is '患者入住重症监护室期间器械使用情况九-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime9
  is '患者入住重症监护室期间器械使用情况九-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect9
  is '患者入住重症监护室期间器械使用情况九-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect_time9
  is '患者入住重症监护室期间器械使用情况九-感染累积时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_type10
  is '患者入住重症监护室期间器械使用情况十-类型1:呼吸机 2:中心静脉导管 3:泌尿道置管 4:PICC 5:持续肾脏替代治疗 6:体外氧合膜肺支持 7:人工心脏 12:漂浮导管 9:有创监测多功能监护仪 10:主动脉球囊反博仪 11:动脉导管 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_begintime10
  is '患者入住重症监护室期间器械使用情况十-开始时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_endtime10
  is '患者入住重症监护室期间器械使用情况十-结束时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instru_infect10
  is '患者入住重症监护室期间器械使用情况十-是否发生感染 0否 1 是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.fall_down
  is '住院有无跌倒或坠床及伤害程度 1. 一级 2.二级 3.三级 4.未造成伤害';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.fall_down_reason
  is '跌倒或坠床原因 1	健康原因
2	治疗、药物、麻醉原因
3	环境因素
9  其他原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.is_physical_rest
  is '住院期间身体约束情况 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.hospital_infect_flag
  is '医院感染情况 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.infectbyop
  is '医院感染是否与手术相关 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.infectbyinvadop
  is '医院感染是否与侵入性操作相关 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.is_in_icu
  is '住院期间是否入住重症监护病房 0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inicu_instrument
  is '入住重症监护病房期间器械使用情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.accumulate_ddd
  is '累积DDD数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.consultation_station
  is '是否会诊   0否 ,1是';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.consultation_inpital
  is '院内会诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.consultation_outpital
  is '院外会诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.consultation_other
  is '其它会诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icutype
  is '患者入住重症病房-ICU类型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_icudate
  is '患者入住重症病房时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_icudate
  is '患者转出重症病房时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.hospital_infect_site
  is '感染部位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.hospital_infect_name
  is '医院感染名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pay_type_code
  is '医疗付费方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pay_type
  is '医疗付费方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.total_fee
  is '住院总费用,元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.self_pay_fee
  is '住院总费用-自付金额（元）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.other_pay_fee
  is '住院总费用-其它支付（元）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.common_medic_fee
  is '综合医疗服务费-一般医疗服务费,元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.common_treat_fee
  is '综合医疗服务费-一般治疗操作费,元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.common_nur_fee
  is '综合医疗服务费-护理费，元';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.common_other_fee
  is '综合医疗服务费-其他费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathology_dia_fee
  is '诊断-病理诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.lis_dia_fee
  is '诊断-实验室诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.iconography_fee
  is '诊断-影像学诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.clinic_dia_fee
  is '临床诊断项目费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.nop_treat_fee
  is '非手术治疗项目费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.nop_physcical_treat_fee
  is '非手术治疗项目费-临床物理治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.op_treat_fee
  is '手术治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.op_treat_anesthesia_fee
  is '手术治疗费-麻醉费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.op_treat_operat_fee
  is '手术治疗费-手术费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.recure_fee
  is '康复费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee
  is '中医诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_treat_fee
  is '中医治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee_external
  is '中医外治费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee_bone
  is '中医骨伤费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee_acupuncture
  is '针刺与灸法费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee_massage
  is '中医推拿治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee_anorectal
  is '中医肛肠治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_diag_fee_special
  is '中医特殊治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_treat_fee_other
  is '中医其他';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_other_fee
  is '中药特殊调配加工费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tcm_treat_fee_diet
  is '辩证施膳';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.drug_fee
  is '西药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.drug_antibact_fee
  is '西药费-抗菌药物费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.ctm_drug_fee
  is '中成药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.herb_medicine_fee
  is '中草药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.herb_madedrug_fee
  is '医疗机构中药制剂费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.blood_fee
  is '血费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.albumin_fee
  is '白蛋白类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.globulin_fee
  is '球蛋白类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.cruor_fee
  is '凝血因子类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.cytokine_fee
  is '细胞因子类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.materials_check_fee
  is '一次性医用材料费-检查用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.materials_treat_fee
  is '一次性医用材料费-治疗用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.materials_opreat_fee
  is '一次性医用材料费-手术用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.others_fee
  is '其他费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out1
  is '出院诊断一-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out2
  is '出院诊断二-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out2
  is '出院诊断二-入院病情  1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out2
  is '出院诊断二-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status2
  is '出院诊断二-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out3
  is '出院诊断三-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out3
  is '出院诊断三-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out3
  is '出院诊断三-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status3
  is '出院诊断三-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out4
  is '出院诊断四-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out4
  is '出院诊断四-入院病情1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out4
  is '出院诊断四-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status4
  is '出院诊断四-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out5
  is '出院诊断五-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out5
  is '出院诊断五-入院病情1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out5
  is '出院诊断五-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status5
  is '出院诊断五-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out6
  is '出院诊断六-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out6
  is '出院诊断六-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out6
  is '出院诊断六-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status6
  is '出院诊断六-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out7
  is '出院诊断七-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out7
  is '出院诊断七-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out7
  is '出院诊断七-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status7
  is '出院诊断七-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out8
  is '出院诊断八-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out8
  is '出院诊断八-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out8
  is '出院诊断八-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status8
  is '出院诊断八-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out9
  is '出院诊断九-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out9
  is '出院诊断九-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out9
  is '出院诊断九-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status9
  is '出院诊断九-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out10
  is '出院诊断十-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out10
  is '出院诊断十-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out10
  is '出院诊断十-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status10
  is '出院诊断十-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out11
  is '出院诊断十一-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out11
  is '出院诊断十一-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out11
  is '出院诊断十一-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status11
  is '出院诊断十一-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out12
  is '出院诊断十二-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out12
  is '出院诊断十二-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out12
  is '出院诊断十二-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status12
  is '出院诊断十二-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out13
  is '出院诊断十三-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out13
  is '出院诊断十三-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out13
  is '出院诊断十三-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status13
  is '出院诊断十三-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out14
  is '出院诊断十四-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_condition_out14
  is '出院诊断十四-入院病情 1.有 2.不明确 3.不明 4.无';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_code_out14
  is '出院诊断十四-主要诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.outhospital_status14
  is '出院诊断十四-出院情况 1.治愈 2.好转 3.未愈 4.死亡 5.其他   转归';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.main_diag_name_out15
  is '出院诊断十五-名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.group_code
  is '集团编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.organization_code
  is '组织编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.domain_id
  is '系统域标识，01门诊02住院03体检';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.createtime
  is '创建时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.unicode
  is '数据唯一记录号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.patient_id
  is '患者ID';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.visittimes
  is '就诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.visit_no
  is '就诊流水号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.health_card
  is '健康卡号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inpatient_no
  is '住院号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.medical_record_no
  is '病案号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.address
  is '患者详细住址,现住址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.addr_tel
  is '家庭电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.id_card
  is '身份证号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.card_type_code
  is '证件类型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.patient_name
  is '患者姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.gendercode
  is '性别代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.gendername
  is '性别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.marrystatuscode
  is '婚姻状况代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.marrystatus
  is '婚姻状况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.nation_code
  is '民族代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.nation
  is '民族';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_address
  is '患者详细住址，出生地';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.born_addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.country_code
  is '国家代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.country
  is '国家名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.age
  is '年龄';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.age_unit
  is '年龄单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_address
  is '患者详细住址，工作单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_addr_road
  is '工作单位地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_addr_street
  is '工作单位地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_addr_area
  is '工作单位地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_addr_city
  is '工作单位地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_addr_province
  is '工作单位地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_addr_zip
  is '工作单位邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.work_tel
  is '工作单位联系电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_address
  is '患者详细住址，户口地址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_addr_road
  is '户口地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_addr_street
  is '户口地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_addr_area
  is '户口地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_addr_city
  is '户口地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_addr_province
  is '户口地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.house_addr_zip
  is '户口地址邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.native_addr_area
  is '籍贯-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.native_addr_city
  is '籍贯-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.native_addr_province
  is '籍贯-省(自治区、直辖市)';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.occupationcode
  is '职业代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.occupation
  is '职业';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.provide_orgnizationcode
  is '医院代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.provide_orgnization
  is '医院名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.author_sign_date
  is '首页文档作者签署日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.author_doc_code
  is '首页文档作者编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.author_doc_name
  is '首页文档作者名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.deptdirectorid
  is '科主任编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.deptdirector
  is '科主任名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.doctor_director
  is '主任(副主任)医师姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.doctor_directorid
  is '主任(副主任)医师编号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.visit_dector_code
  is '主诊医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.visit_dector_name
  is '主诊医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.respons_nurse_code
  is '责任护士编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.respons_nurse_name
  is '责任护士名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.matron_code
  is '护士长编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.matron_name
  is '护士长';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.advanced_studies_docid
  is '进修医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.advanced_studies_doc
  is '进修医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.practice_doctorid
  is '实习医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.practice_doctor
  is '实习医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.coding_doctorid
  is '编码医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.coding_doctor
  is '编码医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_code
  is '联系人关系代码（ GB/T 4761-2008）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation
  is '联系人关系名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_address
  is '联系人详细住址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_phone
  is '联系人电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.relation_name
  is '联系人姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_hospital_type_code
  is '入院途径代码，CV09.00.403';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_hospital_type
  is '入院途径，如：门诊';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_hos_other_hospitalname
  is '入院途径之其它医疗机构转入-医疗机构名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.out_hospital_date
  is '出院日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.admission_condition
  is '入院情况代码，';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.rooom_no
  is '患者所在病房';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_in_weight
  is '新生儿入院体重（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_in_weight_unit
  is '新生儿入院体重单位（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_weight
  is '新生儿出生体重（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_weight_unit
  is '新生儿出生体重单位（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_weight_second
  is '新生儿出生体重2（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_weight_second_unit
  is '新生儿出生体重2单位（g）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_sex_id
  is '新生儿性别代码代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_sex
  is '新生性别代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_sex_id_second
  is '新生儿性别代码代码2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.bdby_sex_second
  is '新生儿性别代码2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnosis_mz
  is '门诊疾病诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnosis_code_mz
  is '门诊疾病诊断编码，ICD-10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathology_code
  is '病理诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathology_name
  is '病理诊断编码，ICD-10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathology_no
  is '病理号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.tnm_period
  is 'TNM分期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compliance_surgery
  is '术前与术后诊断符合 ';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compliance_onp
  is '门诊诊断与出院诊断是否符合';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compliance_inp
  is '入院诊断与出院诊断是否符合';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compliance_dr
  is '放射与病理符合情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compliance_pat
  is '病理检查与临床诊断符合情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compl_daiganddr
  is '放射与临床诊断符合情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.diagnostic_compl_banddiag
  is 'B超与临床诊断符合情况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.condition_told_flag
  is '住院期间是否相关之情告知';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen1
  is '病原学1';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time1
  is '标本1送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample1
  is '病原菌标本1';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample2
  is '病原菌标本2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen2
  is '病原学2';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time2
  is '标本2送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample3
  is '病原菌标本3';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen3
  is '病原学3';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time3
  is '标本3送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_samnple4
  is '病原菌标本4';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen4
  is '病原学4';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time4
  is '标本4送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_samnple5
  is '病原菌标本5';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen5
  is '病原学5';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time5
  is '标本5送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample6
  is '病原菌标本6';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen6
  is '病原学6';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time6
  is '标本6送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample7
  is '病原菌标本7';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen7
  is '病原学7';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time7
  is '标本7送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample8
  is '病原菌标本8';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen8
  is '病原学8';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time8
  is '标本8送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample9
  is '病原菌标本9';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen9
  is '病原学9';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time9
  is '标本9送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen_sample10
  is '病原菌标本10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.pathogen10
  is '病原学10';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.sample_check_time10
  is '标本10送检日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.complie_time
  is '完成编码时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM.mr_no
  is '病案号';





create table CDR_EMR_FIRSTPAGE_MEDICALRECORD_BM_RECORDS
(
    disease_state                 VARCHAR2(50),
    critically_ill_flag           NUMBER,
    isdrug_antibact               NUMBER,
    continu_hours                 INTEGER,
    combination_medical           NUMBER,
    clinical_pathway_flag         NUMBER,
    clinical_pathway_code         NUMBER,
    finish_clinical_path          NUMBER,
    abort_clinical_path           VARCHAR2(50),
    mutat_clinical_path           NUMBER,
    mutat_reason                  NUMBER,
    used_tcm_preparation          NUMBER,
    used_tcm_drug                 NUMBER,
    used_tcm_technology           VARCHAR2(50),
    used_tcm_datt                 VARCHAR2(50),
    dialect_nurse                 NUMBER,
    rescue_times                  INTEGER,
    rescue_success_time           INTEGER,
    is_illness_case               NUMBER,
    follow_up_flag                NUMBER,
    follow_up_year                INTEGER,
    follow_up_mon                 INTEGER,
    follow_up_day                 INTEGER,
    damage_poisoning_reason       VARCHAR2(200),
    damage_pois_reason_code       VARCHAR2(50),
    damage_pois_reason_name       VARCHAR2(200),
    brain_injury_coma_d           NUMBER,
    brain_injury_coma_h           NUMBER,
    brain_injury_coma_min         NUMBER,
    brain_injury_coma_in_d        NUMBER,
    brain_injury_coma_in_h        NUMBER,
    brain_injury_coma_in_min      NUMBER,
    trans_dept_reason             VARCHAR2(200),
    trans_dept_time               DATE,
    trans_dept_code               VARCHAR2(50),
    trans_dept_name               VARCHAR2(200),
    trans_ward_code               VARCHAR2(50),
    trans_ward_name               VARCHAR2(200),
    admission_diagnosis_code      VARCHAR2(100),
    admission_diagnosis           VARCHAR2(100),
    bloodtrans_red_cell           NUMBER,
    bloodtrans_platelet           NUMBER,
    bloodtrans_plasma             NUMBER,
    bloodtrans_wholeblood         NUMBER,
    bloodtrans_autologousblood    NUMBER,
    bloodtrans_albumin            NUMBER,
    bloodtrans_cryoprecipitate    NUMBER,
    bloodtrans_other              NUMBER,
    bloodtrans_reaction           VARCHAR2(200),
    main_diag_name_out1           VARCHAR2(200),
    main_diag_conftime_out        DATE,
    main_diag_code_out1           VARCHAR2(200),
    out_hospital_method_code      VARCHAR2(2),
    out_hospital_method           VARCHAR2(50),
    outhospital_status1           INTEGER,
    plan_accept_hospital          VARCHAR2(50),
    check_ct                      INTEGER,
    check_pect                    INTEGER,
    check_doublect                INTEGER,
    check_b                       INTEGER,
    check_x                       INTEGER,
    check_echo                    INTEGER,
    check_mri                     INTEGER,
    check_isotope                 INTEGER,
    drug_allergies_flar           NUMBER,
    allergy_drug                  VARCHAR2(200),
    abo_blood_type                VARCHAR2(10),
    abo_blood_name                VARCHAR2(20),
    rh_blood_type                 VARCHAR2(10),
    rh_blood_name                 VARCHAR2(20),
    isemergency_op                NUMBER,
    operation_code                VARCHAR2(20),
    operation_date                DATE,
    operator_code                 VARCHAR2(20),
    operator_name                 VARCHAR2(50),
    first_assistantid             VARCHAR2(20),
    first_assistant_name          VARCHAR2(50),
    secend_assistantid            VARCHAR2(20),
    secend_assistant_name         VARCHAR2(50),
    operation_name                VARCHAR2(200),
    operation_level_code          NUMBER,
    operation_level               VARCHAR2(50),
    incision_level_code           INTEGER,
    incision_level                VARCHAR2(50),
    incision_heal_level_code      INTEGER,
    incision_heal_level           VARCHAR2(50),
    anesthesia_type_code          VARCHAR2(50),
    anesthesia_type               VARCHAR2(200),
    anesthesia_code               VARCHAR2(20),
    anesthesia_name               VARCHAR2(50),
    isoptional_dateop             NUMBER,
    preparedate                   DATE,
    operation_begindate           DATE,
    operation_enddate             DATE,
    antdurg_date                  DATE,
    anesthe_begdate               DATE,
    anesthe_enddate               DATE,
    asa_anesthe_level             VARCHAR2(50),
    incision_site                 VARCHAR2(200),
    incision_infect_flag          NUMBER,
    is_opcomplicate               NUMBER,
    opcomplicate_name             VARCHAR2(200),
    in_visit_times                INTEGER,
    in_visit_days                 INTEGER,
    out_hospital_time             DATE,
    out_ward_no                   VARCHAR2(20),
    out_ward_name                 VARCHAR2(50),
    out_dept_no                   VARCHAR2(20),
    out_dept_name                 VARCHAR2(50),
    death_autopsy_flag            NUMBER,
    medical_record_qua_code       INTEGER,
    medical_record_qua            VARCHAR2(200),
    quality_ctrl_doc_code         VARCHAR2(20),
    quality_ctrl_doc              VARCHAR2(100),
    quality_ctrl_nur_code         VARCHAR2(20),
    quality_ctrl_nur              VARCHAR2(100),
    quality_ctrl_date             DATE,
    out_in_falg                   NUMBER,
    out_in_reason                 VARCHAR2(200),
    same_diag_in                  NUMBER,
    days_bet_last_visit           INTEGER,
    syphilis_screen_flag          NUMBER,
    antibacterial_use_act         INTEGER,
    antdurg_names                 VARCHAR2(200),
    infusion_reaction_code        VARCHAR2(200),
    infusion_react_drug           VARCHAR2(200),
    infusion_reaction_desc        VARCHAR2(200),
    is_pressure_sore              NUMBER,
    is_press_sore_hospital        NUMBER,
    pressure_sore_stage           INTEGER,
    in_icu_flag                   NUMBER,
    main_diag_condition_out15     VARCHAR2(200),
    main_diag_code_out15          VARCHAR2(60),
    outhospital_status15          INTEGER,
    main_diag_name_out16          VARCHAR2(200),
    main_diag_condition_out16     VARCHAR2(200),
    main_diag_code_out16          VARCHAR2(60),
    outhospital_status16          INTEGER,
    main_diag_name_out17          VARCHAR2(200),
    main_diag_condition_out17     VARCHAR2(200),
    main_diag_code_out17          VARCHAR2(60),
    outhospital_status17          INTEGER,
    main_diag_name_out18          VARCHAR2(200),
    main_diag_condition_out18     VARCHAR2(200),
    main_diag_code_out18          VARCHAR2(60),
    outhospital_status18          INTEGER,
    main_diag_name_out19          VARCHAR2(200),
    main_diag_condition_out19     VARCHAR2(200),
    main_diag_code_out19          VARCHAR2(60),
    outhospital_status19          INTEGER,
    main_diag_name_out20          VARCHAR2(200),
    main_diag_condition_out20     VARCHAR2(200),
    main_diag_code_out20          VARCHAR2(60),
    outhospital_status20          INTEGER,
    main_diag_name_out21          VARCHAR2(200),
    main_diag_condition_out21     VARCHAR2(200),
    main_diag_code_out21          VARCHAR2(60),
    outhospital_status21          INTEGER,
    main_diag_name_out22          VARCHAR2(200),
    main_diag_condition_out22     VARCHAR2(200),
    main_diag_code_out22          VARCHAR2(60),
    outhospital_status22          INTEGER,
    in_visit_frequency            INTEGER,
    death_time                    DATE,
    mobilization_autopsy          VARCHAR2(20),
    max_diag_basis                VARCHAR2(200),
    graduate_practice_doctor      VARCHAR2(60),
    icu_type1                     VARCHAR2(200),
    in_icu_time1                  DATE,
    out_icu_time1                 DATE,
    return_icu1                   INTEGER,
    return_icu_reason1            VARCHAR2(200),
    icu_type2                     VARCHAR2(60),
    in_icu_time2                  DATE,
    out_icu_time2                 DATE,
    return_icu2                   INTEGER,
    return_icu_reason2            VARCHAR2(200),
    icu_type3                     VARCHAR2(60),
    in_icu_time3                  DATE,
    out_icu_time3                 DATE,
    return_icu3                   INTEGER,
    return_icu_reason3            VARCHAR2(200),
    icu_type4                     VARCHAR2(60),
    in_icu_time4                  DATE,
    out_icu_time4                 DATE,
    return_icu4                   INTEGER,
    return_icu_reason4            VARCHAR2(200),
    icu_type5                     VARCHAR2(60),
    in_icu_time5                  DATE,
    out_icu_time5                 DATE,
    return_icu5                   INTEGER,
    return_icu_reason5            VARCHAR2(200),
    icu_type6                     VARCHAR2(60),
    in_icu_time6                  DATE,
    out_icu_time6                 DATE,
    return_icu6                   INTEGER,
    return_icu_reason6            VARCHAR2(200),
    inicu_instru_type1            VARCHAR2(100),
    inicu_instru_begintime1       DATE,
    inicu_instru_endtime1         DATE,
    inicu_instru_infect1          INTEGER,
    inicu_instru_infect_time1     INTEGER,
    inicu_instru_type2            VARCHAR2(100),
    inicu_instru_begintime2       DATE,
    inicu_instru_endtime2         DATE,
    inicu_instru_infect2          INTEGER,
    inicu_instru_infect_time2     INTEGER,
    inicu_instru_type3            VARCHAR2(100),
    inicu_instru_begintime3       DATE,
    inicu_instru_endtime3         DATE,
    inicu_instru_infect3          INTEGER,
    inicu_instru_infect_time3     INTEGER,
    inicu_instru_type4            VARCHAR2(100),
    inicu_instru_begintime4       DATE,
    inicu_instru_endtime4         DATE,
    isfall_down                   NUMBER,
    inicu_instru_infect_time10    INTEGER,
    superior_nursing_days         INTEGER,
    first_nursing_days            INTEGER,
    second_nursing_days           INTEGER,
    third_nursing_days            INTEGER,
    icu_nursing_days              INTEGER,
    inicu_instru_infect4          INTEGER,
    ccu_nursing_days              INTEGER,
    ventilater_time               INTEGER,
    item_before_transfu           INTEGER,
    insurance_card                VARCHAR2(50),
    insurance_type                VARCHAR2(2),
    insurance_name                VARCHAR2(50),
    insurance_visit_no            VARCHAR2(50),
    inicu_instru_infect_time4     INTEGER,
    inicu_instru_type5            VARCHAR2(100),
    inicu_instru_begintime5       DATE,
    inicu_instru_endtime5         DATE,
    inicu_instru_infect5          INTEGER,
    inicu_instru_infect_time5     INTEGER,
    inicu_instru_type6            VARCHAR2(100),
    inicu_instru_begintime6       DATE,
    inicu_instru_endtime6         DATE,
    inicu_instru_infect6          INTEGER,
    inicu_instru_infect_time6     INTEGER,
    inicu_instru_type7            VARCHAR2(100),
    inicu_instru_begintime7       DATE,
    inicu_instru_endtime7         DATE,
    inicu_instru_infect7          INTEGER,
    inicu_instru_infect_time7     INTEGER,
    inicu_instru_type8            VARCHAR2(100),
    inicu_instru_begintime8       DATE,
    inicu_instru_endtime8         DATE,
    inicu_instru_infect8          INTEGER,
    inicu_instru_infect_time8     INTEGER,
    inicu_instru_type9            VARCHAR2(100),
    inicu_instru_begintime9       DATE,
    inicu_instru_endtime9         DATE,
    inicu_instru_infect9          INTEGER,
    inicu_instru_infect_time9     INTEGER,
    inicu_instru_type10           VARCHAR2(100),
    inicu_instru_begintime10      DATE,
    inicu_instru_endtime10        DATE,
    inicu_instru_infect10         INTEGER,
    fall_down                     INTEGER,
    fall_down_reason              INTEGER,
    is_physical_rest              NUMBER,
    hospital_infect_flag          NUMBER,
    infectbyop                    NUMBER,
    infectbyinvadop               NUMBER,
    is_in_icu                     NUMBER,
    inicu_instrument              VARCHAR2(200),
    accumulate_ddd                NUMBER,
    consultation_station          NUMBER,
    consultation_inpital          INTEGER,
    consultation_outpital         INTEGER,
    consultation_other            INTEGER,
    in_icutype                    VARCHAR2(100),
    in_icudate                    DATE,
    out_icudate                   DATE,
    hospital_infect_site          VARCHAR2(200),
    hospital_infect_name          VARCHAR2(200),
    pay_type_code                 VARCHAR2(50),
    pay_type                      VARCHAR2(100),
    total_fee                     NUMBER(12,4),
    self_pay_fee                  NUMBER(12,4),
    other_pay_fee                 NUMBER(12,4),
    common_medic_fee              NUMBER(12,4),
    common_treat_fee              NUMBER(12,4),
    common_nur_fee                NUMBER(12,4),
    common_other_fee              NUMBER(12,4),
    pathology_dia_fee             NUMBER(12,4),
    lis_dia_fee                   NUMBER(12,4),
    iconography_fee               NUMBER(12,4),
    clinic_dia_fee                NUMBER(12,4),
    nop_treat_fee                 NUMBER(12,4),
    nop_physcical_treat_fee       NUMBER(12,4),
    op_treat_fee                  NUMBER,
    op_treat_anesthesia_fee       NUMBER(12,4),
    op_treat_operat_fee           NUMBER(12,4),
    recure_fee                    NUMBER(12,4),
    tcm_diag_fee                  NUMBER(12,4),
    tcm_treat_fee                 NUMBER(12,4),
    tcm_diag_fee_external         NUMBER(12,4),
    tcm_diag_fee_bone             NUMBER(12,4),
    tcm_diag_fee_acupuncture      NUMBER(12,4),
    tcm_diag_fee_massage          NUMBER(12,4),
    tcm_diag_fee_anorectal        NUMBER(12,4),
    tcm_diag_fee_special          NUMBER(12,4),
    tcm_treat_fee_other           NUMBER(12,4),
    tcm_other_fee                 NUMBER(12,4),
    tcm_treat_fee_diet            NUMBER(12,4),
    drug_fee                      NUMBER(12,4),
    drug_antibact_fee             NUMBER(12,4),
    ctm_drug_fee                  NUMBER(12,4),
    herb_medicine_fee             NUMBER(12,4),
    herb_madedrug_fee             NUMBER(12,4),
    blood_fee                     NUMBER(12,4),
    albumin_fee                   NUMBER(12,4),
    globulin_fee                  NUMBER(12,4),
    cruor_fee                     NUMBER(12,4),
    cytokine_fee                  NUMBER(12,4),
    materials_check_fee           NUMBER(12,4),
    materials_treat_fee           NUMBER(12,4),
    materials_opreat_fee          NUMBER(12,4),
    others_fee                    NUMBER(12,4),
    delete_flag                   NUMBER(1),
    main_diag_condition_out1      VARCHAR2(200),
    main_diag_name_out2           VARCHAR2(200),
    main_diag_condition_out2      VARCHAR2(200),
    main_diag_code_out2           VARCHAR2(60),
    outhospital_status2           INTEGER,
    main_diag_name_out3           VARCHAR2(200),
    main_diag_condition_out3      VARCHAR2(200),
    main_diag_code_out3           VARCHAR2(100),
    outhospital_status3           INTEGER,
    main_diag_name_out4           VARCHAR2(200),
    main_diag_condition_out4      VARCHAR2(200),
    main_diag_code_out4           VARCHAR2(60),
    outhospital_status4           INTEGER,
    main_diag_name_out5           VARCHAR2(200),
    main_diag_condition_out5      VARCHAR2(200),
    main_diag_code_out5           VARCHAR2(60),
    outhospital_status5           INTEGER,
    main_diag_name_out6           VARCHAR2(200),
    main_diag_condition_out6      VARCHAR2(200),
    main_diag_code_out6           VARCHAR2(60),
    outhospital_status6           INTEGER,
    main_diag_name_out7           VARCHAR2(200),
    main_diag_condition_out7      VARCHAR2(200),
    main_diag_code_out7           VARCHAR2(60),
    outhospital_status7           INTEGER,
    main_diag_name_out8           VARCHAR2(200),
    main_diag_condition_out8      VARCHAR2(200),
    main_diag_code_out8           VARCHAR2(60),
    outhospital_status8           INTEGER,
    main_diag_name_out9           VARCHAR2(200),
    main_diag_condition_out9      VARCHAR2(200),
    main_diag_code_out9           VARCHAR2(60),
    outhospital_status9           INTEGER,
    main_diag_name_out10          VARCHAR2(200),
    main_diag_condition_out10     VARCHAR2(200),
    main_diag_code_out10          VARCHAR2(60),
    outhospital_status10          INTEGER,
    main_diag_name_out11          VARCHAR2(200),
    main_diag_condition_out11     VARCHAR2(200),
    main_diag_code_out11          VARCHAR2(60),
    outhospital_status11          INTEGER,
    main_diag_name_out12          VARCHAR2(200),
    main_diag_condition_out12     VARCHAR2(200),
    main_diag_code_out12          VARCHAR2(60),
    outhospital_status12          INTEGER,
    main_diag_name_out13          VARCHAR2(200),
    main_diag_condition_out13     VARCHAR2(200),
    main_diag_code_out13          VARCHAR2(60),
    outhospital_status13          INTEGER,
    main_diag_name_out14          VARCHAR2(200),
    main_diag_condition_out14     VARCHAR2(200),
    main_diag_code_out14          VARCHAR2(60),
    outhospital_status14          INTEGER,
    main_diag_name_out15          VARCHAR2(200),
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    createtime                    DATE,
    unicode                       VARCHAR2(50) not null,
    patient_id                    VARCHAR2(50),
    visittimes                    INTEGER,
    visit_no                      VARCHAR2(20),
    health_card                   VARCHAR2(20),
    inpatient_no                  VARCHAR2(20),
    medical_record_no             VARCHAR2(18),
    address                       VARCHAR2(200),
    addr_road                     VARCHAR2(200),
    addr_street                   VARCHAR2(200),
    addr_area                     VARCHAR2(200),
    addr_city                     VARCHAR2(200),
    addr_province                 VARCHAR2(50),
    addr_zip                      VARCHAR2(10),
    addr_tel                      VARCHAR2(20),
    id_card                       VARCHAR2(18),
    card_type_code                VARCHAR2(5),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    gendername                    VARCHAR2(50),
    marrystatuscode               VARCHAR2(2),
    marrystatus                   VARCHAR2(20),
    nation_code                   VARCHAR2(10),
    nation                        VARCHAR2(50),
    born_address                  VARCHAR2(200),
    born_addr_road                VARCHAR2(200),
    born_addr_street              VARCHAR2(200),
    born_addr_area                VARCHAR2(200),
    born_addr_city                VARCHAR2(200),
    born_addr_province            VARCHAR2(200),
    born_addr_zip                 VARCHAR2(50),
    country_code                  VARCHAR2(50),
    country                       VARCHAR2(50),
    age                           INTEGER,
    age_unit                      VARCHAR2(50),
    work_address                  VARCHAR2(200),
    work_addr_road                VARCHAR2(200),
    work_addr_street              VARCHAR2(200),
    work_addr_area                VARCHAR2(200),
    work_addr_city                VARCHAR2(200),
    work_addr_province            VARCHAR2(50),
    work_addr_zip                 VARCHAR2(50),
    work_tel                      VARCHAR2(50),
    house_address                 VARCHAR2(200),
    house_addr_road               VARCHAR2(100),
    house_addr_street             VARCHAR2(100),
    house_addr_area               VARCHAR2(200),
    house_addr_city               VARCHAR2(200),
    house_addr_province           VARCHAR2(200),
    house_addr_zip                VARCHAR2(6),
    native_addr_area              VARCHAR2(200),
    native_addr_city              VARCHAR2(200),
    native_addr_province          VARCHAR2(200),
    occupationcode                VARCHAR2(2),
    occupation                    VARCHAR2(100),
    provide_orgnizationcode       VARCHAR2(50),
    provide_orgnization           VARCHAR2(50),
    author_sign_date              DATE,
    author_doc_code               VARCHAR2(20),
    author_doc_name               VARCHAR2(100),
    deptdirectorid                VARCHAR2(20),
    deptdirector                  VARCHAR2(100),
    doctor_director               VARCHAR2(50),
    doctor_directorid             VARCHAR2(50),
    charge_doctor_id              VARCHAR2(50),
    charge_doctor                 VARCHAR2(50),
    visit_dector_code             VARCHAR2(20),
    visit_dector_name             VARCHAR2(50),
    inpatient_doctorid            VARCHAR2(20),
    inpatient_doctor              VARCHAR2(50),
    respons_nurse_code            VARCHAR2(20),
    respons_nurse_name            VARCHAR2(50),
    matron_code                   VARCHAR2(20),
    matron_name                   VARCHAR2(50),
    advanced_studies_docid        VARCHAR2(20),
    advanced_studies_doc          VARCHAR2(50),
    practice_doctorid             VARCHAR2(20),
    practice_doctor               VARCHAR2(50),
    coding_doctorid               VARCHAR2(20),
    coding_doctor                 VARCHAR2(50),
    relation_code                 VARCHAR2(100),
    relation                      VARCHAR2(50),
    relation_address              VARCHAR2(200),
    relation_road                 VARCHAR2(50),
    relation_street               VARCHAR2(50),
    relation_area                 VARCHAR2(50),
    relation_city                 VARCHAR2(50),
    relation_province             VARCHAR2(50),
    relation_zip                  VARCHAR2(50),
    relation_phone                VARCHAR2(12),
    relation_name                 VARCHAR2(32),
    in_hospital_type_code         VARCHAR2(100),
    in_hospital_type              VARCHAR2(50),
    in_hos_other_hospitalname     VARCHAR2(50),
    in_hospital_date              DATE,
    out_hospital_date             DATE,
    admission_condition           NUMBER,
    rooom_no                      VARCHAR2(100),
    ward_no                       VARCHAR2(50),
    ward_name                     VARCHAR2(50),
    dept_no                       VARCHAR2(50),
    dept_name                     VARCHAR2(50),
    bdby_in_weight                INTEGER,
    bdby_in_weight_unit           VARCHAR2(10),
    bdby_weight                   INTEGER,
    bdby_weight_unit              VARCHAR2(10),
    bdby_weight_second            INTEGER,
    bdby_weight_second_unit       VARCHAR2(10),
    bdby_sex_id                   VARCHAR2(1),
    bdby_sex                      VARCHAR2(10),
    bdby_sex_id_second            VARCHAR2(1),
    bdby_sex_second               VARCHAR2(10),
    diagnosis_mz                  VARCHAR2(200),
    diagnosis_code_mz             VARCHAR2(200),
    pathology_code                VARCHAR2(50),
    pathology_name                VARCHAR2(200),
    pathology_no                  VARCHAR2(20),
    tnm_period                    VARCHAR2(1),
    diagnostic_compliance_surgery NUMBER,
    diagnostic_compliance_onp     NUMBER,
    diagnostic_compliance_inp     NUMBER,
    diagnostic_compliance_dr      NUMBER,
    diagnostic_compliance_pat     NUMBER,
    diagnostic_compl_daiganddr    NUMBER,
    diagnostic_compl_banddiag     NUMBER,
    condition_told_flag           NUMBER,
    last_update_time              DATE,
    pathogen1                     VARCHAR2(50),
    sample_check_time1            DATE,
    pathogen_sample1              VARCHAR2(50),
    pathogen_sample2              VARCHAR2(50),
    pathogen2                     VARCHAR2(50),
    sample_check_time2            DATE,
    pathogen_sample3              VARCHAR2(50),
    pathogen3                     VARCHAR2(50),
    sample_check_time3            DATE,
    pathogen_samnple4             VARCHAR2(50),
    pathogen4                     VARCHAR2(50),
    sample_check_time4            DATE,
    pathogen_samnple5             VARCHAR2(50),
    pathogen5                     VARCHAR2(50),
    sample_check_time5            DATE,
    pathogen_sample6              VARCHAR2(50),
    pathogen6                     VARCHAR2(50),
    sample_check_time6            DATE,
    pathogen_sample7              VARCHAR2(50),
    pathogen7                     VARCHAR2(50),
    sample_check_time7            DATE,
    pathogen_sample8              VARCHAR2(50),
    pathogen8                     VARCHAR2(50),
    sample_check_time8            DATE,
    pathogen_sample9              VARCHAR2(50),
    pathogen9                     VARCHAR2(50),
    sample_check_time9            DATE,
    pathogen_sample10             VARCHAR2(50),
    pathogen10                    VARCHAR2(50),
    sample_check_time10           DATE,
    complie_time                  DATE not null,
    mr_no                         VARCHAR2(50),
    pathogen_check                NUMBER
)
 ;





create table CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM
(
    group_code                      VARCHAR2(20),
    organization_code               VARCHAR2(20),
    domain_id                       NUMBER(2),
    unicode                         VARCHAR2(30) not null,
    visit_no                        VARCHAR2(50),
    visittimes                      NUMBER,
    patient_id                      VARCHAR2(36),
    patient_name                    VARCHAR2(20),
    outpatient_no                   VARCHAR2(20),
    inpatient_no                    VARCHAR2(20),
    id_card                         VARCHAR2(18),
    age                             VARCHAR2(30),
    birthtime                       DATE,
    gendercode                      INTEGER,
    gendername                      VARCHAR2(12),
    marrystatuscode                 VARCHAR2(2),
    marrystatus                     VARCHAR2(10),
    nation_code                     VARCHAR2(2),
    nation                          VARCHAR2(20),
    telephone                       VARCHAR2(15),
    medical_record_no               VARCHAR2(50),
    health_card                     VARCHAR2(20),
    address                         VARCHAR2(50),
    addr_road                       VARCHAR2(50),
    addr_street                     VARCHAR2(50),
    addr_area                       VARCHAR2(50),
    addr_city                       VARCHAR2(50),
    addr_province                   VARCHAR2(50),
    addr_zip                        VARCHAR2(6),
    born_addr_area                  VARCHAR2(50),
    born_addr_city                  VARCHAR2(50),
    born_addr_province              VARCHAR2(50),
    born_addr_zip                   VARCHAR2(6),
    country_code                    VARCHAR2(6),
    country                         VARCHAR2(20),
    work_address                    VARCHAR2(50),
    work_addr_road                  VARCHAR2(50),
    work_addr_street                VARCHAR2(50),
    work_addr_area                  VARCHAR2(50),
    work_addr_city                  VARCHAR2(50),
    work_addr_province              VARCHAR2(50),
    work_addr_zip                   VARCHAR2(6),
    employerorganization            VARCHAR2(50),
    workphone                       VARCHAR2(20),
    house_address                   VARCHAR2(50),
    house_addr_road                 VARCHAR2(50),
    house_addr_street               VARCHAR2(50),
    house_addr_area                 VARCHAR2(50),
    house_addr_city                 VARCHAR2(50),
    house_addr_province             VARCHAR2(50),
    house_addr_zip                  VARCHAR2(6),
    native_addr_city                VARCHAR2(50),
    native_addr_province            VARCHAR2(50),
    occupationcode                  VARCHAR2(2),
    occupation                      VARCHAR2(20),
    createtime                      DATE,
    record_createdate               DATE,
    record_personid                 VARCHAR2(12),
    record_person                   VARCHAR2(36),
    orgid_custodial                 VARCHAR2(50),
    org_custodial                   VARCHAR2(100),
    doctor_directorid               VARCHAR2(12),
    doctor_director                 VARCHAR2(36),
    doctor_deputy_directorid        VARCHAR2(12),
    doctor_deputy_director          VARCHAR2(36),
    inpatient_doctorid              VARCHAR2(12),
    inpatient_doctor                VARCHAR2(36),
    charge_doctor_id                VARCHAR2(12),
    charge_doctor                   VARCHAR2(36),
    respons_nurse_code              VARCHAR2(10),
    respons_nurse_name              VARCHAR2(30),
    advanced_studies_docid          VARCHAR2(12),
    advanced_studies_doc            VARCHAR2(36),
    practice_doctorid               VARCHAR2(12),
    practice_doctor                 VARCHAR2(36),
    coding_doctorid                 VARCHAR2(12),
    coding_doctor                   VARCHAR2(36),
    relation_code                   VARCHAR2(2),
    relationship                    VARCHAR2(10),
    relation_person                 VARCHAR2(32),
    relation_person_tel             VARCHAR2(16),
    relation_address                VARCHAR2(100),
    relation_road                   VARCHAR2(100),
    relation_street                 VARCHAR2(50),
    relation_area                   VARCHAR2(50),
    relation_city                   VARCHAR2(50),
    relation_province               VARCHAR2(50),
    relation_zip                    VARCHAR2(10),
    in_hospital_type_code           VARCHAR2(2),
    in_hospital_type                VARCHAR2(10),
    in_hospital_date                DATE,
    out_hospital_date               DATE,
    bed_no                          VARCHAR2(4),
    room_no                         VARCHAR2(16),
    department_code                 VARCHAR2(12),
    department                      VARCHAR2(32),
    bdby_in_weight                  NUMBER(3),
    bdby_in_weight_unit             VARCHAR2(1),
    bdby_born_weight                NUMBER(3),
    bdby_born_weight_unit           VARCHAR2(1),
    diagnosis                       VARCHAR2(500),
    diagnosis_code                  VARCHAR2(10),
    tcm_disease                     VARCHAR2(100),
    tcm_diseasecode                 VARCHAR2(10),
    tcm_syndromename                VARCHAR2(100),
    tcm_syndromecode                VARCHAR2(10),
    pathology_code                  VARCHAR2(100),
    pathology_name                  VARCHAR2(10),
    treatment_category              VARCHAR2(2),
    treatment_category_code         VARCHAR2(10),
    clinical_pathway_code           VARCHAR2(2),
    clinical_pathway_name           VARCHAR2(8),
    disease_state_code              VARCHAR2(2),
    disease_state                   VARCHAR2(16),
    damage_pois_reason_code         VARCHAR2(10),
    damage_pois_reason_name         VARCHAR2(10),
    brain_injury_coma_d             NUMBER(3),
    brain_injury_coma_h             NUMBER(3),
    brain_injury_coma_min           NUMBER(3),
    brain_injury_coma_in_d          NUMBER(3),
    brain_injury_coma_in_h          NUMBER(3),
    brain_injury_coma_in_min        NUMBER,
    trans_dept_reason               VARCHAR2(10),
    trans_dept_time                 DATE,
    trans_dept_code                 VARCHAR2(10),
    trans_dept_name                 VARCHAR2(50),
    tcm_dischdiag_dis               VARCHAR2(100),
    tcm_dischdiag_disid             VARCHAR2(10),
    tcm_dischdiag_admidissta        VARCHAR2(500),
    tcm_dischdiag_admidisstaid      VARCHAR2(4),
    tcm_dischdiag_synd              VARCHAR2(100),
    tcm_dischdiag_syndid            VARCHAR2(10),
    tcm_dischdiag_admisyndsta       VARCHAR2(16),
    tcm_dischdiag_admisyndstaid     VARCHAR2(10),
    wm_dischdiag_main_dis           VARCHAR2(100),
    wm_dischdiag_main_disid         VARCHAR2(10),
    wm_dischdiag_main_admidissta    VARCHAR2(16),
    wm_dischdiag_main_admidisstaid  VARCHAR2(10),
    wm_dischdiag_other_dis          VARCHAR2(100),
    wm_dischdiag_other_disid        VARCHAR2(10),
    wm_dischdiag_other_admidissta   VARCHAR2(16),
    wm_dischdiag_other_admidisstaid VARCHAR2(10),
    outhospital_way_code            VARCHAR2(2),
    outhospital_way                 VARCHAR2(16),
    accept_hospital                 VARCHAR2(100),
    is_allergies                    NUMBER(3),
    allergy_drug                    VARCHAR2(50),
    abo_blood_type                  VARCHAR2(2),
    abo_blood_name                  VARCHAR2(10),
    rh_blood_type                   VARCHAR2(2),
    rh_blood_name                   VARCHAR2(10),
    operation_code                  VARCHAR2(10),
    operation_name                  VARCHAR2(100),
    operation_begindate             DATE,
    operation_doctorid              VARCHAR2(12),
    operation_doctor                VARCHAR2(36),
    first_assistantid               VARCHAR2(12),
    first_assistant_name            VARCHAR2(36),
    secend_assistantid              VARCHAR2(12),
    secend_assistant_name           VARCHAR2(36),
    operation_level                 VARCHAR2(10),
    operation_level_code            VARCHAR2(2),
    incision_level_code             VARCHAR2(2),
    incision_level                  VARCHAR2(8),
    incision_heal_level_code        VARCHAR2(2),
    incision_heal_level             VARCHAR2(8),
    anesthesia_type_code            VARCHAR2(2),
    anesthesia_type                 VARCHAR2(10),
    anesthesia_code                 VARCHAR2(10),
    anesthesia_name                 VARCHAR2(32),
    in_visit_times                  NUMBER(3),
    death_autopsy_flag              NUMBER(3),
    medical_record_qua_code         VARCHAR2(2),
    medical_record_qua              VARCHAR2(5),
    quality_ctrl_doc_code           VARCHAR2(10),
    quality_ctrl_doc                VARCHAR2(32),
    quality_ctrl_nur_code           VARCHAR2(10),
    quality_ctrl_nur                VARCHAR2(32),
    in_visit_days                   NUMBER(3),
    out_sickroom_no                 VARCHAR2(6),
    out_sickroom_name               VARCHAR2(20),
    out_dept_no                     VARCHAR2(6),
    out_dept_name                   VARCHAR2(20),
    out_in_falg                     NUMBER(3),
    out_in_reason                   VARCHAR2(50),
    payment_ways                    VARCHAR2(16),
    payment_ways_code               VARCHAR2(2),
    zy_fee                          NUMBER(12,4),
    personal_fee                    NUMBER(12,4),
    common_medic_fee                NUMBER(12,4),
    common_medic_sdat_fee           NUMBER(12,4),
    common_medic_sdat_gcfee         NUMBER(12,4),
    common_treat_fee                NUMBER(12,4),
    common_nur_fee                  NUMBER(12,4),
    common_other_fee                NUMBER(12,4),
    pathology_dia_fee               NUMBER(12,4),
    lis_dia_fee                     NUMBER(12,4),
    iconography_fee                 NUMBER(12,4),
    clinic_dia_fee                  NUMBER(12,4),
    nop_treat_fee                   NUMBER(12,4),
    nop_physcical_treat_fee         NUMBER(12,4),
    op_treat_fee                    NUMBER(12,4),
    op_treat_anesthesia_fee         NUMBER(12,4),
    op_treat_operat_fee             NUMBER(12,4),
    recure_fee                      NUMBER(12,4),
    used_tcm_preparation            NUMBER(3),
    used_tcm_datt                   NUMBER(3),
    is_dialectical_protection       NUMBER(3),
    tcm_diag_fee                    NUMBER(12,4),
    tcm_treat_fee                   NUMBER(12,4),
    tcm_diag_fee_external           NUMBER(12,4),
    tcm_diag_fee_bone               NUMBER(12,4),
    tcm_diag_fee_acupuncture        NUMBER(12,4),
    tcm_diag_fee_massage            NUMBER(12,4),
    tcm_diag_fee_anorectal          NUMBER(12,4),
    tcm_diag_fee_special            NUMBER(12,4),
    tcm_treat_fee_other             NUMBER(12,4),
    tcm_other_fee                   NUMBER(12,4),
    tcm_treat_fee_diet              NUMBER(12,4),
    drug_fee                        NUMBER(12,4),
    drug_antibact_fee               NUMBER(12,4),
    ctm_drug_fee                    NUMBER(12,4),
    herb_medicine_fee               NUMBER(12,4),
    blood_fee                       NUMBER(12,4),
    albumin_fee                     NUMBER(12,4),
    globulin_fee                    NUMBER(12,4),
    cruor_fee                       NUMBER(12,4),
    cytokine_fee                    NUMBER(12,4),
    used_tcm_date                   NUMBER(3),
    materials_check_fee             NUMBER(12,4),
    materials_treat_fee             NUMBER(12,4),
    materials_opreat_fee            NUMBER(12,4),
    others_fee                      NUMBER(12,4),
    last_update_time                DATE
);




















comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.group_code
  is '集团编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.organization_code
  is '组织编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.domain_id
  is '系统域标识';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.visittimes
  is '就诊次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.patient_id
  is '个人标识号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.patient_name
  is '患者姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.outpatient_no
  is '门(急)诊号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.inpatient_no
  is '住院号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.id_card
  is '患者身份证号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.age
  is '年龄';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.birthtime
  is '出生日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.gendercode
  is '性别代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.gendername
  is '性别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.marrystatuscode
  is '婚姻状况代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.marrystatus
  is '婚姻状况';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.nation_code
  is '民族代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.nation
  is '民族';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.telephone
  is '患者联系电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.medical_record_no
  is '病案号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.health_card
  is '健康卡号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.address
  is '患者详细住址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.born_addr_area
  is '地址-县（区）---出生地';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.born_addr_city
  is '地址-市（地区）---出生地';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.born_addr_province
  is '地址-省（自治区、直辖市）---出生地';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.born_addr_zip
  is '邮政编码---出生地';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.country_code
  is '国家代码，世界各国和地区名称代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.country
  is '国家名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_address
  is '患者详细住址，工作单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.work_addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.employerorganization
  is '工作单位名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.workphone
  is '工作单位电话';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_address
  is '患者详细住址，户口地址';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_addr_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_addr_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_addr_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_addr_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_addr_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.house_addr_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.native_addr_city
  is '籍贯-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.native_addr_province
  is '籍贯-省(自治区、直辖市)';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.occupationcode
  is '职业代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.occupation
  is '职业';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.createtime
  is '文档生成时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.record_createdate
  is '文档创建日期';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.record_personid
  is '文档创建医生编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.record_person
  is '文档创建医生';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.orgid_custodial
  is '文档保管机构编号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.org_custodial
  is '文档保管机构名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.doctor_director
  is '主任医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.doctor_deputy_directorid
  is '主任(副)医师编号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.doctor_deputy_director
  is '主任(副)医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.respons_nurse_code
  is '责任护士编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.respons_nurse_name
  is '责任护士名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.advanced_studies_docid
  is '进修医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.advanced_studies_doc
  is '进修医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.practice_doctorid
  is '实习医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.practice_doctor
  is '实习医师名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.coding_doctorid
  is '编码医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.coding_doctor
  is '编码医师';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_code
  is '联系人关系代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relationship
  is '联系人关系';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_person
  is '联系人姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_person_tel
  is '联系人电话号码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_address
  is '详细住址,联系人';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_road
  is '地址-村（街、路、弄等）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_street
  is '地址-乡（镇、街道办事处）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_area
  is '地址-县（区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_city
  is '地址-市（地区）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_province
  is '地址-省（自治区、直辖市）';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.relation_zip
  is '邮政编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.in_hospital_type_code
  is '入院途径代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.in_hospital_type
  is '入院途径';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_hospital_date
  is '出院日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.bed_no
  is '病床号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.room_no
  is '病房号';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.department_code
  is '科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.department
  is '科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.bdby_in_weight
  is '新生儿入院体重';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.bdby_in_weight_unit
  is '新生儿入院体重单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.bdby_born_weight
  is '新生儿出生体重';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.bdby_born_weight_unit
  is '新生儿出生体重单位';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.diagnosis
  is '西医诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.diagnosis_code
  is '西医诊断代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_disease
  is '中医诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diseasecode
  is '中医诊断代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_syndromename
  is '中医证候名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_syndromecode
  is '中医证候代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.pathology_code
  is '病理诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.pathology_name
  is '病理诊断编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.treatment_category
  is '治疗类别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.treatment_category_code
  is '治疗类别代码表';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.clinical_pathway_code
  is '实施临床路径标志代码表';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.clinical_pathway_name
  is '实施临床路径标志名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.disease_state_code
  is '住院者疾病状态代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.disease_state
  is '住院者疾病状态';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.damage_pois_reason_code
  is '损伤中毒的外部原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.damage_pois_reason_name
  is '损伤中毒的外部原因-疾病编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.brain_injury_coma_d
  is '颅脑损伤患者入院前昏迷时间-d';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.brain_injury_coma_h
  is '颅脑损伤患者入院前昏迷时间-h';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.brain_injury_coma_min
  is '颅脑损伤患者入院前昏迷时间-min';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.brain_injury_coma_in_d
  is '颅脑损伤患者入院后昏迷时间-d';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.brain_injury_coma_in_h
  is '颅脑损伤患者入院后昏迷时间-h';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.brain_injury_coma_in_min
  is '颅脑损伤患者入院后昏迷时间-min';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.trans_dept_reason
  is '转科原因';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.trans_dept_time
  is '转科时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.trans_dept_code
  is '转科科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.trans_dept_name
  is '转科科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_dis
  is '出院中医诊断-主病名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_disid
  is '出院中医诊断-主病编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_admidissta
  is '出院中医诊断-主病-入院病情';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_admidisstaid
  is '出院中医诊断-主病-入院病情代码,入院病情代码表';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_synd
  is '出院中医诊断-主证名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_syndid
  is '出院中医诊断-主证代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_admisyndsta
  is '出院中医诊断-主证-入院病情';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_dischdiag_admisyndstaid
  is '出院中医诊断-主证-入院病情代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_main_dis
  is '出院西医诊断-主要诊断-疾病名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_main_disid
  is '出院西医诊断-主要诊断-疾病编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_main_admidissta
  is '出院西医诊断-主要诊断-入院病情';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_main_admidisstaid
  is '出院西医诊断-主要诊断-入院病情代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_other_dis
  is '出院西医诊断-其他诊断名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_other_disid
  is '出院西医诊断-其他诊断疾病编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_other_admidissta
  is '出院西医诊断-其他诊断-入院病情';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.wm_dischdiag_other_admidisstaid
  is '出院西医诊断-其他诊断-入院病情代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.outhospital_way_code
  is '离院方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.outhospital_way
  is '离院方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.accept_hospital
  is '拟接受医疗机构名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.is_allergies
  is '过敏史标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.allergy_drug
  is '过敏药物名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.abo_blood_type
  is 'ABO血型代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.abo_blood_name
  is 'ABO血型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.rh_blood_type
  is 'Rh血型代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.rh_blood_name
  is 'Rh血型';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_code
  is '手术代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_name
  is '手术名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_begindate
  is '手术日期时间';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_doctor
  is '手术医生名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.first_assistantid
  is '第一助手编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.first_assistant_name
  is '第一助手姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.secend_assistantid
  is '第二助手编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.secend_assistant_name
  is '第二助手姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_level
  is '手术级别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.operation_level_code
  is '手术级别代码,';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.incision_level_code
  is '手术切口类别代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.incision_level
  is '手术切口类别';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.incision_heal_level_code
  is '手术切口愈合等级代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.incision_heal_level
  is '手术切口愈合等级';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.anesthesia_type_code
  is '麻醉方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.anesthesia_type
  is '麻醉方式';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.anesthesia_code
  is '麻醉医师编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.anesthesia_name
  is '麻醉医师姓名';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.in_visit_times
  is '住院次数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.death_autopsy_flag
  is '死亡患者尸检标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.medical_record_qua_code
  is '病案质量代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.medical_record_qua
  is '病案质量';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.quality_ctrl_doc_code
  is '质控医生编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.quality_ctrl_doc
  is '质控医生';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.quality_ctrl_nur_code
  is '质控护士编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.quality_ctrl_nur
  is '质控护士';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.in_visit_days
  is '实际住院天数';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_sickroom_no
  is '患者出院病房编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_sickroom_name
  is '患者出院病房名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_dept_no
  is '患者出院科室编码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_dept_name
  is '患者出院科室名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_in_falg
  is '出院31天内再住院标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.out_in_reason
  is '出院31天内再住院目的';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.payment_ways
  is '医疗付款方式名称';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.payment_ways_code
  is '医疗付款方式代码';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.zy_fee
  is '住院总费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.personal_fee
  is '住院总费用-自付金额';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.common_medic_fee
  is '综合医疗服务费-一般医疗服务费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.common_medic_sdat_fee
  is '综合医疗服务费-一般医疗服务费-中医辨证论治费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.common_medic_sdat_gcfee
  is '综合医疗服务费-一般医疗服务费-中医辨证论治会诊费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.common_treat_fee
  is '综合医疗服务费-一般治疗操作费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.common_nur_fee
  is '综合医疗服务费-护理费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.common_other_fee
  is '综合医疗服务费-其他费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.pathology_dia_fee
  is '诊断-病理诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.lis_dia_fee
  is '诊断-实验室诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.iconography_fee
  is '诊断-影像学诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.clinic_dia_fee
  is '诊断-临床诊断项目费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.nop_treat_fee
  is '非手术治疗项目费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.nop_physcical_treat_fee
  is '非手术治疗项目费-临床物理治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.op_treat_fee
  is '手术治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.op_treat_anesthesia_fee
  is '手术治疗费-麻醉费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.op_treat_operat_fee
  is '手术治疗费-手术费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.recure_fee
  is '康复费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.used_tcm_preparation
  is '使用医疗机构中药制剂';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.used_tcm_datt
  is '使用中医诊疗技术标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.is_dialectical_protection
  is '辩证施护标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee
  is '中医诊断费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_treat_fee
  is '中医治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee_external
  is '中医类-中医治疗费-中医外治';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee_bone
  is '中医类-中医治疗费-中医骨伤';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee_acupuncture
  is '中医类-中医治疗费-针刺与灸法';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee_massage
  is '中医类-中医治疗费-中医推拿治疗';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee_anorectal
  is '中医类-中医治疗费-中医肛肠治疗';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_diag_fee_special
  is '中医类-中医治疗费-中医特殊治疗';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_treat_fee_other
  is '中医其他治疗费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_other_fee
  is '中医类-中医其他费-中药特殊调配加工';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.tcm_treat_fee_diet
  is '中医类-中医治疗费-辩证施膳';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.drug_fee
  is '西药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.drug_antibact_fee
  is '西药费-抗菌药物费用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.ctm_drug_fee
  is '中成药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.herb_medicine_fee
  is '中草药费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.blood_fee
  is '血费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.albumin_fee
  is '白蛋白类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.globulin_fee
  is '球蛋白类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.cruor_fee
  is '凝血因子类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.cytokine_fee
  is '细胞因子类制品费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.used_tcm_date
  is '使用中医诊疗设备标志';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.materials_check_fee
  is '一次性医用材料费-检查用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.materials_treat_fee
  is '一次性医用材料费-治疗用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.materials_opreat_fee
  is '一次性医用材料费-手术用';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.others_fee
  is '其他费';
comment on column CDR_EMR_FIRSTPAGE_MEDICALRECORD_TCM.last_update_time
  is '最后修改时间';






create table CDR_EMR_FIRSTRECORD
(
    group_code                     VARCHAR2(20),
    organization_code              VARCHAR2(20),
    domain_id                      VARCHAR2(2),
    unicode                        VARCHAR2(50) not null,
    patient_id                     VARCHAR2(36),
    visit_no                       VARCHAR2(36),
    visittimes                     NUMBER(3),
    inpatient_no                   VARCHAR2(36),
    patient_name                   VARCHAR2(20),
    gendercode                     NUMBER(1),
    age                            VARCHAR2(20),
    bed_no                         VARCHAR2(20),
    room_no                        VARCHAR2(20),
    dept_no                        VARCHAR2(20),
    dept_name                      VARCHAR2(50),
    ward_no                        VARCHAR2(20),
    ward_name                      VARCHAR2(50),
    record_createdate              DATE,
    record_personid                VARCHAR2(20),
    record_person                  VARCHAR2(50),
    superior_physician_signdate    DATE,
    superior_physician_code        VARCHAR2(12),
    superior_physician             VARCHAR2(36),
    inpatient_doctor_signdate      DATE,
    inpatient_doctorid             VARCHAR2(12),
    inpatient_doctor               VARCHAR2(36),
    illness                        VARCHAR2(2000),
    patient_feature                VARCHAR2(4000),
    diagnosis_basis                VARCHAR2(4000),
    prediag_wm                     VARCHAR2(500),
    prediag_tcm_code               VARCHAR2(10),
    prediag_tcm                    VARCHAR2(300),
    prediag_tcm_syndromename       VARCHAR2(300),
    diffdiag_wm                    VARCHAR2(300),
    diffdiag_tcm_code              VARCHAR2(10),
    diffdiag_tcm                   VARCHAR2(100),
    diffdiag_tcm_syndromename      VARCHAR2(100),
    treatment_plan                 VARCHAR2(4000),
    therapeutic_principleandmethod VARCHAR2(500),
    last_update_time               DATE
)
 ;
comment on column CDR_EMR_FIRSTRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_FIRSTRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_FIRSTRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_FIRSTRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_FIRSTRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_FIRSTRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_FIRSTRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_FIRSTRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_FIRSTRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_FIRSTRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_FIRSTRECORD.age
  is '年龄';
comment on column CDR_EMR_FIRSTRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_FIRSTRECORD.room_no
  is '病房号';
comment on column CDR_EMR_FIRSTRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_FIRSTRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_FIRSTRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_FIRSTRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_FIRSTRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_FIRSTRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_FIRSTRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_FIRSTRECORD.superior_physician_signdate
  is '上级医生签字日期';
comment on column CDR_EMR_FIRSTRECORD.superior_physician_code
  is '上级医生编码';
comment on column CDR_EMR_FIRSTRECORD.superior_physician
  is '上级医生姓名';
comment on column CDR_EMR_FIRSTRECORD.inpatient_doctor_signdate
  is '住院医师签字日期';
comment on column CDR_EMR_FIRSTRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_FIRSTRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_FIRSTRECORD.illness
  is '主诉';
comment on column CDR_EMR_FIRSTRECORD.patient_feature
  is '病例特点';
comment on column CDR_EMR_FIRSTRECORD.diagnosis_basis
  is '诊断依据';
comment on column CDR_EMR_FIRSTRECORD.prediag_wm
  is '初步诊断-西医诊断名称';
comment on column CDR_EMR_FIRSTRECORD.prediag_tcm_code
  is '初步诊断-中医病名代码';
comment on column CDR_EMR_FIRSTRECORD.prediag_tcm
  is '初步诊断-中医病名';
comment on column CDR_EMR_FIRSTRECORD.prediag_tcm_syndromename
  is '初步诊断-中医证候名称';
comment on column CDR_EMR_FIRSTRECORD.diffdiag_wm
  is '鉴别诊断-西医诊断名称';
comment on column CDR_EMR_FIRSTRECORD.diffdiag_tcm_code
  is '鉴别诊断-中医病名代码';
comment on column CDR_EMR_FIRSTRECORD.diffdiag_tcm
  is '鉴别诊断-中医病名';
comment on column CDR_EMR_FIRSTRECORD.diffdiag_tcm_syndromename
  is '鉴别诊断-中医证候名称';
comment on column CDR_EMR_FIRSTRECORD.treatment_plan
  is '诊疗计划';
comment on column CDR_EMR_FIRSTRECORD.therapeutic_principleandmethod
  is '治则治法';
comment on column CDR_EMR_FIRSTRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_FIRSTRECORD_AFTEROPREATION
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(100) not null,
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visittimes        INTEGER,
    inpatient_no      VARCHAR2(36),
    patient_name      VARCHAR2(20),
    gendercode        INTEGER,
    age               VARCHAR2(20),
    bed_no            VARCHAR2(20),
    room_no           VARCHAR2(20),
    dept_no           VARCHAR2(20),
    dept_name         VARCHAR2(50),
    ward_no           VARCHAR2(20),
    ward_name         VARCHAR2(50),
    record_createdate DATE,
    record_personid   VARCHAR2(20),
    record_person     VARCHAR2(50),
    assigned_time     DATE,
    assigned_doc_id   VARCHAR2(10),
    assigned_doc_name VARCHAR2(20),
    operation_code    VARCHAR2(200),
    operation_process VARCHAR2(3000),
    notices           VARCHAR2(300),
    last_update_time  DATE
)
 ;
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.group_code
  is '集团编码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.organization_code
  is '组织编码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.domain_id
  is '系统域标识';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.patient_id
  is '个人标识号';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.visittimes
  is '就诊次数';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.inpatient_no
  is '住院号';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.patient_name
  is '患者姓名';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.gendercode
  is '性别代码代码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.age
  is '年龄';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.bed_no
  is '床位号';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.room_no
  is '病房号';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.record_personid
  is '文档作者编码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.record_person
  is '文档作者';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.assigned_time
  is '审核日期时间，数字格式';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.assigned_doc_id
  is '审核医生编码';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.assigned_doc_name
  is '审核医生姓名';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.operation_code
  is '手术代码，手术(操作)代码表(ICD-9-CM)';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.operation_process
  is '内容描述';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.notices
  is '注意事项';
comment on column CDR_EMR_FIRSTRECORD_AFTEROPREATION.last_update_time
  is '最后修改时间';






create table CDR_EMR_GENERAL_NURSERECORD
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visittimes              INTEGER,
    inpatient_no            VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              INTEGER,
    age                     VARCHAR2(20),
    bed_no                  VARCHAR2(20),
    room_no                 VARCHAR2(20),
    dept_no                 VARCHAR2(20),
    dept_name               VARCHAR2(50),
    ward_no                 VARCHAR2(20),
    ward_name               VARCHAR2(50),
    record_createdate       DATE,
    record_personid         VARCHAR2(20),
    record_person           VARCHAR2(50),
    author_sign_date        DATE,
    author_nur_code         VARCHAR2(20),
    author_nur_name         VARCHAR2(50),
    signed_time             DATE,
    signed_nur_code         VARCHAR2(20),
    signed_nur_name         VARCHAR2(50),
    weight                  NUMBER,
    temperature             NUMBER,
    pulse                   INTEGER,
    rate_respiratory        INTEGER,
    pressure_systolic       INTEGER,
    pressure_diastolic      INTEGER,
    blood_oxygen_saturation NUMBER,
    isdorsalis_pedis_pulse  NUMBER,
    diet_satutrtion_code    NUMBER,
    nurse_level_code        NUMBER,
    nurse_level             VARCHAR2(50),
    nurse_type_code         NUMBER,
    nurse_type              VARCHAR2(50),
    catheter_nurse          VARCHAR2(200),
    trachea_nurse_code      NUMBER,
    posture_nurse           VARCHAR2(200),
    skin_nurse              VARCHAR2(200),
    nutrition_nurse         VARCHAR2(200),
    psychologic_nurse_code  NUMBER,
    safety_nurse_code       NUMBER,
    nurse_observed          VARCHAR2(1500),
    nurse_observed_item     VARCHAR2(200),
    nurse_observed_resulit  VARCHAR2(200),
    nurse_operate_name      VARCHAR2(200),
    nurse_operate_item      VARCHAR2(200),
    nurse_operate_result    VARCHAR2(200),
    issend_sug_safety       NUMBER,
    iscollect_sug_safety    NUMBER,
    issend_sug_risk         NUMBER,
    iscollect_sug_risk      NUMBER,
    isnurse_isolation       NUMBER,
    nurse_isolation_code    NUMBER,
    last_update_time        DATE
);




















comment on column CDR_EMR_GENERAL_NURSERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_GENERAL_NURSERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_GENERAL_NURSERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_GENERAL_NURSERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_GENERAL_NURSERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_GENERAL_NURSERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_GENERAL_NURSERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_GENERAL_NURSERECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_GENERAL_NURSERECORD.age
  is '年龄';
comment on column CDR_EMR_GENERAL_NURSERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_GENERAL_NURSERECORD.room_no
  is '病房号';
comment on column CDR_EMR_GENERAL_NURSERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_GENERAL_NURSERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_GENERAL_NURSERECORD.author_sign_date
  is '护理记录书写日期';
comment on column CDR_EMR_GENERAL_NURSERECORD.author_nur_code
  is '护理记录书写护士编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.author_nur_name
  is '护理记录书写护士名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.signed_time
  is '护理记录签名时间';
comment on column CDR_EMR_GENERAL_NURSERECORD.signed_nur_code
  is '护理记录签名护士编码';
comment on column CDR_EMR_GENERAL_NURSERECORD.signed_nur_name
  is '护理记录签名护士名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.weight
  is '体重';
comment on column CDR_EMR_GENERAL_NURSERECORD.temperature
  is '体温';
comment on column CDR_EMR_GENERAL_NURSERECORD.pulse
  is '脉率   ';
comment on column CDR_EMR_GENERAL_NURSERECORD.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_GENERAL_NURSERECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_GENERAL_NURSERECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_GENERAL_NURSERECORD.blood_oxygen_saturation
  is '血氧饱和度';
comment on column CDR_EMR_GENERAL_NURSERECORD.isdorsalis_pedis_pulse
  is '足背动脉搏动标志 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.diet_satutrtion_code
  is '饮食情况代码， ';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_level_code
  is '护理等级代码， ';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_level
  is '护理等级 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_type_code
  is '护理类型代码， ';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_type
  is '护理类型';
comment on column CDR_EMR_GENERAL_NURSERECORD.catheter_nurse
  is '导管护理描述';
comment on column CDR_EMR_GENERAL_NURSERECORD.trachea_nurse_code
  is '气管护理代码，气管护理代码表';
comment on column CDR_EMR_GENERAL_NURSERECORD.posture_nurse
  is '体位护理';
comment on column CDR_EMR_GENERAL_NURSERECORD.skin_nurse
  is '皮肤护理';
comment on column CDR_EMR_GENERAL_NURSERECORD.nutrition_nurse
  is '营养护理';
comment on column CDR_EMR_GENERAL_NURSERECORD.psychologic_nurse_code
  is '心理护理代码，心理护理代码表';
comment on column CDR_EMR_GENERAL_NURSERECORD.safety_nurse_code
  is '安全护理代码， ';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_observed
  is '简要病情';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_observed_item
  is '护理观察项目名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_observed_resulit
  is '护理观察结果';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_operate_name
  is '护理操作名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_operate_item
  is '护理操作项目类目名称';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_operate_result
  is '护理操作结果';
comment on column CDR_EMR_GENERAL_NURSERECORD.issend_sug_safety
  is '发出手术安全核对表标志 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.iscollect_sug_safety
  is '收回手术安全核对表标志 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.issend_sug_risk
  is '发出手术风险评估表标志 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.iscollect_sug_risk
  is '收回手术风险评估表标志 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.isnurse_isolation
  is '护理隔离标志 ';
comment on column CDR_EMR_GENERAL_NURSERECORD.nurse_isolation_code
  is '护理隔离种类代码';
comment on column CDR_EMR_GENERAL_NURSERECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_GENERAL_SURGERYRECORD
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    unicode                  VARCHAR2(50) not null,
    patient_id               VARCHAR2(36),
    visit_no                 VARCHAR2(36),
    visittimes               INTEGER,
    inpatient_no             VARCHAR2(36),
    patient_name             VARCHAR2(20),
    gendercode               INTEGER,
    age                      VARCHAR2(20),
    bed_no                   VARCHAR2(20),
    room_no                  VARCHAR2(20),
    dept_no                  VARCHAR2(20),
    dept_name                VARCHAR2(50),
    ward_no                  VARCHAR2(20),
    ward_name                VARCHAR2(50),
    record_createdate        DATE,
    record_personid          VARCHAR2(20),
    record_person            VARCHAR2(50),
    is_invasive              NUMBER,
    operation_begindate      DATE,
    operation_enddate        DATE,
    operation_doctorid       VARCHAR2(20),
    operation_doctor         VARCHAR2(50),
    first_assistant_name     VARCHAR2(50),
    secend_assistant_name    VARCHAR2(50),
    nurse_instrument_name    VARCHAR2(50),
    nurse_patrol_name        VARCHAR2(50),
    operation_level          VARCHAR2(20),
    operation_classification VARCHAR2(20),
    operation_wound_grade    VARCHAR2(20),
    bleeding_volume          INTEGER,
    measure_unit             VARCHAR2(20),
    blood_transfusion_volume INTEGER,
    blood_transfused         VARCHAR2(500),
    anesthesia_type          VARCHAR2(50),
    anesthesia_type_code     VARCHAR2(10),
    anesthesia_doctorid      VARCHAR2(20),
    anesthesia_doctor_name   VARCHAR2(50),
    anesthesia_begintime     DATE,
    anesthesia_endtime       DATE,
    operation_site_id        VARCHAR2(10),
    operation_site           VARCHAR2(20),
    preoperative_diagnosis   VARCHAR2(500),
    postoperative_diagnosis  VARCHAR2(1000),
    operation_name           VARCHAR2(200),
    operation_process        VARCHAR2(2000),
    postoperative_treatment  VARCHAR2(500),
    operation_material       VARCHAR2(200),
    operation_site_code      VARCHAR2(10),
    operation_site_name      VARCHAR2(50),
    disinfection_desc        VARCHAR2(200),
    incision_desc            VARCHAR2(200),
    stime                    VARCHAR2(200),
    last_update_time         DATE,
    applicationno            VARCHAR2(50),
    operation_code           VARCHAR2(20),
    operation_type           VARCHAR2(20)
)
 ;
comment on column CDR_EMR_GENERAL_SURGERYRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.age
  is '年龄';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.room_no
  is '病房号';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.is_invasive
  is '手术史标志  ';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_begindate
  is '手术开始日期时间';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_enddate
  is '手术结束日期时间';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_doctor
  is '手术医生名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.first_assistant_name
  is '第一助手姓名';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.secend_assistant_name
  is '第二助手姓名';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.nurse_instrument_name
  is '器械护士名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.nurse_patrol_name
  is '巡台护士名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_level
  is '手术级别';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_classification
  is '切口分类';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_wound_grade
  is '手术切口等级';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.bleeding_volume
  is '出血量';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.measure_unit
  is '血量计量单位';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.blood_transfusion_volume
  is '输血量';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.blood_transfused
  is '输血反应';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.anesthesia_type
  is '麻醉方式';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.anesthesia_type_code
  is '麻醉方式编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.anesthesia_doctorid
  is '麻醉医师编码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.anesthesia_doctor_name
  is '麻醉医师姓名';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.anesthesia_begintime
  is '麻醉开始时间';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.anesthesia_endtime
  is '麻醉结束时间';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_site_id
  is '手术目标部位代码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_site
  is '手术目标部位名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.preoperative_diagnosis
  is '术前诊断';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.postoperative_diagnosis
  is '术后诊断';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_name
  is '手术名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_process
  is '手术过程描述';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.postoperative_treatment
  is '术后处置';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_material
  is '介入物名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_site_code
  is '手术体位代码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_site_name
  is '手术体位名称';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.disinfection_desc
  is '皮肤消毒描述';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.incision_desc
  is '手术切口描述';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.stime
  is '手术持续时间(分钟) ';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.applicationno
  is '电子申请单号';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_code
  is '手术代码';
comment on column CDR_EMR_GENERAL_SURGERYRECORD.operation_type
  is '手术类型：诊断操作、介入治疗等';






create table CDR_EMR_GENERAL_SURGERYRECORD_COPY
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    unicode                  VARCHAR2(50) not null,
    patient_id               VARCHAR2(36),
    visit_no                 VARCHAR2(36),
    visittimes               INTEGER,
    inpatient_no             VARCHAR2(36),
    patient_name             VARCHAR2(20),
    gendercode               INTEGER,
    age                      VARCHAR2(20),
    bed_no                   VARCHAR2(20),
    room_no                  VARCHAR2(20),
    dept_no                  VARCHAR2(20),
    dept_name                VARCHAR2(50),
    ward_no                  VARCHAR2(20),
    ward_name                VARCHAR2(50),
    record_createdate        DATE,
    record_personid          VARCHAR2(20),
    record_person            VARCHAR2(50),
    is_invasive              NUMBER,
    operation_begindate      DATE,
    operation_enddate        DATE,
    operation_doctorid       VARCHAR2(20),
    operation_doctor         VARCHAR2(50),
    first_assistant_name     VARCHAR2(50),
    secend_assistant_name    VARCHAR2(50),
    nurse_instrument_name    VARCHAR2(50),
    nurse_patrol_name        VARCHAR2(50),
    operation_level          VARCHAR2(20),
    operation_classification VARCHAR2(20),
    operation_wound_grade    VARCHAR2(20),
    bleeding_volume          INTEGER,
    measure_unit             VARCHAR2(20),
    blood_transfusion_volume INTEGER,
    blood_transfused         VARCHAR2(1000),
    anesthesia_type          VARCHAR2(50),
    anesthesia_type_code     VARCHAR2(10),
    anesthesia_doctorid      VARCHAR2(20),
    anesthesia_doctor_name   VARCHAR2(50),
    anesthesia_begintime     DATE,
    anesthesia_endtime       DATE,
    operation_site_id        VARCHAR2(10),
    operation_site           VARCHAR2(20),
    preoperative_diagnosis   VARCHAR2(1000),
    postoperative_diagnosis  VARCHAR2(1000),
    operation_name           VARCHAR2(200),
    operation_process        VARCHAR2(2000),
    postoperative_treatment  VARCHAR2(1000),
    operation_material       VARCHAR2(500),
    operation_site_code      VARCHAR2(10),
    operation_site_name      VARCHAR2(50),
    disinfection_desc        VARCHAR2(500),
    incision_desc            VARCHAR2(500),
    stime                    VARCHAR2(500),
    last_update_time         DATE default sysdate not null,
    applicationno            VARCHAR2(50),
    operation_code           VARCHAR2(20),
    operation_type           VARCHAR2(20)
)
 ;





create table CDR_EMR_INANDOUT_RECORD
(
    group_code                VARCHAR2(20),
    organization_code         VARCHAR2(20),
    domain_id                 VARCHAR2(2),
    unicode                   VARCHAR2(30) not null,
    patient_id                VARCHAR2(36),
    visit_no                  VARCHAR2(36),
    visittimes                INTEGER,
    inpatient_no              VARCHAR2(36),
    patient_name              VARCHAR2(20),
    gendercode                INTEGER,
    age                       VARCHAR2(20),
    bed_no                    VARCHAR2(20),
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20),
    dept_name                 VARCHAR2(50),
    ward_no                   VARCHAR2(20),
    ward_name                 VARCHAR2(50),
    record_createdate         DATE,
    record_personid           VARCHAR2(20),
    record_person             VARCHAR2(50),
    nurse_level_code          NUMBER,
    nurse_type_code           NUMBER,
    record_datetime           DATE,
    type                      VARCHAR2(20),
    project_name              VARCHAR2(50),
    medication_dosage         NUMBER,
    medication_dosage_unit    VARCHAR2(20),
    medication_quantity       NUMBER,
    totle_dose                NUMBER,
    record_nur_code           VARCHAR2(20),
    record_nur_name           VARCHAR2(50),
    drug_method               NUMBER(20),
    drug_method_name          VARCHAR2(500),
    medication_frequency      NUMBER,
    medication_frequency_unit VARCHAR2(50),
    item_color                VARCHAR2(20),
    item_character            VARCHAR2(50),
    item_comment              VARCHAR2(200),
    is_vomit                  NUMBER,
    is_dysuria                NUMBER,
    last_update_time          DATE
)
 ;
comment on column CDR_EMR_INANDOUT_RECORD.group_code
  is '集团编码';
comment on column CDR_EMR_INANDOUT_RECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_INANDOUT_RECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_INANDOUT_RECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_INANDOUT_RECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_INANDOUT_RECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_INANDOUT_RECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_INANDOUT_RECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_INANDOUT_RECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_INANDOUT_RECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_INANDOUT_RECORD.age
  is '年龄';
comment on column CDR_EMR_INANDOUT_RECORD.bed_no
  is '床位号';
comment on column CDR_EMR_INANDOUT_RECORD.room_no
  is '病房号';
comment on column CDR_EMR_INANDOUT_RECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_INANDOUT_RECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_INANDOUT_RECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_INANDOUT_RECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_INANDOUT_RECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_INANDOUT_RECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_INANDOUT_RECORD.record_person
  is '文档作者';
comment on column CDR_EMR_INANDOUT_RECORD.nurse_level_code
  is '护理等级代码， ';
comment on column CDR_EMR_INANDOUT_RECORD.nurse_type_code
  is '护理类型代码， ';
comment on column CDR_EMR_INANDOUT_RECORD.record_datetime
  is '记录日期时间点';
comment on column CDR_EMR_INANDOUT_RECORD.type
  is '类型：入量/出量';
comment on column CDR_EMR_INANDOUT_RECORD.project_name
  is '项目名（水、食物等，药品则为药品名）';
comment on column CDR_EMR_INANDOUT_RECORD.medication_dosage
  is '剂量(单次)';
comment on column CDR_EMR_INANDOUT_RECORD.medication_dosage_unit
  is '剂量(单次)单位';
comment on column CDR_EMR_INANDOUT_RECORD.medication_quantity
  is '数量';
comment on column CDR_EMR_INANDOUT_RECORD.totle_dose
  is '总量';
comment on column CDR_EMR_INANDOUT_RECORD.record_nur_code
  is '记录护士编码';
comment on column CDR_EMR_INANDOUT_RECORD.record_nur_name
  is '记录护士名称';
comment on column CDR_EMR_INANDOUT_RECORD.drug_method
  is '药物用法代码，用药途径代码表';
comment on column CDR_EMR_INANDOUT_RECORD.drug_method_name
  is '药物用法名称';
comment on column CDR_EMR_INANDOUT_RECORD.medication_frequency
  is '用药频率';
comment on column CDR_EMR_INANDOUT_RECORD.medication_frequency_unit
  is '用药频率单位';
comment on column CDR_EMR_INANDOUT_RECORD.item_color
  is '颜色';
comment on column CDR_EMR_INANDOUT_RECORD.item_character
  is '性状';
comment on column CDR_EMR_INANDOUT_RECORD.item_comment
  is '备注';
comment on column CDR_EMR_INANDOUT_RECORD.is_vomit
  is '呕吐标志 ';
comment on column CDR_EMR_INANDOUT_RECORD.is_dysuria
  is '排尿困难标志 ';
comment on column CDR_EMR_INANDOUT_RECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_INTRACTABLE_DISCUSSIONRECORD
(
    group_code                         VARCHAR2(20),
    organization_code                  VARCHAR2(20),
    domain_id                          VARCHAR2(2),
    unicode                            VARCHAR2(50) not null,
    patient_id                         VARCHAR2(36),
    visit_no                           VARCHAR2(36),
    visittimes                         INTEGER,
    inpatient_no                       VARCHAR2(36),
    patient_name                       VARCHAR2(20),
    gendercode                         INTEGER,
    age                                VARCHAR2(20),
    bed_no                             VARCHAR2(20),
    room_no                            VARCHAR2(20),
    dept_no                            VARCHAR2(20),
    dept_name                          VARCHAR2(50),
    ward_no                            VARCHAR2(20),
    ward_name                          VARCHAR2(50),
    record_createdate                  DATE,
    record_personid                    VARCHAR2(20),
    record_person                      VARCHAR2(50),
    discussion_datetime                DATE,
    discussion_address                 VARCHAR2(50),
    doctor_directorid                  VARCHAR2(12),
    doctor_director                    VARCHAR2(36),
    record_auditor_id                  VARCHAR2(12),
    inpatient_doctorid                 VARCHAR2(12),
    inpatient_doctor                   VARCHAR2(36),
    charge_doctor_id                   VARCHAR2(12),
    charge_doctor                      VARCHAR2(36),
    meeting_chair                      VARCHAR2(36),
    meeting_chair_id                   VARCHAR2(12),
    participants                       VARCHAR2(500),
    discussion_opinions                VARCHAR2(4000),
    director_opinions                  VARCHAR2(2000),
    doctor_opinions                    VARCHAR2(2000),
    other_opinions                     VARCHAR2(2000),
    discussion_summary                 VARCHAR2(4000),
    syndrome_differentiation_treatment VARCHAR2(500),
    tcm_decocting_ways                 VARCHAR2(16),
    tcm_medication                     VARCHAR2(16),
    tcm_doctoradvice                   VARCHAR2(500),
    last_update_time                   DATE
)
 ;
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.age
  is '年龄';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.room_no
  is '病房号';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.discussion_datetime
  is '讨论时间';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.discussion_address
  is '讨论地点';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.doctor_director
  is '主任医师';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.record_auditor_id
  is '接诊医师编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.inpatient_doctorid
  is '住院医师编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.inpatient_doctor
  is '住院医师名称';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.meeting_chair
  is '主持人';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.meeting_chair_id
  is '主持人员编码';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.participants
  is '参会人员';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.discussion_opinions
  is '讨论意见';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.director_opinions
  is '主任意见';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.doctor_opinions
  is '主治/副主任意见';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.other_opinions
  is '其他人意见';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.discussion_summary
  is '主持人总结意见';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.syndrome_differentiation_treatment
  is '辨证论治';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.tcm_decocting_ways
  is '中药饮片煎煮法';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.tcm_medication
  is '中药用药方法';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.tcm_doctoradvice
  is '中药处方医嘱内容';
comment on column CDR_EMR_INTRACTABLE_DISCUSSIONRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_MEDICALRECORD_SUMMARY
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(100) not null,
    patient_id          VARCHAR2(36),
    visit_no            VARCHAR2(36),
    visittimes          INTEGER,
    inpatient_no        VARCHAR2(36),
    patient_name        VARCHAR2(20),
    gendercode          INTEGER,
    age                 VARCHAR2(20),
    marriage            VARCHAR2(4),
    occupation          VARCHAR2(50),
    native_address      VARCHAR2(500),
    in_hospital_date    DATE,
    record_createdate   DATE,
    record_personid     VARCHAR2(20),
    record_person       VARCHAR2(50),
    agent_sign          VARCHAR2(50),
    illness             VARCHAR2(4000),
    illness_current     VARCHAR2(4000),
    illness_history     VARCHAR2(4000),
    disease_history     VARCHAR2(4000),
    infection_history   VARCHAR2(2000),
    operation_history   VARCHAR2(2000),
    marry_histoyr       VARCHAR2(2000),
    transfusion_history VARCHAR2(2000),
    allergy_history     VARCHAR2(2000),
    vaccination_history VARCHAR2(2000),
    personal_history    VARCHAR2(2000),
    menstrual_history   VARCHAR2(2000),
    family_history      VARCHAR2(2000),
    breath_system       VARCHAR2(2000),
    circulate_system    VARCHAR2(2000),
    digestion_system    VARCHAR2(2000),
    reproduction_system VARCHAR2(2000),
    blood_system        VARCHAR2(2000),
    endocrine_system    VARCHAR2(2000),
    muscle_system       VARCHAR2(2000),
    nerve_system        VARCHAR2(2200),
    medical_treatment_t VARCHAR2(2000),
    respons_doctor_id   VARCHAR2(20),
    respons_doctor_name VARCHAR2(50),
    insurance_type      VARCHAR2(10),
    insurance_name      VARCHAR2(50),
    mz_fee              NUMBER,
    zy_fee              NUMBER,
    personal_fee        NUMBER,
    recorde_time        DATE,
    revoke_time         DATE,
    last_modify_time    DATE,
    delete_flag         NUMBER(1),
    last_update_time    DATE
)
 ;
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.group_code
  is '集团编码';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.organization_code
  is '组织编码';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.domain_id
  is '系统域标识';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.patient_id
  is '个人标识号';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.visittimes
  is '就诊次数';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.inpatient_no
  is '住院号';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.patient_name
  is '患者姓名';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.gendercode
  is '性别代码';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.age
  is '年龄';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.marriage
  is '婚姻';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.occupation
  is '职业';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.native_address
  is '单位或地址';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.in_hospital_date
  is '入院时间';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.record_createdate
  is '记录日期';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.record_personid
  is '文档作者编码';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.record_person
  is '文档作者';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.agent_sign
  is '病史陈述者姓名';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.illness
  is '主诉';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.illness_current
  is '现病史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.illness_history
  is '既往史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.disease_history
  is '疾病史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.infection_history
  is '传染病史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.operation_history
  is '手术史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.marry_histoyr
  is '婚育史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.transfusion_history
  is '输血史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.allergy_history
  is '过敏史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.vaccination_history
  is '预防接种史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.personal_history
  is '个人史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.menstrual_history
  is '月经史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.family_history
  is '家族史';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.breath_system
  is '呼吸系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.circulate_system
  is '循环系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.digestion_system
  is '消化系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.reproduction_system
  is '泌尿系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.blood_system
  is '血液系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.endocrine_system
  is '内分泌系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.muscle_system
  is '肌肉及关节';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.nerve_system
  is '神经系统';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.medical_treatment_t
  is '其它医学处置';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.respons_doctor_id
  is '责任医师编码';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.respons_doctor_name
  is '责任医师姓名';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.insurance_type
  is '医疗保险类别代码';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.insurance_name
  is '医疗保险类别名称';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.mz_fee
  is '门诊总费用，单位“元”';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.zy_fee
  is '住院总费用，单位“元”';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.personal_fee
  is '个人承担费用，单位“元”';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.recorde_time
  is '记录时间，';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.revoke_time
  is '撤销时间';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.last_modify_time
  is '编辑时间';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.delete_flag
  is '修改标志';
comment on column CDR_EMR_MEDICALRECORD_SUMMARY.last_update_time
  is '最后修改时间';






create table CDR_EMR_NOTICE_CRITICALCONDITION
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(50) not null,
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visittimes              INTEGER,
    inpatient_no            VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              INTEGER,
    age                     VARCHAR2(20),
    bed_no                  VARCHAR2(20),
    room_no                 VARCHAR2(20),
    dept_no                 VARCHAR2(20),
    dept_name               VARCHAR2(50),
    ward_no                 VARCHAR2(20),
    ward_name               VARCHAR2(50),
    record_createdate       DATE,
    record_personid         VARCHAR2(20),
    record_person           VARCHAR2(50),
    charge_doctor_signtime  DATE,
    charge_doctorid         VARCHAR2(16),
    charge_doctor           VARCHAR2(16),
    patient_sign_tiem       DATE,
    patient_sign            VARCHAR2(36),
    agent_signdate          DATE,
    agent_sign              VARCHAR2(36),
    agent_relationship      VARCHAR2(50),
    agent_relationship_code VARCHAR2(2),
    diagnosis_code          VARCHAR2(50),
    diagnosis               VARCHAR2(100),
    condition_general       VARCHAR2(500),
    critically_ill_date     DATE,
    critically_ill_content  VARCHAR2(1000),
    last_update_time        DATE
)
 ;
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.group_code
  is '集团编码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.organization_code
  is '组织编码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.domain_id
  is '系统域标识';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.patient_id
  is '个人标识号';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.visittimes
  is '就诊次数';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.inpatient_no
  is '住院号';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.patient_name
  is '患者姓名';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.gendercode
  is '性别代码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.age
  is '年龄';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.bed_no
  is '床位号';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.room_no
  is '病房号';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.record_personid
  is '文档作者编码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.record_person
  is '文档作者';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.charge_doctor_signtime
  is '责任医师签署日期';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.charge_doctorid
  is '责任医生编号';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.charge_doctor
  is '责任医生姓名';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.patient_sign_tiem
  is '患者 签名日期时间';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.patient_sign
  is '患者签名';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.agent_signdate
  is '患者代理人签名时间';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.agent_sign
  is '患者代理人签名';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.agent_relationship
  is '患者代理人关系';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.agent_relationship_code
  is '患者代理人关系代码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.diagnosis_code
  is '疾病诊断编码';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.diagnosis
  is '疾病诊断名称';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.condition_general
  is '病情概况以及主要抢救措施';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.critically_ill_date
  is '病危（重）通知时间';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.critically_ill_content
  is '病危（重）通知内容';
comment on column CDR_EMR_NOTICE_CRITICALCONDITION.last_update_time
  is '最后修改时间';






create table CDR_EMR_NOTICE_CRITICALCONDITION_CP
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30),
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visittimes              INTEGER,
    inpatient_no            VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              INTEGER,
    age                     VARCHAR2(20),
    bed_no                  VARCHAR2(20),
    room_no                 VARCHAR2(20),
    dept_no                 VARCHAR2(20),
    dept_name               VARCHAR2(50),
    ward_no                 VARCHAR2(20),
    ward_name               VARCHAR2(50),
    record_createdate       DATE,
    record_personid         VARCHAR2(20),
    record_person           VARCHAR2(50),
    charge_doctor_signtime  DATE,
    charge_doctorid         VARCHAR2(16),
    charge_doctor           VARCHAR2(16),
    patient_sign_tiem       DATE,
    patient_sign            VARCHAR2(36),
    agent_signdate          DATE,
    agent_sign              VARCHAR2(36),
    agent_relationship      VARCHAR2(8),
    agent_relationship_code VARCHAR2(2),
    diagnosis_code          VARCHAR2(10),
    diagnosis               VARCHAR2(100),
    condition_general       VARCHAR2(500),
    critically_ill_date     DATE,
    critically_ill_content  VARCHAR2(1000),
    last_update_time        DATE
)
 ;





create table CDR_EMR_OPERATION_INFORMEDCONSENT
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    unicode                    VARCHAR2(50) not null,
    patient_id                 VARCHAR2(36),
    visit_no                   VARCHAR2(36),
    visittimes                 INTEGER,
    inpatient_no               VARCHAR2(36),
    patient_name               VARCHAR2(20),
    gendercode                 INTEGER,
    age                        VARCHAR2(20),
    bed_no                     VARCHAR2(20),
    room_no                    VARCHAR2(20),
    dept_no                    VARCHAR2(20),
    dept_name                  VARCHAR2(50),
    ward_no                    VARCHAR2(20),
    ward_name                  VARCHAR2(50),
    record_createdate          DATE,
    record_personid            VARCHAR2(20),
    record_person              VARCHAR2(50),
    operation_doctor_signdate  DATE,
    operation_doctorid         VARCHAR2(20),
    operation_doctor_sign      VARCHAR2(50),
    patient_sign               VARCHAR2(50),
    patient_signdate           DATE,
    agent_signdate             DATE,
    agent_sign                 VARCHAR2(50),
    agent_relationship_code    NUMBER,
    preoperative_diagnosis     VARCHAR2(2000),
    operation_name             VARCHAR2(50),
    operation_plan_date        DATE,
    operation_method           VARCHAR2(50),
    preoperative_preparation   VARCHAR2(200),
    operation_contraindication VARCHAR2(200),
    operation_indication       VARCHAR2(200),
    anesthesia_type            VARCHAR2(500),
    alternatives               VARCHAR2(500),
    operation_org_advice       VARCHAR2(2000),
    patient_option             VARCHAR2(2000),
    intraoperative_unexpected  VARCHAR2(2000),
    postoperative_unexpected   VARCHAR2(2000),
    last_update_time           DATE
)
 ;
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.group_code
  is '集团编码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.organization_code
  is '组织编码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.gendercode
  is '性别代码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.age
  is '年龄';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.bed_no
  is '床位号';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.room_no
  is '病房号';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.record_personid
  is '文档作者编码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.record_person
  is '文档作者';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_doctor_signdate
  is '手术医生签名时间';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_doctor_sign
  is '手术医生签名';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.patient_sign
  is '患者签名';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.patient_signdate
  is '患者签名时间';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.agent_signdate
  is '患者代理人签名时间';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.agent_sign
  is '患者代理人签名';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.agent_relationship_code
  is '患者代理人关系代码，';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_name
  is '手术名称';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_plan_date
  is '手术计划日期时间';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_method
  is '手术方式描述';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.preoperative_preparation
  is '术前准备';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_contraindication
  is '手术禁忌症';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_indication
  is '手术指征';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.anesthesia_type
  is '拟实施麻醉方法';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.alternatives
  is '替代方案';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.operation_org_advice
  is '医疗机构的意见';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.patient_option
  is '患者的意见';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.intraoperative_unexpected
  is '手术中可能出现的意外及风险';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.postoperative_unexpected
  is '手术后可能出现的意外以及风险';
comment on column CDR_EMR_OPERATION_INFORMEDCONSENT.last_update_time
  is '最后修改时间';






create table CDR_EMR_OTHER_INFORMEDCONSENT
(
    group_code                VARCHAR2(20),
    organization_code         VARCHAR2(20),
    domain_id                 VARCHAR2(2),
    unicode                   VARCHAR2(50) not null,
    patient_id                VARCHAR2(36),
    visit_no                  VARCHAR2(36),
    visittimes                INTEGER,
    inpatient_no              VARCHAR2(36),
    patient_name              VARCHAR2(20),
    gendercode                INTEGER,
    age                       VARCHAR2(20),
    bed_no                    VARCHAR2(20),
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20),
    dept_name                 VARCHAR2(50),
    ward_no                   VARCHAR2(20),
    ward_name                 VARCHAR2(50),
    record_createdate         DATE,
    record_personid           VARCHAR2(20),
    record_person             VARCHAR2(50),
    attending_doctor_signdate DATE,
    attending_doctorid        VARCHAR2(12),
    attending_doctor          VARCHAR2(36),
    patient_sign              VARCHAR2(32),
    patient_signdate          DATE,
    agent_signdate            DATE,
    agent_sign                VARCHAR2(36),
    agent_relationship        VARCHAR2(8),
    agent_relationship_code   VARCHAR2(10),
    diagnosis                 VARCHAR2(100),
    diagnosis_code            VARCHAR2(10),
    informed_consent_name     VARCHAR2(100),
    operation_org_advice      VARCHAR2(100),
    patient_option            VARCHAR2(1024),
    last_update_time          DATE,
    informed_consent_content  CLOB
)
 ;
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.group_code
  is '集团编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.organization_code
  is '组织编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.gendercode
  is '性别代码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.age
  is '年龄';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.bed_no
  is '床位号';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.room_no
  is '病房号';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.record_personid
  is '文档作者编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.record_person
  is '文档作者';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.attending_doctor_signdate
  is '医师签名时间';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.attending_doctorid
  is '医师编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.attending_doctor
  is '医师签名';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.patient_sign
  is '患者签名';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.patient_signdate
  is '患者签名时间';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.agent_signdate
  is '患者代理人签名时间';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.agent_sign
  is '患者代理人签名';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.agent_relationship
  is '患者代理人关系';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.agent_relationship_code
  is '患者代理人关系代码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.diagnosis
  is '疾病诊断名称';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.diagnosis_code
  is '疾病诊断编码';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.informed_consent_name
  is '知情同意书名称';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.operation_org_advice
  is '医疗机构的意见';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.patient_option
  is '患者的意见';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_OTHER_INFORMEDCONSENT.informed_consent_content
  is '知情同意书内容';






create table CDR_EMR_PATHOMEPAGE_DIAGNOSIS
(
    unicode             VARCHAR2(351) not null,
    patient_id          VARCHAR2(96),
    visit_no            VARCHAR2(219),
    inpatient_no        VARCHAR2(48) not null,
    sort_no             NUMBER(2) not null,
    diagnosis_date      DATE,
    diagnosis_code      VARCHAR2(60),
    diagnosis_name      VARCHAR2(300),
    diagnosis_type_code VARCHAR2(6) not null,
    diagnosis_type_name VARCHAR2(60),
    last_update_time    DATE
)   ;
comment on column CDR_EMR_PATHOMEPAGE_DIAGNOSIS.last_update_time
  is '最后修改时间';


create table CDR_EMR_PREOPERATIVE_DISCUSSION
(
    operation_program           VARCHAR2(500),
    discussion_opinions         VARCHAR2(3000),
    discussion_conclusion       VARCHAR2(3000),
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    unicode                     VARCHAR2(50) not null,
    patient_id                  VARCHAR2(36),
    visit_no                    VARCHAR2(36),
    visittimes                  INTEGER,
    inpatient_no                VARCHAR2(36),
    patient_name                VARCHAR2(20),
    gendercode                  INTEGER,
    age                         VARCHAR2(20),
    bed_no                      VARCHAR2(20),
    room_no                     VARCHAR2(20),
    dept_no                     VARCHAR2(20),
    dept_name                   VARCHAR2(50),
    ward_no                     VARCHAR2(20),
    ward_name                   VARCHAR2(50),
    record_createdate           DATE,
    record_personid             VARCHAR2(20),
    record_person               VARCHAR2(50),
    discussion_datetime         DATE,
    discussion_address          VARCHAR2(50),
    operation_doctorid          VARCHAR2(12),
    operation_doctor            VARCHAR2(36),
    operation_doctor_post       VARCHAR2(16),
    operation_doctor_post_code  VARCHAR2(8),
    operation_doctor_signdate   DATE,
    anesthesia_doctorid         VARCHAR2(12),
    anesthesia_doctor_name      VARCHAR2(36),
    anesthesia_doctor_post      VARCHAR2(16),
    anesthesia_doctor_post_code VARCHAR2(8),
    anesthesia_doctor_signdate  DATE,
    charge_doctorid             VARCHAR2(12),
    charge_doctor               VARCHAR2(36),
    charge_doctor_post          VARCHAR2(16),
    charge_doctor_post_code     VARCHAR2(8),
    charge_doctor_signdate      DATE,
    participants                VARCHAR2(500),
    meeting_chair               VARCHAR2(36),
    meeting_chair_id            VARCHAR2(12),
    preoperative_diagnosis      VARCHAR2(2000),
    preoperative_diagnosis_code VARCHAR2(10),
    in_hospital_date            DATE,
    operation_code_plan         VARCHAR2(10),
    operation_name_plan         VARCHAR2(500),
    operation_site_plan         VARCHAR2(500),
    operation_date_plan         DATE,
    anesthesia_type_code_plan   VARCHAR2(10),
    anesthesia_name_plan        VARCHAR2(1000),
    notices                     VARCHAR2(1000),
    operation_key_points        VARCHAR2(1200),
    preoperative_preparation    VARCHAR2(1000),
    operation_indication        VARCHAR2(1000),
    last_update_time            DATE
)
 ;
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_program
  is '手术方案';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.discussion_opinions
  is '讨论意见';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.discussion_conclusion
  is '讨论结论';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.group_code
  is '集团编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.organization_code
  is '组织编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.domain_id
  is '系统域标识';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.patient_id
  is '个人标识号';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.visittimes
  is '就诊次数';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.inpatient_no
  is '住院号';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.patient_name
  is '患者姓名';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.gendercode
  is '性别代码代码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.age
  is '年龄';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.bed_no
  is '床位号';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.room_no
  is '病房号';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.record_personid
  is '文档作者编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.record_person
  is '文档作者';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.discussion_datetime
  is '讨论时间';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.discussion_address
  is '讨论地点';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_doctor
  is '手术医生名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_doctor_post
  is '手术医生专业技术职务类别';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_doctor_post_code
  is '手术医生专业技术职务类别代码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_doctor_signdate
  is '手术医生签字时间';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_doctorid
  is '麻醉医师编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_doctor_name
  is '麻醉医师姓名';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_doctor_post
  is '麻醉医师专业技术职务类别';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_doctor_post_code
  is '麻醉医师专业技术职务类别代码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_doctor_signdate
  is '麻醉医师签字时间';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.charge_doctorid
  is '医师编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.charge_doctor
  is '医师名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.charge_doctor_post
  is '医师专业技术职务类别';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.charge_doctor_post_code
  is '医师专业技术职务类别代码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.charge_doctor_signdate
  is '医师签字时间';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.participants
  is '参会人员';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.meeting_chair
  is '主持人';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.meeting_chair_id
  is '主持人员编码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.preoperative_diagnosis_code
  is '术前诊断代码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_code_plan
  is '拟实施手术代码密码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_name_plan
  is '拟实施手术名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_site_plan
  is '拟实施手术目标部位名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_date_plan
  is '拟实施手术及操作日期时间';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_type_code_plan
  is '拟实施麻醉方法代码';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.anesthesia_name_plan
  is '拟实施麻醉名称';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.notices
  is '注意事项';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_key_points
  is '手术要点';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.preoperative_preparation
  is '术前准备';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.operation_indication
  is '手术指征';
comment on column CDR_EMR_PREOPERATIVE_DISCUSSION.last_update_time
  is '最后修改时间';






create table CDR_EMR_PREOPERATIVE_SUMMARY
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    unicode                     VARCHAR2(30) not null,
    patient_id                  VARCHAR2(36),
    visit_no                    VARCHAR2(36),
    visittimes                  INTEGER,
    inpatient_no                VARCHAR2(36),
    patient_name                VARCHAR2(20),
    gendercode                  INTEGER,
    age                         VARCHAR2(20),
    bed_no                      VARCHAR2(20),
    room_no                     VARCHAR2(20),
    dept_no                     VARCHAR2(20),
    dept_name                   VARCHAR2(50),
    ward_no                     VARCHAR2(20),
    ward_name                   VARCHAR2(50),
    record_createdate           DATE,
    record_personid             VARCHAR2(20),
    record_person               VARCHAR2(50),
    operation_doctorid          VARCHAR2(12),
    operation_doctor            VARCHAR2(36),
    operation_doctor_signdate   DATE,
    assigned_time               DATE,
    assigned_doc_id             VARCHAR2(10),
    assigned_doc_name           VARCHAR2(20),
    contact_person              VARCHAR2(36),
    contact_phone               NUMBER,
    medical_records_summary     VARCHAR2(500),
    preoperative_diagnosis      NUMBER,
    preoperative_diagnosis_code VARCHAR2(10),
    diagnosis_basis             VARCHAR2(500),
    is_allergies                NUMBER,
    allergies                   VARCHAR2(500),
    examination_auxiliary       VARCHAR2(1000),
    operation_adapt             VARCHAR2(500),
    operation_contraindication  VARCHAR2(50),
    operation_indication        VARCHAR2(100),
    consultation_advices        VARCHAR2(500),
    operation_code_plan         VARCHAR2(10),
    operation_name_plan         VARCHAR2(100),
    operation_site_plan         VARCHAR2(100),
    operation_date_plan         DATE,
    anesthesia_type_code_plan   VARCHAR2(10),
    anesthesia_name_plan        VARCHAR2(100),
    notices                     VARCHAR2(100),
    operation_key_points        VARCHAR2(100),
    preoperative_preparation    VARCHAR2(100),
    last_update_time            DATE
)
 ;
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.group_code
  is '集团编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.organization_code
  is '组织编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.domain_id
  is '系统域标识';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.patient_id
  is '个人标识号';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.visittimes
  is '就诊次数';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.inpatient_no
  is '住院号';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.patient_name
  is '患者姓名';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.gendercode
  is '性别代码代码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.age
  is '年龄';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.bed_no
  is '床位号';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.room_no
  is '病房号';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.record_personid
  is '文档作者编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.record_person
  is '文档作者';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_doctor
  is '手术医生名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_doctor_signdate
  is '手术医生签字时间';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.assigned_time
  is '审核日期时间';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.assigned_doc_id
  is '审核医生编码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.assigned_doc_name
  is '审核医生姓名';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.contact_person
  is '联系人姓名';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.contact_phone
  is '联系人电话';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.medical_records_summary
  is '病历摘要章节';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.preoperative_diagnosis
  is '术前诊断名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.preoperative_diagnosis_code
  is '术前诊断代码，诊断代码表（ICD-10）';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.diagnosis_basis
  is '诊断依据';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.is_allergies
  is '过敏史标志';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.allergies
  is '过敏史';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.examination_auxiliary
  is '辅助检查结果';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_adapt
  is '手术适应证';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_contraindication
  is '手术禁忌症';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_indication
  is '手术指征';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.consultation_advices
  is '会诊意见';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_code_plan
  is '拟实施手术代码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_name_plan
  is '拟实施手术名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_site_plan
  is '拟实施手术目标部位名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_date_plan
  is '拟实施手术及操作日期时间';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.anesthesia_type_code_plan
  is '拟实施麻醉方法代码';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.anesthesia_name_plan
  is '拟实施麻醉名称';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.notices
  is '注意事项';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.operation_key_points
  is '手术要点';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.preoperative_preparation
  is '术前准备';
comment on column CDR_EMR_PREOPERATIVE_SUMMARY.last_update_time
  is '最后修改时间';






create table CDR_EMR_RELIEF_SHIFTRECORD
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(100) not null,
    patient_id                    VARCHAR2(36),
    visit_no                      VARCHAR2(36),
    visittimes                    INTEGER,
    inpatient_no                  VARCHAR2(36),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    age                           VARCHAR2(20),
    bed_no                        VARCHAR2(20),
    room_no                       VARCHAR2(20),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(50),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(20),
    record_person                 VARCHAR2(50),
    handover_datetime             DATE,
    handover_person_id            VARCHAR2(50),
    handover_person               VARCHAR2(50),
    succeed_datetime              DATE,
    succeed_person_id             VARCHAR2(50),
    succeed_person                VARCHAR2(50),
    in_hospital_date              DATE,
    admission_hospital_state      VARCHAR2(4000),
    current_situation             VARCHAR2(4000),
    succeed_treatment_plan        VARCHAR2(4000),
    notices                       VARCHAR2(4000),
    treatment_process_description VARCHAR2(4000),
    record_type                   VARCHAR2(50),
    record_type_code              INTEGER,
    last_update_time              DATE
)
 ;
comment on column CDR_EMR_RELIEF_SHIFTRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.age
  is '年龄';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.room_no
  is '病房号';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.handover_datetime
  is '交班日期时间';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.handover_person_id
  is '交班者编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.handover_person
  is '交班者姓名';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.succeed_datetime
  is '接班日期时间';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.succeed_person_id
  is '接班者编码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.succeed_person
  is '接班者姓名';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.in_hospital_date
  is '入院日期时间';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.admission_hospital_state
  is '入院情况';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.current_situation
  is '目前情况';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.succeed_treatment_plan
  is '接班诊疗计划';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.notices
  is '注意事项';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.record_type
  is '交接班类型';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.record_type_code
  is '交接班类型代码';
comment on column CDR_EMR_RELIEF_SHIFTRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_RESCUERECORD
(
    group_code                     VARCHAR2(20),
    organization_code              VARCHAR2(20),
    domain_id                      VARCHAR2(2),
    unicode                        VARCHAR2(60) not null,
    patient_id                     VARCHAR2(36),
    visit_no                       VARCHAR2(36),
    visittimes                     INTEGER,
    inpatient_no                   VARCHAR2(36),
    patient_name                   VARCHAR2(20),
    gendercode                     INTEGER,
    age                            VARCHAR2(20),
    bed_no                         VARCHAR2(20),
    room_no                        VARCHAR2(20),
    dept_no                        VARCHAR2(20),
    dept_name                      VARCHAR2(50),
    ward_no                        VARCHAR2(20),
    ward_name                      VARCHAR2(50),
    record_createdate              DATE,
    record_personid                VARCHAR2(20),
    record_person                  VARCHAR2(50),
    assigned_time                  DATE,
    assigned_doc_id                VARCHAR2(10),
    assigned_doc_name              VARCHAR2(50),
    assigned_doc_post              VARCHAR2(16),
    assigned_doc_postcode          VARCHAR2(8),
    participants                   VARCHAR2(300),
    change_of_disease              VARCHAR2(2800),
    notices                        VARCHAR2(100),
    operation_code                 VARCHAR2(100),
    operation_name                 VARCHAR2(500),
    operation_site_id              VARCHAR2(100),
    operation_site                 VARCHAR2(100),
    operation_material             VARCHAR2(100),
    operation_method               VARCHAR2(4000),
    operation_number               NUMBER,
    rescue_measures                VARCHAR2(4000),
    rescue_begindate               DATE,
    rescue_enddate                 DATE,
    inspection                     VARCHAR2(50),
    inspection_items               VARCHAR2(30),
    inspection_quantitative_result NUMBER(4,4),
    inspection_quan_result_unit    VARCHAR2(6),
    inspection_result_code         VARCHAR2(1),
    inspection_result              VARCHAR2(6),
    last_update_time               DATE
)
 ;
comment on column CDR_EMR_RESCUERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_RESCUERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_RESCUERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_RESCUERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_RESCUERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_RESCUERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_RESCUERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_RESCUERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_RESCUERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_RESCUERECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_RESCUERECORD.age
  is '年龄';
comment on column CDR_EMR_RESCUERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_RESCUERECORD.room_no
  is '病房号';
comment on column CDR_EMR_RESCUERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_RESCUERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_RESCUERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_RESCUERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_RESCUERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_RESCUERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_RESCUERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_RESCUERECORD.assigned_time
  is '审核日期时间';
comment on column CDR_EMR_RESCUERECORD.assigned_doc_id
  is '审核医生编码';
comment on column CDR_EMR_RESCUERECORD.assigned_doc_name
  is '审核医生姓名';
comment on column CDR_EMR_RESCUERECORD.assigned_doc_post
  is '审核医生职务类别';
comment on column CDR_EMR_RESCUERECORD.assigned_doc_postcode
  is '职务类别编码,专业技术职务类别代码表';
comment on column CDR_EMR_RESCUERECORD.participants
  is '参会人员';
comment on column CDR_EMR_RESCUERECORD.change_of_disease
  is '病情变化情况';
comment on column CDR_EMR_RESCUERECORD.notices
  is '注意事项';
comment on column CDR_EMR_RESCUERECORD.operation_code
  is '手术代码';
comment on column CDR_EMR_RESCUERECORD.operation_name
  is '手术名称';
comment on column CDR_EMR_RESCUERECORD.operation_site_id
  is '手术目标部位代码';
comment on column CDR_EMR_RESCUERECORD.operation_site
  is '手术目标部位名称';
comment on column CDR_EMR_RESCUERECORD.operation_material
  is '介入物名称';
comment on column CDR_EMR_RESCUERECORD.operation_method
  is '操作方法描述';
comment on column CDR_EMR_RESCUERECORD.operation_number
  is '操作次数';
comment on column CDR_EMR_RESCUERECORD.rescue_measures
  is '抢救措施';
comment on column CDR_EMR_RESCUERECORD.rescue_begindate
  is '抢救开始时间';
comment on column CDR_EMR_RESCUERECORD.rescue_enddate
  is '抢救结束时间';
comment on column CDR_EMR_RESCUERECORD.inspection
  is '检查/检验名称';
comment on column CDR_EMR_RESCUERECORD.inspection_items
  is '检查/检验项目';
comment on column CDR_EMR_RESCUERECORD.inspection_quantitative_result
  is '检查/检验定量结果';
comment on column CDR_EMR_RESCUERECORD.inspection_quan_result_unit
  is '检查/检验定量结果单位,如mmHg';
comment on column CDR_EMR_RESCUERECORD.inspection_result_code
  is '检查/检验结果代码，如1.异常 2.正常 3.不确定';
comment on column CDR_EMR_RESCUERECORD.inspection_result
  is '检查/检验结果结果';
comment on column CDR_EMR_RESCUERECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_SERIOUS_NURSERECORD
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    unicode                    VARCHAR2(30) not null,
    patient_id                 VARCHAR2(36),
    visit_no                   VARCHAR2(36),
    visittimes                 INTEGER,
    inpatient_no               VARCHAR2(36),
    patient_name               VARCHAR2(20),
    gendercode                 INTEGER,
    age                        VARCHAR2(20),
    bed_no                     VARCHAR2(20),
    room_no                    VARCHAR2(20),
    dept_no                    VARCHAR2(20),
    dept_name                  VARCHAR2(50),
    ward_no                    VARCHAR2(20),
    ward_name                  VARCHAR2(50),
    record_createdate          DATE,
    record_personid            VARCHAR2(20),
    record_person              VARCHAR2(50),
    weight                     NUMBER(3,2),
    temperature                NUMBER(2,1),
    rate_heart                 INTEGER,
    rate_respiratory           INTEGER,
    pressure_systolic          INTEGER,
    pressure_diastolic         INTEGER,
    blood_sugar                NUMBER(3,2),
    diet_satutrtion_code       NUMBER,
    nurse_level_code           NUMBER,
    catheter_nurse             VARCHAR2(50),
    posture_nurse              VARCHAR2(50),
    skin_nurse                 VARCHAR2(50),
    nurse_level                VARCHAR2(50),
    nurse_type_code            NUMBER,
    nurse_type                 VARCHAR2(50),
    nurse_observed_item        VARCHAR2(100),
    nurse_observed_resulit     VARCHAR2(100),
    nurse_operate_name         VARCHAR2(100),
    nurse_operate_result       VARCHAR2(100),
    ventilator_monitoring_item VARCHAR2(100),
    ventilator_monitoring_dd   INTEGER,
    ventilator_monitoring_hh   INTEGER,
    ventilator_monitoring_mm   INTEGER,
    in_icu_falg                NUMBER,
    in_icu_type                NUMBER,
    in_icu_dd                  INTEGER,
    in_icu_hh                  INTEGER,
    in_icu_mm                  INTEGER,
    rescue_flag                NUMBER,
    last_update_time           DATE
)
 ;
comment on column CDR_EMR_SERIOUS_NURSERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_SERIOUS_NURSERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_SERIOUS_NURSERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_SERIOUS_NURSERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_SERIOUS_NURSERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_SERIOUS_NURSERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_SERIOUS_NURSERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_SERIOUS_NURSERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_SERIOUS_NURSERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_SERIOUS_NURSERECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_SERIOUS_NURSERECORD.age
  is '年龄';
comment on column CDR_EMR_SERIOUS_NURSERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_SERIOUS_NURSERECORD.room_no
  is '病房号';
comment on column CDR_EMR_SERIOUS_NURSERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_SERIOUS_NURSERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_SERIOUS_NURSERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_SERIOUS_NURSERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_SERIOUS_NURSERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_SERIOUS_NURSERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_SERIOUS_NURSERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_SERIOUS_NURSERECORD.weight
  is '体重';
comment on column CDR_EMR_SERIOUS_NURSERECORD.temperature
  is '体温';
comment on column CDR_EMR_SERIOUS_NURSERECORD.rate_heart
  is '心率';
comment on column CDR_EMR_SERIOUS_NURSERECORD.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_SERIOUS_NURSERECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_SERIOUS_NURSERECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_SERIOUS_NURSERECORD.blood_sugar
  is '血糖检测值';
comment on column CDR_EMR_SERIOUS_NURSERECORD.diet_satutrtion_code
  is '饮食情况代码， ';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_level_code
  is '护理等级代码， ';
comment on column CDR_EMR_SERIOUS_NURSERECORD.catheter_nurse
  is '导管护理描述';
comment on column CDR_EMR_SERIOUS_NURSERECORD.posture_nurse
  is '体位护理描述';
comment on column CDR_EMR_SERIOUS_NURSERECORD.skin_nurse
  is '皮肤护理描述';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_level
  is '护理等级 ';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_type_code
  is '护理类型代码， ';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_type
  is '护理类型';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_observed_item
  is '护理观察项目名称';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_observed_resulit
  is '护理观察结果';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_operate_name
  is '护理操作名称';
comment on column CDR_EMR_SERIOUS_NURSERECORD.nurse_operate_result
  is '护理操作结果';
comment on column CDR_EMR_SERIOUS_NURSERECORD.ventilator_monitoring_item
  is '呼吸机监护项目';
comment on column CDR_EMR_SERIOUS_NURSERECORD.ventilator_monitoring_dd
  is '呼吸机使用时间（天）';
comment on column CDR_EMR_SERIOUS_NURSERECORD.ventilator_monitoring_hh
  is '呼吸机使用时间（小时）';
comment on column CDR_EMR_SERIOUS_NURSERECORD.ventilator_monitoring_mm
  is '呼吸机使用时间（分）';
comment on column CDR_EMR_SERIOUS_NURSERECORD.in_icu_falg
  is '是否入住重症监护病房';
comment on column CDR_EMR_SERIOUS_NURSERECORD.in_icu_type
  is '入住重症监护病房类型  ';
comment on column CDR_EMR_SERIOUS_NURSERECORD.in_icu_dd
  is '入住重症监护病房时间（天）';
comment on column CDR_EMR_SERIOUS_NURSERECORD.in_icu_hh
  is '入住重症监护病房时间（小时）';
comment on column CDR_EMR_SERIOUS_NURSERECORD.in_icu_mm
  is '入住重症监护病房时间（分）';
comment on column CDR_EMR_SERIOUS_NURSERECORD.rescue_flag
  is '有无抢救';
comment on column CDR_EMR_SERIOUS_NURSERECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_SM_SURGERYRECORD
(
    group_code                   VARCHAR2(20),
    organization_code            VARCHAR2(20),
    domain_id                    VARCHAR2(2),
    unicode                      VARCHAR2(30) not null,
    patient_id                   VARCHAR2(36),
    visit_no                     VARCHAR2(36),
    visittimes                   INTEGER,
    outpatient_no                VARCHAR2(50),
    inpatient_no                 VARCHAR2(36),
    patient_name                 VARCHAR2(20),
    gendercode                   INTEGER,
    age                          VARCHAR2(20),
    bed_no                       VARCHAR2(20),
    room_no                      VARCHAR2(20),
    dept_no                      VARCHAR2(20),
    dept_name                    VARCHAR2(50),
    ward_no                      VARCHAR2(20),
    ward_name                    VARCHAR2(50),
    applicationno                VARCHAR2(50),
    is_invasive                  NUMBER,
    operation_begindate          DATE,
    operation_enddate            DATE,
    operation_doctorid           VARCHAR2(20),
    operation_doctor             VARCHAR2(50),
    first_assistantid            VARCHAR2(50),
    first_assistant_name         VARCHAR2(50),
    secend_assistant_id          VARCHAR2(50),
    transportor_code             VARCHAR2(50),
    transportor_name             VARCHAR2(20),
    nurse_handoverid             VARCHAR2(50),
    nurse_handovername           VARCHAR2(20),
    nurse_handover_time          DATE,
    nur_patrol_time_bfop         DATE,
    nur_patrolid_bfop            VARCHAR2(20),
    nur_patrol_name_bfop         VARCHAR2(50),
    nur_instrument_time_bfop     DATE,
    nur_instrumentid_bfop        VARCHAR2(20),
    nur_instrument_name_bfop     VARCHAR2(50),
    anesthesia_doctorid          VARCHAR2(20),
    anesthesia_doctor_name       VARCHAR2(50),
    operation_level              VARCHAR2(20),
    operation_classification     VARCHAR2(20),
    operation_wound_grade        VARCHAR2(20),
    bleeding_volume              INTEGER,
    blood_transfusion_volume     INTEGER,
    anesthesia_type              VARCHAR2(90),
    anesthesia_type_code         VARCHAR2(30),
    breathing_type               VARCHAR2(50),
    breathing_type_code          INTEGER,
    anesthesia_begintime         DATE,
    anesthesia_endtime           DATE,
    operation_site_id            VARCHAR2(10),
    operation_site               VARCHAR2(20),
    preoperative_diagnosis       VARCHAR2(200),
    postoperative_diagnosis      VARCHAR2(200),
    operation_name               VARCHAR2(200),
    operation_material           VARCHAR2(200),
    operation_site_code          VARCHAR2(10),
    operation_site_name          VARCHAR2(50),
    disinfection_desc            VARCHAR2(200),
    incision_desc                VARCHAR2(200),
    stime                        VARCHAR2(200),
    in_surgery_items             VARCHAR2(200),
    nur_patrol_time_bfclose      DATE,
    nur_patrolid_bfclose         VARCHAR2(20),
    enur_patrol_name_bfclose     VARCHAR2(50),
    nur_instrument_time_bfclose  DATE,
    nur_instrumentid_bfclose     VARCHAR2(20),
    nur_instrument_name_bfclose  VARCHAR2(50),
    nur_patrol_time_afclose      DATE,
    nur_patrolid_afclose         VARCHAR2(20),
    enur_patrol_name_afclose     VARCHAR2(50),
    nur_instrument_time_afclose  DATE,
    nur_instrumentid_afclose     VARCHAR2(20),
    nur_instrument_name_afclose  VARCHAR2(50),
    nur_handover_time_afop       DATE,
    nur_handoverid_afop          VARCHAR2(20),
    nur_handovername_afop        VARCHAR2(50),
    transportor_code_afop        VARCHAR2(20),
    transportor_name_afop        VARCHAR2(50),
    last_update_time             DATE,
    asa                          VARCHAR2(20),
    secend_assistant_name        VARCHAR2(50),
    secend_assistantid           VARCHAR2(50),
    surgery_code                 VARCHAR2(50),
    preoperative_diagnostic_code VARCHAR2(50),
    operating_room_number        VARCHAR2(50),
    surgical_scheduling_time     DATE,
    operation_dept               VARCHAR2(50),
    operation_code               VARCHAR2(50)
)
 ;
comment on column CDR_EMR_SM_SURGERYRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_SM_SURGERYRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_SM_SURGERYRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_SM_SURGERYRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_SM_SURGERYRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_SM_SURGERYRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_SM_SURGERYRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_SM_SURGERYRECORD.outpatient_no
  is '门(急)诊号';
comment on column CDR_EMR_SM_SURGERYRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_SM_SURGERYRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_SM_SURGERYRECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_SM_SURGERYRECORD.age
  is '年龄';
comment on column CDR_EMR_SM_SURGERYRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_SM_SURGERYRECORD.room_no
  is '病房号';
comment on column CDR_EMR_SM_SURGERYRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_SM_SURGERYRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_SM_SURGERYRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_SM_SURGERYRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_SM_SURGERYRECORD.applicationno
  is '手术申请单号';
comment on column CDR_EMR_SM_SURGERYRECORD.is_invasive
  is '手术史标志  ';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_begindate
  is '手术开始日期时间';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_enddate
  is '手术结束日期时间';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_doctorid
  is '手术医生编码';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_doctor
  is '手术医生名称';
comment on column CDR_EMR_SM_SURGERYRECORD.first_assistantid
  is '第一助手编码';
comment on column CDR_EMR_SM_SURGERYRECORD.first_assistant_name
  is '第一助手';
comment on column CDR_EMR_SM_SURGERYRECORD.secend_assistant_id
  is '第二助手编码';
comment on column CDR_EMR_SM_SURGERYRECORD.transportor_code
  is '转运者编码';
comment on column CDR_EMR_SM_SURGERYRECORD.transportor_name
  is '转运者姓名';
comment on column CDR_EMR_SM_SURGERYRECORD.nurse_handoverid
  is '交接护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.nurse_handovername
  is '交接护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nurse_handover_time
  is '交接护士签名时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrol_time_bfop
  is '术前巡台时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrolid_bfop
  is '术前巡台护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrol_name_bfop
  is '术前巡台护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrument_time_bfop
  is '术前器械护士签字时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrumentid_bfop
  is '术前器械护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrument_name_bfop
  is '术前器械护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.anesthesia_doctorid
  is '麻醉医师编码';
comment on column CDR_EMR_SM_SURGERYRECORD.anesthesia_doctor_name
  is '麻醉医师姓名';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_level
  is '手术级别';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_classification
  is '切口分类';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_wound_grade
  is '手术切口等级';
comment on column CDR_EMR_SM_SURGERYRECORD.bleeding_volume
  is '出血量';
comment on column CDR_EMR_SM_SURGERYRECORD.blood_transfusion_volume
  is '输血量';
comment on column CDR_EMR_SM_SURGERYRECORD.anesthesia_type
  is '麻醉方式';
comment on column CDR_EMR_SM_SURGERYRECORD.anesthesia_type_code
  is '麻醉方式编码';
comment on column CDR_EMR_SM_SURGERYRECORD.breathing_type
  is '呼吸类型';
comment on column CDR_EMR_SM_SURGERYRECORD.breathing_type_code
  is '呼吸类型代码';
comment on column CDR_EMR_SM_SURGERYRECORD.anesthesia_begintime
  is '麻醉开始时间';
comment on column CDR_EMR_SM_SURGERYRECORD.anesthesia_endtime
  is '麻醉结束时间';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_site_id
  is '手术目标部位代码';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_site
  is '手术目标部位名称';
comment on column CDR_EMR_SM_SURGERYRECORD.preoperative_diagnosis
  is '术前诊断';
comment on column CDR_EMR_SM_SURGERYRECORD.postoperative_diagnosis
  is '术后诊断';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_name
  is '手术名称';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_material
  is '介入物名称';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_site_code
  is '手术体位代码';
comment on column CDR_EMR_SM_SURGERYRECORD.operation_site_name
  is '手术体位名称';
comment on column CDR_EMR_SM_SURGERYRECORD.disinfection_desc
  is '皮肤消毒描述';
comment on column CDR_EMR_SM_SURGERYRECORD.incision_desc
  is '手术切口描述';
comment on column CDR_EMR_SM_SURGERYRECORD.stime
  is '手术持续时间(分钟)，院感接口新增';
comment on column CDR_EMR_SM_SURGERYRECORD.in_surgery_items
  is '术中所用物品名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrol_time_bfclose
  is '关前巡台时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrolid_bfclose
  is '关前巡台护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.enur_patrol_name_bfclose
  is '关前巡台护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrument_time_bfclose
  is '关前器械护士签字时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrumentid_bfclose
  is '关前器械护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrument_name_bfclose
  is '关前器械护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrol_time_afclose
  is '关后巡台时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_patrolid_afclose
  is '关后巡台护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.enur_patrol_name_afclose
  is '关后巡台护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrument_time_afclose
  is '关后器械护士签字时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrumentid_afclose
  is '关后器械护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_instrument_name_afclose
  is '关后器械护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_handover_time_afop
  is '术后交接护士交接时间';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_handoverid_afop
  is '术后交接护士编码';
comment on column CDR_EMR_SM_SURGERYRECORD.nur_handovername_afop
  is '术后交接护士名称';
comment on column CDR_EMR_SM_SURGERYRECORD.transportor_code_afop
  is '术后转运者编码';
comment on column CDR_EMR_SM_SURGERYRECORD.transportor_name_afop
  is '术后转运者姓名';
comment on column CDR_EMR_SM_SURGERYRECORD.last_update_time
  is '最后修改时间';
comment on column CDR_EMR_SM_SURGERYRECORD.secend_assistant_name
  is '第二助手';
comment on column CDR_EMR_SM_SURGERYRECORD.surgery_code
  is '手术编码';
comment on column CDR_EMR_SM_SURGERYRECORD.preoperative_diagnostic_code
  is '术前诊断编码';
comment on column CDR_EMR_SM_SURGERYRECORD.operating_room_number
  is '手术室编号';
comment on column CDR_EMR_SM_SURGERYRECORD.surgical_scheduling_time
  is '手术排班时间';







create table CDR_EMR_SPECIALEXAMANDTREAT_CONSENT
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(50) not null,
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visittimes              INTEGER,
    inpatient_no            VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              INTEGER,
    age                     VARCHAR2(20),
    bed_no                  VARCHAR2(20),
    room_no                 VARCHAR2(20),
    dept_no                 VARCHAR2(20),
    dept_name               VARCHAR2(50),
    ward_no                 VARCHAR2(20),
    ward_name               VARCHAR2(50),
    record_createdate       DATE,
    record_personid         VARCHAR2(20),
    record_person           VARCHAR2(50),
    author_sign_date        DATE,
    author_doc_code         VARCHAR2(10),
    author_doc_name         VARCHAR2(20),
    charge_doctor_signtime  DATE,
    charge_doctorid         VARCHAR2(16),
    charge_doctor           VARCHAR2(16),
    patient_sign_tiem       DATE,
    patient_sign            VARCHAR2(36),
    agent_signdate          DATE,
    agent_sign              VARCHAR2(36),
    agent_relationship      VARCHAR2(50),
    agent_relationship_code VARCHAR2(2),
    special_treat_item      VARCHAR2(50),
    special_treat_purpose   VARCHAR2(500),
    alternatives            VARCHAR2(500),
    special_treat_risk      VARCHAR2(1000),
    operation_org_advice    VARCHAR2(100),
    patient_option          VARCHAR2(64),
    last_update_time        DATE
)
 ;
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.group_code
  is '集团编码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.organization_code
  is '组织编码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.gendercode
  is '性别代码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.age
  is '年龄';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.bed_no
  is '床位号';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.room_no
  is '病房号';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.record_personid
  is '文档作者编码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.record_person
  is '文档作者';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.author_sign_date
  is '治疗同意书文档书写签署日期';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.author_doc_code
  is '治疗同意书文档作者编码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.author_doc_name
  is '治疗同意书文档作者名称';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.charge_doctor_signtime
  is '责任医师签署日期';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.charge_doctorid
  is '责任医生编号';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.charge_doctor
  is '责任医生姓名';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.patient_sign_tiem
  is '患者签名日期时间';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.patient_sign
  is '患者签名';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.agent_signdate
  is '患者代理人签名时间';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.agent_sign
  is '患者代理人签名';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.agent_relationship
  is '患者代理人关系';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.agent_relationship_code
  is '患者代理人关系代码';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.special_treat_item
  is '特殊检查及特殊治疗项目名称';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.special_treat_purpose
  is '特殊检查及特殊治疗目的';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.alternatives
  is '替代方案';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.special_treat_risk
  is '特殊检查及特殊治疗可能引起的并发症及风险';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.operation_org_advice
  is '医疗机构的意见';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.patient_option
  is '患者的意见';
comment on column CDR_EMR_SPECIALEXAMANDTREAT_CONSENT.last_update_time
  is '最后修改时间';






create table CDR_EMR_STAGERECORD_SUMMARY
(
    group_code                     VARCHAR2(20),
    organization_code              VARCHAR2(20),
    domain_id                      VARCHAR2(2),
    unicode                        VARCHAR2(100) not null,
    patient_id                     VARCHAR2(36),
    visit_no                       VARCHAR2(36),
    visittimes                     INTEGER,
    inpatient_no                   VARCHAR2(36),
    patient_name                   VARCHAR2(20),
    gendercode                     INTEGER,
    age                            VARCHAR2(20),
    bed_no                         VARCHAR2(20),
    room_no                        VARCHAR2(20),
    dept_no                        VARCHAR2(20),
    dept_name                      VARCHAR2(50),
    ward_no                        VARCHAR2(20),
    ward_name                      VARCHAR2(50),
    record_createdate              DATE,
    record_personid                VARCHAR2(20),
    record_person                  VARCHAR2(50),
    assigned_time                  DATE,
    assigned_doc_id                VARCHAR2(10),
    assigned_doc_name              VARCHAR2(20),
    illness                        VARCHAR2(500),
    current_situation              VARCHAR2(3000),
    currdiag_wm                    VARCHAR2(1500),
    currdiag_tcm                   VARCHAR2(100),
    currdiag_tcm_syndromename      VARCHAR2(100),
    tcm_observations               VARCHAR2(500),
    future_treatment_options       VARCHAR2(4000),
    therapeutic_principleandmethod VARCHAR2(500),
    doctoradvice                   VARCHAR2(4000),
    tcm_decocting_ways             VARCHAR2(16),
    tcm_medication                 VARCHAR2(16),
    treatment_process_description  VARCHAR2(4000),
    last_update_time               DATE
)
 ;
comment on column CDR_EMR_STAGERECORD_SUMMARY.group_code
  is '集团编码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.organization_code
  is '组织编码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.domain_id
  is '系统域标识';
comment on column CDR_EMR_STAGERECORD_SUMMARY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_STAGERECORD_SUMMARY.patient_id
  is '个人标识号';
comment on column CDR_EMR_STAGERECORD_SUMMARY.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_STAGERECORD_SUMMARY.visittimes
  is '就诊次数';
comment on column CDR_EMR_STAGERECORD_SUMMARY.inpatient_no
  is '住院号';
comment on column CDR_EMR_STAGERECORD_SUMMARY.patient_name
  is '患者姓名';
comment on column CDR_EMR_STAGERECORD_SUMMARY.gendercode
  is '性别代码代码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.age
  is '年龄';
comment on column CDR_EMR_STAGERECORD_SUMMARY.bed_no
  is '床位号';
comment on column CDR_EMR_STAGERECORD_SUMMARY.room_no
  is '病房号';
comment on column CDR_EMR_STAGERECORD_SUMMARY.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_STAGERECORD_SUMMARY.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_STAGERECORD_SUMMARY.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_STAGERECORD_SUMMARY.record_personid
  is '文档作者编码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.record_person
  is '文档作者';
comment on column CDR_EMR_STAGERECORD_SUMMARY.assigned_time
  is '审核日期时间';
comment on column CDR_EMR_STAGERECORD_SUMMARY.assigned_doc_id
  is '审核医生编码';
comment on column CDR_EMR_STAGERECORD_SUMMARY.assigned_doc_name
  is '审核医生姓名';
comment on column CDR_EMR_STAGERECORD_SUMMARY.illness
  is '主诉';
comment on column CDR_EMR_STAGERECORD_SUMMARY.current_situation
  is '目前情况';
comment on column CDR_EMR_STAGERECORD_SUMMARY.currdiag_wm
  is '目前诊断-西医诊断名称';
comment on column CDR_EMR_STAGERECORD_SUMMARY.currdiag_tcm
  is '目前诊断-中医病名';
comment on column CDR_EMR_STAGERECORD_SUMMARY.currdiag_tcm_syndromename
  is '目前诊断-中医证候名称';
comment on column CDR_EMR_STAGERECORD_SUMMARY.tcm_observations
  is '中医“四诊”观察结果';
comment on column CDR_EMR_STAGERECORD_SUMMARY.future_treatment_options
  is '今后治疗方案';
comment on column CDR_EMR_STAGERECORD_SUMMARY.therapeutic_principleandmethod
  is '治则治法';
comment on column CDR_EMR_STAGERECORD_SUMMARY.doctoradvice
  is '医嘱内容';
comment on column CDR_EMR_STAGERECORD_SUMMARY.tcm_decocting_ways
  is '中药煎煮方法';
comment on column CDR_EMR_STAGERECORD_SUMMARY.tcm_medication
  is '中药用药方法';
comment on column CDR_EMR_STAGERECORD_SUMMARY.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_EMR_STAGERECORD_SUMMARY.last_update_time
  is '最后修改时间';






create table CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    unicode                  VARCHAR2(50) not null,
    patient_id               VARCHAR2(36),
    visit_no                 VARCHAR2(36),
    visittimes               INTEGER,
    inpatient_no             VARCHAR2(36),
    patient_name             VARCHAR2(20),
    gendercode               INTEGER,
    age                      VARCHAR2(20),
    bed_no                   VARCHAR2(20),
    room_no                  VARCHAR2(20),
    dept_no                  VARCHAR2(20),
    dept_name                VARCHAR2(50),
    ward_no                  VARCHAR2(20),
    ward_name                VARCHAR2(50),
    record_createdate        DATE,
    record_personid          VARCHAR2(20),
    record_person            VARCHAR2(50),
    doctor_directorid        VARCHAR2(12),
    doctor_director          VARCHAR2(1000),
    doctor_director_signdate DATE,
    charge_doctor_id         VARCHAR2(12),
    charge_doctor            VARCHAR2(36),
    charge_doctor_signdate   DATE,
    record_datetime          DATE,
    ward_round_records       VARCHAR2(4000),
    last_update_time         DATE
)
 ;
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.group_code
  is '集团编码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.organization_code
  is '组织编码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.domain_id
  is '系统域标识';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.patient_id
  is '个人标识号';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.visittimes
  is '就诊次数';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.inpatient_no
  is '住院号';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.patient_name
  is '患者姓名';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.gendercode
  is '性别代码代码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.age
  is '年龄';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.bed_no
  is '床位号';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.room_no
  is '病房号';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.record_personid
  is '文档作者编码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.record_person
  is '文档作者';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.doctor_directorid
  is '主任医师编号';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.doctor_director
  is '主任医师';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.doctor_director_signdate
  is '主任医师签字日期';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.charge_doctor_id
  is '主治医师编码';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.charge_doctor
  is '主治医师名称';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.charge_doctor_signdate
  is '主治医师签名日期';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.record_datetime
  is '查房记录日期时间';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.ward_round_records
  is '查房记录';
comment on column CDR_EMR_SUPERIORDOCTORS_WARDINSPECTION.last_update_time
  is '最后修改时间';






create table CDR_EMR_SURGICAL_NURSERECORD
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    patient_id             VARCHAR2(36),
    visit_no               VARCHAR2(36),
    visittimes             INTEGER,
    inpatient_no           VARCHAR2(36),
    patient_name           VARCHAR2(20),
    gendercode             INTEGER,
    age                    VARCHAR2(20),
    bed_no                 VARCHAR2(20),
    room_no                VARCHAR2(20),
    dept_no                VARCHAR2(20),
    dept_name              VARCHAR2(50),
    ward_no                VARCHAR2(20),
    ward_name              VARCHAR2(50),
    record_createdate      DATE,
    record_personid        VARCHAR2(20),
    record_person          VARCHAR2(50),
    weight                 NUMBER(3),
    abo_blood_type         NUMBER,
    abo_blood_name         VARCHAR2(50),
    rh_blood_type          NUMBER,
    rh_blood_name          VARCHAR2(50),
    skin_check             VARCHAR2(200),
    nurse_level_code       NUMBER,
    nurse_level            VARCHAR2(50),
    nurse_type_code        NUMBER,
    nurse_type             VARCHAR2(50),
    nurse_observed_item    VARCHAR2(200),
    nurse_observed_resulit VARCHAR2(200),
    nurse_operate_name     VARCHAR2(200),
    nurse_operate_item     VARCHAR2(200),
    nurse_operate_result   VARCHAR2(200),
    operationroom_in_time  DATE,
    operationroom_out_time DATE,
    last_update_time       DATE
)
 ;
comment on column CDR_EMR_SURGICAL_NURSERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_SURGICAL_NURSERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_SURGICAL_NURSERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_SURGICAL_NURSERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_SURGICAL_NURSERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_SURGICAL_NURSERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_SURGICAL_NURSERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_SURGICAL_NURSERECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.age
  is '年龄';
comment on column CDR_EMR_SURGICAL_NURSERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_SURGICAL_NURSERECORD.room_no
  is '病房号';
comment on column CDR_EMR_SURGICAL_NURSERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_SURGICAL_NURSERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_SURGICAL_NURSERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_SURGICAL_NURSERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_SURGICAL_NURSERECORD.weight
  is '体重';
comment on column CDR_EMR_SURGICAL_NURSERECORD.abo_blood_type
  is 'ABO血型代码';
comment on column CDR_EMR_SURGICAL_NURSERECORD.abo_blood_name
  is 'ABO血型';
comment on column CDR_EMR_SURGICAL_NURSERECORD.rh_blood_type
  is 'Rh血型代码  ';
comment on column CDR_EMR_SURGICAL_NURSERECORD.rh_blood_name
  is 'Rh血型';
comment on column CDR_EMR_SURGICAL_NURSERECORD.skin_check
  is '皮肤检查描述';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_level_code
  is '护理等级代码， ';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_level
  is '护理等级 ';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_type_code
  is '护理类型代码， ';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_type
  is '护理类型';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_observed_item
  is '护理观察项目名称';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_observed_resulit
  is '护理观察结果';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_operate_name
  is '护理操作名称';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_operate_item
  is '护理操作项目类目名称';
comment on column CDR_EMR_SURGICAL_NURSERECORD.nurse_operate_result
  is '护理操作结果';
comment on column CDR_EMR_SURGICAL_NURSERECORD.operationroom_in_time
  is '入手术室日期时间';
comment on column CDR_EMR_SURGICAL_NURSERECORD.operationroom_out_time
  is '出手术室日期时间';
comment on column CDR_EMR_SURGICAL_NURSERECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_THERAPYRECORD
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    unicode                    VARCHAR2(100) not null,
    patient_id                 VARCHAR2(36),
    visit_no                   VARCHAR2(36),
    visittimes                 INTEGER,
    inpatient_no               VARCHAR2(36),
    patient_name               VARCHAR2(20),
    gendercode                 INTEGER,
    age                        VARCHAR2(20),
    dept_no                    VARCHAR2(20),
    dept_name                  VARCHAR2(50),
    ward_no                    VARCHAR2(20),
    ward_name                  VARCHAR2(50),
    record_createdate          DATE,
    record_personid            VARCHAR2(20),
    record_person              VARCHAR2(50),
    is_invasive                NUMBER,
    doctoradvice               VARCHAR2(4000),
    treatment_project          VARCHAR2(4000),
    treatment_name             VARCHAR2(4000),
    effect_judge               VARCHAR2(500),
    future_treatment_solutions VARCHAR2(4000),
    revoke_time                DATE,
    last_modify_time           DATE,
    delete_flag                NUMBER(1),
    last_update_time           DATE
)
 ;
comment on column CDR_EMR_THERAPYRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_THERAPYRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_THERAPYRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_THERAPYRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_THERAPYRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_THERAPYRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_THERAPYRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_THERAPYRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_THERAPYRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_THERAPYRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_THERAPYRECORD.age
  is '年龄';
comment on column CDR_EMR_THERAPYRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_THERAPYRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_THERAPYRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_THERAPYRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_THERAPYRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_THERAPYRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_THERAPYRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_THERAPYRECORD.is_invasive
  is '有创诊疗操作标志';
comment on column CDR_EMR_THERAPYRECORD.doctoradvice
  is '处理及指导意见';
comment on column CDR_EMR_THERAPYRECORD.treatment_project
  is '治疗方案';
comment on column CDR_EMR_THERAPYRECORD.treatment_name
  is '治疗项目';
comment on column CDR_EMR_THERAPYRECORD.effect_judge
  is '效果评价';
comment on column CDR_EMR_THERAPYRECORD.future_treatment_solutions
  is '今后治疗方案';
comment on column CDR_EMR_THERAPYRECORD.revoke_time
  is '撤销时间';
comment on column CDR_EMR_THERAPYRECORD.last_modify_time
  is '编辑时间';
comment on column CDR_EMR_THERAPYRECORD.delete_flag
  is '修改标志';
comment on column CDR_EMR_THERAPYRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_TRANSFERREDRECORD
(
    group_code                VARCHAR2(20) not null,
    organization_code         VARCHAR2(20) not null,
    domain_id                 VARCHAR2(2) not null,
    unicode                   VARCHAR2(50) not null,
    patient_id                VARCHAR2(36) not null,
    visit_no                  VARCHAR2(36) not null,
    visittimes                NUMBER not null,
    inpatient_no              VARCHAR2(36) not null,
    patient_name              VARCHAR2(20) not null,
    gendercode                NUMBER not null,
    age                       VARCHAR2(20) not null,
    bed_no                    VARCHAR2(20) not null,
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20) not null,
    dept_name                 VARCHAR2(50) not null,
    ward_no                   VARCHAR2(50) not null,
    ward_name                 VARCHAR2(50) not null,
    record_createdate         DATE not null,
    record_personid           VARCHAR2(20) not null,
    record_person             VARCHAR2(50) not null,
    illness                   VARCHAR2(2000) not null,
    admission_hospital_state  VARCHAR2(2000) not null,
    admiission_diag           VARCHAR2(300) not null,
    admiission_diag_code      VARCHAR2(300) not null,
    treatment_process         VARCHAR2(4000) not null,
    current_situation         VARCHAR2(3000) not null,
    current_diag              VARCHAR2(2000) not null,
    treatment_plan            VARCHAR2(4000) not null,
    notices                   VARCHAR2(3000) not null,
    transfer_out_departmentid VARCHAR2(10) not null,
    transfer_out_department   VARCHAR2(50) not null,
    transfer_out_area_code    VARCHAR2(10) not null,
    transfer_out_area         VARCHAR2(50) not null,
    shift_to_departmentid     VARCHAR2(10) not null,
    shift_to_department       VARCHAR2(50) not null,
    shift_to_area_code        VARCHAR2(10) not null,
    transfer_purpose          VARCHAR2(2000) not null,
    transfer_out_record       VARCHAR2(30),
    transfer_out_recordcode   NUMBER
)
 ;
comment on column CDR_EMR_TRANSFERREDRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_TRANSFERREDRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_TRANSFERREDRECORD.domain_id
  is '系统域标识01门诊02住院
03体检
04急诊';
comment on column CDR_EMR_TRANSFERREDRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_TRANSFERREDRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_TRANSFERREDRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_TRANSFERREDRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_TRANSFERREDRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_TRANSFERREDRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_TRANSFERREDRECORD.gendercode
  is '性别代码代码0未知的性别代码，1 男性，2女性，9未说明的性别代码';
comment on column CDR_EMR_TRANSFERREDRECORD.age
  is '年龄';
comment on column CDR_EMR_TRANSFERREDRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_TRANSFERREDRECORD.room_no
  is '病房号';
comment on column CDR_EMR_TRANSFERREDRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_TRANSFERREDRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_TRANSFERREDRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_TRANSFERREDRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_TRANSFERREDRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_TRANSFERREDRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_TRANSFERREDRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_TRANSFERREDRECORD.illness
  is '主诉';
comment on column CDR_EMR_TRANSFERREDRECORD.admission_hospital_state
  is '入院情况';
comment on column CDR_EMR_TRANSFERREDRECORD.admiission_diag
  is '入院诊断-西医诊断名称';
comment on column CDR_EMR_TRANSFERREDRECORD.admiission_diag_code
  is '入院诊断-西医诊断代码';
comment on column CDR_EMR_TRANSFERREDRECORD.treatment_process
  is '治疗经过';
comment on column CDR_EMR_TRANSFERREDRECORD.current_situation
  is '目前情况';
comment on column CDR_EMR_TRANSFERREDRECORD.current_diag
  is '目前诊断';
comment on column CDR_EMR_TRANSFERREDRECORD.treatment_plan
  is '转入诊疗计划';
comment on column CDR_EMR_TRANSFERREDRECORD.notices
  is '注意事项';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_out_departmentid
  is '转出科室编码';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_out_department
  is '转出科室名称';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_out_area_code
  is '转出病区代码';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_out_area
  is '转出病区名称';
comment on column CDR_EMR_TRANSFERREDRECORD.shift_to_departmentid
  is '转入科室编码';
comment on column CDR_EMR_TRANSFERREDRECORD.shift_to_department
  is '转入科室名称';
comment on column CDR_EMR_TRANSFERREDRECORD.shift_to_area_code
  is '转入病区代码';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_purpose
  is '转科目的';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_out_record
  is '转科记录类型1	转入记录
2	转出记录';
comment on column CDR_EMR_TRANSFERREDRECORD.transfer_out_recordcode
  is '转科记录类型代码表';





create table CDR_EMR_TRANSFUSION_THERAPYCONSENT
(
    group_code                VARCHAR2(20),
    organization_code         VARCHAR2(20),
    domain_id                 VARCHAR2(2),
    unicode                   VARCHAR2(50) not null,
    patient_id                VARCHAR2(36),
    visit_no                  VARCHAR2(36),
    visittimes                INTEGER,
    inpatient_no              VARCHAR2(36),
    patient_name              VARCHAR2(20),
    gendercode                INTEGER,
    age                       VARCHAR2(20),
    bed_no                    VARCHAR2(20),
    room_no                   VARCHAR2(20),
    dept_no                   VARCHAR2(20),
    dept_name                 VARCHAR2(50),
    ward_no                   VARCHAR2(20),
    ward_name                 VARCHAR2(50),
    record_createdate         DATE,
    record_personid           VARCHAR2(20),
    record_person             VARCHAR2(50),
    attending_doctor_signdate DATE,
    attending_doctorid        VARCHAR2(12),
    attending_doctor          VARCHAR2(36),
    assigned_time             DATE,
    assigned_doc_id           VARCHAR2(10),
    assigned_doc_name         VARCHAR2(20),
    patient_sign_tiem         DATE,
    patient_sign              VARCHAR2(36),
    agent_signdate            DATE,
    agent_sign                VARCHAR2(36),
    agent_relationship        VARCHAR2(50),
    agent_relationship_code   VARCHAR2(2),
    isblood_trans_code        VARCHAR2(2),
    isblood_trans_name        VARCHAR2(8),
    blood_trans_date          DATE,
    blood_trans_ways          VARCHAR2(200),
    blood_trans_indication    VARCHAR2(200),
    blood_trans_type          VARCHAR2(2),
    blood_trans_name          VARCHAR2(50),
    hbsag                     VARCHAR2(50),
    hbsab                     VARCHAR2(50),
    hbeag                     VARCHAR2(50),
    hbeab                     VARCHAR2(20),
    hbcab                     VARCHAR2(20),
    alt                       VARCHAR2(20),
    syphilis                  VARCHAR2(20),
    anti_hiv_half             VARCHAR2(20),
    anti_hcv                  VARCHAR2(20),
    operation_org_advice      VARCHAR2(100),
    patient_option            VARCHAR2(1024),
    blood_trans_unexpected    VARCHAR2(512),
    last_update_time          DATE
)
 ;
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.group_code
  is '集团编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.organization_code
  is '组织编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.domain_id
  is '系统域标识';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.patient_id
  is '个人标识号';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.visittimes
  is '就诊次数';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.inpatient_no
  is '住院号';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.patient_name
  is '患者姓名';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.gendercode
  is '性别代码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.age
  is '年龄';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.bed_no
  is '床位号';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.room_no
  is '病房号';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.record_personid
  is '文档作者编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.record_person
  is '文档作者';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.attending_doctor_signdate
  is '经治医师签名时间';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.attending_doctorid
  is '经治医师编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.attending_doctor
  is '经治医师签名';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.assigned_time
  is '审核日期时间';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.assigned_doc_id
  is '审核医生编码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.assigned_doc_name
  is '审核医生姓名';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.patient_sign_tiem
  is '患者签名日期时间';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.patient_sign
  is '患者签名';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.agent_signdate
  is '患者代理人签名时间';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.agent_sign
  is '患者代理人签名';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.agent_relationship
  is '患者代理人关系';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.agent_relationship_code
  is '患者代理人关系代码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.isblood_trans_code
  is '输血史标志';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.isblood_trans_name
  is '是否有输血史';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.blood_trans_date
  is '输血时间';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.blood_trans_ways
  is '输血方式';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.blood_trans_indication
  is '输血指征';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.blood_trans_type
  is '输血品种代码';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.blood_trans_name
  is '输血品种';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.hbsag
  is '乙型肝炎表面抗原，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.hbsab
  is '乙型肝炎表面抗体，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.hbeag
  is '乙型肝炎病毒抗原，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.hbeab
  is '乙型肝炎病毒抗体，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.hbcab
  is '乙型肝炎病毒核心抗体，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.alt
  is '谷丙转氨酶，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.syphilis
  is '梅毒，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.anti_hiv_half
  is '抗艾滋病毒，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.anti_hcv
  is '抗丙肝病毒，输血前有关检查项目';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.operation_org_advice
  is '医疗机构的意见';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.patient_option
  is '患者的意见';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.blood_trans_unexpected
  is '输血风险及可能发生的不良后果';
comment on column CDR_EMR_TRANSFUSION_THERAPYCONSENT.last_update_time
  is '最后修改时间';






create table CDR_EMR_VAGINAL_DELIVERYRECORD
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    unicode                     VARCHAR2(30) not null,
    patient_id                  VARCHAR2(36),
    visit_no                    VARCHAR2(36),
    visittimes                  INTEGER,
    inpatient_no                VARCHAR2(36),
    patient_name                VARCHAR2(20),
    gendercode                  INTEGER,
    age                         VARCHAR2(20),
    bed_no                      VARCHAR2(20),
    room_no                     VARCHAR2(20),
    dept_no                     VARCHAR2(20),
    dept_name                   VARCHAR2(50),
    ward_no                     VARCHAR2(20),
    ward_name                   VARCHAR2(50),
    record_createdate           DATE,
    record_personid             VARCHAR2(20),
    record_person               VARCHAR2(50),
    midwifery_doctorid          VARCHAR2(20),
    midwifery_doctor_name       VARCHAR2(50),
    midwifery_assist_doctorid   VARCHAR2(20),
    midwifery_assist_doctorname VARCHAR2(50),
    baby_protectorid            VARCHAR2(20),
    baby_protector_name         VARCHAR2(50),
    pregant_no                  INTEGER,
    borned_no                   INTEGER,
    predict_born_date           DATE,
    coming_born_date            DATE,
    membranes_broke_datetime    DATE,
    preamniotic_fluid_condition VARCHAR2(200),
    preamniotic_fluid_volumn    INTEGER,
    contractions_begindate      DATE,
    firstborn_time_spent        INTEGER,
    uterus_fullopen_timespent   DATE,
    secendborn_time_spent       INTEGER,
    babyborn_datetime           DATE,
    thirdborn_time_spent        INTEGER,
    placenta_emerge_datetime    DATE,
    midwifery_fulltime_spent    INTEGER,
    fetal_position              VARCHAR2(50),
    midwifery_assist_method     VARCHAR2(50),
    placenta_emerge_situation   VARCHAR2(500),
    is_fetal_membranes_intact   NUMBER,
    amniotic_fluid_condition    VARCHAR2(200),
    amniotic_fluid_volumn       INTEGER,
    umbilical_cord_length       INTEGER,
    nuchal_cord                 INTEGER,
    medication_birthing         VARCHAR2(200),
    preventive_measure          VARCHAR2(200),
    is_episiotomy               NUMBER,
    episiotomy_site             VARCHAR2(50),
    perineum_suture_number      INTEGER,
    perineum_lace_degree_code   NUMBER,
    is_perineum_hematoma        NUMBER,
    perineum_hematoma_size      VARCHAR2(100),
    perineum_hematoma_handle    VARCHAR2(200),
    anesthesia_type             VARCHAR2(50),
    anesthesia_type_code        VARCHAR2(10),
    anesthesia_drug             VARCHAR2(200),
    cervix_suture               VARCHAR2(500),
    birthing_summary            VARCHAR2(2000),
    condition_contractions      VARCHAR2(2000),
    condition_womb              VARCHAR2(500),
    condition_lochia            VARCHAR2(500),
    condition_perineum          VARCHAR2(2000),
    repairprocedure             VARCHAR2(2000),
    save_cord_blood             NUMBER,
    pressure_systolic           INTEGER,
    pressure_diastolic          INTEGER,
    postpartum_pulse            INTEGER,
    postpartum_rate_heart       INTEGER,
    postpartum_bleeding_volume  INTEGER,
    postpartum_contractions     VARCHAR2(200),
    postpartum_uterus_loc       NUMBER,
    anus_exam                   VARCHAR2(200),
    bdby_sex_id                 NUMBER,
    bdby_weight                 INTEGER,
    bdby_height                 NUMBER(3,1),
    apgar_rating_interval_code  DATE,
    apgar_rating_interval       VARCHAR2(20),
    apgar_score                 INTEGER,
    birthing_result_code        NUMBER,
    baby_abnormal_code          NUMBER,
    last_update_time            DATE
)
 ;
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.group_code
  is '集团编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.gendercode
  is '性别代码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.age
  is '年龄';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.bed_no
  is '床位号';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.room_no
  is '病房号';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.record_person
  is '文档作者';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.midwifery_doctorid
  is '接生者编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.midwifery_doctor_name
  is '接生者姓名';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.midwifery_assist_doctorid
  is '助产者编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.midwifery_assist_doctorname
  is '助产者姓名';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.baby_protectorid
  is '护婴者编码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.baby_protector_name
  is '护婴者姓名';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.pregant_no
  is '孕次';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.borned_no
  is '产次';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.predict_born_date
  is '预产期';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.coming_born_date
  is '临产日期时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.membranes_broke_datetime
  is '胎膜破裂日期时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.preamniotic_fluid_condition
  is '前羊水性状';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.preamniotic_fluid_volumn
  is '前羊水量';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.contractions_begindate
  is '宫缩开始日期时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.firstborn_time_spent
  is '第1产程时长（min）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.uterus_fullopen_timespent
  is '宫口开全日期时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.secendborn_time_spent
  is '第2产程时长（min）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.babyborn_datetime
  is '胎儿娩出日期时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.thirdborn_time_spent
  is '第3产程时长（min）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.placenta_emerge_datetime
  is '胎盘娩出日期时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.midwifery_fulltime_spent
  is '总产程时长（min）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.fetal_position
  is '胎方位';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.midwifery_assist_method
  is '助产方式';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.placenta_emerge_situation
  is '胎盘娩出情况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.is_fetal_membranes_intact
  is '胎膜完整情况标志';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.amniotic_fluid_condition
  is '羊水性状';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.amniotic_fluid_volumn
  is '羊水量（mL）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.umbilical_cord_length
  is '脐带长度（cm）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.nuchal_cord
  is '绕颈身（周）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.medication_birthing
  is '产时用药';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.preventive_measure
  is '预防措施';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.is_episiotomy
  is '产妇会阴切开标志';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.episiotomy_site
  is '会阴切开位置';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.perineum_suture_number
  is '产妇会阴缝合针数';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.perineum_lace_degree_code
  is '产妇会阴裂伤程度,会阴裂伤情况代码表';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.is_perineum_hematoma
  is '会阴血肿标志';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.perineum_hematoma_size
  is '会阴血肿大小';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.perineum_hematoma_handle
  is '会阴血肿处理';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.anesthesia_type
  is '麻醉方法';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.anesthesia_type_code
  is '麻醉方法代码, ';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.anesthesia_drug
  is '麻醉药物名称';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.cervix_suture
  is '宫颈缝合情况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.birthing_summary
  is '分娩过程摘要';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.condition_contractions
  is '宫缩情况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.condition_womb
  is '子宫情况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.condition_lochia
  is '恶露状况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.condition_perineum
  is '会阴情况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.repairprocedure
  is '修补手术过程';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.save_cord_blood
  is '存脐带血情况标志 ';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.pressure_systolic
  is '产后15分钟收缩压';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.pressure_diastolic
  is '产后15分钟舒张压';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.postpartum_pulse
  is '产后15分钟脉搏（次/min ）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.postpartum_rate_heart
  is '产后15分钟心率（次/min ）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.postpartum_bleeding_volume
  is '产后出血量（mL）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.postpartum_contractions
  is '产后宫缩情况';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.postpartum_uterus_loc
  is '产后宫底高度（cm）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.anus_exam
  is '肛查';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.bdby_sex_id
  is '新生儿性别代码代码';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.bdby_weight
  is '新生儿出生体重（g）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.bdby_height
  is '新生儿出生身长（cm）';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.apgar_rating_interval_code
  is 'Apgar评分间隔时间,Apgar评分间隔时间代码表';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.apgar_rating_interval
  is 'Apgar评分间隔时间';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.apgar_score
  is 'Apgar评分值';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.birthing_result_code
  is '分娩结局';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.baby_abnormal_code
  is '新生儿异常情况， ';
comment on column CDR_EMR_VAGINAL_DELIVERYRECORD.last_update_time
  is '最后修改时间';






create table CDR_EMR_VITALSIGNS_MEASURERECORD
(
    group_code                    VARCHAR2(20),
    organization_code             VARCHAR2(20),
    domain_id                     VARCHAR2(2),
    unicode                       VARCHAR2(30) not null,
    patient_id                    VARCHAR2(36),
    visit_no                      VARCHAR2(36),
    visittimes                    INTEGER,
    inpatient_no                  VARCHAR2(36),
    patient_name                  VARCHAR2(20),
    gendercode                    INTEGER,
    age                           VARCHAR2(20),
    bed_no                        VARCHAR2(20),
    room_no                       VARCHAR2(20),
    dept_no                       VARCHAR2(20),
    dept_name                     VARCHAR2(50),
    ward_no                       VARCHAR2(20),
    ward_name                     VARCHAR2(50),
    record_createdate             DATE,
    record_personid               VARCHAR2(20),
    record_person                 VARCHAR2(50),
    rate_respiratory              INTEGER,
    is_use_ventilator             NUMBER,
    pulse                         INTEGER,
    pacemaker_heart_rate          INTEGER,
    temperature                   NUMBER(4,2),
    pressure_systolic             INTEGER,
    pressure_diastolic            INTEGER,
    weight                        NUMBER(4,2),
    weight_unit                   VARCHAR2(10),
    ac                            NUMBER(4,2),
    nurse_observed_item_first     VARCHAR2(200),
    nurse_observed_resulit_first  VARCHAR2(1500),
    nurse_observed_item_second    VARCHAR2(200),
    nurse_observed_resulit_second VARCHAR2(200),
    nurse_observed_item_third     VARCHAR2(200),
    nurse_observed_resulit_third  VARCHAR2(200),
    last_update_time              DATE
);




















comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.group_code
  is '集团编码';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.organization_code
  is '组织编码';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.domain_id
  is '系统域标识';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.patient_id
  is '个人标识号';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.visit_no
  is '住院就诊流水号';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.visittimes
  is '就诊次数';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.inpatient_no
  is '住院号';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.patient_name
  is '患者姓名';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.gendercode
  is '性别代码代码';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.age
  is '年龄';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.bed_no
  is '床位号';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.room_no
  is '病房号';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.dept_no
  is '患者所在科室编码';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.dept_name
  is '患者所在科室名称';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.ward_no
  is '患者所在病区编码';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.ward_name
  is '患者所在病区名称';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.record_createdate
  is '记录创建日期';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.record_personid
  is '文档作者编码';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.record_person
  is '文档作者';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.rate_respiratory
  is '呼吸频率';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.is_use_ventilator
  is '使用呼吸机标志 ';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.pulse
  is '脉率（次/min）  ';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.pacemaker_heart_rate
  is '起搏器心率（次/min）';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.temperature
  is '体温（℃）';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.pressure_systolic
  is '收缩压';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.pressure_diastolic
  is '舒张压';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.weight
  is '体重';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.weight_unit
  is '体重单位';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.ac
  is '腹围（cm）';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.nurse_observed_item_first
  is '护理观察项目名称1';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.nurse_observed_resulit_first
  is '护理观察结果1';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.nurse_observed_item_second
  is '护理观察项目名称2';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.nurse_observed_resulit_second
  is '护理观察结果2';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.nurse_observed_item_third
  is '护理观察项目名称3';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.nurse_observed_resulit_third
  is '护理观察结果3';
comment on column CDR_EMR_VITALSIGNS_MEASURERECORD.last_update_time
  is '最后修改时间';






create table CDR_EQUIP_IN_OUT
(
    unicode         VARCHAR2(100) not null,
    supplier        VARCHAR2(200),
    amount          VARCHAR2(100),
    invoice_amount  VARCHAR2(100),
    filling_person  VARCHAR2(100),
    createtime      DATE,
    check_person    VARCHAR2(100),
    check_time      DATE,
    accounting_date DATE,
    check_period    VARCHAR2(100),
    id              VARCHAR2(100),
    no              VARCHAR2(100)
)
 ;
comment on column CDR_EQUIP_IN_OUT.unicode
  is '唯一主键';
comment on column CDR_EQUIP_IN_OUT.supplier
  is '供应商';
comment on column CDR_EQUIP_IN_OUT.amount
  is '金额';
comment on column CDR_EQUIP_IN_OUT.invoice_amount
  is '发票金额';
comment on column CDR_EQUIP_IN_OUT.filling_person
  is '填制人';
comment on column CDR_EQUIP_IN_OUT.createtime
  is '填制日期';
comment on column CDR_EQUIP_IN_OUT.check_person
  is '审核人';
comment on column CDR_EQUIP_IN_OUT.check_time
  is '审核日期';
comment on column CDR_EQUIP_IN_OUT.accounting_date
  is '会计日期';
comment on column CDR_EQUIP_IN_OUT.check_period
  is '审核期间';
comment on column CDR_EQUIP_IN_OUT.id
  is '主表明细表关联字段';
comment on column CDR_EQUIP_IN_OUT.no
  is '入库编号';








create table CDR_EQUIP_IN_OUT_DETAIL
(
    id                     VARCHAR2(20) not null,
    device_information     VARCHAR2(200),
    specifications         VARCHAR2(200),
    producer               VARCHAR2(500),
    goods_number           VARCHAR2(50),
    invoice_number         VARCHAR2(50),
    invoice_date           DATE,
    unit                   VARCHAR2(50),
    warehousing_number     NUMBER(3),
    invoice_unit_price     NUMBER(18,4),
    invoice_value          NUMBER(18,4),
    trans_miscell_expenses NUMBER(18,4),
    cost_unit_price        NUMBER(18,4),
    cost_amount            NUMBER(18,4),
    invoice_code           VARCHAR2(50),
    unicode                VARCHAR2(50) not null
)
 ;
comment on column CDR_EQUIP_IN_OUT_DETAIL.id
  is '唯一主键和主表关联';
comment on column CDR_EQUIP_IN_OUT_DETAIL.device_information
  is '设备信息';
comment on column CDR_EQUIP_IN_OUT_DETAIL.specifications
  is '规格';
comment on column CDR_EQUIP_IN_OUT_DETAIL.producer
  is '生产商';
comment on column CDR_EQUIP_IN_OUT_DETAIL.goods_number
  is '货物单号';
comment on column CDR_EQUIP_IN_OUT_DETAIL.invoice_number
  is '发票号码';
comment on column CDR_EQUIP_IN_OUT_DETAIL.invoice_date
  is '发票日期';
comment on column CDR_EQUIP_IN_OUT_DETAIL.unit
  is '单位';
comment on column CDR_EQUIP_IN_OUT_DETAIL.warehousing_number
  is '
数量';
comment on column CDR_EQUIP_IN_OUT_DETAIL.invoice_unit_price
  is '发票单价';
comment on column CDR_EQUIP_IN_OUT_DETAIL.invoice_value
  is '发票金额';
comment on column CDR_EQUIP_IN_OUT_DETAIL.trans_miscell_expenses
  is '应摊运杂费';
comment on column CDR_EQUIP_IN_OUT_DETAIL.cost_unit_price
  is '成本单价';
comment on column CDR_EQUIP_IN_OUT_DETAIL.cost_amount
  is '
成本金额
';
comment on column CDR_EQUIP_IN_OUT_DETAIL.invoice_code
  is '发票代码';
comment on column CDR_EQUIP_IN_OUT_DETAIL.unicode
  is '唯一值';





create table CDR_EXAMAPPINFOQUERY
(
    group_code          VARCHAR2(6),
    organization_code   VARCHAR2(9),
    domain_id           VARCHAR2(6),
    hospital_id         VARCHAR2(30),
    hospital_name       VARCHAR2(48),
    outpatient_no       NUMBER(18),
    inpatient_no        NUMBER(18),
    medical_cardno      VARCHAR2(150),
    ehealth_card        VARCHAR2(300),
    clinic_type_code    VARCHAR2(3),
    clinic_type         VARCHAR2(12),
    patient_id          NUMBER(18),
    visittimes          NUMBER,
    visit_no            VARCHAR2(243),
    id_card             VARCHAR2(54),
    insurance_card      VARCHAR2(90),
    patient_name        VARCHAR2(300),
    telecom             VARCHAR2(60),
    gendercode          NUMBER,
    gendername          VARCHAR2(30),
    birthtime           DATE,
    age                 VARCHAR2(612),
    age_unit            VARCHAR2(54),
    address             VARCHAR2(300),
    bed_code            VARCHAR2(30),
    bed_no              VARCHAR2(30),
    room_code           VARCHAR2(30),
    room_no             VARCHAR2(30),
    department_code     NUMBER(18),
    department          VARCHAR2(300),
    ward_code           NUMBER(18),
    ward_name           VARCHAR2(300),
    diag_type_code      VARCHAR2(120),
    diag_type           VARCHAR2(24),
    diag_date           DATE,
    diagnosis_code      VARCHAR2(120),
    diagnosis           VARCHAR2(1500),
    author_time         DATE,
    apply_doc_signid    VARCHAR2(765),
    apply_doc_id        NUMBER(18),
    apply_doc_name      VARCHAR2(60),
    apply_dept_code     NUMBER(18) not null,
    apply_dept_name     VARCHAR2(300) not null,
    assigned_time       DATE,
    assigned_doc_id     NUMBER(18),
    assigned_doc_name   VARCHAR2(60),
    applicationno       NUMBER,
    unicode             NUMBER not null,
    apply_desc          VARCHAR2(3000),
    apply_state         VARCHAR2(24),
    apply_effective_b   DATE,
    apply_effective_e   DATE,
    priority_code       VARCHAR2(765),
    priority            VARCHAR2(765),
    lis_sample_id       VARCHAR2(765),
    lis_sample_typecode VARCHAR2(6),
    lis_sample_type     VARCHAR2(180),
    blood_sampling      NUMBER,
    order_id            NUMBER,
    lis_item_code       VARCHAR2(60),
    lis_item_name       VARCHAR2(180),
    lis_methodcode      VARCHAR2(765),
    lis_method          VARCHAR2(765),
    lis_effective_date  DATE,
    exec_dept_code      NUMBER(18) not null,
    exec_dept_name      VARCHAR2(300) not null,
    notice              VARCHAR2(600),
    urgentflag          VARCHAR2(15),
    creattime           DATE,
    charge_status       NUMBER,
    external_inspection NUMBER,
    bar_code            VARCHAR2(54),
    tube_color          VARCHAR2(24)
)   ;
comment on column CDR_EXAMAPPINFOQUERY.group_code
  is '集团编码';
comment on column CDR_EXAMAPPINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_EXAMAPPINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_EXAMAPPINFOQUERY.hospital_id
  is '医疗机构代码';
comment on column CDR_EXAMAPPINFOQUERY.hospital_name
  is '医疗机构';
comment on column CDR_EXAMAPPINFOQUERY.outpatient_no
  is '门急诊号';
comment on column CDR_EXAMAPPINFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_EXAMAPPINFOQUERY.medical_cardno
  is '患者就诊卡号';
comment on column CDR_EXAMAPPINFOQUERY.ehealth_card
  is '电子健康卡号';
comment on column CDR_EXAMAPPINFOQUERY.clinic_type_code
  is '就诊类别代码';
comment on column CDR_EXAMAPPINFOQUERY.clinic_type
  is '就诊类别名称';
comment on column CDR_EXAMAPPINFOQUERY.patient_id
  is '患者ID';
comment on column CDR_EXAMAPPINFOQUERY.visittimes
  is '就诊次数';
comment on column CDR_EXAMAPPINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_EXAMAPPINFOQUERY.id_card
  is '患者身份证号';
comment on column CDR_EXAMAPPINFOQUERY.insurance_card
  is '患者医保卡号';
comment on column CDR_EXAMAPPINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_EXAMAPPINFOQUERY.telecom
  is '患者电话';
comment on column CDR_EXAMAPPINFOQUERY.gendercode
  is '性别代码';
comment on column CDR_EXAMAPPINFOQUERY.gendername
  is '性别名称';
comment on column CDR_EXAMAPPINFOQUERY.birthtime
  is '出生日期';
comment on column CDR_EXAMAPPINFOQUERY.age
  is '年龄';
comment on column CDR_EXAMAPPINFOQUERY.age_unit
  is '年龄单位';
comment on column CDR_EXAMAPPINFOQUERY.address
  is '地址';
comment on column CDR_EXAMAPPINFOQUERY.bed_code
  is '病床编码';
comment on column CDR_EXAMAPPINFOQUERY.bed_no
  is '病床号';
comment on column CDR_EXAMAPPINFOQUERY.room_code
  is '病房编号';
comment on column CDR_EXAMAPPINFOQUERY.room_no
  is '病房号';
comment on column CDR_EXAMAPPINFOQUERY.department_code
  is '科室代码';
comment on column CDR_EXAMAPPINFOQUERY.department
  is '科室名称';
comment on column CDR_EXAMAPPINFOQUERY.ward_code
  is '病区代码';
comment on column CDR_EXAMAPPINFOQUERY.ward_name
  is '病区名称';
comment on column CDR_EXAMAPPINFOQUERY.diag_type_code
  is '诊断类别编码';
comment on column CDR_EXAMAPPINFOQUERY.diag_type
  is '诊断类别名称';
comment on column CDR_EXAMAPPINFOQUERY.diag_date
  is '诊断时间';
comment on column CDR_EXAMAPPINFOQUERY.diagnosis_code
  is '疾病编码';
comment on column CDR_EXAMAPPINFOQUERY.diagnosis
  is '疾病名称';
comment on column CDR_EXAMAPPINFOQUERY.author_time
  is '开单日期时间';
comment on column CDR_EXAMAPPINFOQUERY.apply_doc_signid
  is '开立者签名';
comment on column CDR_EXAMAPPINFOQUERY.apply_doc_id
  is '开立者ID ';
comment on column CDR_EXAMAPPINFOQUERY.apply_doc_name
  is '开立者姓名';
comment on column CDR_EXAMAPPINFOQUERY.apply_dept_code
  is '开立科室代码';
comment on column CDR_EXAMAPPINFOQUERY.apply_dept_name
  is '开立科室名称';
comment on column CDR_EXAMAPPINFOQUERY.assigned_time
  is '审核日期时间';
comment on column CDR_EXAMAPPINFOQUERY.assigned_doc_id
  is '审核者工号';
comment on column CDR_EXAMAPPINFOQUERY.assigned_doc_name
  is '审核者姓名';
comment on column CDR_EXAMAPPINFOQUERY.applicationno
  is '电子申请单号';
comment on column CDR_EXAMAPPINFOQUERY.unicode
  is '唯一编码';
comment on column CDR_EXAMAPPINFOQUERY.apply_desc
  is '申请单描述内容';
comment on column CDR_EXAMAPPINFOQUERY.apply_state
  is '申请单状态';
comment on column CDR_EXAMAPPINFOQUERY.apply_effective_b
  is '申请单有效日期上限';
comment on column CDR_EXAMAPPINFOQUERY.apply_effective_e
  is '申请单有效日期下限';
comment on column CDR_EXAMAPPINFOQUERY.priority_code
  is '优先级别代码';
comment on column CDR_EXAMAPPINFOQUERY.priority
  is '优先级别名称';
comment on column CDR_EXAMAPPINFOQUERY.lis_sample_id
  is '标本ID';
comment on column CDR_EXAMAPPINFOQUERY.lis_sample_typecode
  is '标本类别代码';
comment on column CDR_EXAMAPPINFOQUERY.lis_sample_type
  is '标本类别名称';
comment on column CDR_EXAMAPPINFOQUERY.blood_sampling
  is '血液标本';
comment on column CDR_EXAMAPPINFOQUERY.order_id
  is '医嘱ID';
comment on column CDR_EXAMAPPINFOQUERY.lis_item_code
  is '检验项目编码';
comment on column CDR_EXAMAPPINFOQUERY.lis_item_name
  is '检验项目名称';
comment on column CDR_EXAMAPPINFOQUERY.lis_methodcode
  is '检验方法编码';
comment on column CDR_EXAMAPPINFOQUERY.lis_method
  is '检验方法名称';
comment on column CDR_EXAMAPPINFOQUERY.lis_effective_date
  is '执行日期时间';
comment on column CDR_EXAMAPPINFOQUERY.exec_dept_code
  is '执行科室代码';
comment on column CDR_EXAMAPPINFOQUERY.exec_dept_name
  is '执行科室名称';
comment on column CDR_EXAMAPPINFOQUERY.notice
  is '注意事项';
comment on column CDR_EXAMAPPINFOQUERY.urgentflag
  is '加急标志';
comment on column CDR_EXAMAPPINFOQUERY.creattime
  is '创建时间';
comment on column CDR_EXAMAPPINFOQUERY.charge_status
  is '收费状态';
comment on column CDR_EXAMAPPINFOQUERY.external_inspection
  is '外检标志(0否，1是)';
comment on column CDR_EXAMAPPINFOQUERY.bar_code
  is '条码号';
comment on column CDR_EXAMAPPINFOQUERY.tube_color
  is '采血管颜色';

 
 
 
 
 








create table CDR_HRP_BUDGET_DETAIL
(
    budget_plan        VARCHAR2(120),
    establishment_type VARCHAR2(50),
    charge_name        VARCHAR2(633),
    period             NUMBER(10),
    dept               VARCHAR2(60),
    centralized_dept   VARCHAR2(60),
    establishment_dept VARCHAR2(60),
    budgeted_amount    NUMBER(16,2),
    approval_amount    NUMBER(16,2),
    source_funds       NUMBER(1),
    tips               VARCHAR2(255),
    unicode            VARCHAR2(50)
)
 ;
comment on column CDR_HRP_BUDGET_DETAIL.budget_plan
  is '预算方案';
comment on column CDR_HRP_BUDGET_DETAIL.establishment_type
  is '编制类型';
comment on column CDR_HRP_BUDGET_DETAIL.charge_name
  is '指标';
comment on column CDR_HRP_BUDGET_DETAIL.period
  is '期间';
comment on column CDR_HRP_BUDGET_DETAIL.dept
  is '科室';
comment on column CDR_HRP_BUDGET_DETAIL.centralized_dept
  is '归口科室';
comment on column CDR_HRP_BUDGET_DETAIL.establishment_dept
  is '编制科室';
comment on column CDR_HRP_BUDGET_DETAIL.budgeted_amount
  is '预算金额';
comment on column CDR_HRP_BUDGET_DETAIL.approval_amount
  is '批复金额';
comment on column CDR_HRP_BUDGET_DETAIL.source_funds
  is '资金来源';
comment on column CDR_HRP_BUDGET_DETAIL.tips
  is '备注';
comment on column CDR_HRP_BUDGET_DETAIL.unicode
  is '主键';





create table CDR_HRP_BUDGET_DICT
(
    charge_code      VARCHAR2(32),
    charge_name      VARCHAR2(600),
    centralized_dept VARCHAR2(111)
)
 ;
comment on column CDR_HRP_BUDGET_DICT.charge_code
  is '指标编码';
comment on column CDR_HRP_BUDGET_DICT.charge_name
  is '指标名称';
comment on column CDR_HRP_BUDGET_DICT.centralized_dept
  is '归口科室';





create table CDR_HRP_BUDGET_RECEIPT
(
    period       NUMBER(10),
    charge_dept  VARCHAR2(111),
    charge_name  VARCHAR2(633),
    exec_amt     NUMBER(16,2),
    receipt_date VARCHAR2(20)
)
 ;
comment on column CDR_HRP_BUDGET_RECEIPT.charge_dept
  is '费用科室';
comment on column CDR_HRP_BUDGET_RECEIPT.charge_name
  is '费用指标';
comment on column CDR_HRP_BUDGET_RECEIPT.exec_amt
  is '执行金额';
comment on column CDR_HRP_BUDGET_RECEIPT.receipt_date
  is '单据日期';





create table CDR_HRP_CLINICALSERVICEDEPT_COST
(
    dept_code       VARCHAR2(50),
    dept_name       VARCHAR2(60),
    qj              VARCHAR2(10),
    directcost1     VARCHAR2(16),
    indirectcost1   VARCHAR2(16),
    fullcost1       VARCHAR2(16),
    directcost2     VARCHAR2(16),
    indirectcost2   VARCHAR2(16),
    fullcost2       VARCHAR2(16),
    directcost3     VARCHAR2(16),
    indirectcost3   VARCHAR2(16),
    fullcost3       VARCHAR2(16),
    directcost4     VARCHAR2(16),
    indirectcost4   VARCHAR2(16),
    fullcost4       VARCHAR2(16),
    directcost5     VARCHAR2(16),
    indirectcost5   VARCHAR2(16),
    fullcost5       VARCHAR2(16),
    directcost6     VARCHAR2(16),
    indirectcost6   VARCHAR2(16),
    fullcost6       VARCHAR2(16),
    directcost7     VARCHAR2(16),
    indirectcost7   VARCHAR2(16),
    fullcost7       VARCHAR2(16),
    directcost8     VARCHAR2(16),
    indirectcost8   VARCHAR2(16),
    fullcost8       VARCHAR2(16),
    directcost9     VARCHAR2(16),
    indirectcost9   VARCHAR2(16),
    fullcost9       VARCHAR2(16),
    directcost10    VARCHAR2(16),
    indirectcost10  VARCHAR2(16),
    fullcost10      VARCHAR2(16),
    directcost11    VARCHAR2(16),
    indirectcost11  VARCHAR2(16),
    fullcost11      VARCHAR2(16),
    directcost12    VARCHAR2(16),
    indirectcost12  VARCHAR2(16),
    fullcost12      VARCHAR2(16),
    directcost101   VARCHAR2(16),
    indirectcost101 VARCHAR2(16),
    fullcost101     VARCHAR2(16),
    directcost102   VARCHAR2(16),
    indirectcost102 VARCHAR2(16),
    fullcost102     VARCHAR2(16),
    directcost103   VARCHAR2(16),
    indirectcost103 VARCHAR2(16),
    fullcost103     VARCHAR2(16),
    directcost107   VARCHAR2(16),
    indirectcost107 VARCHAR2(16),
    fullcost107     VARCHAR2(16),
    directcost201   VARCHAR2(16),
    indirectcost201 VARCHAR2(16),
    fullcost201     VARCHAR2(16),
    directcost202   VARCHAR2(16),
    indirectcost202 VARCHAR2(16),
    fullcost202     VARCHAR2(16),
    directcost203   VARCHAR2(16),
    indirectcost203 VARCHAR2(16),
    fullcost203     VARCHAR2(16),
    directcost207   VARCHAR2(16),
    indirectcost207 VARCHAR2(16),
    fullcost207     VARCHAR2(16)
)
 ;
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.dept_code
  is '科室编码';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.dept_name
  is '科室名称';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.directcost1
  is '001人员经费直接成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.fullcost1
  is '001人员经费全成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.directcost3
  is '003药品费直接成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.fullcost3
  is '003药品费全成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.directcost7
  is '007其他费用直接成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.fullcost7
  is '007其他费用全成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.directcost12
  is '012其他支出直接成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.fullcost12
  is '012其他支出全成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.directcost103
  is '103财政药品费直接成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.fullcost103
  is '103财政药品费全成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.directcost107
  is '107财政其他费用直接成本';
comment on column CDR_HRP_CLINICALSERVICEDEPT_COST.fullcost107
  is '107财政其他费用';





create table CDR_HRP_DEPARTMENT_DICT
(
    his_id   VARCHAR2(50),
    his_name VARCHAR2(200),
    cw_code  VARCHAR2(50),
    cw_name  VARCHAR2(150)
)
 ;
comment on column CDR_HRP_DEPARTMENT_DICT.his_id
  is 'HIS科室编码';
comment on column CDR_HRP_DEPARTMENT_DICT.his_name
  is 'HIS科室名称';
comment on column CDR_HRP_DEPARTMENT_DICT.cw_code
  is '财务科室编码';
comment on column CDR_HRP_DEPARTMENT_DICT.cw_name
  is '财务科室名称';





create table CDR_HRP_DEPARTMENT_DIRECTCOST
(
    dept_type_code VARCHAR2(30),
    dept_type      VARCHAR2(50),
    dept_code      VARCHAR2(50),
    dept_name      VARCHAR2(60),
    qj             VARCHAR2(10),
    directcost_001 VARCHAR2(16),
    directcost_002 VARCHAR2(16),
    directcost_003 VARCHAR2(16),
    directcost_004 VARCHAR2(16),
    directcost_005 VARCHAR2(16),
    directcost_006 VARCHAR2(16),
    directcost_007 VARCHAR2(16),
    directcost_008 VARCHAR2(16),
    directcost_009 VARCHAR2(16),
    directcost_010 VARCHAR2(16),
    directcost_011 VARCHAR2(16),
    directcost_012 VARCHAR2(16),
    directcost_101 VARCHAR2(16),
    directcost_102 VARCHAR2(16),
    directcost_103 VARCHAR2(16),
    directcost_107 VARCHAR2(16),
    directcost_201 VARCHAR2(16),
    directcost_202 VARCHAR2(16),
    directcost_203 VARCHAR2(16),
    directcost_207 VARCHAR2(16)
)
 ;
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.dept_type_code
  is '科室类型编码';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.dept_type
  is '科室类型名称';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.dept_code
  is '科室编码';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.dept_name
  is '科室名称';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.directcost_001
  is '001人员经费';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.directcost_003
  is '003药品费';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.directcost_007
  is '007其他费用';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.directcost_012
  is '012其他支出';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.directcost_103
  is '103财政药品费';
comment on column CDR_HRP_DEPARTMENT_DIRECTCOST.directcost_107
  is '107财政其他费用';





create table CDR_HRP_DEPTSZ_DEDTAIL
(
    typeid      VARCHAR2(43),
    class_code  VARCHAR2(30),
    class_name  VARCHAR2(50),
    dept_no     VARCHAR2(50),
    dept_name   VARCHAR2(60),
    cost_code   VARCHAR2(50),
    cost_name   VARCHAR2(50),
    sz_code     VARCHAR2(60),
    sz_name     VARCHAR2(50),
    sdate       VARCHAR2(10),
    sz_type     VARCHAR2(30),
    income      NUMBER(12,2) default 0,
    outcome     NUMBER(12,2) default 0,
    evidence_no VARCHAR2(30)
)
 ;
comment on column CDR_HRP_DEPTSZ_DEDTAIL.class_code
  is '科室类型编码';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.class_name
  is '科室类型名称';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.dept_no
  is '科室编码';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.dept_name
  is '科室名称';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.cost_code
  is '成本项目编码';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.cost_name
  is '成本项目名称 如：人员经费';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.sz_code
  is '收支项目编码';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.sz_name
  is '收支项目名称 如：(门诊)挂号收入';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.sdate
  is '日期';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.sz_type
  is '收支类型';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.income
  is '收入金额';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.outcome
  is '支出金额';
comment on column CDR_HRP_DEPTSZ_DEDTAIL.evidence_no
  is '凭证摘要';





create table CDR_HRP_HIS_REPORT
(
    病人病区        VARCHAR2(50),
    住院医师        VARCHAR2(50),
    病人id        VARCHAR2(50),
    主页id        NUMBER,
    姓名          VARCHAR2(50),
    住院号         VARCHAR2(50),
    入科时间        DATE,
    出科时间        VARCHAR2(50),
    费别          VARCHAR2(50),
    住院天数        NUMBER,
    治疗费         NUMBER(12,2) default 0,
    化验费         NUMBER(12,2) default 0,
    药事服务费       NUMBER(12,2) default 0,
    西成药费        NUMBER(12,2) default 0,
    高值耗材费       NUMBER(12,2) default 0,
    检查费         NUMBER(12,2) default 0,
    tcd         NUMBER(12,2) default 0,
    外诊费         NUMBER(12,2) default 0,
    护理费         NUMBER(12,2) default 0,
    氧气费         NUMBER(12,2) default 0,
    中成药费        NUMBER(12,2) default 0,
    理疗费         NUMBER(12,2) default 0,
    输血费         NUMBER(12,2) default 0,
    放射检查        NUMBER(12,2) default 0,
    麻醉费         NUMBER(12,2) default 0,
    动态心电图       NUMBER(12,2) default 0,
    其他费         NUMBER(12,2) default 0,
    其他材料费       NUMBER(12,2) default 0,
    动态血压监测      NUMBER(12,2) default 0,
    手术费         NUMBER(12,2) default 0,
    床位费         NUMBER(12,2) default 0,
    诊察费         NUMBER(12,2) default 0,
    一般耗材费       NUMBER(12,2) default 0,
    心率变异性分析     NUMBER(12,2) default 0,
    化验费a        NUMBER(12,2) default 0,
    疼痛费         NUMBER(12,2) default 0,
    放射治疗        NUMBER(12,2) default 0,
    b超费         NUMBER(12,2) default 0,
    诊疗费         NUMBER(12,2) default 0,
    中草药费        NUMBER(12,2) default 0,
    心电图费        NUMBER(12,2) default 0,
    肺通气         NUMBER(12,2) default 0,
    stroge_date DATE,
    执行科室        VARCHAR2(50),
    开单科室        VARCHAR2(50)
)
 ;





create table CDR_HRP_SZ_ITEM
(
    sz_code      VARCHAR2(50),
    sz_name      VARCHAR2(60),
    sz_category  VARCHAR2(30),
    sz_type      VARCHAR2(30),
    income_type  VARCHAR2(30),
    cost_nature  VARCHAR2(30),
    cost_source  VARCHAR2(30),
    cost_items   VARCHAR2(101),
    code_level   NUMBER(5),
    v            VARCHAR2(255),
    sz_attribute VARCHAR2(1952),
    final_mark   VARCHAR2(30)
)
 ;
comment on column CDR_HRP_SZ_ITEM.sz_code
  is '收支项目编码';
comment on column CDR_HRP_SZ_ITEM.sz_name
  is '收支项目名称';
comment on column CDR_HRP_SZ_ITEM.sz_category
  is '收支类别 如：门诊收入、住院收入';
comment on column CDR_HRP_SZ_ITEM.sz_type
  is '收支类型 如：临床收入、药品收入';
comment on column CDR_HRP_SZ_ITEM.income_type
  is '收入大类 如：门诊收入';
comment on column CDR_HRP_SZ_ITEM.cost_nature
  is '费用性质 如：卫生材料、高值耗材';
comment on column CDR_HRP_SZ_ITEM.cost_source
  is '成本来源';
comment on column CDR_HRP_SZ_ITEM.cost_items
  is '成本项目';
comment on column CDR_HRP_SZ_ITEM.code_level
  is '编码层次';
comment on column CDR_HRP_SZ_ITEM.v
  is '收支项目全称';
comment on column CDR_HRP_SZ_ITEM.sz_attribute
  is '启用收支属性 如：变动性态';
comment on column CDR_HRP_SZ_ITEM.final_mark
  is '末级标志 0：否  1：是';





create table CDR_INFECTION_REPORT
(
    cardid                  INTEGER,
    cardno                  VARCHAR2(50),
    cardtype                VARCHAR2(50),
    cardstatus              VARCHAR2(50),
    reporttime              DATE,
    reportercode            VARCHAR2(50),
    reportername            VARCHAR2(50),
    checktime               DATE,
    checkercode             VARCHAR2(50),
    checkername             VARCHAR2(50),
    patientcode             VARCHAR2(50),
    patientname             VARCHAR2(50),
    patientdeptcode         VARCHAR2(50),
    patientdeptname         VARCHAR2(50),
    isdeleted               INTEGER,
    cardedittime            DATE,
    visitid                 VARCHAR2(50),
    earlyid                 VARCHAR2(50),
    printcount              INTEGER,
    createtime              DATE,
    createuser              VARCHAR2(50),
    createusercode          VARCHAR2(50),
    createuserdept          VARCHAR2(50),
    cardguid                VARCHAR2(50),
    reportdepart            VARCHAR2(50),
    correctdisease          VARCHAR2(50),
    reportdoctor            VARCHAR2(50),
    reportdate              VARCHAR2(50),
    deptphone               VARCHAR2(50),
    cardreason              VARCHAR2(50),
    parentname_main         VARCHAR2(50),
    patientname_main        VARCHAR2(50),
    idcard                  VARCHAR2(50),
    patientsex_main         VARCHAR2(50),
    patientage_main         VARCHAR2(50),
    ageunit_main            VARCHAR2(50),
    birthdate               VARCHAR2(50),
    workunit                VARCHAR2(50),
    patientid_main          VARCHAR2(50),
    region_main             VARCHAR2(50),
    patientphone            VARCHAR2(50),
    addr_province           VARCHAR2(50),
    addr_city               VARCHAR2(50),
    addr_county             VARCHAR2(50),
    addr_town               VARCHAR2(50),
    addr_other              VARCHAR2(200),
    professional_main       VARCHAR2(50),
    professionalother       VARCHAR2(50),
    diseasetype             VARCHAR2(50),
    diseasedegree           VARCHAR2(50),
    casesymptom             VARCHAR2(50),
    attackdate              DATE,
    diagnosedate_main       VARCHAR2(50),
    deaddate                VARCHAR2(50),
    diseasesentity          VARCHAR2(50),
    diseasestype            VARCHAR2(50),
    diseasesname            VARCHAR2(50),
    diseasespart            VARCHAR2(50),
    positivetime            VARCHAR2(50),
    debutsymptom            VARCHAR2(50),
    debutdate               DATE,
    alt                     VARCHAR2(50),
    khbc                    VARCHAR2(50),
    liverpuncture           VARCHAR2(50),
    khbs                    VARCHAR2(50),
    samesymptom             VARCHAR2(50),
    maritalstatus           VARCHAR2(50),
    nation_addi             VARCHAR2(50),
    education_addi          VARCHAR2(50),
    region_addi             VARCHAR2(50),
    comboboxprovince        VARCHAR2(50),
    comboboxcity            VARCHAR2(50),
    comboboxcounty          VARCHAR2(50),
    comboboxtown            VARCHAR2(50),
    txtaddr                 VARCHAR2(50),
    contacthistory1         VARCHAR2(50),
    injectionno             VARCHAR2(50),
    nonbusiness             VARCHAR2(50),
    business                VARCHAR2(50),
    sexno                   VARCHAR2(50),
    gaysexno                VARCHAR2(50),
    contacthistory2         VARCHAR2(50),
    othercontacthistory     VARCHAR2(50),
    sexualhistory           VARCHAR2(50),
    binfectroutes           VARCHAR2(50),
    sample                  VARCHAR2(50),
    experimentalresults     VARCHAR2(50),
    positivedate            VARCHAR2(50),
    contacts                VARCHAR2(50),
    confirmunit             VARCHAR2(50),
    aidsdate                VARCHAR2(50),
    status                  VARCHAR2(50),
    patientname_addi        VARCHAR2(50),
    patientsex_addi         VARCHAR2(50),
    patientage_addi         VARCHAR2(50),
    ageunit_addi            VARCHAR2(50),
    addrs                   VARCHAR2(50),
    householdername         VARCHAR2(50),
    householderphone        VARCHAR2(50),
    workunit_addi           VARCHAR2(50),
    professional_addi       VARCHAR2(50),
    referralreason1         VARCHAR2(50),
    referralreason2         VARCHAR2(50),
    referraldate            VARCHAR2(50),
    referralunit            VARCHAR2(50),
    referraldoc             VARCHAR2(50),
    tounit                  VARCHAR2(50),
    unitaddr                VARCHAR2(50),
    unitphone               VARCHAR2(50),
    remark                  VARCHAR2(50),
    handleremark            VARCHAR2(50),
    diseasecode             VARCHAR2(50),
    remarks                 VARCHAR2(50),
    ispatienttype           VARCHAR2(50),
    checkresult             VARCHAR2(50),
    aidsremarks             VARCHAR2(50),
    contactsymptom          VARCHAR2(50),
    certificatetype         VARCHAR2(50),
    checkafp                INTEGER,
    region_afptrue          INTEGER,
    region_afpfalse         INTEGER,
    region_afp              VARCHAR2(50),
    indate_afp              DATE,
    addr_province_afp       VARCHAR2(50),
    addr_city_afp           VARCHAR2(50),
    addr_county_afp         VARCHAR2(50),
    addr_town_afp           VARCHAR2(50),
    addr_other_afp          VARCHAR2(50),
    afp_date                DATE,
    afp_symptoms            VARCHAR2(50),
    zztz                    VARCHAR2(50),
    zyid                    INTEGER,
    additiondiseasecategory VARCHAR2(50),
    additioninputtype       VARCHAR2(50),
    additioninputcountry    VARCHAR2(50),
    outdate                 DATE,
    sample_other            VARCHAR2(50),
    binfectroutes_other     VARCHAR2(50),
    checkresulttwo          VARCHAR2(50),
    late_report             INTEGER,
    is_tp_past              VARCHAR2(50),
    tp_symptom              VARCHAR2(50),
    tp_tppa                 VARCHAR2(50),
    tp_trust                VARCHAR2(50),
    tp_titer                VARCHAR2(50),
    rnaresult               VARCHAR2(50),
    orf1ab_ct               VARCHAR2(50),
    n_ct                    VARCHAR2(50),
    is_covid19_related      VARCHAR2(50),
    death_diagnose          VARCHAR2(50),
    tp_report_dept          VARCHAR2(50),
    correct_reason          VARCHAR2(50),
    is_covid19              VARCHAR2(50),
    last_alt                VARCHAR2(50),
    njy_check_report        VARCHAR2(50),
    first_yganduknow        INTEGER,
    inoculation_times       VARCHAR2(50),
    first_covid19_time      DATE,
    is_first_infect         INTEGER,
    re_infect_time          DATE,
    is_covid19_before       VARCHAR2(50),
    is_tp_before            VARCHAR2(50),
    is_tp_symptom           VARCHAR2(50),
    tp_special              VARCHAR2(50),
    no_tp_trust             VARCHAR2(50),
    unicode                 INTEGER not null
)
 ;










create table CDR_INTERACTIVE_SERVICE_LOG
(
    resid          VARCHAR2(200) not null,
    his_resid      VARCHAR2(200),
    patient_id     VARCHAR2(200),
    creationtime   DATE,
    last_time      DATE,
    xml_in         CLOB,
    type_code      VARCHAR2(10),
    result         VARCHAR2(80),
    failure_reason VARCHAR2(2000),
    xml_out        CLOB,
    modify_flag    VARCHAR2(200),
    table_name     VARCHAR2(200),
    interface_name VARCHAR2(200),
    req_sys_code   VARCHAR2(200),
    interface_code VARCHAR2(200),
    req_sys_name   VARCHAR2(200),
    interface_type VARCHAR2(2) default 1,
    empi_resid     VARCHAR2(200),
    start_time     VARCHAR2(50),
    end_time       VARCHAR2(50),
    execution_time VARCHAR2(50),
    exception      VARCHAR2(500)
)   ;
comment on table CDR_INTERACTIVE_SERVICE_LOG
  is '111';
comment on column CDR_INTERACTIVE_SERVICE_LOG.resid
  is '生成的唯一消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG.his_resid
  is '请求入参唯一消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG.patient_id
  is '患者id';
comment on column CDR_INTERACTIVE_SERVICE_LOG.creationtime
  is '请求中的消息创建时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG.last_time
  is '最后修改时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG.xml_in
  is '调用接口的请求入参';
comment on column CDR_INTERACTIVE_SERVICE_LOG.type_code
  is '处理结果编码 ‘AA’/ ‘AE’';
comment on column CDR_INTERACTIVE_SERVICE_LOG.result
  is '处理结果名称 ''成功''/''失败''';
comment on column CDR_INTERACTIVE_SERVICE_LOG.failure_reason
  is '失败原因';
comment on column CDR_INTERACTIVE_SERVICE_LOG.xml_out
  is '调用接口后的返回消息';
comment on column CDR_INTERACTIVE_SERVICE_LOG.modify_flag
  is '修改标志UPDATE/ADD/QUERY';
comment on column CDR_INTERACTIVE_SERVICE_LOG.table_name
  is '新增/修改的对应表名';
comment on column CDR_INTERACTIVE_SERVICE_LOG.interface_name
  is '接口名称';
comment on column CDR_INTERACTIVE_SERVICE_LOG.req_sys_code
  is '厂商ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG.interface_code
  is '接口编码';
comment on column CDR_INTERACTIVE_SERVICE_LOG.req_sys_name
  is '厂商名称';
comment on column CDR_INTERACTIVE_SERVICE_LOG.interface_type
  is '0:标准交互服务 1:院内交互服务 2:共享文档 3:查询接口 4:外部机构 5:推送第三方';
comment on column CDR_INTERACTIVE_SERVICE_LOG.empi_resid
  is 'EMPI返回的消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG.start_time
  is '接口调用开始时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG.end_time
  is '接口调用结束时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG.execution_time
  is '接口调用耗时(ms)';
comment on column CDR_INTERACTIVE_SERVICE_LOG.exception
  is '异常说明';
 
 
 
 
 
 
 
 
 
 
 
 









create table CDR_INTERACTIVE_SERVICE_LOG_A
(
    resid          VARCHAR2(200) not null,
    his_resid      VARCHAR2(200),
    patient_id     VARCHAR2(200),
    creationtime   DATE,
    last_time      DATE,
    xml_in         CLOB,
    type_code      VARCHAR2(10),
    result         VARCHAR2(80),
    failure_reason VARCHAR2(2000),
    xml_out        CLOB,
    modify_flag    VARCHAR2(200),
    table_name     VARCHAR2(200),
    interface_name VARCHAR2(200),
    req_sys_code   VARCHAR2(200),
    interface_code VARCHAR2(200),
    req_sys_name   VARCHAR2(200),
    interface_type VARCHAR2(2) default 1,
    empi_resid     VARCHAR2(200),
    start_time     VARCHAR2(50),
    end_time       VARCHAR2(50),
    execution_time VARCHAR2(50),
    exception      VARCHAR2(500),
    filter_flag    NUMBER default 0
)   ;
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.resid
  is '生成的唯一消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.his_resid
  is '请求入参唯一消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.patient_id
  is '患者id';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.creationtime
  is '请求中的消息创建时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.last_time
  is '最后修改时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.xml_in
  is '调用接口的请求入参';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.type_code
  is '处理结果编码 ‘AA’/ ‘AE’';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.result
  is '处理结果名称 ''成功''/''失败''';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.failure_reason
  is '失败原因';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.xml_out
  is '调用接口后的返回消息';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.modify_flag
  is '修改标志UPDATE/ADD/QUERY';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.table_name
  is '新增/修改的对应表名';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.interface_name
  is '接口名称';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.req_sys_code
  is '厂商ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.interface_code
  is '接口编码';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.req_sys_name
  is '厂商名称';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.interface_type
  is '0:标准交互服务 1:院内交互服务 2:共享文档 3:查询接口 4:外部机构 5:推送第三方';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.empi_resid
  is 'EMPI返回的消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.start_time
  is '接口调用开始时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.end_time
  is '接口调用结束时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.execution_time
  is '接口调用耗时(ms)';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.exception
  is '异常说明';
comment on column CDR_INTERACTIVE_SERVICE_LOG_A.filter_flag
  is '0无需过滤 1过滤';



 
 



 

 








create table CDR_INTERACTIVE_SERVICE_LOG_A_BAK
(
    resid          VARCHAR2(200) not null,
    his_resid      VARCHAR2(200),
    patient_id     VARCHAR2(200),
    creationtime   DATE,
    last_time      DATE,
    xml_in         CLOB,
    type_code      VARCHAR2(10),
    result         VARCHAR2(80),
    failure_reason VARCHAR2(2000),
    xml_out        CLOB,
    modify_flag    VARCHAR2(200),
    table_name     VARCHAR2(200),
    interface_name VARCHAR2(200),
    req_sys_code   VARCHAR2(200),
    interface_code VARCHAR2(200),
    req_sys_name   VARCHAR2(200),
    interface_type VARCHAR2(2),
    empi_resid     VARCHAR2(200),
    start_time     VARCHAR2(50),
    end_time       VARCHAR2(50),
    execution_time VARCHAR2(50),
    exception      VARCHAR2(500),
    filter_flag    NUMBER
)  ;





create table CDR_INTERACTIVE_SERVICE_LOG_B
(
    resid          VARCHAR2(200) not null,
    his_resid      VARCHAR2(200),
    patient_id     VARCHAR2(200),
    creationtime   DATE,
    last_time      DATE,
    xml_in         CLOB,
    type_code      VARCHAR2(10),
    result         VARCHAR2(80),
    failure_reason VARCHAR2(2000),
    xml_out        CLOB,
    modify_flag    VARCHAR2(200),
    table_name     VARCHAR2(200),
    interface_name VARCHAR2(200),
    req_sys_code   VARCHAR2(200),
    interface_code VARCHAR2(200),
    req_sys_name   VARCHAR2(200),
    interface_type VARCHAR2(2) default 1,
    empi_resid     VARCHAR2(200),
    start_time     VARCHAR2(50),
    end_time       VARCHAR2(50),
    execution_time VARCHAR2(50),
    exception      VARCHAR2(500),
    filter_flag    NUMBER default 0
)   ;
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.resid
  is '生成的唯一消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.his_resid
  is '请求入参唯一消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.patient_id
  is '患者id';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.creationtime
  is '请求中的消息创建时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.last_time
  is '最后修改时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.xml_in
  is '调用接口的请求入参';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.type_code
  is '处理结果编码 ‘AA’/ ‘AE’';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.result
  is '处理结果名称 ''成功''/''失败''';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.failure_reason
  is '失败原因';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.xml_out
  is '调用接口后的返回消息';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.modify_flag
  is '修改标志UPDATE/ADD/QUERY';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.table_name
  is '新增/修改的对应表名';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.interface_name
  is '接口名称';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.req_sys_code
  is '厂商ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.interface_code
  is '接口编码';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.req_sys_name
  is '厂商名称';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.interface_type
  is '0:标准交互服务 1:院内交互服务 2:共享文档 3:查询接口 4:外部机构 5:推送第三方';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.empi_resid
  is 'EMPI返回的消息ID';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.start_time
  is '接口调用开始时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.end_time
  is '接口调用结束时间';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.execution_time
  is '接口调用耗时(ms)';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.exception
  is '异常说明';
comment on column CDR_INTERACTIVE_SERVICE_LOG_B.filter_flag
  is '0无需过滤 1过滤';

 
 

 
 
 

 









create table CDR_LABORATORY_APPLYINFO
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(50),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    author_time           DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc_name        VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(100),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    lis_sample_id         VARCHAR2(20),
    lis_sample_typecode   VARCHAR2(5),
    lis_sample_type       VARCHAR2(20),
    blood_sampling        NUMBER(1),
    order_id              VARCHAR2(20),
    lis_item_code         VARCHAR2(5),
    lis_item_name         VARCHAR2(150),
    lis_effective_date    DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    notice                VARCHAR2(100),
    acquisition_method    NUMBER(1),
    urgentflag            NUMBER(1),
    charge_status         NUMBER(1),
    apply_state           NUMBER(1),
    external_inspection   NUMBER(1),
    sample_id             VARCHAR2(40),
    tube_color            VARCHAR2(20),
    delete_flag           NUMBER(1),
    nuclein_flag          NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER,
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50)
);




















comment on column CDR_LABORATORY_APPLYINFO.group_code
  is '集团编码';
comment on column CDR_LABORATORY_APPLYINFO.organization_code
  is '组织编码';
comment on column CDR_LABORATORY_APPLYINFO.domain_id
  is '系统域标识';
comment on column CDR_LABORATORY_APPLYINFO.outpatient_no
  is '门急诊号';
comment on column CDR_LABORATORY_APPLYINFO.inpatient_no
  is '住院号';
comment on column CDR_LABORATORY_APPLYINFO.patient_id
  is '患者ID';
comment on column CDR_LABORATORY_APPLYINFO.visit_times
  is '就诊次数';
comment on column CDR_LABORATORY_APPLYINFO.visit_no
  is '就诊流水号';
comment on column CDR_LABORATORY_APPLYINFO.patient_name
  is '患者姓名';
comment on column CDR_LABORATORY_APPLYINFO.gendercode
  is '性别代码';
comment on column CDR_LABORATORY_APPLYINFO.age
  is '年龄';
comment on column CDR_LABORATORY_APPLYINFO.bed_no
  is '病床号';
comment on column CDR_LABORATORY_APPLYINFO.room_no
  is '病房号';
comment on column CDR_LABORATORY_APPLYINFO.department_code
  is '科室代码';
comment on column CDR_LABORATORY_APPLYINFO.department
  is '科室';
comment on column CDR_LABORATORY_APPLYINFO.ward_code
  is '病区代码';
comment on column CDR_LABORATORY_APPLYINFO.ward
  is '病区';
comment on column CDR_LABORATORY_APPLYINFO.diagnosis_code
  is '疾病编码';
comment on column CDR_LABORATORY_APPLYINFO.diagnosis
  is '疾病名称';
comment on column CDR_LABORATORY_APPLYINFO.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_LABORATORY_APPLYINFO.author_time
  is '开单日期时间';
comment on column CDR_LABORATORY_APPLYINFO.apply_doc_id
  is '申请医生编码';
comment on column CDR_LABORATORY_APPLYINFO.apply_doc_name
  is '申请医生';
comment on column CDR_LABORATORY_APPLYINFO.apply_dept_code
  is '开立科室代码';
comment on column CDR_LABORATORY_APPLYINFO.apply_dept
  is '开立科室';
comment on column CDR_LABORATORY_APPLYINFO.applicationno
  is '电子申请单ID';
comment on column CDR_LABORATORY_APPLYINFO.apply_desc
  is '申请单描述内容';
comment on column CDR_LABORATORY_APPLYINFO.apply_effective_b
  is '申请单有效日期上限';
comment on column CDR_LABORATORY_APPLYINFO.apply_effective_e
  is '申请单有效日期下限';
comment on column CDR_LABORATORY_APPLYINFO.lis_sample_id
  is '标本ID';
comment on column CDR_LABORATORY_APPLYINFO.lis_sample_typecode
  is '标本类别代码';
comment on column CDR_LABORATORY_APPLYINFO.lis_sample_type
  is '标本类别名称';
comment on column CDR_LABORATORY_APPLYINFO.blood_sampling
  is '血液标本标识 1是0否';
comment on column CDR_LABORATORY_APPLYINFO.order_id
  is '医嘱ID';
comment on column CDR_LABORATORY_APPLYINFO.lis_item_code
  is '检验项目编码';
comment on column CDR_LABORATORY_APPLYINFO.lis_item_name
  is '检验项目名称';
comment on column CDR_LABORATORY_APPLYINFO.lis_effective_date
  is '执行日期时间';
comment on column CDR_LABORATORY_APPLYINFO.exec_dept_code
  is '执行科室代码';
comment on column CDR_LABORATORY_APPLYINFO.exec_dept
  is '执行科室';
comment on column CDR_LABORATORY_APPLYINFO.notice
  is '注意事项';
comment on column CDR_LABORATORY_APPLYINFO.acquisition_method
  is '采集方式编码 1.血液标本采集2.痰液标本采集3.尿液标本采集4.粪便标本采集5.咽拭子标本采集6其他（脑脊液及胸腹水标本采集等）';
comment on column CDR_LABORATORY_APPLYINFO.urgentflag
  is '加急标志 0：否/1：是';
comment on column CDR_LABORATORY_APPLYINFO.charge_status
  is '收费状态 1未缴费2已缴费3退费';
comment on column CDR_LABORATORY_APPLYINFO.apply_state
  is '申请单状态 0,''采样'',1,''护工接收'',2,''登记'',3,''上机检验''，4，已出报告，5，拒绝执行，6，取消执行';
comment on column CDR_LABORATORY_APPLYINFO.external_inspection
  is '外检标志 0：非外检 1：外检 ';
comment on column CDR_LABORATORY_APPLYINFO.sample_id
  is '检验条码号';
comment on column CDR_LABORATORY_APPLYINFO.tube_color
  is '试管颜色';
comment on column CDR_LABORATORY_APPLYINFO.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_LABORATORY_APPLYINFO.nuclein_flag
  is '核酸标志，0否1是';
comment on column CDR_LABORATORY_APPLYINFO.last_update_time
  is '最后修改时间';
comment on column CDR_LABORATORY_APPLYINFO.appoint_time
  is '预约时间,进行预约登记的当前时间)';
comment on column CDR_LABORATORY_APPLYINFO.appoint_operator_id
  is '预约登记人员编码';
comment on column CDR_LABORATORY_APPLYINFO.appoint_operator_name
  is '预约登记人员名称';
comment on column CDR_LABORATORY_APPLYINFO.appoint_status
  is '预约状态编码,1未预约 2预约完成 3取消预约 ';
comment on column CDR_LABORATORY_APPLYINFO.appoint_checktime
  is '预约检查时间';
comment on column CDR_LABORATORY_APPLYINFO.appoint_no
  is '预约流水号';
comment on column CDR_LABORATORY_APPLYINFO.appoint_sortno
  is '预约排序号';
comment on column CDR_LABORATORY_APPLYINFO.appoint_equip
  is '预约设备名称';
comment on column CDR_LABORATORY_APPLYINFO.appoint_dept
  is '预约诊室名称';
comment on column CDR_LABORATORY_APPLYINFO.ehealth_card
  is '电子健康卡号';







create table CDR_LABORATORY_APPLYINFO_BAK20240514
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(50),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    author_time           DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc_name        VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(100),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    lis_sample_id         VARCHAR2(20),
    lis_sample_typecode   VARCHAR2(5),
    lis_sample_type       VARCHAR2(20),
    blood_sampling        NUMBER(1),
    order_id              VARCHAR2(20),
    lis_item_code         VARCHAR2(5),
    lis_item_name         VARCHAR2(150),
    lis_effective_date    DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    notice                VARCHAR2(100),
    acquisition_method    NUMBER(1),
    urgentflag            NUMBER(1),
    charge_status         NUMBER(1),
    apply_state           NUMBER(1),
    external_inspection   NUMBER(1),
    sample_id             VARCHAR2(40),
    tube_color            VARCHAR2(20),
    delete_flag           NUMBER(1),
    nuclein_flag          NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER,
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50)
)
 ;





create table CDR_LABORATORY_APPLYINFO_BF
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    author_time           DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc_name        VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(100),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    lis_sample_id         VARCHAR2(20),
    lis_sample_typecode   VARCHAR2(5),
    lis_sample_type       VARCHAR2(20),
    blood_sampling        NUMBER(1),
    order_id              VARCHAR2(20),
    lis_item_code         VARCHAR2(5),
    lis_item_name         VARCHAR2(150),
    lis_effective_date    DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    notice                VARCHAR2(100),
    acquisition_method    NUMBER(1),
    urgentflag            NUMBER(1),
    charge_status         NUMBER(1),
    apply_state           NUMBER(1),
    external_inspection   NUMBER(1),
    sample_id             VARCHAR2(40),
    tube_color            VARCHAR2(20),
    delete_flag           NUMBER(1),
    nuclein_flag          NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER,
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100)
)
 ;





create table CDR_LABORATORY_APPLYINFO_IMPORT
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(50),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    author_time           DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc_name        VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(100),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    lis_sample_id         VARCHAR2(20),
    lis_sample_typecode   VARCHAR2(5),
    lis_sample_type       VARCHAR2(20),
    blood_sampling        NUMBER(1),
    order_id              VARCHAR2(20),
    lis_item_code         VARCHAR2(5),
    lis_item_name         VARCHAR2(150),
    lis_effective_date    DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    notice                VARCHAR2(100),
    acquisition_method    NUMBER(1),
    urgentflag            NUMBER(1),
    charge_status         NUMBER(1),
    apply_state           NUMBER(1),
    external_inspection   NUMBER(1),
    sample_id             VARCHAR2(40),
    tube_color            VARCHAR2(20),
    delete_flag           NUMBER(1),
    nuclein_flag          NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER,
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50)
)
 ;





create table CDR_LABORATORY_APPLYINFO_RECORDS
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(50),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(100),
    list_unicode          VARCHAR2(30) not null,
    author_time           DATE,
    apply_doc_id          VARCHAR2(20),
    apply_doc_name        VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    applicationno         VARCHAR2(20),
    apply_desc            VARCHAR2(100),
    apply_effective_b     DATE,
    apply_effective_e     DATE,
    lis_sample_id         VARCHAR2(20),
    lis_sample_typecode   VARCHAR2(5),
    lis_sample_type       VARCHAR2(20),
    blood_sampling        NUMBER(1),
    order_id              VARCHAR2(20),
    lis_item_code         VARCHAR2(5),
    lis_item_name         VARCHAR2(150),
    lis_effective_date    DATE,
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    notice                VARCHAR2(100),
    acquisition_method    NUMBER(1),
    urgentflag            NUMBER(1),
    charge_status         NUMBER(1),
    apply_state           NUMBER(1),
    external_inspection   NUMBER(1),
    sample_id             VARCHAR2(40),
    tube_color            VARCHAR2(20),
    delete_flag           NUMBER(1),
    nuclein_flag          NUMBER(1),
    last_update_time      DATE,
    appoint_time          DATE,
    appoint_operator_id   VARCHAR2(20),
    appoint_operator_name VARCHAR2(50),
    appoint_status        NUMBER,
    appoint_checktime     DATE,
    appoint_no            VARCHAR2(50),
    appoint_sortno        VARCHAR2(50),
    appoint_equip         VARCHAR2(50),
    appoint_dept          VARCHAR2(50),
    ehealth_card          VARCHAR2(100),
    appoint_dept_code     VARCHAR2(50)
)
 ;





create table CDR_LABORATORY_REPORT
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(50),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    send_time           DATE,
    receive_staffid     VARCHAR2(20),
    receive_staff       VARCHAR2(50),
    receive_time        DATE,
    technician_doc_code VARCHAR2(20),
    technician_doc      VARCHAR2(50),
    lis_exam_time       DATE,
    report_no           VARCHAR2(50),
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    assigned_time       DATE,
    assigned_doc_code   VARCHAR2(20),
    assigned_doc        VARCHAR2(50),
    print_time          DATE,
    lis_sample_no       VARCHAR2(50),
    lis_sample_code     VARCHAR2(20),
    lis_sample_name     VARCHAR2(50),
    lis_item_code       VARCHAR2(50),
    lis_item_name       VARCHAR2(100),
    report_type_code    VARCHAR2(20),
    report_type         VARCHAR2(100),
    device_number       VARCHAR2(50),
    device_name         VARCHAR2(100),
    lis_barcode         VARCHAR2(50),
    total_times         NUMBER,
    imaging_notes       VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(200),
    image_index         VARCHAR2(50),
    image_content       CLOB,
    wsw_flag            NUMBER(1),
    report_date         DATE,
    delete_flag         NUMBER(1),
    nuclein_flag        NUMBER(1),
    last_update_time    DATE,
    report_dept_code    VARCHAR2(20),
    report_dept         VARCHAR2(50),
    effectivetime_b     DATE,
    effectivetime_e     DATE
);




















comment on column CDR_LABORATORY_REPORT.group_code
  is '集团编码';
comment on column CDR_LABORATORY_REPORT.organization_code
  is '组织编码';
comment on column CDR_LABORATORY_REPORT.domain_id
  is '系统域标识';
comment on column CDR_LABORATORY_REPORT.unicode
  is '数据唯一记录号';
comment on column CDR_LABORATORY_REPORT.creattime
  is '创建时间';
comment on column CDR_LABORATORY_REPORT.patient_id
  is '患者ID';
comment on column CDR_LABORATORY_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_LABORATORY_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_LABORATORY_REPORT.visit_times
  is '就诊次数';
comment on column CDR_LABORATORY_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_LABORATORY_REPORT.patient_name
  is '患者姓名';
comment on column CDR_LABORATORY_REPORT.age
  is '年龄';
comment on column CDR_LABORATORY_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_LABORATORY_REPORT.department
  is '病人所在科室';
comment on column CDR_LABORATORY_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_LABORATORY_REPORT.ward
  is '病人所在病区';
comment on column CDR_LABORATORY_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_LABORATORY_REPORT.bed_no
  is '病床号';
comment on column CDR_LABORATORY_REPORT.applicationno
  is '电子申请单编号';
comment on column CDR_LABORATORY_REPORT.apply_doc_id
  is '申请医生工号';
comment on column CDR_LABORATORY_REPORT.apply_doc
  is '申请医生';
comment on column CDR_LABORATORY_REPORT.apply_dept_code
  is '申请科室编码';
comment on column CDR_LABORATORY_REPORT.apply_dept
  is '申请科室';
comment on column CDR_LABORATORY_REPORT.apply_time
  is '申请时间';
comment on column CDR_LABORATORY_REPORT.send_time
  is '送检时间';
comment on column CDR_LABORATORY_REPORT.receive_staffid
  is '标本核收人编码';
comment on column CDR_LABORATORY_REPORT.receive_staff
  is '标本核收人';
comment on column CDR_LABORATORY_REPORT.receive_time
  is '标本核收时间';
comment on column CDR_LABORATORY_REPORT.technician_doc_code
  is '检验医生编码';
comment on column CDR_LABORATORY_REPORT.technician_doc
  is '检验医生';
comment on column CDR_LABORATORY_REPORT.lis_exam_time
  is '检验时间';
comment on column CDR_LABORATORY_REPORT.report_no
  is '报告号';
comment on column CDR_LABORATORY_REPORT.report_doc_code
  is '报告医生编码';
comment on column CDR_LABORATORY_REPORT.report_doc
  is '报告医生';
comment on column CDR_LABORATORY_REPORT.assigned_time
  is '检验报告审核时间';
comment on column CDR_LABORATORY_REPORT.assigned_doc_code
  is '检验报告审核人编码';
comment on column CDR_LABORATORY_REPORT.assigned_doc
  is '检验报告审核人';
comment on column CDR_LABORATORY_REPORT.print_time
  is '打印时间';
comment on column CDR_LABORATORY_REPORT.lis_sample_no
  is '检验标本号';
comment on column CDR_LABORATORY_REPORT.lis_sample_code
  is '检验标本编码';
comment on column CDR_LABORATORY_REPORT.lis_sample_name
  is '检验标本名称';
comment on column CDR_LABORATORY_REPORT.lis_item_code
  is '检验项目编码';
comment on column CDR_LABORATORY_REPORT.lis_item_name
  is '检验项目名称';
comment on column CDR_LABORATORY_REPORT.report_type_code
  is '检验报告类别代码 01一般临床检验 02血液学检查 03临床化学检查 04临床免疫学检查  05临床微生物学检查 06临床寄生物学检查 07分子生物学检查';
comment on column CDR_LABORATORY_REPORT.report_type
  is '检验报告类别';
comment on column CDR_LABORATORY_REPORT.device_number
  is '仪器编号';
comment on column CDR_LABORATORY_REPORT.device_name
  is '仪器名称';
comment on column CDR_LABORATORY_REPORT.lis_barcode
  is '条码号';
comment on column CDR_LABORATORY_REPORT.total_times
  is '总测量次数';
comment on column CDR_LABORATORY_REPORT.imaging_notes
  is '备注';
comment on column CDR_LABORATORY_REPORT.diagnosis_code
  is '临床诊断代码（主要诊断)';
comment on column CDR_LABORATORY_REPORT.diagnosis
  is '临床诊断名称（主要诊断）';
comment on column CDR_LABORATORY_REPORT.image_index
  is '图像索引号';
comment on column CDR_LABORATORY_REPORT.image_content
  is '整张报告图片信息/URL 地址';
comment on column CDR_LABORATORY_REPORT.wsw_flag
  is '微生物报告标志，0否1是';
comment on column CDR_LABORATORY_REPORT.report_date
  is '报告时间';
comment on column CDR_LABORATORY_REPORT.delete_flag
  is '删除标志，0否1是';
comment on column CDR_LABORATORY_REPORT.nuclein_flag
  is '核酸标志，0否1是';
comment on column CDR_LABORATORY_REPORT.last_update_time
  is '最后修改时间';
comment on column CDR_LABORATORY_REPORT.report_dept_code
  is '检验报告科室编码';
comment on column CDR_LABORATORY_REPORT.report_dept
  is '检验报告科室';
comment on column CDR_LABORATORY_REPORT.effectivetime_b
  is '采样开始时间';
comment on column CDR_LABORATORY_REPORT.effectivetime_e
  is '采样结束时间';







create table CDR_LABORATORY_REPORT230918
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(20),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    send_time           DATE,
    receive_staffid     VARCHAR2(20),
    receive_staff       VARCHAR2(50),
    receive_time        DATE,
    technician_doc_code VARCHAR2(20),
    technician_doc      VARCHAR2(50),
    lis_exam_time       DATE,
    report_no           VARCHAR2(50),
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    assigned_time       DATE,
    assigned_doc_code   VARCHAR2(20),
    assigned_doc        VARCHAR2(50),
    print_time          DATE,
    lis_sample_no       VARCHAR2(50),
    lis_sample_code     VARCHAR2(20),
    lis_sample_name     VARCHAR2(50),
    lis_item_code       VARCHAR2(50),
    lis_item_name       VARCHAR2(100),
    report_type_code    VARCHAR2(20),
    report_type         VARCHAR2(100),
    device_number       VARCHAR2(50),
    device_name         VARCHAR2(100),
    lis_barcode         VARCHAR2(50),
    total_times         NUMBER,
    imaging_notes       VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(70),
    image_index         VARCHAR2(50),
    image_content       CLOB,
    wsw_flag            NUMBER(1),
    report_date         DATE,
    delete_flag         NUMBER(1),
    nuclein_flag        NUMBER(1),
    last_update_time    DATE,
    report_dept_code    VARCHAR2(20),
    report_dept         VARCHAR2(50),
    effectivetime_b     DATE,
    effectivetime_e     DATE
)
 ;





create table CDR_LABORATORY_REPORT_20240423
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(50),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    send_time           DATE,
    receive_staffid     VARCHAR2(20),
    receive_staff       VARCHAR2(50),
    receive_time        DATE,
    technician_doc_code VARCHAR2(20),
    technician_doc      VARCHAR2(50),
    lis_exam_time       DATE,
    report_no           VARCHAR2(50),
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    assigned_time       DATE,
    assigned_doc_code   VARCHAR2(20),
    assigned_doc        VARCHAR2(50),
    print_time          DATE,
    lis_sample_no       VARCHAR2(50),
    lis_sample_code     VARCHAR2(20),
    lis_sample_name     VARCHAR2(50),
    lis_item_code       VARCHAR2(50),
    lis_item_name       VARCHAR2(100),
    report_type_code    VARCHAR2(20),
    report_type         VARCHAR2(100),
    device_number       VARCHAR2(50),
    device_name         VARCHAR2(100),
    lis_barcode         VARCHAR2(50),
    total_times         NUMBER,
    imaging_notes       VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(200),
    image_index         VARCHAR2(50),
    image_content       CLOB,
    wsw_flag            NUMBER(1),
    report_date         DATE,
    delete_flag         NUMBER(1),
    nuclein_flag        NUMBER(1),
    last_update_time    DATE,
    report_dept_code    VARCHAR2(20),
    report_dept         VARCHAR2(50),
    effectivetime_b     DATE,
    effectivetime_e     DATE
)
 ;





create table CDR_LABORATORY_REPORT_BASE64
(
    report_no        VARCHAR2(100),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)   ;
comment on column CDR_LABORATORY_REPORT_BASE64.report_no
  is '报告id';
comment on column CDR_LABORATORY_REPORT_BASE64.base64
  is 'base64转码';
comment on column CDR_LABORATORY_REPORT_BASE64.create_time
  is '报告生成时间';
comment on column CDR_LABORATORY_REPORT_BASE64.last_update_time
  is '最后修改时间';
 





create table CDR_LABORATORY_REPORT_DETAIL
(
    patient_id             VARCHAR2(20),
    applicationno          VARCHAR2(20),
    report_no              VARCHAR2(50),
    report_date            DATE,
    lis_item_name          VARCHAR2(200),
    list_unicode           VARCHAR2(30) not null,
    lis_report_id          VARCHAR2(50),
    lisitem_unicode        VARCHAR2(50),
    lis_item_sub_code      VARCHAR2(30),
    lis_item_sub_name      VARCHAR2(100),
    lis_ration_result      VARCHAR2(150),
    lis_ration_result_unit VARCHAR2(50),
    print_serial_number    VARCHAR2(50),
    detect_indicat_result  VARCHAR2(10),
    abnormal_tips          NUMBER,
    reference_range        VARCHAR2(60),
    measure_unit           VARCHAR2(500),
    last_update_time       DATE
);




















comment on column CDR_LABORATORY_REPORT_DETAIL.patient_id
  is '患者ID';
comment on column CDR_LABORATORY_REPORT_DETAIL.applicationno
  is '电子申请单编号';
comment on column CDR_LABORATORY_REPORT_DETAIL.report_no
  is '报告号';
comment on column CDR_LABORATORY_REPORT_DETAIL.report_date
  is '报告时间';
comment on column CDR_LABORATORY_REPORT_DETAIL.lis_item_name
  is '检验项目名称';
comment on column CDR_LABORATORY_REPORT_DETAIL.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_LABORATORY_REPORT_DETAIL.lis_report_id
  is '检验报告ID';
comment on column CDR_LABORATORY_REPORT_DETAIL.lisitem_unicode
  is '检验子项目唯一记录号';
comment on column CDR_LABORATORY_REPORT_DETAIL.lis_item_sub_code
  is '检验子项目代码';
comment on column CDR_LABORATORY_REPORT_DETAIL.lis_item_sub_name
  is '检验子项目名称';
comment on column CDR_LABORATORY_REPORT_DETAIL.lis_ration_result
  is '检验定量结果';
comment on column CDR_LABORATORY_REPORT_DETAIL.lis_ration_result_unit
  is '检验定量结果单位';
comment on column CDR_LABORATORY_REPORT_DETAIL.print_serial_number
  is '打印序号';
comment on column CDR_LABORATORY_REPORT_DETAIL.detect_indicat_result
  is '检测指标结果(箭头提示) 偏高↑或偏低↓';
comment on column CDR_LABORATORY_REPORT_DETAIL.abnormal_tips
  is '异常结果代码 1,正常;2,无法识别的异常;3,异常偏高;4,异常偏低;9,不确定';
comment on column CDR_LABORATORY_REPORT_DETAIL.reference_range
  is '参考值范围';
comment on column CDR_LABORATORY_REPORT_DETAIL.measure_unit
  is '计量单位';
comment on column CDR_LABORATORY_REPORT_DETAIL.last_update_time
  is '最后修改时间';


create table CDR_LABORATORY_REPORT_DETAIL230919
(
    patient_id             VARCHAR2(20),
    applicationno          VARCHAR2(20),
    report_no              VARCHAR2(50),
    report_date            DATE,
    lis_item_name          VARCHAR2(200),
    list_unicode           VARCHAR2(30) not null,
    lis_report_id          VARCHAR2(50),
    lisitem_unicode        VARCHAR2(50),
    lis_item_sub_code      VARCHAR2(30),
    lis_item_sub_name      VARCHAR2(100),
    lis_ration_result      VARCHAR2(150),
    lis_ration_result_unit VARCHAR2(50),
    print_serial_number    VARCHAR2(50),
    detect_indicat_result  VARCHAR2(10),
    abnormal_tips          NUMBER,
    reference_range        VARCHAR2(60),
    measure_unit           VARCHAR2(500),
    last_update_time       DATE
)
 ;





create table CDR_LABORATORY_REPORT_DETAIL_RECORDS
(
    patient_id             VARCHAR2(20),
    applicationno          VARCHAR2(20),
    report_no              VARCHAR2(50),
    report_date            DATE,
    lis_item_name          VARCHAR2(200),
    list_unicode           VARCHAR2(30) not null,
    lis_report_id          VARCHAR2(50),
    lisitem_unicode        VARCHAR2(50),
    lis_item_sub_code      VARCHAR2(30),
    lis_item_sub_name      VARCHAR2(100),
    lis_ration_result      VARCHAR2(150),
    lis_ration_result_unit VARCHAR2(50),
    print_serial_number    VARCHAR2(50),
    detect_indicat_result  VARCHAR2(10),
    abnormal_tips          NUMBER,
    reference_range        VARCHAR2(60),
    measure_unit           VARCHAR2(500),
    last_update_time       DATE
)
 ;





create table CDR_LABORATORY_REPORT_DETAIL_WSW
(
    patient_id              VARCHAR2(20),
    applicationno           VARCHAR2(20),
    report_no               VARCHAR2(50),
    report_date             DATE,
    lis_item_name           VARCHAR2(200),
    list_unicode            VARCHAR2(30) not null,
    bacteria_code           VARCHAR2(50),
    bacteria_name           VARCHAR2(100),
    comments_name           VARCHAR2(100),
    colony_counts           VARCHAR2(100),
    culture_container       VARCHAR2(50),
    culture_time            VARCHAR2(50),
    culture_condition       VARCHAR2(50),
    discovery_method        VARCHAR2(10),
    indicator_result        VARCHAR2(500),
    indicator_result_des    VARCHAR2(500),
    susceptibility_resu_no  VARCHAR2(500),
    drug_sensitive_code     VARCHAR2(20),
    drug_sensitive_name     VARCHAR2(100),
    sir_reference_range     VARCHAR2(100),
    drug_content            NVARCHAR2(100),
    inhibit_bacterial_cont  NUMBER,
    inhibit_bacterial_width NUMBER,
    last_update_time        DATE
);




















comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.patient_id
  is '患者ID';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.applicationno
  is '电子申请单编号';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.report_no
  is '报告号';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.report_date
  is '报告时间';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.lis_item_name
  is '检验项目名称';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.bacteria_code
  is '细菌代号';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.bacteria_name
  is '细菌名称';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.comments_name
  is '检出病原体名称';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.colony_counts
  is '菌落计数 单位：cfu/ml；如“>10万”';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.culture_container
  is '培养基 例如：“巧克力平板”';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.culture_time
  is '培养时间包含单位 例如：72小时';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.culture_condition
  is '培养条件 例如：“37℃；';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.discovery_method
  is '发现方式  例如：“肉眼”或“镜检”等';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.indicator_result
  is '检测结果 简要描述是否发现或是否生长等';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.indicator_result_des
  is '检测结果文字描述  如：耐药、中度敏感、敏感等';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.susceptibility_resu_no
  is '药敏结果流水号';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.drug_sensitive_code
  is '药敏代码 例如：阿莫西林代码为“AMX”或 “AMOX”';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.drug_sensitive_name
  is '药敏名称,例如：“阿莫西林”';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.sir_reference_range
  is 'SIR参考值范围';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.drug_content
  is '纸片含药量 应包含单位：g、mg、μg';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.inhibit_bacterial_cont
  is '抑菌浓度,即 MIC 单位：g/ml';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.inhibit_bacterial_width
  is '抑菌环直径 单位：mm';
comment on column CDR_LABORATORY_REPORT_DETAIL_WSW.last_update_time
  is '最后修改时间';


create table CDR_LABORATORY_REPORT_DETAIL_WSW230920
(
    patient_id              VARCHAR2(20),
    applicationno           VARCHAR2(20),
    report_no               VARCHAR2(50),
    report_date             DATE,
    lis_item_name           VARCHAR2(200),
    list_unicode            VARCHAR2(30) not null,
    bacteria_code           VARCHAR2(50),
    bacteria_name           VARCHAR2(100),
    comments_name           VARCHAR2(100),
    colony_counts           VARCHAR2(100),
    culture_container       VARCHAR2(50),
    culture_time            VARCHAR2(50),
    culture_condition       VARCHAR2(50),
    discovery_method        VARCHAR2(10),
    indicator_result        VARCHAR2(500),
    indicator_result_des    VARCHAR2(500),
    susceptibility_resu_no  VARCHAR2(500),
    drug_sensitive_code     VARCHAR2(20),
    drug_sensitive_name     VARCHAR2(100),
    sir_reference_range     VARCHAR2(100),
    drug_content            NVARCHAR2(100),
    inhibit_bacterial_cont  NUMBER,
    inhibit_bacterial_width NUMBER,
    last_update_time        DATE
)
 ;





create table CDR_LABORATORY_REPORT_DETAIL_WSW_RECORDS
(
    patient_id              VARCHAR2(20),
    applicationno           VARCHAR2(20),
    report_no               VARCHAR2(50),
    report_date             DATE,
    lis_item_name           VARCHAR2(200),
    list_unicode            VARCHAR2(30) not null,
    bacteria_code           VARCHAR2(50),
    bacteria_name           VARCHAR2(100),
    comments_name           VARCHAR2(100),
    colony_counts           VARCHAR2(100),
    culture_container       VARCHAR2(50),
    culture_time            VARCHAR2(50),
    culture_condition       VARCHAR2(50),
    discovery_method        VARCHAR2(10),
    indicator_result        VARCHAR2(500),
    indicator_result_des    VARCHAR2(500),
    susceptibility_resu_no  VARCHAR2(500),
    drug_sensitive_code     VARCHAR2(20),
    drug_sensitive_name     VARCHAR2(100),
    sir_reference_range     VARCHAR2(100),
    drug_content            NVARCHAR2(100),
    inhibit_bacterial_cont  NUMBER,
    inhibit_bacterial_width NUMBER,
    last_update_time        DATE
) ;





create table CDR_LABORATORY_REPORT_RECORDS
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(50),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    send_time           DATE,
    receive_staffid     VARCHAR2(20),
    receive_staff       VARCHAR2(50),
    receive_time        DATE,
    technician_doc_code VARCHAR2(20),
    technician_doc      VARCHAR2(50),
    lis_exam_time       DATE,
    report_no           VARCHAR2(50),
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    assigned_time       DATE,
    assigned_doc_code   VARCHAR2(20),
    assigned_doc        VARCHAR2(50),
    print_time          DATE,
    lis_sample_no       VARCHAR2(50),
    lis_sample_code     VARCHAR2(20),
    lis_sample_name     VARCHAR2(50),
    lis_item_code       VARCHAR2(50),
    lis_item_name       VARCHAR2(100),
    report_type_code    VARCHAR2(20),
    report_type         VARCHAR2(100),
    device_number       VARCHAR2(50),
    device_name         VARCHAR2(100),
    lis_barcode         VARCHAR2(50),
    total_times         NUMBER,
    imaging_notes       VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(200),
    image_index         VARCHAR2(50),
    image_content       CLOB,
    wsw_flag            NUMBER(1),
    report_date         DATE,
    delete_flag         NUMBER(1),
    nuclein_flag        NUMBER(1),
    last_update_time    DATE,
    report_dept_code    VARCHAR2(20),
    report_dept         VARCHAR2(50),
    effectivetime_b     DATE,
    effectivetime_e     DATE
)
 ;





create table CDR_LABORATORY_REPORT_TEST01
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(20),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    send_time           DATE,
    receive_staffid     VARCHAR2(20),
    receive_staff       VARCHAR2(50),
    receive_time        DATE,
    technician_doc_code VARCHAR2(20),
    technician_doc      VARCHAR2(50),
    lis_exam_time       DATE,
    report_no           VARCHAR2(50),
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    assigned_time       DATE,
    assigned_doc_code   VARCHAR2(20),
    assigned_doc        VARCHAR2(50),
    print_time          DATE,
    lis_sample_no       VARCHAR2(50),
    lis_sample_code     VARCHAR2(20),
    lis_sample_name     VARCHAR2(50),
    lis_item_code       VARCHAR2(50),
    lis_item_name       VARCHAR2(100),
    report_type_code    VARCHAR2(20),
    report_type         VARCHAR2(100),
    device_number       VARCHAR2(50),
    device_name         VARCHAR2(100),
    lis_barcode         VARCHAR2(50),
    total_times         NUMBER,
    imaging_notes       VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(70),
    image_index         VARCHAR2(50),
    image_content       CLOB,
    wsw_flag            NUMBER(1),
    report_date         DATE,
    delete_flag         NUMBER(1),
    nuclein_flag        NUMBER(1),
    last_update_time    DATE,
    report_dept_code    VARCHAR2(20),
    report_dept         VARCHAR2(50),
    effectivetime_b     DATE,
    effectivetime_e     DATE
);




















comment on column CDR_LABORATORY_REPORT_TEST01.group_code
  is '集团编码';








create table CDR_LABORATORY_STATUS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    creattime         DATE,
    patient_id        VARCHAR2(20) not null,
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3) not null,
    visit_no          VARCHAR2(20) not null,
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    list_unicode      VARCHAR2(30) not null,
    applicationno     VARCHAR2(20),
    sample_code       VARCHAR2(20),
    sampling_time     DATE,
    sampling_staffid  VARCHAR2(20),
    sampling_staff    VARCHAR2(50),
    transport_time    DATE,
    transport_staffid VARCHAR2(20),
    transport_staff   VARCHAR2(50),
    receiving_time    DATE,
    receiving_staffid VARCHAR2(20),
    receiving_staff   VARCHAR2(50),
    receive_time      DATE,
    receive_staffid   VARCHAR2(20),
    receive_staff     VARCHAR2(50),
    audit_time        DATE,
    audit_staffid     VARCHAR2(20),
    audit_staff       VARCHAR2(50),
    apply_status      NUMBER(2),
    modify_date       DATE,
    modify_doc_code   VARCHAR2(10),
    modify_doc        VARCHAR2(50),
    modify_dept_code  VARCHAR2(10),
    delete_flag       NUMBER(1),
    nuclein_flag      NUMBER(1),
    last_update_time  DATE
)
 ;
comment on column CDR_LABORATORY_STATUS.group_code
  is '集团编码';
comment on column CDR_LABORATORY_STATUS.organization_code
  is '组织编码';
comment on column CDR_LABORATORY_STATUS.domain_id
  is '系统域标识';
comment on column CDR_LABORATORY_STATUS.creattime
  is '创建时间';
comment on column CDR_LABORATORY_STATUS.patient_id
  is '患者ID';
comment on column CDR_LABORATORY_STATUS.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_LABORATORY_STATUS.inpatient_no
  is '住院号标识';
comment on column CDR_LABORATORY_STATUS.visit_times
  is '就诊次数';
comment on column CDR_LABORATORY_STATUS.visit_no
  is '就诊流水号';
comment on column CDR_LABORATORY_STATUS.patient_name
  is '患者姓名';
comment on column CDR_LABORATORY_STATUS.age
  is '年龄';
comment on column CDR_LABORATORY_STATUS.department_code
  is '病人所在科室编码';
comment on column CDR_LABORATORY_STATUS.department
  is '病人所在科室';
comment on column CDR_LABORATORY_STATUS.ward_code
  is '病人所在病区编码';
comment on column CDR_LABORATORY_STATUS.ward
  is '病人所在病区';
comment on column CDR_LABORATORY_STATUS.sickroom_no
  is '病房编号';
comment on column CDR_LABORATORY_STATUS.bed_no
  is '病床号';
comment on column CDR_LABORATORY_STATUS.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_LABORATORY_STATUS.applicationno
  is '申请单号';
comment on column CDR_LABORATORY_STATUS.sample_code
  is '检验条码号';
comment on column CDR_LABORATORY_STATUS.sampling_time
  is '标本采集时间';
comment on column CDR_LABORATORY_STATUS.sampling_staffid
  is '标本采集人编码';
comment on column CDR_LABORATORY_STATUS.sampling_staff
  is '标本采集人';
comment on column CDR_LABORATORY_STATUS.transport_time
  is '送检时间';
comment on column CDR_LABORATORY_STATUS.transport_staffid
  is '标本送检人编码';
comment on column CDR_LABORATORY_STATUS.transport_staff
  is '标本送检人';
comment on column CDR_LABORATORY_STATUS.receiving_time
  is '护工接收标本时间';
comment on column CDR_LABORATORY_STATUS.receiving_staffid
  is '护工编码';
comment on column CDR_LABORATORY_STATUS.receiving_staff
  is '护工';
comment on column CDR_LABORATORY_STATUS.receive_time
  is '标本核收时间';
comment on column CDR_LABORATORY_STATUS.receive_staffid
  is '标本核收人编码';
comment on column CDR_LABORATORY_STATUS.receive_staff
  is '标本核收人';
comment on column CDR_LABORATORY_STATUS.audit_time
  is '检验报告审核时间';
comment on column CDR_LABORATORY_STATUS.audit_staffid
  is '检验报告审核人编码';
comment on column CDR_LABORATORY_STATUS.audit_staff
  is '检验报告审核人';
comment on column CDR_LABORATORY_STATUS.apply_status
  is '检验状态 0,''采样'',1,''护工接收'',2,''登记'',3,''上机检验''，4，已出报告，5，拒绝执行，6，取消执行';
comment on column CDR_LABORATORY_STATUS.modify_date
  is '检验日期';
comment on column CDR_LABORATORY_STATUS.modify_doc_code
  is '检验医生工号';
comment on column CDR_LABORATORY_STATUS.modify_doc
  is '检验医生';
comment on column CDR_LABORATORY_STATUS.modify_dept_code
  is '检验科室编码';
comment on column CDR_LABORATORY_STATUS.delete_flag
  is '修改标志 0正常 1撤销';
comment on column CDR_LABORATORY_STATUS.nuclein_flag
  is '核酸标志 0否1是';
comment on column CDR_LABORATORY_STATUS.last_update_time
  is '最后修改时间';




create table CDR_LABORATORY_STATUS_20231009
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    creattime         DATE,
    patient_id        VARCHAR2(20) not null,
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3) not null,
    visit_no          VARCHAR2(20) not null,
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    list_unicode      VARCHAR2(30) not null,
    applicationno     VARCHAR2(20),
    sample_code       VARCHAR2(20),
    sampling_time     DATE,
    sampling_staffid  VARCHAR2(20),
    sampling_staff    VARCHAR2(50),
    transport_time    DATE,
    transport_staffid VARCHAR2(20),
    transport_staff   VARCHAR2(50),
    receiving_time    DATE,
    receiving_staffid VARCHAR2(20),
    receiving_staff   VARCHAR2(50),
    receive_time      DATE,
    receive_staffid   VARCHAR2(20),
    receive_staff     VARCHAR2(50),
    audit_time        DATE,
    audit_staffid     VARCHAR2(20),
    audit_staff       VARCHAR2(50),
    apply_status      NUMBER(2),
    modify_date       DATE,
    modify_doc_code   VARCHAR2(10),
    modify_doc        VARCHAR2(50),
    modify_dept_code  VARCHAR2(10),
    delete_flag       NUMBER(1),
    nuclein_flag      NUMBER(1),
    last_update_time  DATE
)
 ;





create table CDR_LOG_OPERATION
(
    id        NUMBER generated always as identity,
    user_id   VARCHAR2(100),
    username  VARCHAR2(100),
    operation VARCHAR2(100),
    time      VARCHAR2(100),
    method    VARCHAR2(100),
    ip        VARCHAR2(100),
    create_on DATE,
    params    CLOB
)
 ;
comment on column CDR_LOG_OPERATION.id
  is '主键id';
comment on column CDR_LOG_OPERATION.user_id
  is '用户id';
comment on column CDR_LOG_OPERATION.username
  is '用户名称';
comment on column CDR_LOG_OPERATION.operation
  is '操作';
comment on column CDR_LOG_OPERATION.time
  is '耗时';
comment on column CDR_LOG_OPERATION.method
  is '方法';
comment on column CDR_LOG_OPERATION.ip
  is 'ip地址';
comment on column CDR_LOG_OPERATION.create_on
  is '创建时间';
comment on column CDR_LOG_OPERATION.params
  is '参数';



create table CDR_MEDICALEXAMINATION_REPORT
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(50) not null,
    creattime               DATE,
    patient_id              VARCHAR2(20),
    outpatient_no           VARCHAR2(20),
    inpatient_no            VARCHAR2(20),
    visit_times             NUMBER(3),
    visit_no                VARCHAR2(20),
    patient_name            VARCHAR2(20),
    age                     VARCHAR2(30),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    sickroom_no             VARCHAR2(10),
    bed_no                  VARCHAR2(36),
    report_no               VARCHAR2(50),
    exam_main_date          DATE,
    exam_main_doctorid      VARCHAR2(50),
    exam_main_doctor        VARCHAR2(50),
    report_date             DATE,
    record_personid         VARCHAR2(50),
    record_person           VARCHAR2(50),
    exam_main_conclusion    CLOB,
    exam_main_conclusion_jy CLOB,
    report_info             CLOB,
    last_update_time        DATE
);




















comment on column CDR_MEDICALEXAMINATION_REPORT.group_code
  is '集团编码';
comment on column CDR_MEDICALEXAMINATION_REPORT.organization_code
  is '组织编码';
comment on column CDR_MEDICALEXAMINATION_REPORT.domain_id
  is '系统域标识';
comment on column CDR_MEDICALEXAMINATION_REPORT.unicode
  is '数据唯一记录号';
comment on column CDR_MEDICALEXAMINATION_REPORT.creattime
  is '创建时间';
comment on column CDR_MEDICALEXAMINATION_REPORT.patient_id
  is '患者ID';
comment on column CDR_MEDICALEXAMINATION_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_MEDICALEXAMINATION_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_MEDICALEXAMINATION_REPORT.visit_times
  is '就诊次数';
comment on column CDR_MEDICALEXAMINATION_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_MEDICALEXAMINATION_REPORT.patient_name
  is '患者姓名';
comment on column CDR_MEDICALEXAMINATION_REPORT.age
  is '年龄';
comment on column CDR_MEDICALEXAMINATION_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_MEDICALEXAMINATION_REPORT.department
  is '病人所在科室';
comment on column CDR_MEDICALEXAMINATION_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_MEDICALEXAMINATION_REPORT.ward
  is '病人所在病区';
comment on column CDR_MEDICALEXAMINATION_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_MEDICALEXAMINATION_REPORT.bed_no
  is '病床号';
comment on column CDR_MEDICALEXAMINATION_REPORT.report_no
  is '体检报告号';
comment on column CDR_MEDICALEXAMINATION_REPORT.exam_main_date
  is '主检时间';
comment on column CDR_MEDICALEXAMINATION_REPORT.exam_main_doctorid
  is '主检医生编码';
comment on column CDR_MEDICALEXAMINATION_REPORT.exam_main_doctor
  is '主检医生姓名';
comment on column CDR_MEDICALEXAMINATION_REPORT.report_date
  is '报告生成时间';
comment on column CDR_MEDICALEXAMINATION_REPORT.record_personid
  is '报告医生编码';
comment on column CDR_MEDICALEXAMINATION_REPORT.record_person
  is '报告医生';
comment on column CDR_MEDICALEXAMINATION_REPORT.exam_main_conclusion
  is '总检结论';
comment on column CDR_MEDICALEXAMINATION_REPORT.exam_main_conclusion_jy
  is '总检健康建议';
comment on column CDR_MEDICALEXAMINATION_REPORT.report_info
  is '报告信息';
comment on column CDR_MEDICALEXAMINATION_REPORT.last_update_time
  is '最后修改时间';





create table CDR_MEDICALEXAMINATION_REPORT230920
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(50) not null,
    creattime               DATE,
    patient_id              VARCHAR2(20),
    outpatient_no           VARCHAR2(20),
    inpatient_no            VARCHAR2(20),
    visit_times             NUMBER(3),
    visit_no                VARCHAR2(20),
    patient_name            VARCHAR2(20),
    age                     VARCHAR2(30),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    sickroom_no             VARCHAR2(10),
    bed_no                  VARCHAR2(36),
    report_no               VARCHAR2(50),
    exam_main_date          DATE,
    exam_main_doctorid      VARCHAR2(50),
    exam_main_doctor        VARCHAR2(50),
    report_date             DATE,
    record_personid         VARCHAR2(50),
    record_person           VARCHAR2(50),
    exam_main_conclusion    CLOB,
    exam_main_conclusion_jy CLOB,
    report_info             CLOB,
    last_update_time        DATE
)
 ;





create table CDR_MEDICALEXAMINATION_REPORT_BASE64
(
    report_no        VARCHAR2(100),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)   ;
comment on column CDR_MEDICALEXAMINATION_REPORT_BASE64.report_no
  is '报告id';
comment on column CDR_MEDICALEXAMINATION_REPORT_BASE64.base64
  is 'base64转码';
comment on column CDR_MEDICALEXAMINATION_REPORT_BASE64.create_time
  is '报告生成时间';
comment on column CDR_MEDICALEXAMINATION_REPORT_BASE64.last_update_time
  is '最后修改时间';
 





create table CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM
(
    patient_id            VARCHAR2(20),
    report_no             VARCHAR2(50),
    report_date           DATE,
    mtesub_name           VARCHAR2(100),
    list_subitem_unicode  VARCHAR2(50) not null,
    lt_subitem_code       VARCHAR2(50),
    lt_subitem_name       VARCHAR2(50),
    lt_subitem_no         VARCHAR2(50),
    lt_subitem_conclusion VARCHAR2(3000),
    lt_subitem_reference  VARCHAR2(50),
    lt_subitem_unit       VARCHAR2(50),
    abnormal_tips         NUMBER(2),
    lt_subitem_normal     VARCHAR2(50),
    last_update_time      DATE,
    mtesub_code           VARCHAR2(50)
);




















comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.patient_id
  is '患者ID';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.report_no
  is '体检报告号';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.report_date
  is '报告生成时间';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.mtesub_name
  is '检查项目名称';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.list_subitem_unicode
  is '检查项目明细唯一记录号';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_code
  is '检查明细项目编码';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_name
  is '检查明细项目';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_no
  is '检查结果排列序号';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_conclusion
  is '检查明细项目实验室检查结果';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_reference
  is '参考值范围';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_unit
  is '实验室检验项目单位';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.abnormal_tips
  is '检查结果是否正常 1,正常;2,异常';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.lt_subitem_normal
  is '检查结果异常标识 结果是否正常,正常—, 偏高↑或偏低↓';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.last_update_time
  is '最后修改时间';
comment on column CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM.mtesub_code
  is '检查项目编码';






create table CDR_MEDICALEXAMINATION_REPORT_LTSUBITEM230920
(
    patient_id            VARCHAR2(20),
    report_no             VARCHAR2(50),
    report_date           DATE,
    mtesub_name           VARCHAR2(50),
    list_subitem_unicode  VARCHAR2(50) not null,
    lt_subitem_code       VARCHAR2(50),
    lt_subitem_name       VARCHAR2(50),
    lt_subitem_no         VARCHAR2(50),
    lt_subitem_conclusion VARCHAR2(2000),
    lt_subitem_reference  VARCHAR2(50),
    lt_subitem_unit       VARCHAR2(50),
    abnormal_tips         NUMBER(2),
    lt_subitem_normal     VARCHAR2(50),
    last_update_time      DATE
)
 ;





create table CDR_MEDICALEXAMINATION_REPORT_MTESUB
(
    patient_id       VARCHAR2(20),
    report_no        VARCHAR2(50),
    report_date      DATE,
    list_unicode     VARCHAR2(50) not null,
    mtesub_code      VARCHAR2(20),
    mtesub_name      VARCHAR2(100),
    mte_dept_code    VARCHAR2(10),
    mte_dept         VARCHAR2(50),
    mte_audit_date   DATE,
    mte_doctor_code  VARCHAR2(10),
    mte_doctor       VARCHAR2(50),
    last_update_time DATE
);




















comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.patient_id
  is '患者ID';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.report_no
  is '体检报告号';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.report_date
  is '报告生成时间';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.list_unicode
  is '检查项目唯一记录号';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mtesub_code
  is '检查项目编码';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mtesub_name
  is '检查项目名称';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mte_dept_code
  is '项目执行科室编码';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mte_dept
  is '项目执行科室';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mte_audit_date
  is '项目检查时间';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mte_doctor_code
  is '项目检查医生编码';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.mte_doctor
  is '项目检查医生';
comment on column CDR_MEDICALEXAMINATION_REPORT_MTESUB.last_update_time
  is '最后修改时间';






create table CDR_MEDICALEXAMINATION_REPORT_MTESUB230920
(
    patient_id       VARCHAR2(20),
    report_no        VARCHAR2(50),
    report_date      DATE,
    list_unicode     VARCHAR2(50) not null,
    mtesub_code      VARCHAR2(20),
    mtesub_name      VARCHAR2(50),
    mte_dept_code    VARCHAR2(10),
    mte_dept         VARCHAR2(50),
    mte_audit_date   DATE,
    mte_doctor_code  VARCHAR2(10),
    mte_doctor       VARCHAR2(50),
    last_update_time DATE
)
 ;





create table CDR_MEDICAL_CARD
(
    group_code          VARCHAR2(20) default '01' not null,
    organization_code   VARCHAR2(100) default '001' not null,
    hospital_id         VARCHAR2(32) default '45227967-1' not null,
    domain_id           CHAR(2) default '01' not null,
    patient_id          VARCHAR2(20),
    id_card             VARCHAR2(18),
    medical_card        VARCHAR2(40),
    patient_name        VARCHAR2(100) not null,
    gender              VARCHAR2(1) not null,
    birth_time          DATE,
    company_name        VARCHAR2(100),
    mobile              VARCHAR2(50),
    nation_code         VARCHAR2(3) default '01',
    home_address        VARCHAR2(200),
    relation_code       VARCHAR2(2),
    relation_name       VARCHAR2(50),
    relation_phone      VARCHAR2(50),
    medical_card_status VARCHAR2(20),
    create_card_date    DATE,
    privince            VARCHAR2(200),
    city                VARCHAR2(200),
    area                VARCHAR2(200),
    street              VARCHAR2(200),
    road                VARCHAR2(200),
    door_number         VARCHAR2(200),
    postcode            VARCHAR2(200),
    marry_code          VARCHAR2(2),
    marry_describe      VARCHAR2(200),
    nation_describe     VARCHAR2(200),
    job_title           VARCHAR2(200),
    company_mobile      VARCHAR2(50),
    relation_describe   VARCHAR2(200),
    insurance_type      VARCHAR2(200),
    insurance_describe  VARCHAR2(200),
    gender_describe     VARCHAR2(200),
    card_builder_code   VARCHAR2(50),
    card_builder_name   VARCHAR2(50),
    last_update_time    DATE
)   ;
comment on column CDR_MEDICAL_CARD.hospital_id
  is '组织机构代码';
comment on column CDR_MEDICAL_CARD.id_card
  is '身份证号';
comment on column CDR_MEDICAL_CARD.medical_card
  is '就诊卡号';
comment on column CDR_MEDICAL_CARD.patient_name
  is '患者姓名';
comment on column CDR_MEDICAL_CARD.gender
  is '患者性别代码';
comment on column CDR_MEDICAL_CARD.birth_time
  is '患者出生日期';
comment on column CDR_MEDICAL_CARD.company_name
  is '工作单位名称';
comment on column CDR_MEDICAL_CARD.mobile
  is '患者联系电话';
comment on column CDR_MEDICAL_CARD.nation_code
  is '民族代码';
comment on column CDR_MEDICAL_CARD.home_address
  is '患者完整地址';
comment on column CDR_MEDICAL_CARD.relation_code
  is '联系人关系代码';
comment on column CDR_MEDICAL_CARD.relation_name
  is '联系人姓名';
comment on column CDR_MEDICAL_CARD.relation_phone
  is '联系人电话';
comment on column CDR_MEDICAL_CARD.medical_card_status
  is '就诊卡状态';
comment on column CDR_MEDICAL_CARD.create_card_date
  is '建卡日期时间';
comment on column CDR_MEDICAL_CARD.privince
  is '省（自治区、直辖市）';
comment on column CDR_MEDICAL_CARD.city
  is '市（地区）';
comment on column CDR_MEDICAL_CARD.area
  is '县（区）';
comment on column CDR_MEDICAL_CARD.street
  is '乡（镇、街道办事处）';
comment on column CDR_MEDICAL_CARD.road
  is '村（街、路、弄等）';
comment on column CDR_MEDICAL_CARD.door_number
  is '门牌号码';
comment on column CDR_MEDICAL_CARD.postcode
  is '邮政编码';
comment on column CDR_MEDICAL_CARD.marry_code
  is '婚姻代码';
comment on column CDR_MEDICAL_CARD.marry_describe
  is '婚姻描述';
comment on column CDR_MEDICAL_CARD.nation_describe
  is '民族描述';
comment on column CDR_MEDICAL_CARD.job_title
  is '职业类别代码';
comment on column CDR_MEDICAL_CARD.company_mobile
  is '工作单位电话';
comment on column CDR_MEDICAL_CARD.relation_describe
  is '联系人关系描述';
comment on column CDR_MEDICAL_CARD.insurance_type
  is '医疗保险类别代码';
comment on column CDR_MEDICAL_CARD.insurance_describe
  is '医疗保险类别描述';
comment on column CDR_MEDICAL_CARD.gender_describe
  is '患者性别描述';
comment on column CDR_MEDICAL_CARD.card_builder_code
  is '建卡者工号';
comment on column CDR_MEDICAL_CARD.card_builder_name
  is '建卡者姓名';
comment on column CDR_MEDICAL_CARD.last_update_time
  is '最后修改时间';





create table CDR_MEDICAL_REC
(
    group_code        VARCHAR2(20) not null,
    organization_code VARCHAR2(20) not null,
    domain_id         VARCHAR2(2) not null,
    unicode           VARCHAR2(60) not null,
    type_code         VARCHAR2(36) not null,
    type_name         VARCHAR2(100) not null,
    patient_id        VARCHAR2(36) not null,
    visit_times       INTEGER not null,
    status            NUMBER(1) not null,
    sno               NUMBER(5),
    page_no           NUMBER(2),
    mr_id             VARCHAR2(36) not null,
    dept_id           NUMBER(18) not null,
    dept_name         VARCHAR2(300),
    creator_id        VARCHAR2(50),
    creator           VARCHAR2(300) not null,
    create_time       DATE not null,
    editor_id         VARCHAR2(50),
    editor            VARCHAR2(300),
    edit_time         DATE,
    cmpltr_id         VARCHAR2(50),
    cmpltr            VARCHAR2(300),
    cmplt_time        DATE
)
 ;
comment on table CDR_MEDICAL_REC
  is '病历记录';
comment on column CDR_MEDICAL_REC.group_code
  is '集团编码01';
comment on column CDR_MEDICAL_REC.organization_code
  is '组织编码001';
comment on column CDR_MEDICAL_REC.domain_id
  is '域id02';
comment on column CDR_MEDICAL_REC.unicode
  is '唯一编码';
comment on column CDR_MEDICAL_REC.type_code
  is '病历类型';
comment on column CDR_MEDICAL_REC.type_name
  is '病历类型名称';
comment on column CDR_MEDICAL_REC.patient_id
  is '患者id';
comment on column CDR_MEDICAL_REC.visit_times
  is '患者就诊次数';
comment on column CDR_MEDICAL_REC.status
  is '状态|病历编辑状态：-1-已作废；
1-已书写；
2-书写完成；
3-已签名；
4-已审订；
5-需重签（针对于患者签名）;
6-需重签（针对于医生签名）;';
comment on column CDR_MEDICAL_REC.sno
  is '病历显示序号';
comment on column CDR_MEDICAL_REC.page_no
  is '页面序号';
comment on column CDR_MEDICAL_REC.mr_id
  is '病历记录ID|病历记录唯一键，用GUID';
comment on column CDR_MEDICAL_REC.dept_id
  is '科室ID|书写本次病历的医生或护士所在科室ID';
comment on column CDR_MEDICAL_REC.dept_name
  is '科室名称';
comment on column CDR_MEDICAL_REC.creator_id
  is '创建人ID';
comment on column CDR_MEDICAL_REC.creator
  is '创建人|创建人';
comment on column CDR_MEDICAL_REC.create_time
  is '创建时间|创建时间';
comment on column CDR_MEDICAL_REC.editor_id
  is '修改人ID|最后修改人ID';
comment on column CDR_MEDICAL_REC.editor
  is '修改人|最后修改人';
comment on column CDR_MEDICAL_REC.edit_time
  is '修改时间|最后修改时间';
comment on column CDR_MEDICAL_REC.cmpltr_id
  is '完成人ID|首次非实习医生签名人ID';
comment on column CDR_MEDICAL_REC.cmpltr
  is '完成人|首次非实习医生签名人';
comment on column CDR_MEDICAL_REC.cmplt_time
  is '完成时间|完成时间';








create table CDR_MEDICAL_REC_BK
(
    group_code        VARCHAR2(20) not null,
    organization_code VARCHAR2(20) not null,
    domain_id         VARCHAR2(2) not null,
    unicode           VARCHAR2(60) not null,
    type_code         VARCHAR2(36) not null,
    type_name         VARCHAR2(100) not null,
    patient_id        VARCHAR2(36) not null,
    visit_times       INTEGER not null,
    status            NUMBER(1) not null,
    sno               NUMBER(5),
    page_no           NUMBER(2),
    mr_id             VARCHAR2(36) not null,
    dept_id           NUMBER(18) not null,
    dept_name         VARCHAR2(300),
    creator_id        VARCHAR2(50),
    creator           VARCHAR2(300) not null,
    create_time       DATE not null,
    editor_id         VARCHAR2(50),
    editor            VARCHAR2(300),
    edit_time         DATE,
    cmpltr_id         VARCHAR2(50),
    cmpltr            VARCHAR2(300),
    cmplt_time        DATE
)
 ;





create table CDR_MEDICAL_REC_CONTENT
(
    mr_content_id   VARCHAR2(36) not null,
    mr_id           VARCHAR2(36) not null,
    mr_frmt         CLOB not null,
    mr_text_content CLOB,
    mr_content      CLOB,
    create_time     DATE
)
 ;
comment on table CDR_MEDICAL_REC_CONTENT
  is '病历内容';
comment on column CDR_MEDICAL_REC_CONTENT.mr_content_id
  is '病历内容ID|病历内容主键，用GUID';
comment on column CDR_MEDICAL_REC_CONTENT.mr_id
  is '病历记录ID|病历记录唯一键，用GUID';
comment on column CDR_MEDICAL_REC_CONTENT.mr_frmt
  is '病历内容格式|病历内容格式';
comment on column CDR_MEDICAL_REC_CONTENT.mr_text_content
  is '病历记录文本内容';
comment on column CDR_MEDICAL_REC_CONTENT.mr_content
  is '病历内容|病历具体内容';
comment on column CDR_MEDICAL_REC_CONTENT.create_time
  is '病历创建时间';








create table CDR_MEDICAL_REC_CONTENT_BK
(
    mr_content_id   VARCHAR2(36) not null,
    mr_id           VARCHAR2(36) not null,
    mr_frmt         CLOB not null,
    mr_text_content CLOB,
    mr_content      CLOB,
    create_time     DATE
)  ;





create table CDR_MEDICINE_QUEUE
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    patient_id        VARCHAR2(36),
    outpatient_no     VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    patient_name      VARCHAR2(20),
    list_unicode      VARCHAR2(30) not null,
    order_detailid    VARCHAR2(50),
    item_code         VARCHAR2(50),
    item_name         VARCHAR2(100),
    specification     VARCHAR2(100),
    usingroute        VARCHAR2(180),
    frequency         VARCHAR2(50),
    quantity          VARCHAR2(50),
    exec_dept         VARCHAR2(50),
    dept_address      VARCHAR2(200),
    record_time       DATE,
    delete_flag       NUMBER(1),
    last_update_time  DATE
);




















comment on column CDR_MEDICINE_QUEUE.group_code
  is '集团编码';
comment on column CDR_MEDICINE_QUEUE.organization_code
  is '组织编码';
comment on column CDR_MEDICINE_QUEUE.domain_id
  is '系统域标识';
comment on column CDR_MEDICINE_QUEUE.patient_id
  is '个人标识号';
comment on column CDR_MEDICINE_QUEUE.outpatient_no
  is '门诊号';
comment on column CDR_MEDICINE_QUEUE.visit_no
  is '住院就诊流水号';
comment on column CDR_MEDICINE_QUEUE.visit_times
  is '就诊次数';
comment on column CDR_MEDICINE_QUEUE.patient_name
  is '患者姓名';
comment on column CDR_MEDICINE_QUEUE.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MEDICINE_QUEUE.order_detailid
  is '医嘱号';
comment on column CDR_MEDICINE_QUEUE.item_code
  is '药品编码';
comment on column CDR_MEDICINE_QUEUE.item_name
  is '药品名称';
comment on column CDR_MEDICINE_QUEUE.specification
  is '药品规格名称';
comment on column CDR_MEDICINE_QUEUE.usingroute
  is '药品用法名称';
comment on column CDR_MEDICINE_QUEUE.frequency
  is '用药频率名称';
comment on column CDR_MEDICINE_QUEUE.quantity
  is '待发药数量';
comment on column CDR_MEDICINE_QUEUE.exec_dept
  is '发药药房名称';
comment on column CDR_MEDICINE_QUEUE.dept_address
  is '药房地址';
comment on column CDR_MEDICINE_QUEUE.record_time
  is '医嘱开立时间';
comment on column CDR_MEDICINE_QUEUE.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_MEDICINE_QUEUE.last_update_time
  is '最后修改时间';





create table CDR_MEDICINE_QUEUE_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    patient_id        VARCHAR2(36),
    outpatient_no     VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    patient_name      VARCHAR2(20),
    list_unicode      VARCHAR2(30),
    order_detailid    VARCHAR2(50),
    item_code         VARCHAR2(50),
    item_name         VARCHAR2(100),
    specification     VARCHAR2(100),
    usingroute        VARCHAR2(180),
    frequency         VARCHAR2(50),
    quantity          VARCHAR2(50),
    exec_dept         VARCHAR2(50),
    dept_address      VARCHAR2(200),
    record_time       DATE,
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;





create table CDR_MEDICINE_QUEUE_lt
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    patient_id        VARCHAR2(36),
    outpatient_no     VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    patient_name      VARCHAR2(20),
    list_unicode      VARCHAR2(30) not null,
    order_detailid    VARCHAR2(50),
    item_code         VARCHAR2(50),
    item_name         VARCHAR2(100),
    specification     VARCHAR2(100),
    usingroute        VARCHAR2(180),
    frequency         VARCHAR2(50),
    quantity          VARCHAR2(50),
    exec_dept         VARCHAR2(50),
    dept_address      VARCHAR2(200),
    record_time       DATE,
    delete_flag       NUMBER(1),
    last_update_time  DATE
);

























create table CDR_MR_TEMPLATE
(
    template_id       VARCHAR2(120),
    template_type     NUMBER,
    type_id           VARCHAR2(120),
    template_code     VARCHAR2(120),
    template_name     VARCHAR2(120),
    apply_type        NUMBER,
    creator           VARCHAR2(120),
    create_time       DATE,
    editor            VARCHAR2(120),
    edit_time         DATE,
    note              VARCHAR2(120),
    basic_template_id VARCHAR2(120),
    print_control     NUMBER,
    is_enable         NUMBER,
    template_type_id  VARCHAR2(120),
    is_send_cda       NUMBER,
    is_send_pdf       NUMBER,
    task_control      NUMBER
)
 ;





create table CDR_MR_TYPE
(
    type_id           VARCHAR2(50) not null,
    type_class        VARCHAR2(50),
    type_code         VARCHAR2(50),
    type_name         VARCHAR2(100),
    frequency         VARCHAR2(50),
    time_limit        VARCHAR2(50),
    time_limit_unit   VARCHAR2(50),
    is_course         VARCHAR2(50),
    creator           VARCHAR2(50),
    create_time       DATE,
    editor            VARCHAR2(50),
    edit_time         DATE,
    note              VARCHAR2(80),
    business_group    VARCHAR2(50),
    is_independ_print VARCHAR2(50),
    mr_type_page_id   VARCHAR2(50),
    cda_doc_code      VARCHAR2(50),
    business_group_id VARCHAR2(50),
    is_new_page       VARCHAR2(50)
)
 ;






create table CDR_MR_TYPE_PAGE
(
    mr_type_page_id   VARCHAR2(36) not null,
    mr_type_page_code NUMBER(5) not null,
    mr_type_page_name VARCHAR2(50),
    creator           VARCHAR2(40) not null,
    create_time       DATE not null,
    editor            VARCHAR2(40),
    edit_time         DATE,
    default_focus     NUMBER(1) default 0
)
 ;
comment on table CDR_MR_TYPE_PAGE
  is '病历类型页面';
comment on column CDR_MR_TYPE_PAGE.mr_type_page_id
  is '病历类型页面ID';
comment on column CDR_MR_TYPE_PAGE.mr_type_page_code
  is '页面编码';
comment on column CDR_MR_TYPE_PAGE.mr_type_page_name
  is '页面名称';
comment on column CDR_MR_TYPE_PAGE.creator
  is '创建人|创建人';
comment on column CDR_MR_TYPE_PAGE.create_time
  is '创建时间|创建时间';
comment on column CDR_MR_TYPE_PAGE.editor
  is '修改人|最后修改人';
comment on column CDR_MR_TYPE_PAGE.edit_time
  is '修改时间|最后修改时间';
comment on column CDR_MR_TYPE_PAGE.default_focus
  is '默认定位|用于连续书写界面定位页面中病历';








create table CDR_MZ_CHARGE_DETAIL
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    patient_id             VARCHAR2(36),
    visit_no               VARCHAR2(36),
    visit_times            NUMBER(3),
    patient_name           VARCHAR2(30),
    age                    VARCHAR2(30),
    charge_detailid        VARCHAR2(36),
    settle_scene           NUMBER(1),
    recipel_detailid       VARCHAR2(36),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    charge_happentime      DATE,
    charge_settleid        VARCHAR2(36),
    charge_settletime      DATE,
    dept_code              VARCHAR2(10),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(10),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(10),
    exec_dept_name         VARCHAR2(50),
    exec_doctor_code       VARCHAR2(10),
    exec_doctor            VARCHAR2(50),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(100),
    detail_itemunit        VARCHAR2(24),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empsn           VARCHAR2(36),
    charge_deptsn          VARCHAR2(36),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(50),
    last_update_time       DATE
);




















comment on column CDR_MZ_CHARGE_DETAIL.group_code
  is '集团编码';
comment on column CDR_MZ_CHARGE_DETAIL.organization_code
  is '组织编码';
comment on column CDR_MZ_CHARGE_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_MZ_CHARGE_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_CHARGE_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_MZ_CHARGE_DETAIL.visit_no
  is '就诊流水号';
comment on column CDR_MZ_CHARGE_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_MZ_CHARGE_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_MZ_CHARGE_DETAIL.age
  is '年龄';
comment on column CDR_MZ_CHARGE_DETAIL.charge_detailid
  is '收费明细ID';
comment on column CDR_MZ_CHARGE_DETAIL.settle_scene
  is '收费场景代码 1：挂号时产生费用；2：门诊收费产生费用';
comment on column CDR_MZ_CHARGE_DETAIL.recipel_detailid
  is '对应处方明细ID';
comment on column CDR_MZ_CHARGE_DETAIL.charge_item_type
  is '收费项目类别代码01西药02中成药03中药饮片04卫生材料05检验06检查07手术08护理09床位10治疗11麻醉12输血13输氧99其他';
comment on column CDR_MZ_CHARGE_DETAIL.charge_type_hospital
  is '费用收入归类代码';
comment on column CDR_MZ_CHARGE_DETAIL.charge_happentime
  is '费用发生时间';
comment on column CDR_MZ_CHARGE_DETAIL.charge_settleid
  is '费用结算ID';
comment on column CDR_MZ_CHARGE_DETAIL.charge_settletime
  is '费用结算时间';
comment on column CDR_MZ_CHARGE_DETAIL.dept_code
  is '开单科室编码';
comment on column CDR_MZ_CHARGE_DETAIL.dept_name
  is '开单科室';
comment on column CDR_MZ_CHARGE_DETAIL.doctor_code
  is '开单医生编号';
comment on column CDR_MZ_CHARGE_DETAIL.doctor_name
  is '开单医生';
comment on column CDR_MZ_CHARGE_DETAIL.exec_dept_code
  is '执行科室编码';
comment on column CDR_MZ_CHARGE_DETAIL.exec_dept_name
  is '执行科室';
comment on column CDR_MZ_CHARGE_DETAIL.exec_doctor_code
  is '执行人员编号';
comment on column CDR_MZ_CHARGE_DETAIL.exec_doctor
  is '执行人员';
comment on column CDR_MZ_CHARGE_DETAIL.detail_itemcode
  is '明细项目代码';
comment on column CDR_MZ_CHARGE_DETAIL.detail_itemname
  is '明细项目名称';
comment on column CDR_MZ_CHARGE_DETAIL.detail_itemunit
  is '明细项目单位';
comment on column CDR_MZ_CHARGE_DETAIL.detail_itemunit_price
  is '明细项目单价';
comment on column CDR_MZ_CHARGE_DETAIL.detail_item_quantity
  is '明细项目数量';
comment on column CDR_MZ_CHARGE_DETAIL.detail_item_receivable
  is '明细项目应收金额';
comment on column CDR_MZ_CHARGE_DETAIL.detail_item_received
  is '明细项目实收金额';
comment on column CDR_MZ_CHARGE_DETAIL.charge_empsn
  is '收/退费员编码';
comment on column CDR_MZ_CHARGE_DETAIL.charge_deptsn
  is '收/退费科室编码';
comment on column CDR_MZ_CHARGE_DETAIL.charge_status
  is '收费状态 1未缴费2已缴费3退费';
comment on column CDR_MZ_CHARGE_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_MZ_CHARGE_DETAIL.delete_unicode
  is '对应被退费的收费记录ID';
comment on column CDR_MZ_CHARGE_DETAIL.last_update_time
  is '最后修改时间';




create table CDR_MZ_CHARGE_DETAIL_RECORDS
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    patient_id             VARCHAR2(36),
    visit_no               VARCHAR2(36),
    visit_times            NUMBER(3),
    patient_name           VARCHAR2(30),
    age                    VARCHAR2(30),
    charge_detailid        VARCHAR2(36),
    settle_scene           NUMBER(1),
    recipel_detailid       VARCHAR2(36),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    charge_happentime      DATE,
    charge_settleid        VARCHAR2(36),
    charge_settletime      DATE,
    dept_code              VARCHAR2(10),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(10),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(10),
    exec_dept_name         VARCHAR2(50),
    exec_doctor_code       VARCHAR2(10),
    exec_doctor            VARCHAR2(50),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(100),
    detail_itemunit        VARCHAR2(24),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empsn           VARCHAR2(36),
    charge_deptsn          VARCHAR2(36),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(50),
    last_update_time       DATE
)
 ;





create table CDR_MZ_DIAGNOSE_DETAIL
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    visit_no                    VARCHAR2(36),
    visit_times                 NUMBER(3),
    patient_id                  VARCHAR2(36),
    patient_name                VARCHAR2(50),
    age                         VARCHAR2(30),
    list_unicode                VARCHAR2(30) not null,
    diagnosed_id                VARCHAR2(36),
    diagnosed_method            VARCHAR2(2),
    diagnosed_type              VARCHAR2(2),
    diagnosed_primary_secondary VARCHAR2(2),
    sort_no                     NUMBER(2),
    diagnosis_code              VARCHAR2(32),
    diagnosis                   VARCHAR2(200),
    diagnosis_doc_code          VARCHAR2(10),
    diagnosis_doc               VARCHAR2(36),
    tcm_pattern_code            VARCHAR2(20),
    tcm_pattern_name            VARCHAR2(36),
    suspected_diagnosis         NUMBER(1),
    record_time                 DATE,
    last_edit_time              DATE,
    last_edit_code              VARCHAR2(10),
    last_editor                 VARCHAR2(50),
    delete_flag                 NUMBER(1),
    last_update_time            DATE
);




















comment on column CDR_MZ_DIAGNOSE_DETAIL.group_code
  is '集团编码';
comment on column CDR_MZ_DIAGNOSE_DETAIL.organization_code
  is '组织编码';
comment on column CDR_MZ_DIAGNOSE_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_MZ_DIAGNOSE_DETAIL.visit_no
  is '就诊流水号';
comment on column CDR_MZ_DIAGNOSE_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_MZ_DIAGNOSE_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_MZ_DIAGNOSE_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_MZ_DIAGNOSE_DETAIL.age
  is '年龄';
comment on column CDR_MZ_DIAGNOSE_DETAIL.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosed_id
  is '诊断ID';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosed_method
  is '诊断方法代码 01：西医；02：中医';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosed_type
  is '诊断类别代码';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosed_primary_secondary
  is '诊断主次代码 01：主要诊断；02：次要诊断';
comment on column CDR_MZ_DIAGNOSE_DETAIL.sort_no
  is '诊断顺序';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosis_code
  is '诊断代码';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosis
  is '诊断名称';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosis_doc_code
  is '诊断医生编码';
comment on column CDR_MZ_DIAGNOSE_DETAIL.diagnosis_doc
  is '诊断医生姓名';
comment on column CDR_MZ_DIAGNOSE_DETAIL.tcm_pattern_code
  is '中医病证区别代码 01：病；02：证；诊断方法代码为02 时必须填写 ，中医科及相关专业应填';
comment on column CDR_MZ_DIAGNOSE_DETAIL.tcm_pattern_name
  is '中医证候名';
comment on column CDR_MZ_DIAGNOSE_DETAIL.suspected_diagnosis
  is '是否疑诊 0 否；1 是';
comment on column CDR_MZ_DIAGNOSE_DETAIL.record_time
  is '诊断记录时间';
comment on column CDR_MZ_DIAGNOSE_DETAIL.last_edit_time
  is '最后编辑时间';
comment on column CDR_MZ_DIAGNOSE_DETAIL.last_edit_code
  is '最后编辑人编码';
comment on column CDR_MZ_DIAGNOSE_DETAIL.last_editor
  is '最后编辑人';
comment on column CDR_MZ_DIAGNOSE_DETAIL.delete_flag
  is '删除标志 0：否，1：是';
comment on column CDR_MZ_DIAGNOSE_DETAIL.last_update_time
  is '最后修改时间';




create table CDR_MZ_DIAGNOSE_DETAIL_20240531
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    visit_no                    VARCHAR2(36),
    visit_times                 NUMBER(3),
    patient_id                  VARCHAR2(36),
    patient_name                VARCHAR2(50),
    age                         VARCHAR2(30),
    list_unicode                VARCHAR2(30) not null,
    diagnosed_id                VARCHAR2(36),
    diagnosed_method            VARCHAR2(2),
    diagnosed_type              VARCHAR2(2),
    diagnosed_primary_secondary VARCHAR2(2),
    sort_no                     NUMBER(2),
    diagnosis_code              VARCHAR2(32),
    diagnosis                   VARCHAR2(200),
    diagnosis_doc_code          VARCHAR2(10),
    diagnosis_doc               VARCHAR2(36),
    tcm_pattern_code            VARCHAR2(20),
    tcm_pattern_name            VARCHAR2(36),
    suspected_diagnosis         NUMBER(1),
    record_time                 DATE,
    last_edit_time              DATE,
    last_edit_code              VARCHAR2(10),
    last_editor                 VARCHAR2(50),
    delete_flag                 NUMBER(1),
    last_update_time            DATE
)
 ;





create table CDR_MZ_DIAGNOSE_DETAIL_RECORDS
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    visit_no                    VARCHAR2(36),
    visit_times                 NUMBER(3),
    patient_id                  VARCHAR2(36),
    patient_name                VARCHAR2(50),
    age                         VARCHAR2(30),
    list_unicode                VARCHAR2(30) not null,
    diagnosed_id                VARCHAR2(36),
    diagnosed_method            VARCHAR2(2),
    diagnosed_type              VARCHAR2(2),
    diagnosed_primary_secondary VARCHAR2(2),
    sort_no                     NUMBER(2),
    diagnosis_code              VARCHAR2(32),
    diagnosis                   VARCHAR2(200),
    diagnosis_doc_code          VARCHAR2(10),
    diagnosis_doc               VARCHAR2(36),
    tcm_pattern_code            VARCHAR2(20),
    tcm_pattern_name            VARCHAR2(36),
    suspected_diagnosis         NUMBER(1),
    record_time                 DATE,
    last_edit_time              DATE,
    last_edit_code              VARCHAR2(10),
    last_editor                 VARCHAR2(50),
    delete_flag                 NUMBER(1),
    last_update_time            DATE
)
 ;





create table CDR_MZ_PAYMENT_DETAIL
(
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    patient_id           VARCHAR2(36),
    visit_no             VARCHAR2(36),
    visit_times          NUMBER(3),
    patient_name         VARCHAR2(50),
    age                  VARCHAR2(30),
    charge_settleid      VARCHAR2(36),
    settle_status        NUMBER(1),
    list_unicode         VARCHAR2(40) not null,
    payment_id           VARCHAR2(36),
    pay_type_code        VARCHAR2(2),
    payment_money        NUMBER(12,4),
    settle_time          DATE,
    settlement_clerkcode VARCHAR2(36),
    payment_serialno     VARCHAR2(100),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    group_code           VARCHAR2(20),
    last_update_time     DATE
);




















comment on column CDR_MZ_PAYMENT_DETAIL.organization_code
  is '组织编码';
comment on column CDR_MZ_PAYMENT_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_MZ_PAYMENT_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_MZ_PAYMENT_DETAIL.visit_no
  is '就诊流水号';
comment on column CDR_MZ_PAYMENT_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_MZ_PAYMENT_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_MZ_PAYMENT_DETAIL.age
  is '年龄';
comment on column CDR_MZ_PAYMENT_DETAIL.charge_settleid
  is '结算记录ID';
comment on column CDR_MZ_PAYMENT_DETAIL.settle_status
  is '记录收费状态';
comment on column CDR_MZ_PAYMENT_DETAIL.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_PAYMENT_DETAIL.payment_id
  is '支付方式记录ID';
comment on column CDR_MZ_PAYMENT_DETAIL.pay_type_code
  is '支付方式编码 01:现金02:支票03:汇款存款04:内部转账05:单位记账06:账户金07:统筹金08:银行卡09:微信10:支付宝11:银联99:其他';
comment on column CDR_MZ_PAYMENT_DETAIL.payment_money
  is '支付金额';
comment on column CDR_MZ_PAYMENT_DETAIL.settle_time
  is '费用结算时间';
comment on column CDR_MZ_PAYMENT_DETAIL.settlement_clerkcode
  is '结算人员编号';
comment on column CDR_MZ_PAYMENT_DETAIL.payment_serialno
  is '支付流水号';
comment on column CDR_MZ_PAYMENT_DETAIL.delete_flag
  is '修改标志 0:正常 1:取消结算';
comment on column CDR_MZ_PAYMENT_DETAIL.delete_unicode
  is '被取消结算的记录ID';
comment on column CDR_MZ_PAYMENT_DETAIL.group_code
  is '集团编码';
comment on column CDR_MZ_PAYMENT_DETAIL.last_update_time
  is '最后修改时间';





create table CDR_MZ_PAYMENT_DETAIL_RECORDS
(
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    patient_id           VARCHAR2(36),
    visit_no             VARCHAR2(36),
    visit_times          NUMBER(3),
    patient_name         VARCHAR2(50),
    age                  VARCHAR2(30),
    charge_settleid      VARCHAR2(36),
    settle_status        NUMBER(1),
    list_unicode         VARCHAR2(40) not null,
    payment_id           VARCHAR2(36),
    pay_type_code        VARCHAR2(2),
    payment_money        NUMBER(12,4),
    settle_time          DATE,
    settlement_clerkcode VARCHAR2(36),
    payment_serialno     VARCHAR2(100),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    group_code           VARCHAR2(20),
    last_update_time     DATE
)
 ;





create table CDR_MZ_RECIPEL
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    unicode                    VARCHAR2(30) not null,
    visit_no                   VARCHAR2(36),
    visit_times                NUMBER(3),
    patient_id                 VARCHAR2(36),
    patient_name               VARCHAR2(80),
    age                        VARCHAR2(30),
    recipel_id                 VARCHAR2(36),
    recipel_type               NUMBER(2),
    press_class                VARCHAR2(2),
    recipel_validdays          NUMBER(3),
    recipel_notices            VARCHAR2(100),
    chinese_medicine_quantity  NUMBER(2),
    chinese_medicine_frequency VARCHAR2(100),
    chinese_medicine_boiling   VARCHAR2(100),
    chinese_medicine_way       VARCHAR2(100),
    notices                    VARCHAR2(200),
    record_time                DATE,
    recipel_start              DATE,
    recipel_end                DATE,
    doctor_name                VARCHAR2(36),
    doctor_code                VARCHAR2(10),
    recipel_dept_code          VARCHAR2(36),
    recipel_dept_name          VARCHAR2(100),
    over_reason                VARCHAR2(128),
    last_update_time           DATE
);




















comment on column CDR_MZ_RECIPEL.group_code
  is '集团编码';
comment on column CDR_MZ_RECIPEL.organization_code
  is '组织编码';
comment on column CDR_MZ_RECIPEL.domain_id
  is '系统域标识';
comment on column CDR_MZ_RECIPEL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_RECIPEL.visit_no
  is '就诊流水号';
comment on column CDR_MZ_RECIPEL.visit_times
  is '就诊次数';
comment on column CDR_MZ_RECIPEL.patient_id
  is '个人标识号';
comment on column CDR_MZ_RECIPEL.patient_name
  is '患者姓名';
comment on column CDR_MZ_RECIPEL.age
  is '年龄';
comment on column CDR_MZ_RECIPEL.recipel_id
  is '处方ID';
comment on column CDR_MZ_RECIPEL.recipel_type
  is '处方分类01:普通处方；02:急诊处方；03:儿科处方；04:麻醉药品和第一类精神药品处方；05:第二类精神药品处方；99:无法归类处方';
comment on column CDR_MZ_RECIPEL.press_class
  is '处方类别01西药处方 02中成药处方 03中药处方';
comment on column CDR_MZ_RECIPEL.recipel_validdays
  is '处方有效天数';
comment on column CDR_MZ_RECIPEL.recipel_notices
  is '处方备注信息';
comment on column CDR_MZ_RECIPEL.chinese_medicine_quantity
  is '中药剂数/付数 如：5剂，中药处方必填，单位：剂';
comment on column CDR_MZ_RECIPEL.chinese_medicine_frequency
  is '中药用法频次 如：每日一剂，中药处方必填';
comment on column CDR_MZ_RECIPEL.chinese_medicine_boiling
  is '中药煎煮法 如：水煎，中药处方应填';
comment on column CDR_MZ_RECIPEL.chinese_medicine_way
  is '中药服法 如：分早晚两次空腹温服，中药处方应填';
comment on column CDR_MZ_RECIPEL.notices
  is '处方备注';
comment on column CDR_MZ_RECIPEL.record_time
  is '处方开立时间';
comment on column CDR_MZ_RECIPEL.recipel_start
  is '处方开始时间';
comment on column CDR_MZ_RECIPEL.recipel_end
  is '处方停止时间';
comment on column CDR_MZ_RECIPEL.doctor_name
  is '处方开立医生';
comment on column CDR_MZ_RECIPEL.doctor_code
  is '处方开立医生编码';
comment on column CDR_MZ_RECIPEL.recipel_dept_code
  is '处方开立科室编码';
comment on column CDR_MZ_RECIPEL.recipel_dept_name
  is '处方开立科室';
comment on column CDR_MZ_RECIPEL.over_reason
  is '超量开单原因内容';
comment on column CDR_MZ_RECIPEL.last_update_time
  is '最后修改时间';




create table CDR_MZ_RECIPEL_DETAIL
(
    patient_id          VARCHAR2(36),
    recipel_id          VARCHAR2(36),
    list_unicode        VARCHAR2(30) not null,
    recipel_detailid    VARCHAR2(36),
    medical_orderno     NUMBER(8),
    parent_orderno      NUMBER(20),
    item_code           VARCHAR2(36),
    item_name           VARCHAR2(84),
    item_classification VARCHAR2(32),
    dosage_formcode     VARCHAR2(4),
    drug_specification  VARCHAR2(84),
    drug_usingroute     VARCHAR2(80),
    drug_frequency_code VARCHAR2(80),
    single_dosage       NUMBER(10,2),
    dosage_unit         VARCHAR2(6),
    total_dosage        NUMBER(12,2),
    total_dosage_unit   VARCHAR2(6),
    speed               VARCHAR2(20),
    drug_price          NUMBER(15,4),
    skin_test_resultno  VARCHAR2(20),
    exec_dept_code      VARCHAR2(20),
    exec_dept           VARCHAR2(50),
    exec_doctor_code    VARCHAR2(10),
    exec_doctor         VARCHAR2(50),
    exec_time           DATE,
    batch_no            VARCHAR2(50),
    charge_status       NUMBER(1),
    registration_time   DATE,
    charge_type         VARCHAR2(10),
    delete_flag         NUMBER(1),
    last_update_time    DATE,
    medication_days     NUMBER,
    sort_no             NUMBER
);




















comment on column CDR_MZ_RECIPEL_DETAIL.patient_id
  is '个人标识号(用于和主表进行关联)';
comment on column CDR_MZ_RECIPEL_DETAIL.recipel_id
  is '处方ID(用于和主表进行关联)';
comment on column CDR_MZ_RECIPEL_DETAIL.list_unicode
  is '数据记录主键，作为循环数据记录唯一行';
comment on column CDR_MZ_RECIPEL_DETAIL.recipel_detailid
  is '处方明细ID';
comment on column CDR_MZ_RECIPEL_DETAIL.medical_orderno
  is '医嘱号';
comment on column CDR_MZ_RECIPEL_DETAIL.parent_orderno
  is '父医嘱号';
comment on column CDR_MZ_RECIPEL_DETAIL.item_code
  is '药品代码';
comment on column CDR_MZ_RECIPEL_DETAIL.item_name
  is '药品名称';
comment on column CDR_MZ_RECIPEL_DETAIL.item_classification
  is '药品分类代码';
comment on column CDR_MZ_RECIPEL_DETAIL.dosage_formcode
  is '剂型代码';
comment on column CDR_MZ_RECIPEL_DETAIL.drug_specification
  is '药品规格';
comment on column CDR_MZ_RECIPEL_DETAIL.drug_usingroute
  is '用药途径代码';
comment on column CDR_MZ_RECIPEL_DETAIL.drug_frequency_code
  is '使用频次代码';
comment on column CDR_MZ_RECIPEL_DETAIL.single_dosage
  is '使用次剂量';
comment on column CDR_MZ_RECIPEL_DETAIL.dosage_unit
  is '使用剂量单位';
comment on column CDR_MZ_RECIPEL_DETAIL.total_dosage
  is '使用总剂量';
comment on column CDR_MZ_RECIPEL_DETAIL.total_dosage_unit
  is '总剂量单位';
comment on column CDR_MZ_RECIPEL_DETAIL.speed
  is '滴速';
comment on column CDR_MZ_RECIPEL_DETAIL.drug_price
  is '标准单价';
comment on column CDR_MZ_RECIPEL_DETAIL.skin_test_resultno
  is '皮试记录号';
comment on column CDR_MZ_RECIPEL_DETAIL.exec_dept_code
  is '执行科室编码';
comment on column CDR_MZ_RECIPEL_DETAIL.exec_dept
  is '执行科室';
comment on column CDR_MZ_RECIPEL_DETAIL.exec_doctor_code
  is '处方执行人编号';
comment on column CDR_MZ_RECIPEL_DETAIL.exec_doctor
  is '处方执行人';
comment on column CDR_MZ_RECIPEL_DETAIL.exec_time
  is '处方执行时间';
comment on column CDR_MZ_RECIPEL_DETAIL.batch_no
  is '药品批次';
comment on column CDR_MZ_RECIPEL_DETAIL.charge_status
  is '收费状态 1未缴费2已缴费3已退费';
comment on column CDR_MZ_RECIPEL_DETAIL.registration_time
  is '收费时间';
comment on column CDR_MZ_RECIPEL_DETAIL.charge_type
  is '费用类型';
comment on column CDR_MZ_RECIPEL_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）；1：撤销 作废时传1';
comment on column CDR_MZ_RECIPEL_DETAIL.last_update_time
  is '最后修改时间';
comment on column CDR_MZ_RECIPEL_DETAIL.medication_days
  is '用药天数';
comment on column CDR_MZ_RECIPEL_DETAIL.sort_no
  is '医嘱排序号';










create table CDR_MZ_RECIPEL_OTHER
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    visit_no                 VARCHAR2(36),
    visit_times              NUMBER(3),
    patient_id               VARCHAR2(36),
    patient_name             VARCHAR2(20),
    age                      VARCHAR2(30),
    list_unicode             VARCHAR2(30) not null,
    recipel_type             VARCHAR2(5),
    recipel_validdays        NUMBER(3),
    notices                  VARCHAR2(100),
    medical_orderno          NUMBER(8),
    recipel_detailid         VARCHAR2(36),
    item_code                VARCHAR2(36),
    item_name                VARCHAR2(100),
    charge_price             NUMBER(15,4),
    amount                   NUMBER(8,4),
    record_time              DATE,
    recipel_start            DATE,
    recipel_end              DATE,
    apply_doctor_code        VARCHAR2(10),
    apply_doctor_name        VARCHAR2(36),
    recipel_dept_code        VARCHAR2(36),
    recipel_dept_name        VARCHAR2(64),
    item_classification      VARCHAR2(32),
    item_classification_name VARCHAR2(50),
    frequency_code           VARCHAR2(20),
    exec_dept_code           VARCHAR2(64),
    exec_doctor_code         VARCHAR2(10),
    exec_doctor              VARCHAR2(50),
    exec_time                DATE,
    charge_status            NUMBER(1),
    registration_time        DATE,
    delete_flag              NUMBER(1),
    last_update_time         DATE,
    sort_no                  NUMBER
);




















comment on column CDR_MZ_RECIPEL_OTHER.group_code
  is '集团编码';
comment on column CDR_MZ_RECIPEL_OTHER.organization_code
  is '组织编码';
comment on column CDR_MZ_RECIPEL_OTHER.domain_id
  is '系统域标识';
comment on column CDR_MZ_RECIPEL_OTHER.visit_no
  is '就诊流水号';
comment on column CDR_MZ_RECIPEL_OTHER.visit_times
  is '就诊次数';
comment on column CDR_MZ_RECIPEL_OTHER.patient_id
  is '个人标识号';
comment on column CDR_MZ_RECIPEL_OTHER.patient_name
  is '患者姓名';
comment on column CDR_MZ_RECIPEL_OTHER.age
  is '年龄';
comment on column CDR_MZ_RECIPEL_OTHER.list_unicode
  is '数据记录主键，作为循环数据记录唯一行';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_type
  is '处方分类 01：普通处方；02：急诊处方；03：儿科处方；04：麻醉药品和第一类精神药品处方；05：第二类精神药品处方；99：无法归类处方';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_validdays
  is '处方有效天数';
comment on column CDR_MZ_RECIPEL_OTHER.notices
  is '处方备注';
comment on column CDR_MZ_RECIPEL_OTHER.medical_orderno
  is '医嘱号';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_detailid
  is '处方明细ID';
comment on column CDR_MZ_RECIPEL_OTHER.item_code
  is '项目代码';
comment on column CDR_MZ_RECIPEL_OTHER.item_name
  is '项目名称';
comment on column CDR_MZ_RECIPEL_OTHER.charge_price
  is '标准单价';
comment on column CDR_MZ_RECIPEL_OTHER.amount
  is '数量';
comment on column CDR_MZ_RECIPEL_OTHER.record_time
  is '处方开嘱时间';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_start
  is '处方开始时间';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_end
  is '处方停止时间';
comment on column CDR_MZ_RECIPEL_OTHER.apply_doctor_code
  is '处方开立医生编码';
comment on column CDR_MZ_RECIPEL_OTHER.apply_doctor_name
  is '处方开立医生';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_dept_code
  is '处方开立科室编码';
comment on column CDR_MZ_RECIPEL_OTHER.recipel_dept_name
  is '处方开立科室';
comment on column CDR_MZ_RECIPEL_OTHER.item_classification
  is '项目分类代码';
comment on column CDR_MZ_RECIPEL_OTHER.item_classification_name
  is '项目分类名称';
comment on column CDR_MZ_RECIPEL_OTHER.frequency_code
  is '使用频次代码';
comment on column CDR_MZ_RECIPEL_OTHER.exec_dept_code
  is '执行科室编码';
comment on column CDR_MZ_RECIPEL_OTHER.exec_doctor_code
  is '处方执行人编号';
comment on column CDR_MZ_RECIPEL_OTHER.exec_doctor
  is '处方执行人';
comment on column CDR_MZ_RECIPEL_OTHER.exec_time
  is '处方执行时间';
comment on column CDR_MZ_RECIPEL_OTHER.charge_status
  is '收费状态 1未缴费2已缴费3退费';
comment on column CDR_MZ_RECIPEL_OTHER.registration_time
  is '收费时间';
comment on column CDR_MZ_RECIPEL_OTHER.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销 作废时传1';
comment on column CDR_MZ_RECIPEL_OTHER.last_update_time
  is '最后修改时间';
comment on column CDR_MZ_RECIPEL_OTHER.sort_no
  is '医嘱排序号';




create table CDR_MZ_RECIPEL_OTHER_BF
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    visit_no                 VARCHAR2(36),
    visit_times              NUMBER(3),
    patient_id               VARCHAR2(36),
    patient_name             VARCHAR2(20),
    age                      VARCHAR2(30),
    list_unicode             VARCHAR2(30) not null,
    recipel_type             VARCHAR2(5),
    recipel_validdays        NUMBER(3),
    notices                  VARCHAR2(100),
    medical_orderno          NUMBER(8),
    recipel_detailid         VARCHAR2(36),
    item_code                VARCHAR2(36),
    item_name                VARCHAR2(64),
    charge_price             NUMBER(15,4),
    amount                   NUMBER(8,4),
    record_time              DATE,
    recipel_start            DATE,
    recipel_end              DATE,
    apply_doctor_code        VARCHAR2(10),
    apply_doctor_name        VARCHAR2(36),
    recipel_dept_code        VARCHAR2(36),
    recipel_dept_name        VARCHAR2(64),
    item_classification      VARCHAR2(32),
    item_classification_name VARCHAR2(50),
    frequency_code           VARCHAR2(20),
    exec_dept_code           VARCHAR2(64),
    exec_doctor_code         VARCHAR2(10),
    exec_doctor              VARCHAR2(50),
    exec_time                DATE,
    charge_status            NUMBER(1),
    registration_time        DATE,
    delete_flag              NUMBER(1),
    last_update_time         DATE,
    sort_no                  NUMBER
)
 ;





create table CDR_MZ_RECIPEL_OTHER_RECORDS
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    visit_no                 VARCHAR2(36),
    visit_times              NUMBER(3),
    patient_id               VARCHAR2(36),
    patient_name             VARCHAR2(20),
    age                      VARCHAR2(30),
    list_unicode             VARCHAR2(30) not null,
    recipel_type             VARCHAR2(5),
    recipel_validdays        NUMBER(3),
    notices                  VARCHAR2(100),
    medical_orderno          NUMBER(8),
    recipel_detailid         VARCHAR2(36),
    item_code                VARCHAR2(36),
    item_name                VARCHAR2(100),
    charge_price             NUMBER(15,4),
    amount                   NUMBER(8,4),
    record_time              DATE,
    recipel_start            DATE,
    recipel_end              DATE,
    apply_doctor_code        VARCHAR2(10),
    apply_doctor_name        VARCHAR2(36),
    recipel_dept_code        VARCHAR2(36),
    recipel_dept_name        VARCHAR2(64),
    item_classification      VARCHAR2(32),
    item_classification_name VARCHAR2(50),
    frequency_code           VARCHAR2(20),
    exec_dept_code           VARCHAR2(64),
    exec_doctor_code         VARCHAR2(10),
    exec_doctor              VARCHAR2(50),
    exec_time                DATE,
    charge_status            NUMBER(1),
    registration_time        DATE,
    delete_flag              NUMBER(1),
    last_update_time         DATE,
    sort_no                  NUMBER
)
 ;





create table CDR_MZ_REGISTER_DETAIL
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(50) not null,
    register_id          VARCHAR2(36),
    visit_no             VARCHAR2(36),
    outpatient_no        VARCHAR2(20),
    patient_id           VARCHAR2(20),
    visit_times          NUMBER(3),
    patient_name         VARCHAR2(80),
    refund_flag          NUMBER(2),
    receipt_no           VARCHAR2(50),
    register_refund_time DATE,
    register_type        VARCHAR2(3),
    reserved_type        NUMBER(1),
    emergency_flag       NUMBER(1),
    schedule_id          VARCHAR2(20),
    register_waycode     NUMBER(1),
    department_code      VARCHAR2(64),
    department_name      VARCHAR2(64),
    register_doctor_code VARCHAR2(20),
    register_doctor      VARCHAR2(50),
    register_time_period VARCHAR2(30),
    register_charge      NUMBER(12,4),
    pay_type_code        VARCHAR2(20),
    insurance_type       VARCHAR2(20),
    gh_clinic_date       DATE,
    medical_cardno       VARCHAR2(50),
    ehealth_card         VARCHAR2(100),
    special_flag         NUMBER(1),
    nonlocal_flag        NUMBER(1),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    modify_date          DATE,
    last_update_time     DATE,
    reserved_sort        INTEGER
);




















comment on column CDR_MZ_REGISTER_DETAIL.group_code
  is '集团编码';
comment on column CDR_MZ_REGISTER_DETAIL.organization_code
  is '组织编码';
comment on column CDR_MZ_REGISTER_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_MZ_REGISTER_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_REGISTER_DETAIL.register_id
  is '挂号记录ID';
comment on column CDR_MZ_REGISTER_DETAIL.visit_no
  is '流水号';
comment on column CDR_MZ_REGISTER_DETAIL.outpatient_no
  is '门诊号';
comment on column CDR_MZ_REGISTER_DETAIL.patient_id
  is '患者ID';
comment on column CDR_MZ_REGISTER_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_MZ_REGISTER_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_MZ_REGISTER_DETAIL.refund_flag
  is '挂号标志1挂号2退号';
comment on column CDR_MZ_REGISTER_DETAIL.receipt_no
  is '收/退费编号';
comment on column CDR_MZ_REGISTER_DETAIL.register_refund_time
  is '实际挂/退号时间';
comment on column CDR_MZ_REGISTER_DETAIL.register_type
  is '挂号类别100普通101专科102专家103特需104专病999其他';
comment on column CDR_MZ_REGISTER_DETAIL.reserved_type
  is '预约标志1:预约0:不预约';
comment on column CDR_MZ_REGISTER_DETAIL.emergency_flag
  is '是否急诊1:急诊0:非急诊';
comment on column CDR_MZ_REGISTER_DETAIL.schedule_id
  is '号源id';
comment on column CDR_MZ_REGISTER_DETAIL.register_waycode
  is '挂号途径代码1.微信挂号 2.支付宝挂号 3.自助机挂号 4.医院APP挂号 5.电话挂号 6.网上挂号 7.挂号窗口 8.门诊诊间 9. 其它';
comment on column CDR_MZ_REGISTER_DETAIL.department_code
  is '挂号科室编码';
comment on column CDR_MZ_REGISTER_DETAIL.department_name
  is '挂号科室名称';
comment on column CDR_MZ_REGISTER_DETAIL.register_doctor_code
  is '挂号医生编号';
comment on column CDR_MZ_REGISTER_DETAIL.register_doctor
  is '挂号医生';
comment on column CDR_MZ_REGISTER_DETAIL.register_time_period
  is '挂号时段';
comment on column CDR_MZ_REGISTER_DETAIL.register_charge
  is '挂号总费用';
comment on column CDR_MZ_REGISTER_DETAIL.pay_type_code
  is '支付编码01现金02支票03汇款存款04内部转账05单位记账06账户金07统筹金08银行卡09微信10支付宝99其他';
comment on column CDR_MZ_REGISTER_DETAIL.insurance_type
  is '保险类型（患者属性）01城镇职工02城镇居民03新农合04贫困救助05商业险06全公费07全自费99其他';
comment on column CDR_MZ_REGISTER_DETAIL.gh_clinic_date
  is '计划就诊日期';
comment on column CDR_MZ_REGISTER_DETAIL.medical_cardno
  is '就诊卡号';
comment on column CDR_MZ_REGISTER_DETAIL.ehealth_card
  is '电子健康卡号';
comment on column CDR_MZ_REGISTER_DETAIL.special_flag
  is '特需标志0非特需，1特需';
comment on column CDR_MZ_REGISTER_DETAIL.nonlocal_flag
  is '外地标志1:本市 2:外地 3:境外（港澳台） 4:外国 5:未知';
comment on column CDR_MZ_REGISTER_DETAIL.delete_flag
  is '删除标志0正常 1撤销（退号时传1）';
comment on column CDR_MZ_REGISTER_DETAIL.delete_unicode
  is '退号记录ID';
comment on column CDR_MZ_REGISTER_DETAIL.modify_date
  is '操作时间（退号，更新时间）';
comment on column CDR_MZ_REGISTER_DETAIL.last_update_time
  is '最后修改时间';
comment on column CDR_MZ_REGISTER_DETAIL.reserved_sort
  is '挂号序号';




create table CDR_MZ_REGISTER_DETAIL0921
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(50) not null,
    register_id          VARCHAR2(36),
    visit_no             VARCHAR2(36),
    outpatient_no        VARCHAR2(20),
    patient_id           VARCHAR2(20),
    visit_times          NUMBER(3),
    patient_name         VARCHAR2(80),
    refund_flag          NUMBER(2),
    receipt_no           VARCHAR2(50),
    register_refund_time DATE,
    register_type        VARCHAR2(3),
    reserved_type        NUMBER(1),
    emergency_flag       NUMBER(1),
    schedule_id          VARCHAR2(20),
    register_waycode     NUMBER(1),
    department_code      VARCHAR2(64),
    department_name      VARCHAR2(64),
    register_doctor_code VARCHAR2(20),
    register_doctor      VARCHAR2(50),
    register_time_period VARCHAR2(30),
    register_charge      NUMBER(12,4),
    pay_type_code        VARCHAR2(20),
    insurance_type       VARCHAR2(20),
    gh_clinic_date       DATE,
    medical_cardno       VARCHAR2(50),
    ehealth_card         VARCHAR2(100),
    special_flag         NUMBER(1),
    nonlocal_flag        NUMBER(1),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    modify_date          DATE,
    last_update_time     DATE,
    reserved_sort        INTEGER
)
 ;





create table CDR_MZ_REGISTER_DETAIL_0911
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(50) not null,
    register_id          VARCHAR2(36),
    visit_no             VARCHAR2(36),
    outpatient_no        VARCHAR2(20),
    patient_id           VARCHAR2(20),
    visit_times          NUMBER(3),
    patient_name         VARCHAR2(80),
    refund_flag          NUMBER(2),
    receipt_no           VARCHAR2(50),
    register_refund_time DATE,
    register_type        VARCHAR2(3),
    reserved_type        NUMBER(1),
    emergency_flag       NUMBER(1),
    schedule_id          VARCHAR2(20),
    register_waycode     NUMBER(1),
    department_code      VARCHAR2(64),
    department_name      VARCHAR2(64),
    register_doctor_code VARCHAR2(20),
    register_doctor      VARCHAR2(50),
    register_time_period VARCHAR2(30),
    register_charge      NUMBER(12,4),
    pay_type_code        VARCHAR2(20),
    insurance_type       VARCHAR2(20),
    gh_clinic_date       DATE,
    medical_cardno       VARCHAR2(50),
    ehealth_card         VARCHAR2(100),
    special_flag         NUMBER(1),
    nonlocal_flag        NUMBER(1),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    modify_date          DATE,
    last_update_time     DATE,
    reserved_sort        INTEGER
)
 ;





create table CDR_MZ_REGISTER_DETAIL_BAK20231029
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(50) not null,
    register_id          VARCHAR2(36),
    visit_no             VARCHAR2(36),
    outpatient_no        VARCHAR2(20),
    patient_id           VARCHAR2(20),
    visit_times          NUMBER(3),
    patient_name         VARCHAR2(80),
    refund_flag          NUMBER(2),
    receipt_no           VARCHAR2(50),
    register_refund_time DATE,
    register_type        VARCHAR2(3),
    reserved_type        NUMBER(1),
    emergency_flag       NUMBER(1),
    schedule_id          VARCHAR2(20),
    register_waycode     NUMBER(1),
    department_code      VARCHAR2(64),
    department_name      VARCHAR2(64),
    register_doctor_code VARCHAR2(20),
    register_doctor      VARCHAR2(50),
    register_time_period VARCHAR2(30),
    register_charge      NUMBER(12,4),
    pay_type_code        VARCHAR2(20),
    insurance_type       VARCHAR2(20),
    gh_clinic_date       DATE,
    medical_cardno       VARCHAR2(50),
    ehealth_card         VARCHAR2(100),
    special_flag         NUMBER(1),
    nonlocal_flag        NUMBER(1),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    modify_date          DATE,
    last_update_time     DATE,
    reserved_sort        INTEGER
)
 ;





create table CDR_MZ_SETTLE_DETAIL
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visit_times             NUMBER(3),
    patient_name            VARCHAR2(30),
    age                     VARCHAR2(30),
    unicode                 VARCHAR2(30) not null,
    charge_settleid         VARCHAR2(36),
    settle_receiptno        VARCHAR2(200),
    receipt_time            DATE,
    print_code              VARCHAR2(14),
    print_name              VARCHAR2(50),
    electronic_invoice      VARCHAR2(20),
    insurance_personal_code VARCHAR2(50),
    insurance_code          VARCHAR2(20),
    ybtcqbm                 VARCHAR2(20),
    ybtcqmc                 VARCHAR2(50),
    trade_no                VARCHAR2(40),
    settle_scene            NUMBER(1),
    settle_status           NUMBER(1),
    settle_time             DATE,
    medical_payment_method  VARCHAR2(2),
    settle_total_money      NUMBER(12,4),
    personal_expenses       NUMBER(10,2),
    settlement_doc_code     VARCHAR2(20),
    settlement_doc          VARCHAR2(50),
    delete_flag             NUMBER(1),
    delete_unicode          VARCHAR2(50),
    last_update_time        DATE
);




















comment on column CDR_MZ_SETTLE_DETAIL.group_code
  is '集团编码';
comment on column CDR_MZ_SETTLE_DETAIL.organization_code
  is '组织编码';
comment on column CDR_MZ_SETTLE_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_MZ_SETTLE_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_MZ_SETTLE_DETAIL.visit_no
  is '就诊流水号';
comment on column CDR_MZ_SETTLE_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_MZ_SETTLE_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_MZ_SETTLE_DETAIL.age
  is '年龄';
comment on column CDR_MZ_SETTLE_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_SETTLE_DETAIL.charge_settleid
  is '结算记录ID';
comment on column CDR_MZ_SETTLE_DETAIL.settle_receiptno
  is '结算发票号';
comment on column CDR_MZ_SETTLE_DETAIL.receipt_time
  is '开票时间';
comment on column CDR_MZ_SETTLE_DETAIL.print_code
  is '开票人编码';
comment on column CDR_MZ_SETTLE_DETAIL.print_name
  is '开票人';
comment on column CDR_MZ_SETTLE_DETAIL.electronic_invoice
  is '电子发票代码';
comment on column CDR_MZ_SETTLE_DETAIL.insurance_personal_code
  is '医保个人编码';
comment on column CDR_MZ_SETTLE_DETAIL.insurance_code
  is '医保就诊编码';
comment on column CDR_MZ_SETTLE_DETAIL.ybtcqbm
  is '医保统筹区编码';
comment on column CDR_MZ_SETTLE_DETAIL.ybtcqmc
  is '医保统筹区名称';
comment on column CDR_MZ_SETTLE_DETAIL.trade_no
  is '医保交易流水号';
comment on column CDR_MZ_SETTLE_DETAIL.settle_scene
  is '收费场景代码 1：挂号时产生费用；2：门诊收费产生费用';
comment on column CDR_MZ_SETTLE_DETAIL.settle_status
  is '记录收费状态 1：收费；2：退费';
comment on column CDR_MZ_SETTLE_DETAIL.settle_time
  is '费用结算时间';
comment on column CDR_MZ_SETTLE_DETAIL.medical_payment_method
  is '医疗付费方式代码';
comment on column CDR_MZ_SETTLE_DETAIL.settle_total_money
  is '费用结算总金额';
comment on column CDR_MZ_SETTLE_DETAIL.personal_expenses
  is '个人承担费用金额';
comment on column CDR_MZ_SETTLE_DETAIL.settlement_doc_code
  is '结算人员编号';
comment on column CDR_MZ_SETTLE_DETAIL.settlement_doc
  is '结算人员';
comment on column CDR_MZ_SETTLE_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：取消结算';
comment on column CDR_MZ_SETTLE_DETAIL.delete_unicode
  is '被取消结算的记录ID';
comment on column CDR_MZ_SETTLE_DETAIL.last_update_time
  is '最后修改时间';




create table CDR_MZ_SETTLE_DETAIL_RECORDS
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    patient_id              VARCHAR2(36),
    visit_no                VARCHAR2(36),
    visit_times             NUMBER(3),
    patient_name            VARCHAR2(30),
    age                     VARCHAR2(30),
    unicode                 VARCHAR2(30) not null,
    charge_settleid         VARCHAR2(36),
    settle_receiptno        VARCHAR2(200),
    receipt_time            DATE,
    print_code              VARCHAR2(14),
    print_name              VARCHAR2(50),
    electronic_invoice      VARCHAR2(20),
    insurance_personal_code VARCHAR2(50),
    insurance_code          VARCHAR2(20),
    ybtcqbm                 VARCHAR2(20),
    ybtcqmc                 VARCHAR2(50),
    trade_no                VARCHAR2(40),
    settle_scene            NUMBER(1),
    settle_status           NUMBER(1),
    settle_time             DATE,
    medical_payment_method  VARCHAR2(2),
    settle_total_money      NUMBER(12,4),
    personal_expenses       NUMBER(10,2),
    settlement_doc_code     VARCHAR2(20),
    settlement_doc          VARCHAR2(50),
    delete_flag             NUMBER(1),
    delete_unicode          VARCHAR2(50),
    last_update_time        DATE
) ;





create table CDR_MZ_VISIT_DETAIL
(
    group_code        VARCHAR2(20) not null,
    organization_code VARCHAR2(20) not null,
    domain_id         VARCHAR2(2) not null,
    unicode           VARCHAR2(30) not null,
    visit_detail_id   VARCHAR2(36) not null,
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    return_visit      NUMBER(2),
    outpatient_no     VARCHAR2(20),
    patient_name      VARCHAR2(50),
    age               VARCHAR2(30),
    register_id       VARCHAR2(36),
    visit_dept_code   VARCHAR2(20),
    visit_dept_name   VARCHAR2(50),
    check_time        DATE,
    visit_time        DATE,
    finish_visit_time DATE,
    visit_dector_code VARCHAR2(20),
    visit_dector_name VARCHAR2(50),
    diagnosis_code    VARCHAR2(50),
    diagnosis         VARCHAR2(100),
    id_type           VARCHAR2(50),
    id_type_name      VARCHAR2(50),
    medical_treatment VARCHAR2(64),
    diagnose_notices  VARCHAR2(100),
    visit_status_code NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE
);




















comment on column CDR_MZ_VISIT_DETAIL.group_code
  is '集团编码';
comment on column CDR_MZ_VISIT_DETAIL.organization_code
  is '组织编码';
comment on column CDR_MZ_VISIT_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_MZ_VISIT_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_MZ_VISIT_DETAIL.visit_detail_id
  is '就诊明细ID';
comment on column CDR_MZ_VISIT_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_MZ_VISIT_DETAIL.visit_no
  is '就诊流水号';
comment on column CDR_MZ_VISIT_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_MZ_VISIT_DETAIL.return_visit
  is '是否复诊1:复诊;0:初诊';
comment on column CDR_MZ_VISIT_DETAIL.outpatient_no
  is '门（急）诊号';
comment on column CDR_MZ_VISIT_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_MZ_VISIT_DETAIL.age
  is '年龄';
comment on column CDR_MZ_VISIT_DETAIL.register_id
  is '对应挂号记录ID';
comment on column CDR_MZ_VISIT_DETAIL.visit_dept_code
  is '就诊科室编码';
comment on column CDR_MZ_VISIT_DETAIL.visit_dept_name
  is '就诊科室名称';
comment on column CDR_MZ_VISIT_DETAIL.check_time
  is '分诊台报道时间';
comment on column CDR_MZ_VISIT_DETAIL.visit_time
  is '接诊时间';
comment on column CDR_MZ_VISIT_DETAIL.finish_visit_time
  is '完成就诊时间';
comment on column CDR_MZ_VISIT_DETAIL.visit_dector_code
  is '主诊医生编号';
comment on column CDR_MZ_VISIT_DETAIL.visit_dector_name
  is '主诊医生姓名';
comment on column CDR_MZ_VISIT_DETAIL.diagnosis_code
  is '门诊诊断代码';
comment on column CDR_MZ_VISIT_DETAIL.diagnosis
  is '门诊诊断名称（主要诊断）';
comment on column CDR_MZ_VISIT_DETAIL.id_type
  is '证型代码（主要证型)';
comment on column CDR_MZ_VISIT_DETAIL.id_type_name
  is '证型名称（主要证型)';
comment on column CDR_MZ_VISIT_DETAIL.medical_treatment
  is '治法名称';
comment on column CDR_MZ_VISIT_DETAIL.diagnose_notices
  is '门诊诊断补充说明';
comment on column CDR_MZ_VISIT_DETAIL.visit_status_code
  is '就诊状态编码0未接诊，1正在就诊，2已诊毕，3回诊';
comment on column CDR_MZ_VISIT_DETAIL.delete_flag
  is '修改标志0:正常(选填默认);1:撤销';
comment on column CDR_MZ_VISIT_DETAIL.last_update_time
  is '最后修改时间';




create table CDR_MZ_VISIT_DETAIL_BF
(
    group_code        VARCHAR2(20) not null,
    organization_code VARCHAR2(20) not null,
    domain_id         VARCHAR2(2) not null,
    unicode           VARCHAR2(30) not null,
    visit_detail_id   VARCHAR2(36) not null,
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    return_visit      NUMBER(2),
    outpatient_no     VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    register_id       VARCHAR2(36),
    visit_dept_code   VARCHAR2(20),
    visit_dept_name   VARCHAR2(50),
    check_time        DATE,
    visit_time        DATE,
    finish_visit_time DATE,
    visit_dector_code VARCHAR2(20),
    visit_dector_name VARCHAR2(50),
    diagnosis_code    VARCHAR2(50),
    diagnosis         VARCHAR2(70),
    id_type           VARCHAR2(50),
    id_type_name      VARCHAR2(50),
    medical_treatment VARCHAR2(64),
    diagnose_notices  VARCHAR2(100),
    visit_status_code NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;





create table CDR_MZ_VISIT_DETAIL_BK
(
    group_code        VARCHAR2(20) not null,
    organization_code VARCHAR2(20) not null,
    domain_id         VARCHAR2(2) not null,
    unicode           VARCHAR2(30) not null,
    visit_detail_id   VARCHAR2(36) not null,
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    return_visit      NUMBER(2),
    outpatient_no     VARCHAR2(20),
    patient_name      VARCHAR2(50),
    age               VARCHAR2(30),
    register_id       VARCHAR2(36),
    visit_dept_code   VARCHAR2(20),
    visit_dept_name   VARCHAR2(50),
    check_time        DATE,
    visit_time        DATE,
    finish_visit_time DATE,
    visit_dector_code VARCHAR2(20),
    visit_dector_name VARCHAR2(50),
    diagnosis_code    VARCHAR2(50),
    diagnosis         VARCHAR2(100),
    id_type           VARCHAR2(50),
    id_type_name      VARCHAR2(50),
    medical_treatment VARCHAR2(64),
    diagnose_notices  VARCHAR2(100),
    visit_status_code NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE
)
 ;





create table CDR_MZ_VISIT_DETAIL_RECORDS
(
    group_code        VARCHAR2(20) not null,
    organization_code VARCHAR2(20) not null,
    domain_id         VARCHAR2(2) not null,
    unicode           VARCHAR2(30) not null,
    visit_detail_id   VARCHAR2(36) not null,
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(36),
    visit_times       NUMBER(3),
    return_visit      NUMBER(2),
    outpatient_no     VARCHAR2(20),
    patient_name      VARCHAR2(50),
    age               VARCHAR2(30),
    register_id       VARCHAR2(36),
    visit_dept_code   VARCHAR2(20),
    visit_dept_name   VARCHAR2(50),
    check_time        DATE,
    visit_time        DATE,
    finish_visit_time DATE,
    visit_dector_code VARCHAR2(20),
    visit_dector_name VARCHAR2(50),
    diagnosis_code    VARCHAR2(50),
    diagnosis         VARCHAR2(100),
    id_type           VARCHAR2(50),
    id_type_name      VARCHAR2(50),
    medical_treatment VARCHAR2(64),
    diagnose_notices  VARCHAR2(100),
    visit_status_code NUMBER(1),
    delete_flag       NUMBER(1),
    last_update_time  DATE
) ;





create table CDR_NUCLEIN_REPORT
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(20),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    send_time           DATE,
    receive_staffid     VARCHAR2(20),
    receive_staff       VARCHAR2(50),
    receive_time        DATE,
    technician_doc_code VARCHAR2(20),
    technician_doc      VARCHAR2(50),
    lis_exam_time       DATE,
    report_no           VARCHAR2(50),
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    assigned_time       DATE,
    assigned_doc_code   VARCHAR2(20),
    assigned_doc        VARCHAR2(50),
    print_time          DATE,
    lis_sample_no       VARCHAR2(50),
    lis_sample_code     VARCHAR2(20),
    lis_sample_name     VARCHAR2(50),
    lis_item_code       VARCHAR2(50),
    lis_item_name       VARCHAR2(100),
    report_type_code    VARCHAR2(20),
    report_type         VARCHAR2(100),
    device_number       VARCHAR2(50),
    device_name         VARCHAR2(100),
    lis_barcode         VARCHAR2(50),
    total_times         NUMBER,
    imaging_notes       VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(50),
    image_index         VARCHAR2(50),
    image_content       CLOB,
    wsw_flag            NUMBER(1),
    report_date         DATE,
    delete_flag         NUMBER(1),
    nuclein_flag        NUMBER(1),
    last_update_time    DATE
);




















comment on column CDR_NUCLEIN_REPORT.group_code
  is '集团编码';
comment on column CDR_NUCLEIN_REPORT.organization_code
  is '组织编码';
comment on column CDR_NUCLEIN_REPORT.domain_id
  is '系统域标识';
comment on column CDR_NUCLEIN_REPORT.unicode
  is '数据唯一记录号';
comment on column CDR_NUCLEIN_REPORT.creattime
  is '创建时间';
comment on column CDR_NUCLEIN_REPORT.patient_id
  is '患者ID';
comment on column CDR_NUCLEIN_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_NUCLEIN_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_NUCLEIN_REPORT.visit_times
  is '就诊次数';
comment on column CDR_NUCLEIN_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_NUCLEIN_REPORT.patient_name
  is '患者姓名';
comment on column CDR_NUCLEIN_REPORT.age
  is '年龄';
comment on column CDR_NUCLEIN_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_NUCLEIN_REPORT.department
  is '病人所在科室';
comment on column CDR_NUCLEIN_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_NUCLEIN_REPORT.ward
  is '病人所在病区';
comment on column CDR_NUCLEIN_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_NUCLEIN_REPORT.bed_no
  is '病床号';
comment on column CDR_NUCLEIN_REPORT.applicationno
  is '电子申请单编号';
comment on column CDR_NUCLEIN_REPORT.apply_doc_id
  is '申请医生工号';
comment on column CDR_NUCLEIN_REPORT.apply_doc
  is '申请医生';
comment on column CDR_NUCLEIN_REPORT.apply_dept_code
  is '申请科室编码';
comment on column CDR_NUCLEIN_REPORT.apply_dept
  is '申请科室';
comment on column CDR_NUCLEIN_REPORT.apply_time
  is '申请时间';
comment on column CDR_NUCLEIN_REPORT.send_time
  is '送检时间';
comment on column CDR_NUCLEIN_REPORT.receive_staffid
  is '标本核收人编码';
comment on column CDR_NUCLEIN_REPORT.receive_staff
  is '标本核收人';
comment on column CDR_NUCLEIN_REPORT.receive_time
  is '标本核收时间';
comment on column CDR_NUCLEIN_REPORT.technician_doc_code
  is '检验医生编码';
comment on column CDR_NUCLEIN_REPORT.technician_doc
  is '检验医生';
comment on column CDR_NUCLEIN_REPORT.lis_exam_time
  is '检验时间';
comment on column CDR_NUCLEIN_REPORT.report_no
  is '报告号';
comment on column CDR_NUCLEIN_REPORT.report_doc_code
  is '报告医生编码';
comment on column CDR_NUCLEIN_REPORT.report_doc
  is '报告医生';
comment on column CDR_NUCLEIN_REPORT.assigned_time
  is '检验报告审核时间';
comment on column CDR_NUCLEIN_REPORT.assigned_doc_code
  is '检验报告审核人编码';
comment on column CDR_NUCLEIN_REPORT.assigned_doc
  is '检验报告审核人';
comment on column CDR_NUCLEIN_REPORT.print_time
  is '打印时间';
comment on column CDR_NUCLEIN_REPORT.lis_sample_no
  is '检验标本号';
comment on column CDR_NUCLEIN_REPORT.lis_sample_code
  is '检验标本编码';
comment on column CDR_NUCLEIN_REPORT.lis_sample_name
  is '检验标本名称';
comment on column CDR_NUCLEIN_REPORT.lis_item_code
  is '检验项目编码';
comment on column CDR_NUCLEIN_REPORT.lis_item_name
  is '检验项目名称';
comment on column CDR_NUCLEIN_REPORT.report_type_code
  is '检验报告类别代码';
comment on column CDR_NUCLEIN_REPORT.report_type
  is '检验报告类别';
comment on column CDR_NUCLEIN_REPORT.device_number
  is '仪器编号';
comment on column CDR_NUCLEIN_REPORT.device_name
  is '仪器名称';
comment on column CDR_NUCLEIN_REPORT.lis_barcode
  is '条码号';
comment on column CDR_NUCLEIN_REPORT.total_times
  is '总测量次数';
comment on column CDR_NUCLEIN_REPORT.imaging_notes
  is '备注';
comment on column CDR_NUCLEIN_REPORT.diagnosis_code
  is '临床诊断代码（主要诊断)';
comment on column CDR_NUCLEIN_REPORT.diagnosis
  is '临床诊断名称（主要诊断）';
comment on column CDR_NUCLEIN_REPORT.image_index
  is '图像索引号';
comment on column CDR_NUCLEIN_REPORT.image_content
  is '整张报告图片信息';
comment on column CDR_NUCLEIN_REPORT.wsw_flag
  is '微生物报告标志，0否1是';
comment on column CDR_NUCLEIN_REPORT.report_date
  is '报告时间';
comment on column CDR_NUCLEIN_REPORT.delete_flag
  is '删除标志，0否1是';
comment on column CDR_NUCLEIN_REPORT.nuclein_flag
  is '核酸标志，0否1是';
comment on column CDR_NUCLEIN_REPORT.last_update_time
  is '最后修改时间';






create table CDR_NUCLEIN_REPORT_BASE64
(
    report_no        VARCHAR2(100),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)   ;
comment on column CDR_NUCLEIN_REPORT_BASE64.last_update_time
  is '最后修改时间';






create table CDR_NUCLEIN_REPORT_DETAIL
(
    report_id              NUMBER(18) not null,
    lis_item_code          VARCHAR2(60),
    lis_item_name          VARCHAR2(180),
    unicode                VARCHAR2(183) not null,
    lis_result_code        VARCHAR2(60),
    lis_result_name        VARCHAR2(1500),
    lis_ration_result      VARCHAR2(1500),
    lis_ration_result_unit VARCHAR2(90),
    record_doc_name        VARCHAR2(60),
    print_serial_number    VARCHAR2(54),
    detect_bill_code       VARCHAR2(60),
    loinc_code             VARCHAR2(60),
    detect_indicat_code    VARCHAR2(60),
    detect_indicat_name    VARCHAR2(180),
    indicator_resu_tpcode  NUMBER(1),
    abnormal_tips          NUMBER(2),
    detect_indicat_result  VARCHAR2(12),
    reference_range        VARCHAR2(1500),
    measure_unit           VARCHAR2(90),
    record_time            DATE,
    last_update_time       DATE
)   ;
comment on column CDR_NUCLEIN_REPORT_DETAIL.last_update_time
  is '最后修改时间';









create table CDR_NURSING_GRADE
(
    list_unicode               VARCHAR2(48),
    patient_id                 NUMBER(18),
    patient_name               VARCHAR2(300),
    visit_no                   VARCHAR2(81),
    visit_times                NUMBER(5) not null,
    inpatient_no               NUMBER,
    age                        VARCHAR2(60),
    department_code            NUMBER(18),
    ward_code                  NUMBER(18),
    bed_no                     VARCHAR2(30),
    order_detailid             NUMBER,
    order_time_typecode        VARCHAR2(1),
    order_creattime            VARCHAR2(19),
    order_doctor               VARCHAR2(123),
    order_deptcode             NUMBER(18),
    order_reviewer             VARCHAR2(123),
    order_reviewdate           VARCHAR2(19),
    order_starttime            VARCHAR2(19),
    order_endtime              VARCHAR2(19),
    order_confirm_nurse        VARCHAR2(60),
    order_confirmtime          VARCHAR2(19),
    order_stop_doctor          VARCHAR2(603),
    order_stop_doctortime      VARCHAR2(19),
    order_stop_nurse           VARCHAR2(60),
    order_stoptime             VARCHAR2(19),
    order_canceller            VARCHAR2(123),
    doctoradvice_cancellertiem VARCHAR2(19),
    exec_statuscode            NUMBER,
    exec_dept_code             NUMBER(18),
    order_illustration         VARCHAR2(3000),
    execution_frequency        VARCHAR2(60),
    item_date                  VARCHAR2(8)
)
 ;





create table CDR_OPERATION_ANDSCHEDULE
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    outpatient_no          VARCHAR2(20),
    inpatient_no           VARCHAR2(20),
    patient_id             VARCHAR2(20),
    visit_times            NUMBER(3),
    visit_no               VARCHAR2(36),
    patient_name           VARCHAR2(20),
    gendercode             VARCHAR2(1),
    age                    VARCHAR2(30),
    bed_no                 VARCHAR2(50),
    room_no                VARCHAR2(50),
    department_code        VARCHAR2(20),
    department             VARCHAR2(50),
    ward_code              VARCHAR2(20),
    ward                   VARCHAR2(50),
    list_unicode           VARCHAR2(30) not null,
    applicationno          VARCHAR2(20),
    opsoucre_ordno         VARCHAR2(20),
    schedule_time          DATE,
    opreat_appoint_time    DATE,
    estimatetime_num       NUMBER,
    estimatetime_unit      VARCHAR2(10),
    appoint_equipmentcode  VARCHAR2(20),
    appoint_equipment      VARCHAR2(100),
    operator_code          VARCHAR2(10),
    operator_name          VARCHAR2(36),
    first_assistantid      VARCHAR2(20),
    first_assistant_name   VARCHAR2(50),
    secend_assistantid     VARCHAR2(20),
    secend_assistant_name  VARCHAR2(50),
    third_assistantid      VARCHAR2(20),
    third_assistant_name   VARCHAR2(50),
    nurse_instrumentid     VARCHAR2(20),
    nurse_instrument_name  VARCHAR2(50),
    nurse_patrolid         VARCHAR2(20),
    nurse_patrol_name      VARCHAR2(50),
    operation_room_number  VARCHAR2(20),
    operation_dept         VARCHAR2(20),
    operation_dept_name    VARCHAR2(50),
    operation_platform     VARCHAR2(20),
    anesthesia_doctorid    VARCHAR2(20),
    anesthesia_doctor_name VARCHAR2(50),
    last_update_time       DATE,
    delete_flag            NUMBER(1) default 0,
    wash_nurse_name        VARCHAR2(50),
    wash_nurse_id          VARCHAR2(20)
)
 ;
comment on column CDR_OPERATION_ANDSCHEDULE.group_code
  is '集团编码';
comment on column CDR_OPERATION_ANDSCHEDULE.organization_code
  is '组织编码';
comment on column CDR_OPERATION_ANDSCHEDULE.domain_id
  is '系统域标识';
comment on column CDR_OPERATION_ANDSCHEDULE.outpatient_no
  is '门急诊号';
comment on column CDR_OPERATION_ANDSCHEDULE.inpatient_no
  is '住院号';
comment on column CDR_OPERATION_ANDSCHEDULE.patient_id
  is '患者ID';
comment on column CDR_OPERATION_ANDSCHEDULE.visit_times
  is '就诊次数';
comment on column CDR_OPERATION_ANDSCHEDULE.visit_no
  is '就诊流水号';
comment on column CDR_OPERATION_ANDSCHEDULE.patient_name
  is '患者姓名';
comment on column CDR_OPERATION_ANDSCHEDULE.gendercode
  is '性别代码';
comment on column CDR_OPERATION_ANDSCHEDULE.age
  is '年龄';
comment on column CDR_OPERATION_ANDSCHEDULE.bed_no
  is '病床号';
comment on column CDR_OPERATION_ANDSCHEDULE.room_no
  is '病房号';
comment on column CDR_OPERATION_ANDSCHEDULE.department_code
  is '科室代码';
comment on column CDR_OPERATION_ANDSCHEDULE.department
  is '科室';
comment on column CDR_OPERATION_ANDSCHEDULE.ward_code
  is '病区代码';
comment on column CDR_OPERATION_ANDSCHEDULE.ward
  is '病区';
comment on column CDR_OPERATION_ANDSCHEDULE.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_OPERATION_ANDSCHEDULE.applicationno
  is '手术申请单号';
comment on column CDR_OPERATION_ANDSCHEDULE.opsoucre_ordno
  is '手术排台号';
comment on column CDR_OPERATION_ANDSCHEDULE.schedule_time
  is '手术排班时间';
comment on column CDR_OPERATION_ANDSCHEDULE.opreat_appoint_time
  is '排台手术开始时间';
comment on column CDR_OPERATION_ANDSCHEDULE.estimatetime_num
  is '预计手术时长';
comment on column CDR_OPERATION_ANDSCHEDULE.estimatetime_unit
  is '预计手术时长单位';
comment on column CDR_OPERATION_ANDSCHEDULE.appoint_equipmentcode
  is '预约设备编码';
comment on column CDR_OPERATION_ANDSCHEDULE.appoint_equipment
  is '预约设备名称';
comment on column CDR_OPERATION_ANDSCHEDULE.operator_code
  is '主刀医生工号';
comment on column CDR_OPERATION_ANDSCHEDULE.operator_name
  is '主刀医生名称';
comment on column CDR_OPERATION_ANDSCHEDULE.first_assistantid
  is '第一助手编码';
comment on column CDR_OPERATION_ANDSCHEDULE.first_assistant_name
  is '第一助手姓名';
comment on column CDR_OPERATION_ANDSCHEDULE.secend_assistantid
  is '第二助手编码';
comment on column CDR_OPERATION_ANDSCHEDULE.secend_assistant_name
  is '第二助手姓名';
comment on column CDR_OPERATION_ANDSCHEDULE.third_assistantid
  is '第三助手编码';
comment on column CDR_OPERATION_ANDSCHEDULE.third_assistant_name
  is '第三助手姓名';
comment on column CDR_OPERATION_ANDSCHEDULE.nurse_instrumentid
  is '器械护士编码';
comment on column CDR_OPERATION_ANDSCHEDULE.nurse_instrument_name
  is '器械护士名称';
comment on column CDR_OPERATION_ANDSCHEDULE.nurse_patrolid
  is '巡台护士编码';
comment on column CDR_OPERATION_ANDSCHEDULE.nurse_patrol_name
  is '巡台护士名称';
comment on column CDR_OPERATION_ANDSCHEDULE.operation_room_number
  is '手术间编号';
comment on column CDR_OPERATION_ANDSCHEDULE.operation_dept
  is '手术室编码';
comment on column CDR_OPERATION_ANDSCHEDULE.operation_dept_name
  is '手术室名称';
comment on column CDR_OPERATION_ANDSCHEDULE.operation_platform
  is '手术台编码';
comment on column CDR_OPERATION_ANDSCHEDULE.anesthesia_doctorid
  is '麻醉医生编码';
comment on column CDR_OPERATION_ANDSCHEDULE.anesthesia_doctor_name
  is '麻醉医生姓名';
comment on column CDR_OPERATION_ANDSCHEDULE.last_update_time
  is '最后修改时间';
comment on column CDR_OPERATION_ANDSCHEDULE.delete_flag
  is '删除标志 0：正常（选填默认）1：撤销';
comment on column CDR_OPERATION_ANDSCHEDULE.wash_nurse_name
  is '洗手护士名称';
comment on column CDR_OPERATION_ANDSCHEDULE.wash_nurse_id
  is '洗手护士编码';






create table CDR_OPERATION_ANDSCHEDULE_RECORDS
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    outpatient_no          VARCHAR2(20),
    inpatient_no           VARCHAR2(20),
    patient_id             VARCHAR2(20),
    visit_times            NUMBER(3),
    visit_no               VARCHAR2(36),
    patient_name           VARCHAR2(20),
    gendercode             VARCHAR2(1),
    age                    VARCHAR2(30),
    bed_no                 VARCHAR2(50),
    room_no                VARCHAR2(50),
    department_code        VARCHAR2(20),
    department             VARCHAR2(50),
    ward_code              VARCHAR2(20),
    ward                   VARCHAR2(50),
    list_unicode           VARCHAR2(30) not null,
    applicationno          VARCHAR2(20),
    opsoucre_ordno         VARCHAR2(20),
    schedule_time          DATE,
    opreat_appoint_time    DATE,
    estimatetime_num       NUMBER,
    estimatetime_unit      VARCHAR2(10),
    appoint_equipmentcode  VARCHAR2(20),
    appoint_equipment      VARCHAR2(100),
    operator_code          VARCHAR2(10),
    operator_name          VARCHAR2(36),
    first_assistantid      VARCHAR2(20),
    first_assistant_name   VARCHAR2(50),
    secend_assistantid     VARCHAR2(20),
    secend_assistant_name  VARCHAR2(50),
    third_assistantid      VARCHAR2(20),
    third_assistant_name   VARCHAR2(50),
    nurse_instrumentid     VARCHAR2(20),
    nurse_instrument_name  VARCHAR2(50),
    nurse_patrolid         VARCHAR2(20),
    nurse_patrol_name      VARCHAR2(50),
    operation_room_number  VARCHAR2(20),
    operation_dept         VARCHAR2(20),
    operation_dept_name    VARCHAR2(50),
    operation_platform     VARCHAR2(20),
    anesthesia_doctorid    VARCHAR2(20),
    anesthesia_doctor_name VARCHAR2(50),
    last_update_time       DATE,
    delete_flag            NUMBER(1),
    wash_nurse_name        VARCHAR2(50),
    wash_nurse_id          VARCHAR2(20)
) ;





create table CDR_OPERATION_APPINFOQUERY
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(30) not null,
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(50),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(50),
    applicationno         VARCHAR2(20),
    orderid               VARCHAR2(10),
    operat_apply_time     DATE,
    operation_portion     VARCHAR2(70),
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    assigned_time         DATE,
    assigned_doc_id       VARCHAR2(10),
    assigned_doc          VARCHAR2(10),
    operation_code        VARCHAR2(20),
    operation_name        VARCHAR2(300),
    operation_levelcode   VARCHAR2(2),
    planoperation_flag    NUMBER(3),
    operation_class       VARCHAR2(10),
    anesthesia_type_code  VARCHAR2(10),
    anesthesia_type       VARCHAR2(50),
    operat_plandate       DATE,
    operation_doctorid    VARCHAR2(20),
    operation_doctor      VARCHAR2(50),
    first_assistantid     VARCHAR2(20),
    first_assistant_name  VARCHAR2(50),
    secend_assistantid    VARCHAR2(20),
    secend_assistant_name VARCHAR2(50),
    exec_dept_code        VARCHAR2(20),
    notice                VARCHAR2(200),
    urgent_flag           NUMBER(3),
    apply_state           VARCHAR2(20),
    charge_status         NUMBER(1),
    delete_flag           NUMBER(1),
    last_update_time      DATE
)
 ;
comment on column CDR_OPERATION_APPINFOQUERY.group_code
  is '集团编码';
comment on column CDR_OPERATION_APPINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_OPERATION_APPINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_OPERATION_APPINFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_OPERATION_APPINFOQUERY.outpatient_no
  is '门急诊号';
comment on column CDR_OPERATION_APPINFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_OPERATION_APPINFOQUERY.patient_id
  is '患者ID';
comment on column CDR_OPERATION_APPINFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_OPERATION_APPINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_OPERATION_APPINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_OPERATION_APPINFOQUERY.gendercode
  is '性别代码';
comment on column CDR_OPERATION_APPINFOQUERY.age
  is '年龄';
comment on column CDR_OPERATION_APPINFOQUERY.bed_no
  is '病床号';
comment on column CDR_OPERATION_APPINFOQUERY.room_no
  is '病房号';
comment on column CDR_OPERATION_APPINFOQUERY.department_code
  is '科室代码';
comment on column CDR_OPERATION_APPINFOQUERY.department
  is '科室';
comment on column CDR_OPERATION_APPINFOQUERY.ward_code
  is '病区代码';
comment on column CDR_OPERATION_APPINFOQUERY.ward
  is '病区';
comment on column CDR_OPERATION_APPINFOQUERY.diagnosis_code
  is '疾病编码';
comment on column CDR_OPERATION_APPINFOQUERY.diagnosis
  is '疾病名称';
comment on column CDR_OPERATION_APPINFOQUERY.applicationno
  is '电子申请单编号';
comment on column CDR_OPERATION_APPINFOQUERY.orderid
  is '医嘱号';
comment on column CDR_OPERATION_APPINFOQUERY.operat_apply_time
  is '申请日期';
comment on column CDR_OPERATION_APPINFOQUERY.operation_portion
  is '手术部位';
comment on column CDR_OPERATION_APPINFOQUERY.apply_doc_id
  is '申请医生工号';
comment on column CDR_OPERATION_APPINFOQUERY.apply_doc
  is '申请医生';
comment on column CDR_OPERATION_APPINFOQUERY.apply_dept_code
  is '申请科室编码';
comment on column CDR_OPERATION_APPINFOQUERY.apply_dept
  is '申请科室';
comment on column CDR_OPERATION_APPINFOQUERY.assigned_time
  is '审核日期';
comment on column CDR_OPERATION_APPINFOQUERY.assigned_doc_id
  is '审核医生工号';
comment on column CDR_OPERATION_APPINFOQUERY.assigned_doc
  is '审核医生';
comment on column CDR_OPERATION_APPINFOQUERY.operation_code
  is '手术编码';
comment on column CDR_OPERATION_APPINFOQUERY.operation_name
  is '手术名称';
comment on column CDR_OPERATION_APPINFOQUERY.operation_levelcode
  is '手术等级编码';
comment on column CDR_OPERATION_APPINFOQUERY.planoperation_flag
  is '计划手术标志 0，计划手术，1，非计划再次手术';
comment on column CDR_OPERATION_APPINFOQUERY.operation_class
  is '手术类型';
comment on column CDR_OPERATION_APPINFOQUERY.anesthesia_type_code
  is '拟行麻醉方式';
comment on column CDR_OPERATION_APPINFOQUERY.anesthesia_type
  is '拟行麻醉方式';
comment on column CDR_OPERATION_APPINFOQUERY.operat_plandate
  is '预定手术时间';
comment on column CDR_OPERATION_APPINFOQUERY.operation_doctorid
  is '手术医生工号';
comment on column CDR_OPERATION_APPINFOQUERY.operation_doctor
  is '手术医生';
comment on column CDR_OPERATION_APPINFOQUERY.first_assistantid
  is '一助编码';
comment on column CDR_OPERATION_APPINFOQUERY.first_assistant_name
  is '一助姓名';
comment on column CDR_OPERATION_APPINFOQUERY.secend_assistantid
  is '二助编码';
comment on column CDR_OPERATION_APPINFOQUERY.secend_assistant_name
  is '二助姓名';
comment on column CDR_OPERATION_APPINFOQUERY.exec_dept_code
  is '执行科室编码';
comment on column CDR_OPERATION_APPINFOQUERY.notice
  is '注意事项';
comment on column CDR_OPERATION_APPINFOQUERY.urgent_flag
  is '加急标志 0：否/1：是';
comment on column CDR_OPERATION_APPINFOQUERY.apply_state
  is '申请单状态 0申请，1 排班，2手术完成3取消手术';
comment on column CDR_OPERATION_APPINFOQUERY.charge_status
  is '收费状态 1未缴费2已缴费3退费（针对门诊手术情况）';
comment on column CDR_OPERATION_APPINFOQUERY.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_OPERATION_APPINFOQUERY.last_update_time
  is '最后修改时间';






create table CDR_OPERATION_APPINFOQUERY_0408
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(30) not null,
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(50),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(50),
    applicationno         VARCHAR2(20),
    orderid               VARCHAR2(10),
    operat_apply_time     DATE,
    operation_portion     VARCHAR2(70),
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    assigned_time         DATE,
    assigned_doc_id       VARCHAR2(10),
    assigned_doc          VARCHAR2(10),
    operation_code        VARCHAR2(20),
    operation_name        VARCHAR2(50),
    operation_levelcode   VARCHAR2(2),
    planoperation_flag    NUMBER(3),
    operation_class       VARCHAR2(10),
    anesthesia_type_code  VARCHAR2(10),
    anesthesia_type       VARCHAR2(50),
    operat_plandate       DATE,
    operation_doctorid    VARCHAR2(20),
    operation_doctor      VARCHAR2(50),
    first_assistantid     VARCHAR2(20),
    first_assistant_name  VARCHAR2(50),
    secend_assistantid    VARCHAR2(20),
    secend_assistant_name VARCHAR2(50),
    exec_dept_code        VARCHAR2(20),
    notice                VARCHAR2(200),
    urgent_flag           NUMBER(3),
    apply_state           VARCHAR2(20),
    charge_status         NUMBER(1),
    delete_flag           NUMBER(1),
    last_update_time      DATE
)
 ;





create table CDR_OPERATION_APPINFOQUERY_RECORDS
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(30) not null,
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(50),
    patient_id            VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(36),
    patient_name          VARCHAR2(20),
    gendercode            VARCHAR2(1),
    age                   VARCHAR2(30),
    bed_no                VARCHAR2(50),
    room_no               VARCHAR2(50),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    diagnosis_code        VARCHAR2(20),
    diagnosis             VARCHAR2(50),
    applicationno         VARCHAR2(20),
    orderid               VARCHAR2(10),
    operat_apply_time     DATE,
    operation_portion     VARCHAR2(70),
    apply_doc_id          VARCHAR2(20),
    apply_doc             VARCHAR2(50),
    apply_dept_code       VARCHAR2(20),
    apply_dept            VARCHAR2(50),
    assigned_time         DATE,
    assigned_doc_id       VARCHAR2(10),
    assigned_doc          VARCHAR2(10),
    operation_code        VARCHAR2(20),
    operation_name        VARCHAR2(50),
    operation_levelcode   VARCHAR2(2),
    planoperation_flag    NUMBER(3),
    operation_class       VARCHAR2(10),
    anesthesia_type_code  VARCHAR2(10),
    anesthesia_type       VARCHAR2(50),
    operat_plandate       DATE,
    operation_doctorid    VARCHAR2(20),
    operation_doctor      VARCHAR2(50),
    first_assistantid     VARCHAR2(20),
    first_assistant_name  VARCHAR2(50),
    secend_assistantid    VARCHAR2(20),
    secend_assistant_name VARCHAR2(50),
    exec_dept_code        VARCHAR2(20),
    notice                VARCHAR2(200),
    urgent_flag           NUMBER(3),
    apply_state           VARCHAR2(20),
    charge_status         NUMBER(1),
    delete_flag           NUMBER(1),
    last_update_time      DATE
)  ;





create table CDR_OPERATION_STATUS
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30),
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(20),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    applicationno       VARCHAR2(20),
    opsoucre_ordno      VARCHAR2(20),
    opreat_appoint_time DATE,
    modify_date         DATE,
    modify_doc_code     VARCHAR2(10),
    modify_doc          VARCHAR2(50),
    exec_statuscode     NUMBER(1),
    delete_flag         NUMBER(1),
    last_update_time    DATE
)
 ;
comment on column CDR_OPERATION_STATUS.group_code
  is '集团编码';
comment on column CDR_OPERATION_STATUS.organization_code
  is '组织编码';
comment on column CDR_OPERATION_STATUS.domain_id
  is '系统域标识';
comment on column CDR_OPERATION_STATUS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_OPERATION_STATUS.creattime
  is '创建时间';
comment on column CDR_OPERATION_STATUS.patient_id
  is '患者ID';
comment on column CDR_OPERATION_STATUS.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_OPERATION_STATUS.inpatient_no
  is '住院号标识';
comment on column CDR_OPERATION_STATUS.visit_times
  is '就诊次数';
comment on column CDR_OPERATION_STATUS.visit_no
  is '就诊流水号';
comment on column CDR_OPERATION_STATUS.patient_name
  is '患者姓名';
comment on column CDR_OPERATION_STATUS.age
  is '年龄';
comment on column CDR_OPERATION_STATUS.department_code
  is '病人所在科室编码';
comment on column CDR_OPERATION_STATUS.department
  is '病人所在科室';
comment on column CDR_OPERATION_STATUS.ward_code
  is '病人所在病区编码';
comment on column CDR_OPERATION_STATUS.ward
  is '病人所在病区';
comment on column CDR_OPERATION_STATUS.sickroom_no
  is '病房编号';
comment on column CDR_OPERATION_STATUS.bed_no
  is '病床号';
comment on column CDR_OPERATION_STATUS.applicationno
  is '会诊申请单号';
comment on column CDR_OPERATION_STATUS.opsoucre_ordno
  is '手术排台号';
comment on column CDR_OPERATION_STATUS.opreat_appoint_time
  is '排台手术开始时间';
comment on column CDR_OPERATION_STATUS.modify_date
  is '登记日期';
comment on column CDR_OPERATION_STATUS.modify_doc_code
  is '登记医生工号';
comment on column CDR_OPERATION_STATUS.modify_doc
  is '登记医生';
comment on column CDR_OPERATION_STATUS.exec_statuscode
  is '状态编码 0申请，1 排班，2手术完成，3取消手术，4麻醉开始，5手术开始，6手术结束';
comment on column CDR_OPERATION_STATUS.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_OPERATION_STATUS.last_update_time
  is '最后修改时间';





create table CDR_ORDER_STATUS
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(30) not null,
    creattime             DATE,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    inpatient_no          VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    department_code       VARCHAR2(20),
    department            VARCHAR2(50),
    ward_code             VARCHAR2(20),
    ward                  VARCHAR2(50),
    sickroom_no           VARCHAR2(10),
    bed_no                VARCHAR2(36),
    order_id              VARCHAR2(20),
    parent_orderno        VARCHAR2(36),
    order_endtime         DATE,
    order_stop_doctorcode VARCHAR2(20),
    order_stop_doctor     VARCHAR2(50),
    order_stop_doctortime DATE,
    order_stop_nursecode  VARCHAR2(20),
    order_stop_nurse      VARCHAR2(50),
    order_stoptime        DATE,
    order_cancellerid     VARCHAR2(20),
    order_canceller       VARCHAR2(50),
    order_cancellertiem   DATE,
    revoke_time           DATE,
    revoke_reason         VARCHAR2(20),
    exec_statuscode       NUMBER(1),
    delete_flag           NUMBER(1),
    last_update_time      DATE,
    order_type            NUMBER
)
 ;
comment on column CDR_ORDER_STATUS.group_code
  is '集团编码';
comment on column CDR_ORDER_STATUS.organization_code
  is '组织编码';
comment on column CDR_ORDER_STATUS.domain_id
  is '系统域标识';
comment on column CDR_ORDER_STATUS.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ORDER_STATUS.creattime
  is '创建时间';
comment on column CDR_ORDER_STATUS.patient_id
  is '患者ID';
comment on column CDR_ORDER_STATUS.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_ORDER_STATUS.inpatient_no
  is '住院号标识';
comment on column CDR_ORDER_STATUS.visit_times
  is '就诊次数';
comment on column CDR_ORDER_STATUS.visit_no
  is '就诊流水号';
comment on column CDR_ORDER_STATUS.patient_name
  is '患者姓名';
comment on column CDR_ORDER_STATUS.age
  is '年龄';
comment on column CDR_ORDER_STATUS.department_code
  is '病人所在科室编码';
comment on column CDR_ORDER_STATUS.department
  is '病人所在科室';
comment on column CDR_ORDER_STATUS.ward_code
  is '病人所在病区编码';
comment on column CDR_ORDER_STATUS.ward
  is '病人所在病区';
comment on column CDR_ORDER_STATUS.sickroom_no
  is '病房编号';
comment on column CDR_ORDER_STATUS.bed_no
  is '病床号';
comment on column CDR_ORDER_STATUS.order_id
  is '医嘱ID';
comment on column CDR_ORDER_STATUS.parent_orderno
  is '父医嘱ID';
comment on column CDR_ORDER_STATUS.order_endtime
  is '医嘱停止时间';
comment on column CDR_ORDER_STATUS.order_stop_doctorcode
  is '停嘱医生编号';
comment on column CDR_ORDER_STATUS.order_stop_doctor
  is '停嘱医生';
comment on column CDR_ORDER_STATUS.order_stop_doctortime
  is '医生停嘱时间';
comment on column CDR_ORDER_STATUS.order_stop_nursecode
  is '确认停嘱护士编号';
comment on column CDR_ORDER_STATUS.order_stop_nurse
  is '确认停嘱护士';
comment on column CDR_ORDER_STATUS.order_stoptime
  is '护士确认停嘱时间';
comment on column CDR_ORDER_STATUS.order_cancellerid
  is '医嘱作废医生编码';
comment on column CDR_ORDER_STATUS.order_canceller
  is '医嘱作废医生';
comment on column CDR_ORDER_STATUS.order_cancellertiem
  is '医嘱作废时间';
comment on column CDR_ORDER_STATUS.revoke_time
  is '医嘱撤销时间';
comment on column CDR_ORDER_STATUS.revoke_reason
  is '医嘱撤销原因描述';
comment on column CDR_ORDER_STATUS.exec_statuscode
  is '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废';
comment on column CDR_ORDER_STATUS.delete_flag
  is '修改标志 0正常 1撤销';
comment on column CDR_ORDER_STATUS.last_update_time
  is '最后修改时间';
comment on column CDR_ORDER_STATUS.order_type
  is '1为药品类医嘱 2为非药品类医嘱';








create table CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY
(
    group_code         VARCHAR2(6),
    organization_code  VARCHAR2(9),
    domain_id          VARCHAR2(6),
    hospital_id        VARCHAR2(30),
    hospital_name      VARCHAR2(48),
    creattime          DATE,
    patient_id         NUMBER(18),
    patient_name       VARCHAR2(300),
    gendercode         VARCHAR2(3),
    gendername         VARCHAR2(36),
    id_card            VARCHAR2(54),
    telcome            VARCHAR2(150),
    patientappointid   NUMBER(18) not null,
    unicode            NUMBER(18) not null,
    patientappointdate DATE,
    sys_appointdate    DATE,
    sys_id             VARCHAR2(765),
    appoint_statuscode VARCHAR2(765),
    appoint_status     VARCHAR2(765),
    doc_registerdate   DATE,
    register_doc_code  VARCHAR2(765),
    register_doc       VARCHAR2(765),
    sourceid           VARCHAR2(765),
    source_stratdate   DATE,
    source_enddate     DATE,
    last_update_time   DATE
)   ;
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.group_code
  is '集团编码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.hospital_id
  is '医疗机构代码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.hospital_name
  is '医疗机构';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.creattime
  is '创建时间';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.patient_id
  is '患者ID';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.gendercode
  is '性别代码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.gendername
  is '性别';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.id_card
  is '身份证号码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.telcome
  is '联系电话';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.patientappointid
  is '预约ID';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.unicode
  is '唯一编码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.patientappointdate
  is '预约日期时间';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.sys_appointdate
  is '系统预约日期时';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.sys_id
  is '系统id';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.appoint_statuscode
  is '预约状态码';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.appoint_status
  is '预约状态描述';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.doc_registerdate
  is '医务人员预约日期时间';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.register_doc_code
  is '预约医务人员工号';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.register_doc
  is '预约医务人员姓名';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.sourceid
  is '资源ID';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.source_stratdate
  is '资源时段开始日期时间';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.source_enddate
  is '资源时段结束日期时间';
comment on column CDR_OUTPATIENTAPPOINTSTATUSINFOQUERY.last_update_time
  is '最后修改时间';





 








create table CDR_OUTPATIENTMEDICALRECORD
(
    group_code VARCHAR2 (20),
    organization_code VARCHAR2 (20),
    domain_id VARCHAR2 (2),
    unicode VARCHAR2 (30) not null,
    creattime        DATE,
    patient_id VARCHAR2 (20),
    outpatient_no VARCHAR2 (20),
    visit_times NUMBER (3),
    visit_no VARCHAR2 (20),
    patient_name VARCHAR2 (20),
    age VARCHAR2 (30),
    department_id VARCHAR2 (10),
    department VARCHAR2 (32),
    date_clinic      DATE,
    author_assigned_id VARCHAR2 (56),
    uthor_assigned VARCHAR2 (56),
    charge_doctorid VARCHAR2 (36),
    charge_doctor VARCHAR2 (36),
    allergies_flar NUMBER (1),
    allergies VARCHAR2 (1000),
    illness VARCHAR2 (4000),
    illness_current VARCHAR2 (4000),
    illness_history VARCHAR2 (4000),
    examination_physique VARCHAR2 (4000),
    doc_advice VARCHAR2 (1000),
    menstrual_history VARCHAR2 (500),
    personal_history VARCHAR2 (1000),
    exam_auxiliary_item VARCHAR2 (4000),
    examination_auxiliary VARCHAR2 (4000),
    diagnosis_preliminary VARCHAR2 (8),
    diagnosis_code VARCHAR2 (30),
    diagnosis VARCHAR2 (100),
    tcm_disease VARCHAR2 (100),
    tcm_syndromename VARCHAR2 (100),
    tcm_syndromecode VARCHAR2 (50),
    delete_flag NUMBER (1),
    last_update_time DATE
);


















comment on column CDR_OUTPATIENTMEDICALRECORD.group_code
  is '集团编码';
comment on column CDR_OUTPATIENTMEDICALRECORD.organization_code
  is '组织编码';
comment on column CDR_OUTPATIENTMEDICALRECORD.domain_id
  is '系统域标识';
comment on column CDR_OUTPATIENTMEDICALRECORD.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_OUTPATIENTMEDICALRECORD.creattime
  is '创建时间';
comment on column CDR_OUTPATIENTMEDICALRECORD.patient_id
  is '患者ID';
comment on column CDR_OUTPATIENTMEDICALRECORD.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_OUTPATIENTMEDICALRECORD.visit_times
  is '就诊次数';
comment on column CDR_OUTPATIENTMEDICALRECORD.visit_no
  is '就诊流水号';
comment on column CDR_OUTPATIENTMEDICALRECORD.patient_name
  is '患者姓名';
comment on column CDR_OUTPATIENTMEDICALRECORD.age
  is '年龄';
comment on column CDR_OUTPATIENTMEDICALRECORD.department_id
  is '病人就诊科室编码';
comment on column CDR_OUTPATIENTMEDICALRECORD.department
  is '病人就诊科室名称';
comment on column CDR_OUTPATIENTMEDICALRECORD.date_clinic
  is '就诊日期时间';
comment on column CDR_OUTPATIENTMEDICALRECORD.author_assigned_id
  is '就诊医师编码';
comment on column CDR_OUTPATIENTMEDICALRECORD.uthor_assigned
  is '就诊医师姓名';
comment on column CDR_OUTPATIENTMEDICALRECORD.charge_doctorid
  is '责任医生编号';
comment on column CDR_OUTPATIENTMEDICALRECORD.charge_doctor
  is '责任医生姓名';
comment on column CDR_OUTPATIENTMEDICALRECORD.allergies_flar
  is '过敏标志 0:否;1:是';
comment on column CDR_OUTPATIENTMEDICALRECORD.allergies
  is '过敏史描述';
comment on column CDR_OUTPATIENTMEDICALRECORD.illness
  is '主诉';
comment on column CDR_OUTPATIENTMEDICALRECORD.illness_current
  is '现病史';
comment on column CDR_OUTPATIENTMEDICALRECORD.illness_history
  is '既往史';
comment on column CDR_OUTPATIENTMEDICALRECORD.examination_physique
  is '体格检查结果';
comment on column CDR_OUTPATIENTMEDICALRECORD.doc_advice
  is '治疗意见';
comment on column CDR_OUTPATIENTMEDICALRECORD.menstrual_history
  is '月经史';
comment on column CDR_OUTPATIENTMEDICALRECORD.personal_history
  is '个人史';
comment on column CDR_OUTPATIENTMEDICALRECORD.exam_auxiliary_item
  is '辅助检查项目';
comment on column CDR_OUTPATIENTMEDICALRECORD.examination_auxiliary
  is '辅助检查结果';
comment on column CDR_OUTPATIENTMEDICALRECORD.diagnosis_preliminary
  is '初诊/复诊 0 初诊 1复诊';
comment on column CDR_OUTPATIENTMEDICALRECORD.diagnosis_code
  is '主要诊断代码';
comment on column CDR_OUTPATIENTMEDICALRECORD.diagnosis
  is '主要诊断名称';
comment on column CDR_OUTPATIENTMEDICALRECORD.tcm_disease
  is '中医病名名称';
comment on column CDR_OUTPATIENTMEDICALRECORD.tcm_syndromename
  is '中医证候名称';
comment on column CDR_OUTPATIENTMEDICALRECORD.tcm_syndromecode
  is '中医证候代码';
comment on column CDR_OUTPATIENTMEDICALRECORD.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_OUTPATIENTMEDICALRECORD.last_update_time
  is '最后修改时间';




create table CDR_OUTPATIENTMEDICALRECORD_RECORDS
(
    group_code            VARCHAR2(20),
    organization_code     VARCHAR2(20),
    domain_id             VARCHAR2(2),
    unicode               VARCHAR2(30) not null,
    creattime             DATE,
    patient_id            VARCHAR2(20),
    outpatient_no         VARCHAR2(20),
    visit_times           NUMBER(3),
    visit_no              VARCHAR2(20),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(30),
    department_id         VARCHAR2(10),
    department            VARCHAR2(32),
    date_clinic           DATE,
    author_assigned_id    VARCHAR2(56),
    uthor_assigned        VARCHAR2(56),
    charge_doctorid       VARCHAR2(36),
    charge_doctor         VARCHAR2(36),
    allergies_flar        NUMBER(1),
    allergies             VARCHAR2(1000),
    illness               VARCHAR2(4000),
    illness_current       VARCHAR2(4000),
    illness_history       VARCHAR2(4000),
    examination_physique  VARCHAR2(4000),
    doc_advice            VARCHAR2(1000),
    menstrual_history     VARCHAR2(500),
    personal_history      VARCHAR2(1000),
    exam_auxiliary_item   VARCHAR2(4000),
    examination_auxiliary VARCHAR2(4000),
    diagnosis_preliminary VARCHAR2(8),
    diagnosis_code        VARCHAR2(30),
    diagnosis             VARCHAR2(100),
    tcm_disease           VARCHAR2(100),
    tcm_syndromename      VARCHAR2(100),
    tcm_syndromecode      VARCHAR2(50),
    delete_flag           NUMBER(1),
    last_update_time      DATE
)
 ;





create table CDR_OUTPATIENT_INPATIENT
(
    patient_id          VARCHAR2(24),
    inpatient_no        VARCHAR2(24),
    visit_no_inpatient  VARCHAR2(243),
    outpatient_no       VARCHAR2(24),
    visit_no_outpatient VARCHAR2(24),
    last_update_time    DATE
)   ;
comment on column CDR_OUTPATIENT_INPATIENT.last_update_time
  is '最后修改时间';





create table CDR_PATHOLOGY_APPLYINFO
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    outpatient_no           VARCHAR2(20),
    inpatient_no            VARCHAR2(2),
    patient_id              VARCHAR2(20),
    visit_times             NUMBER(3),
    visit_no                VARCHAR2(36),
    patient_name            VARCHAR2(20),
    gendercode              VARCHAR2(1),
    age                     VARCHAR2(30),
    bed_no                  VARCHAR2(50),
    room_no                 VARCHAR2(50),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    diagnosis_code          VARCHAR2(20),
    diagnosis               VARCHAR2(50),
    list_unicode            VARCHAR2(30) not null,
    applicationno           VARCHAR2(20),
    apply_doc_id            VARCHAR2(20),
    apply_doc               VARCHAR2(50),
    apply_dept_code         VARCHAR2(20),
    apply_dept              VARCHAR2(50),
    apply_desc              VARCHAR2(100),
    check_apply_time        DATE,
    check_typecode          VARCHAR2(5),
    check_type              VARCHAR2(50),
    specimen                VARCHAR2(50),
    specimen_amount         NUMBER(3),
    specimen_amount_unit    VARCHAR2(20),
    sample_id               VARCHAR2(20),
    collect_site            VARCHAR2(36),
    collect_amount          NUMBER(3),
    collect_amount_unit     VARCHAR2(20),
    fixative                VARCHAR2(50),
    medical_records_summary VARCHAR2(500),
    check_item_code         VARCHAR2(5),
    check_item_name         VARCHAR2(50),
    check_method            VARCHAR2(100),
    check_site              VARCHAR2(50),
    exec_dept_code          VARCHAR2(20),
    exec_dept               VARCHAR2(50),
    notice                  VARCHAR2(100),
    urgent_flag             NUMBER(3),
    apply_state             VARCHAR2(20),
    charge_status           NUMBER(1),
    delete_flag             NUMBER(1),
    last_update_time        DATE
)
 ;
comment on column CDR_PATHOLOGY_APPLYINFO.group_code
  is '集团编码';
comment on column CDR_PATHOLOGY_APPLYINFO.organization_code
  is '组织编码';
comment on column CDR_PATHOLOGY_APPLYINFO.domain_id
  is '系统域标识';
comment on column CDR_PATHOLOGY_APPLYINFO.outpatient_no
  is '门急诊号';
comment on column CDR_PATHOLOGY_APPLYINFO.inpatient_no
  is '住院号';
comment on column CDR_PATHOLOGY_APPLYINFO.patient_id
  is '患者ID';
comment on column CDR_PATHOLOGY_APPLYINFO.visit_times
  is '就诊次数';
comment on column CDR_PATHOLOGY_APPLYINFO.visit_no
  is '就诊流水号';
comment on column CDR_PATHOLOGY_APPLYINFO.patient_name
  is '患者姓名';
comment on column CDR_PATHOLOGY_APPLYINFO.gendercode
  is '性别代码';
comment on column CDR_PATHOLOGY_APPLYINFO.age
  is '年龄';
comment on column CDR_PATHOLOGY_APPLYINFO.bed_no
  is '病床号';
comment on column CDR_PATHOLOGY_APPLYINFO.room_no
  is '病房号';
comment on column CDR_PATHOLOGY_APPLYINFO.department_code
  is '科室代码';
comment on column CDR_PATHOLOGY_APPLYINFO.department
  is '科室';
comment on column CDR_PATHOLOGY_APPLYINFO.ward_code
  is '病区代码';
comment on column CDR_PATHOLOGY_APPLYINFO.ward
  is '病区';
comment on column CDR_PATHOLOGY_APPLYINFO.diagnosis_code
  is '疾病编码';
comment on column CDR_PATHOLOGY_APPLYINFO.diagnosis
  is '疾病名称';
comment on column CDR_PATHOLOGY_APPLYINFO.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_PATHOLOGY_APPLYINFO.applicationno
  is '电子申请单编号';
comment on column CDR_PATHOLOGY_APPLYINFO.apply_doc_id
  is '申请医生工号';
comment on column CDR_PATHOLOGY_APPLYINFO.apply_doc
  is '申请医生';
comment on column CDR_PATHOLOGY_APPLYINFO.apply_dept_code
  is '申请科室编码';
comment on column CDR_PATHOLOGY_APPLYINFO.apply_dept
  is '申请科室';
comment on column CDR_PATHOLOGY_APPLYINFO.apply_desc
  is '申请单详细内容';
comment on column CDR_PATHOLOGY_APPLYINFO.check_apply_time
  is '检查申请日期';
comment on column CDR_PATHOLOGY_APPLYINFO.check_typecode
  is '检查类型编码';
comment on column CDR_PATHOLOGY_APPLYINFO.check_type
  is '检查类型名称';
comment on column CDR_PATHOLOGY_APPLYINFO.specimen
  is '送检组织';
comment on column CDR_PATHOLOGY_APPLYINFO.specimen_amount
  is '送检组织数量';
comment on column CDR_PATHOLOGY_APPLYINFO.specimen_amount_unit
  is '送检组织数量单位';
comment on column CDR_PATHOLOGY_APPLYINFO.sample_id
  is '标本条码号';
comment on column CDR_PATHOLOGY_APPLYINFO.collect_site
  is '取材部位';
comment on column CDR_PATHOLOGY_APPLYINFO.collect_amount
  is '取材数量';
comment on column CDR_PATHOLOGY_APPLYINFO.collect_amount_unit
  is '取材数量单位';
comment on column CDR_PATHOLOGY_APPLYINFO.fixative
  is '固定液';
comment on column CDR_PATHOLOGY_APPLYINFO.medical_records_summary
  is '病历摘要及手术所见';
comment on column CDR_PATHOLOGY_APPLYINFO.check_item_code
  is '检查项目编码';
comment on column CDR_PATHOLOGY_APPLYINFO.check_item_name
  is '检查项目名称';
comment on column CDR_PATHOLOGY_APPLYINFO.check_method
  is '检查方法名称';
comment on column CDR_PATHOLOGY_APPLYINFO.check_site
  is '检查部位名称';
comment on column CDR_PATHOLOGY_APPLYINFO.exec_dept_code
  is '执行科室编码';
comment on column CDR_PATHOLOGY_APPLYINFO.exec_dept
  is '执行科室';
comment on column CDR_PATHOLOGY_APPLYINFO.notice
  is '注意事项 ';
comment on column CDR_PATHOLOGY_APPLYINFO.urgent_flag
  is '加急标志 0：否/1：是';
comment on column CDR_PATHOLOGY_APPLYINFO.apply_state
  is '申请单状态 0,''待检'',1,登记'',2,''已出报告,3,拒绝执行4，取消执行';
comment on column CDR_PATHOLOGY_APPLYINFO.charge_status
  is '收费状态 1未缴费2已缴费3退费';
comment on column CDR_PATHOLOGY_APPLYINFO.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_PATHOLOGY_APPLYINFO.last_update_time
  is '最后修改时间';






create table CDR_PATHOLOGY_REPORT
(
    group_code          VARCHAR2(20),
    organization_code   VARCHAR2(20),
    domain_id           VARCHAR2(2),
    unicode             VARCHAR2(30) not null,
    creattime           DATE,
    patient_id          VARCHAR2(20),
    outpatient_no       VARCHAR2(20),
    inpatient_no        VARCHAR2(20),
    visit_times         NUMBER(3),
    visit_no            VARCHAR2(20),
    patient_name        VARCHAR2(20),
    age                 VARCHAR2(30),
    department_code     VARCHAR2(20),
    department          VARCHAR2(50),
    ward_code           VARCHAR2(20),
    ward                VARCHAR2(50),
    sickroom_no         VARCHAR2(10),
    bed_no              VARCHAR2(36),
    last_mens_date      DATE,
    applicationno       VARCHAR2(20),
    apply_doc_id        VARCHAR2(20),
    apply_doc           VARCHAR2(50),
    apply_dept_code     VARCHAR2(20),
    apply_dept          VARCHAR2(50),
    apply_time          DATE,
    register_time       DATE,
    register_id         VARCHAR2(20),
    register            VARCHAR2(50),
    report_date         DATE,
    report_doc_code     VARCHAR2(20),
    report_doc          VARCHAR2(50),
    review_doc_code     VARCHAR2(20),
    review_doc          VARCHAR2(50),
    report_no           VARCHAR2(50),
    image_content       LONG,
    report_order_id     VARCHAR2(50),
    check_item_code     VARCHAR2(20),
    check_item_name     VARCHAR2(50),
    check_typecode      VARCHAR2(20),
    check_type          VARCHAR2(50),
    report_memo         VARCHAR2(200),
    imaging_finding     VARCHAR2(200),
    imaging_conclusion  VARCHAR2(200),
    diagnosis_code      VARCHAR2(64),
    diagnosis           VARCHAR2(50),
    diag_doc_code       VARCHAR2(20),
    diag_doc            VARCHAR2(50),
    subvisit_doc_code   VARCHAR2(20),
    subvisit_doc        VARCHAR2(50),
    suggestion          VARCHAR2(200),
    pathology_diagnosis VARCHAR2(200),
    check_method        VARCHAR2(100),
    exam_doc_code       VARCHAR2(20),
    exam_doc            VARCHAR2(50),
    exam_dept_code      VARCHAR2(20),
    exam_dept           VARCHAR2(50),
    exam_date           DATE,
    speci_menno         VARCHAR2(50),
    specimen_typename   VARCHAR2(50),
    manufacture_rcode   VARCHAR2(20),
    pathlogy_no         VARCHAR2(50),
    speci_connect_date  DATE,
    dna_distill_code    VARCHAR2(20),
    dna_distill_name    VARCHAR2(50),
    draw_position_code  VARCHAR2(20),
    draw_position_name  VARCHAR2(50),
    draw_doc_code       VARCHAR2(20),
    draw_doc_name       VARCHAR2(50),
    specimen_fixative   VARCHAR2(50),
    received_date       DATE,
    item_result_flag    NUMBER(1),
    delete_flag         NUMBER(1),
    last_update_time    DATE
)
 ;
comment on column CDR_PATHOLOGY_REPORT.group_code
  is '集团编码';
comment on column CDR_PATHOLOGY_REPORT.organization_code
  is '组织编码';
comment on column CDR_PATHOLOGY_REPORT.domain_id
  is '系统域标识';
comment on column CDR_PATHOLOGY_REPORT.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_PATHOLOGY_REPORT.creattime
  is '创建时间';
comment on column CDR_PATHOLOGY_REPORT.patient_id
  is '患者ID';
comment on column CDR_PATHOLOGY_REPORT.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_PATHOLOGY_REPORT.inpatient_no
  is '住院号标识';
comment on column CDR_PATHOLOGY_REPORT.visit_times
  is '就诊次数';
comment on column CDR_PATHOLOGY_REPORT.visit_no
  is '就诊流水号';
comment on column CDR_PATHOLOGY_REPORT.patient_name
  is '患者姓名';
comment on column CDR_PATHOLOGY_REPORT.age
  is '年龄';
comment on column CDR_PATHOLOGY_REPORT.department_code
  is '病人所在科室编码';
comment on column CDR_PATHOLOGY_REPORT.department
  is '病人所在科室';
comment on column CDR_PATHOLOGY_REPORT.ward_code
  is '病人所在病区编码';
comment on column CDR_PATHOLOGY_REPORT.ward
  is '病人所在病区';
comment on column CDR_PATHOLOGY_REPORT.sickroom_no
  is '病房编号';
comment on column CDR_PATHOLOGY_REPORT.bed_no
  is '病床号';
comment on column CDR_PATHOLOGY_REPORT.last_mens_date
  is '末次月经时间';
comment on column CDR_PATHOLOGY_REPORT.applicationno
  is '电子申请单编号';
comment on column CDR_PATHOLOGY_REPORT.apply_doc_id
  is '申请医生工号';
comment on column CDR_PATHOLOGY_REPORT.apply_doc
  is '申请医生';
comment on column CDR_PATHOLOGY_REPORT.apply_dept_code
  is '申请科室编码';
comment on column CDR_PATHOLOGY_REPORT.apply_dept
  is '申请科室';
comment on column CDR_PATHOLOGY_REPORT.apply_time
  is '申请时间';
comment on column CDR_PATHOLOGY_REPORT.register_time
  is '检查登记时间';
comment on column CDR_PATHOLOGY_REPORT.register_id
  is '检查登记人编码';
comment on column CDR_PATHOLOGY_REPORT.register
  is '检查登记人';
comment on column CDR_PATHOLOGY_REPORT.report_date
  is '报告时间';
comment on column CDR_PATHOLOGY_REPORT.report_doc_code
  is '报告医生编码';
comment on column CDR_PATHOLOGY_REPORT.report_doc
  is '报告医生';
comment on column CDR_PATHOLOGY_REPORT.review_doc_code
  is '审核医生编码';
comment on column CDR_PATHOLOGY_REPORT.review_doc
  is '审核医生';
comment on column CDR_PATHOLOGY_REPORT.report_no
  is '报告号';
comment on column CDR_PATHOLOGY_REPORT.image_content
  is '整张报告图片信息';
comment on column CDR_PATHOLOGY_REPORT.report_order_id
  is '检查号';
comment on column CDR_PATHOLOGY_REPORT.check_item_code
  is '检查类项目编码';
comment on column CDR_PATHOLOGY_REPORT.check_item_name
  is '检查项目名称';
comment on column CDR_PATHOLOGY_REPORT.check_typecode
  is '检查类型编码';
comment on column CDR_PATHOLOGY_REPORT.check_type
  is '检查类型名称';
comment on column CDR_PATHOLOGY_REPORT.report_memo
  is '检查备注';
comment on column CDR_PATHOLOGY_REPORT.imaging_finding
  is '客观所见内容';
comment on column CDR_PATHOLOGY_REPORT.imaging_conclusion
  is '主观提示内容';
comment on column CDR_PATHOLOGY_REPORT.diagnosis_code
  is '临床诊断代码（主要诊断)';
comment on column CDR_PATHOLOGY_REPORT.diagnosis
  is '临床诊断名称（主要诊断）';
comment on column CDR_PATHOLOGY_REPORT.diag_doc_code
  is '诊断医生编码';
comment on column CDR_PATHOLOGY_REPORT.diag_doc
  is '诊断医生';
comment on column CDR_PATHOLOGY_REPORT.subvisit_doc_code
  is '审核医生编码';
comment on column CDR_PATHOLOGY_REPORT.subvisit_doc
  is '审核医生';
comment on column CDR_PATHOLOGY_REPORT.suggestion
  is '补充意见';
comment on column CDR_PATHOLOGY_REPORT.pathology_diagnosis
  is '病理诊断意见';
comment on column CDR_PATHOLOGY_REPORT.check_method
  is '检查方法名称';
comment on column CDR_PATHOLOGY_REPORT.exam_doc_code
  is '检查医生编码';
comment on column CDR_PATHOLOGY_REPORT.exam_doc
  is '检查医生名称';
comment on column CDR_PATHOLOGY_REPORT.exam_dept_code
  is '检查科室编码';
comment on column CDR_PATHOLOGY_REPORT.exam_dept
  is '检查科室名称';
comment on column CDR_PATHOLOGY_REPORT.exam_date
  is '检查时间';
comment on column CDR_PATHOLOGY_REPORT.speci_menno
  is '标本号';
comment on column CDR_PATHOLOGY_REPORT.specimen_typename
  is '标本名称';
comment on column CDR_PATHOLOGY_REPORT.manufacture_rcode
  is '仪器型号';
comment on column CDR_PATHOLOGY_REPORT.pathlogy_no
  is '病理编号';
comment on column CDR_PATHOLOGY_REPORT.speci_connect_date
  is '标本采集日期';
comment on column CDR_PATHOLOGY_REPORT.dna_distill_code
  is 'DNA提取方法编码';
comment on column CDR_PATHOLOGY_REPORT.dna_distill_name
  is 'DNA提取方法名称';
comment on column CDR_PATHOLOGY_REPORT.draw_position_code
  is '取材部位编码';
comment on column CDR_PATHOLOGY_REPORT.draw_position_name
  is '取材部位名称';
comment on column CDR_PATHOLOGY_REPORT.draw_doc_code
  is '取样医生编码';
comment on column CDR_PATHOLOGY_REPORT.draw_doc_name
  is '取样医生名称';
comment on column CDR_PATHOLOGY_REPORT.specimen_fixative
  is '标本固定液';
comment on column CDR_PATHOLOGY_REPORT.received_date
  is '样本接收时间';
comment on column CDR_PATHOLOGY_REPORT.item_result_flag
  is '检查结果标志 1,正常;2,异常9,不确定';
comment on column CDR_PATHOLOGY_REPORT.delete_flag
  is '删除标志 0：正常（选填默认）1：撤销';
comment on column CDR_PATHOLOGY_REPORT.last_update_time
  is '最后修改时间';






create table CDR_PATHOLOGY_REPORT_BASE64
(
    report_no        VARCHAR2(100),
    base64           CLOB,
    create_time      DATE,
    last_update_time DATE
)
 ;
comment on column CDR_PATHOLOGY_REPORT_BASE64.last_update_time
  is '最后修改时间';






create table CDR_REHABILITATION_FEES
(
    visit_no              VARCHAR2(36),
    id                    VARCHAR2(50),
    visit_times           NUMBER(3),
    patient_id            VARCHAR2(36),
    patient_name          VARCHAR2(20),
    age                   VARCHAR2(20),
    inpatient_no          VARCHAR2(36),
    order_detailid        VARCHAR2(30),
    dept_code             VARCHAR2(20),
    dept_name             VARCHAR2(50),
    doctor_code           VARCHAR2(20),
    doctor_name           VARCHAR2(30),
    exec_dept_code        VARCHAR2(20),
    exec_dept             VARCHAR2(50),
    exec_doctor_code      VARCHAR2(20),
    exec_doctor           VARCHAR2(30),
    charge_settletime     DATE,
    detail_itemunit_price NUMBER(5),
    detail_item_quantity  NUMBER(3),
    detail_item_received  NUMBER(5),
    detail_itemcode       VARCHAR2(20),
    charge_empcode        VARCHAR2(10),
    charge_status         VARCHAR2(10),
    delete_unicode        VARCHAR2(20),
    unicode               VARCHAR2(30)
)
 ;
comment on column CDR_REHABILITATION_FEES.visit_no
  is '住院就诊流水号';
comment on column CDR_REHABILITATION_FEES.id
  is 'ID';
comment on column CDR_REHABILITATION_FEES.visit_times
  is '就诊次数';
comment on column CDR_REHABILITATION_FEES.patient_id
  is '个人标识号';
comment on column CDR_REHABILITATION_FEES.patient_name
  is '患者姓名';
comment on column CDR_REHABILITATION_FEES.age
  is '年龄';
comment on column CDR_REHABILITATION_FEES.inpatient_no
  is '住院号';
comment on column CDR_REHABILITATION_FEES.order_detailid
  is '医嘱明细号';
comment on column CDR_REHABILITATION_FEES.dept_code
  is '科室代码';
comment on column CDR_REHABILITATION_FEES.dept_name
  is '科室名称';
comment on column CDR_REHABILITATION_FEES.doctor_code
  is '医生编码';
comment on column CDR_REHABILITATION_FEES.doctor_name
  is '医生姓名';
comment on column CDR_REHABILITATION_FEES.exec_dept_code
  is '执行科室代码';
comment on column CDR_REHABILITATION_FEES.exec_dept
  is '执行科室';
comment on column CDR_REHABILITATION_FEES.exec_doctor_code
  is '执行医生代码';
comment on column CDR_REHABILITATION_FEES.exec_doctor
  is '执行医生名称';
comment on column CDR_REHABILITATION_FEES.charge_settletime
  is '结算时间';
comment on column CDR_REHABILITATION_FEES.detail_itemcode
  is '项目编码';
comment on column CDR_REHABILITATION_FEES.charge_status
  is '状态';



create table CDR_SCALD_RISK_INFO
(
    日期               DATE,
    护理单元             VARCHAR2(70),
    评估人数             NUMBER,
    原有烫伤人数           NUMBER,
    今日新发高风险          NUMBER,
    last_update_time DATE,
    unicode          VARCHAR2(2000) not null
)   ;
comment on column CDR_SCALD_RISK_INFO.last_update_time
  is '最后修改时间';








create table CDR_SIGNIN_INFOQUERY
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    creattime         DATE,
    sign_type         NUMBER(2),
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    ticket_number     VARCHAR2(20),
    sign_dept_code    VARCHAR2(20),
    sign_dept         VARCHAR2(50),
    sign_doc_code     VARCHAR2(20),
    sign_doc          VARCHAR2(50),
    sign_time         DATE,
    wind_no           VARCHAR2(5),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    sign_room_code    VARCHAR2(20),
    sign_room         VARCHAR2(50)
)
 ;
comment on column CDR_SIGNIN_INFOQUERY.group_code
  is '集团编码';
comment on column CDR_SIGNIN_INFOQUERY.organization_code
  is '组织编码';
comment on column CDR_SIGNIN_INFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_SIGNIN_INFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_SIGNIN_INFOQUERY.creattime
  is '创建时间';
comment on column CDR_SIGNIN_INFOQUERY.sign_type
  is '签到场景 1挂号 2药房 3检查 4检验 5收费结算';
comment on column CDR_SIGNIN_INFOQUERY.patient_id
  is '患者ID';
comment on column CDR_SIGNIN_INFOQUERY.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_SIGNIN_INFOQUERY.inpatient_no
  is '住院号标识';
comment on column CDR_SIGNIN_INFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_SIGNIN_INFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_SIGNIN_INFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_SIGNIN_INFOQUERY.age
  is '年龄';
comment on column CDR_SIGNIN_INFOQUERY.department_code
  is '病人所在科室编码';
comment on column CDR_SIGNIN_INFOQUERY.department
  is '病人所在科室';
comment on column CDR_SIGNIN_INFOQUERY.ward_code
  is '病人所在病区编码';
comment on column CDR_SIGNIN_INFOQUERY.ward
  is '病人所在病区';
comment on column CDR_SIGNIN_INFOQUERY.sickroom_no
  is '病房编号';
comment on column CDR_SIGNIN_INFOQUERY.bed_no
  is '病床号';
comment on column CDR_SIGNIN_INFOQUERY.ticket_number
  is '票号';
comment on column CDR_SIGNIN_INFOQUERY.sign_dept_code
  is '签到科室编码';
comment on column CDR_SIGNIN_INFOQUERY.sign_dept
  is '签到科室';
comment on column CDR_SIGNIN_INFOQUERY.sign_doc_code
  is '签到医生编码';
comment on column CDR_SIGNIN_INFOQUERY.sign_doc
  is '签到医生';
comment on column CDR_SIGNIN_INFOQUERY.sign_time
  is '签到时间';
comment on column CDR_SIGNIN_INFOQUERY.wind_no
  is '分派窗口号';
comment on column CDR_SIGNIN_INFOQUERY.delete_flag
  is '修改标志 0正常 1撤销';
comment on column CDR_SIGNIN_INFOQUERY.last_update_time
  is '最后修改时间';
comment on column CDR_SIGNIN_INFOQUERY.sign_room_code
  is '签到诊室编码';
comment on column CDR_SIGNIN_INFOQUERY.sign_room
  is '签到诊室';





create table CDR_SIGNIN_INFOQUERY_lt
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    creattime         DATE,
    sign_type         NUMBER(2),
    patient_id        VARCHAR2(20),
    outpatient_no     VARCHAR2(20),
    inpatient_no      VARCHAR2(20),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(20),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    sickroom_no       VARCHAR2(10),
    bed_no            VARCHAR2(36),
    ticket_number     VARCHAR2(20),
    sign_dept_code    VARCHAR2(20),
    sign_dept         VARCHAR2(50),
    sign_doc_code     VARCHAR2(20),
    sign_doc          VARCHAR2(50),
    sign_time         DATE,
    wind_no           VARCHAR2(5),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    sign_room_code    VARCHAR2(20),
    sign_room         VARCHAR2(50)
)
 ;
comment on column CDR_SIGNIN_INFOQUERY_lt.group_code
  is '集团编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.organization_code
  is '组织编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.domain_id
  is '系统域标识';
comment on column CDR_SIGNIN_INFOQUERY_lt.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_SIGNIN_INFOQUERY_lt.creattime
  is '创建时间';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_type
  is '签到场景 1挂号 2药房 3检查 4检验 5收费结算';
comment on column CDR_SIGNIN_INFOQUERY_lt.patient_id
  is '患者ID';
comment on column CDR_SIGNIN_INFOQUERY_lt.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_SIGNIN_INFOQUERY_lt.inpatient_no
  is '住院号标识';
comment on column CDR_SIGNIN_INFOQUERY_lt.visit_times
  is '就诊次数';
comment on column CDR_SIGNIN_INFOQUERY_lt.visit_no
  is '就诊流水号';
comment on column CDR_SIGNIN_INFOQUERY_lt.patient_name
  is '患者姓名';
comment on column CDR_SIGNIN_INFOQUERY_lt.age
  is '年龄';
comment on column CDR_SIGNIN_INFOQUERY_lt.department_code
  is '病人所在科室编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.department
  is '病人所在科室';
comment on column CDR_SIGNIN_INFOQUERY_lt.ward_code
  is '病人所在病区编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.ward
  is '病人所在病区';
comment on column CDR_SIGNIN_INFOQUERY_lt.sickroom_no
  is '病房编号';
comment on column CDR_SIGNIN_INFOQUERY_lt.bed_no
  is '病床号';
comment on column CDR_SIGNIN_INFOQUERY_lt.ticket_number
  is '票号';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_dept_code
  is '签到科室编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_dept
  is '签到科室';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_doc_code
  is '签到医生编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_doc
  is '签到医生';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_time
  is '签到时间';
comment on column CDR_SIGNIN_INFOQUERY_lt.wind_no
  is '分派窗口号';
comment on column CDR_SIGNIN_INFOQUERY_lt.delete_flag
  is '修改标志 0正常 1撤销';
comment on column CDR_SIGNIN_INFOQUERY_lt.last_update_time
  is '最后修改时间';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_room_code
  is '签到诊室编码';
comment on column CDR_SIGNIN_INFOQUERY_lt.sign_room
  is '签到诊室';





create table CDR_SKINTEST_INFOQUERY
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(10),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visitid            VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    bedno              VARCHAR2(20),
    skin_test_resultno VARCHAR2(20),
    advice_order_id    NUMBER,
    advice_no          VARCHAR2(20),
    apply_doctor_code  VARCHAR2(10),
    apply_doctor_name  VARCHAR2(36),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    exec_time          DATE,
    excute_dept_code   VARCHAR2(20),
    excute_dept        VARCHAR2(50),
    excute_doc_code    VARCHAR2(20),
    excute_doc         VARCHAR2(50),
    test_date          DATE,
    test_result        VARCHAR2(20),
    test_describe      VARCHAR2(200),
    record_date        DATE,
    record_doc_code    VARCHAR2(20),
    record_doc         VARCHAR2(50),
    project_code       VARCHAR2(20),
    project            VARCHAR2(100),
    batch_no           VARCHAR2(20),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;
comment on column CDR_SKINTEST_INFOQUERY.group_code
  is '集团编码';
comment on column CDR_SKINTEST_INFOQUERY.organization_code
  is '组织编码';
comment on column CDR_SKINTEST_INFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_SKINTEST_INFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_SKINTEST_INFOQUERY.patient_id
  is '患者ID';
comment on column CDR_SKINTEST_INFOQUERY.outpatient_no
  is '门（急）诊号标识';
comment on column CDR_SKINTEST_INFOQUERY.inpatient_no
  is '住院号标识';
comment on column CDR_SKINTEST_INFOQUERY.visitid
  is '就诊号';
comment on column CDR_SKINTEST_INFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_SKINTEST_INFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_SKINTEST_INFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_SKINTEST_INFOQUERY.age
  is '年龄';
comment on column CDR_SKINTEST_INFOQUERY.department_code
  is '病人所在科室编码';
comment on column CDR_SKINTEST_INFOQUERY.department
  is '病人所在科室';
comment on column CDR_SKINTEST_INFOQUERY.ward_code
  is '病人所在病区编码';
comment on column CDR_SKINTEST_INFOQUERY.ward
  is '病人所在病区';
comment on column CDR_SKINTEST_INFOQUERY.bedno
  is '床号';
comment on column CDR_SKINTEST_INFOQUERY.skin_test_resultno
  is '皮试结果唯一记录号';
comment on column CDR_SKINTEST_INFOQUERY.advice_order_id
  is '关联医嘱序号';
comment on column CDR_SKINTEST_INFOQUERY.advice_no
  is '关联医嘱号';
comment on column CDR_SKINTEST_INFOQUERY.apply_doctor_code
  is '申请医生编码';
comment on column CDR_SKINTEST_INFOQUERY.apply_doctor_name
  is '申请医生';
comment on column CDR_SKINTEST_INFOQUERY.apply_dept_code
  is '申请科室编码';
comment on column CDR_SKINTEST_INFOQUERY.apply_dept
  is '申请科室';
comment on column CDR_SKINTEST_INFOQUERY.exec_time
  is '执行时间';
comment on column CDR_SKINTEST_INFOQUERY.excute_dept_code
  is '皮试科室编码';
comment on column CDR_SKINTEST_INFOQUERY.excute_dept
  is '皮试科室';
comment on column CDR_SKINTEST_INFOQUERY.excute_doc_code
  is '皮试医生编码';
comment on column CDR_SKINTEST_INFOQUERY.excute_doc
  is '皮试医生';
comment on column CDR_SKINTEST_INFOQUERY.test_date
  is '皮试时间';
comment on column CDR_SKINTEST_INFOQUERY.test_result
  is '皮试结果';
comment on column CDR_SKINTEST_INFOQUERY.test_describe
  is '皮试过程描述';
comment on column CDR_SKINTEST_INFOQUERY.record_date
  is '皮试结果录入时间';
comment on column CDR_SKINTEST_INFOQUERY.record_doc_code
  is '录入人编码';
comment on column CDR_SKINTEST_INFOQUERY.record_doc
  is '录入人';
comment on column CDR_SKINTEST_INFOQUERY.project_code
  is '皮试项目编码';
comment on column CDR_SKINTEST_INFOQUERY.project
  is '皮试项目名称';
comment on column CDR_SKINTEST_INFOQUERY.batch_no
  is '皮试药品批号';
comment on column CDR_SKINTEST_INFOQUERY.delete_flag
  is '修改标志0正常 1撤销';
comment on column CDR_SKINTEST_INFOQUERY.last_update_time
  is '最后修改时间';





create table CDR_SKINTEST_INFOQUERY_RECORDS
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(10),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    patient_id         VARCHAR2(20),
    outpatient_no      VARCHAR2(20),
    inpatient_no       VARCHAR2(20),
    visitid            VARCHAR2(20),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(20),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    department_code    VARCHAR2(20),
    department         VARCHAR2(50),
    ward_code          VARCHAR2(20),
    ward               VARCHAR2(50),
    bedno              VARCHAR2(20),
    skin_test_resultno VARCHAR2(20),
    advice_order_id    NUMBER,
    advice_no          VARCHAR2(20),
    apply_doctor_code  VARCHAR2(10),
    apply_doctor_name  VARCHAR2(36),
    apply_dept_code    VARCHAR2(20),
    apply_dept         VARCHAR2(50),
    exec_time          DATE,
    excute_dept_code   VARCHAR2(20),
    excute_dept        VARCHAR2(50),
    excute_doc_code    VARCHAR2(20),
    excute_doc         VARCHAR2(50),
    test_date          DATE,
    test_result        VARCHAR2(20),
    test_describe      VARCHAR2(200),
    record_date        DATE,
    record_doc_code    VARCHAR2(20),
    record_doc         VARCHAR2(50),
    project_code       VARCHAR2(20),
    project            VARCHAR2(100),
    batch_no           VARCHAR2(20),
    delete_flag        NUMBER(1),
    last_update_time   DATE
)
 ;





create table CDR_SOURCE_ANDSCHEDULE
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(30) not null,
    create_doc_code      VARCHAR2(10),
    subspecialty_code    VARCHAR2(20),
    schedule_id          VARCHAR2(20),
    dept_flag            NUMBER,
    dept_code            VARCHAR2(10),
    dept_name            VARCHAR2(50),
    doctor_code          VARCHAR2(10),
    doctor_name          VARCHAR2(50),
    technical_title_code VARCHAR2(5),
    shift_name           VARCHAR2(100),
    req_type             NUMBER(3),
    req_sequence         NUMBER(4),
    time_period          VARCHAR2(36),
    register_charge      NUMBER(12,4),
    req_strattime        DATE,
    req_endtime          DATE,
    req_creattime        DATE,
    reg_status           NUMBER,
    delete_flag          NUMBER(1),
    last_update_time     DATE
);




















comment on column CDR_SOURCE_ANDSCHEDULE.group_code
  is '集团编码';
comment on column CDR_SOURCE_ANDSCHEDULE.organization_code
  is '组织编码';
comment on column CDR_SOURCE_ANDSCHEDULE.domain_id
  is '系统域标识';
comment on column CDR_SOURCE_ANDSCHEDULE.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_SOURCE_ANDSCHEDULE.create_doc_code
  is '排班计划医生工号';
comment on column CDR_SOURCE_ANDSCHEDULE.subspecialty_code
  is '号源专业代码';
comment on column CDR_SOURCE_ANDSCHEDULE.schedule_id
  is '号源记录唯一标识号';
comment on column CDR_SOURCE_ANDSCHEDULE.dept_flag
  is '科室号标识';
comment on column CDR_SOURCE_ANDSCHEDULE.dept_code
  is '出诊科室编码';
comment on column CDR_SOURCE_ANDSCHEDULE.dept_name
  is '出诊科室';
comment on column CDR_SOURCE_ANDSCHEDULE.doctor_code
  is '出诊医生编码';
comment on column CDR_SOURCE_ANDSCHEDULE.doctor_name
  is '出诊医生';
comment on column CDR_SOURCE_ANDSCHEDULE.technical_title_code
  is '出诊医生专业技能职务类别代码';
comment on column CDR_SOURCE_ANDSCHEDULE.shift_name
  is '班别名称';
comment on column CDR_SOURCE_ANDSCHEDULE.req_type
  is '号类 100 =普通号；101=专科号；102=专家号；103=特需号；104=专病号；999 =其他。';
comment on column CDR_SOURCE_ANDSCHEDULE.req_sequence
  is '挂号顺序号';
comment on column CDR_SOURCE_ANDSCHEDULE.time_period
  is '挂号时段';
comment on column CDR_SOURCE_ANDSCHEDULE.register_charge
  is '挂号总费用';
comment on column CDR_SOURCE_ANDSCHEDULE.req_strattime
  is '排班开始日期时间';
comment on column CDR_SOURCE_ANDSCHEDULE.req_endtime
  is '排班结束日期时间';
comment on column CDR_SOURCE_ANDSCHEDULE.req_creattime
  is '排班时间';
comment on column CDR_SOURCE_ANDSCHEDULE.reg_status
  is '号源状态 出诊状态，0-停诊,1-正常未挂出,2-已挂出,';
comment on column CDR_SOURCE_ANDSCHEDULE.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_SOURCE_ANDSCHEDULE.last_update_time
  is '最后修改时间';






create table CDR_SOURCE_ANDSCHEDULE_RECORDS
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(30) not null,
    create_doc_code      VARCHAR2(10),
    subspecialty_code    VARCHAR2(20),
    schedule_id          VARCHAR2(20),
    dept_flag            NUMBER,
    dept_code            VARCHAR2(10),
    dept_name            VARCHAR2(50),
    doctor_code          VARCHAR2(10),
    doctor_name          VARCHAR2(50),
    technical_title_code VARCHAR2(5),
    shift_name           VARCHAR2(100),
    req_type             NUMBER(3),
    req_sequence         NUMBER(4),
    time_period          VARCHAR2(36),
    register_charge      NUMBER(12,4),
    req_strattime        DATE,
    req_endtime          DATE,
    req_creattime        DATE,
    reg_status           NUMBER,
    delete_flag          NUMBER(1),
    last_update_time     DATE
)  ;





create table CDR_SURGERY_HIS
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 NUMBER(18) not null,
    patient_id              VARCHAR2(20),
    visit_times             NUMBER(5),
    visit_no                VARCHAR2(36),
    patient_name            VARCHAR2(20),
    operation_date          DATE,
    start_time              DATE,
    end_time                DATE,
    surgery_name            VARCHAR2(100),
    operation_id            VARCHAR2(100),
    treatment_id            VARCHAR2(100),
    operator_name           VARCHAR2(20),
    first_assistant_name    VARCHAR2(50),
    secend_assistant_name   VARCHAR2(50),
    nurse_name              VARCHAR2(20),
    anesthe_begdate         DATE,
    anesthe_enddate         DATE,
    anesthesia_method       NUMBER(18),
    anesthesia_type         VARCHAR2(50),
    anesthesia_quality      VARCHAR2(6),
    influsion_amount        NUMBER(5),
    anesthesia_name         VARCHAR2(50),
    oxygen_starttime        DATE,
    oxygen_endtime          DATE,
    incision_level          VARCHAR2(6),
    incision_heal_level     VARCHAR2(6),
    record_date             DATE,
    creator                 VARCHAR2(40),
    cancel_time             DATE,
    cancel_operator         VARCHAR2(20),
    operation_condition     VARCHAR2(8),
    asa                     VARCHAR2(20),
    is_again                NUMBER(1),
    incision_level_code     NUMBER(1),
    operation_level         NUMBER(2),
    ready_days              NUMBER(3),
    bacterial_time          DATE,
    incision_site           VARCHAR2(100),
    backagain_plan          NUMBER(1),
    backagain_purpose       VARCHAR2(100),
    incision_infect_flag    NUMBER(1),
    is_opcomplicate         NUMBER(1),
    pre_bacterial_medicine  NUMBER(1),
    bacterial_days          NUMBER(5),
    surprised_surgery       NUMBER(1),
    anesthesia_opcomplicate NUMBER(1),
    reserved_flag           NUMBER(1),
    surgery_opcomplicate    NUMBER(1),
    pro_blood               NUMBER(1),
    wound_dehiscence        NUMBER(1),
    vein_thrombosis         NUMBER(1),
    metabolic_disturbance   NUMBER(1),
    raspiratory             NUMBER(1),
    pulmonary_embolism      NUMBER(1),
    hematosepsis            NUMBER(1),
    fracture                NUMBER(1),
    sort_no                 NUMBER(2),
    delete_flag             NUMBER(1),
    last_update_time        DATE
)  ;
comment on column CDR_SURGERY_HIS.group_code
  is '集团编码';
comment on column CDR_SURGERY_HIS.organization_code
  is '组织编码';
comment on column CDR_SURGERY_HIS.domain_id
  is '域id';
comment on column CDR_SURGERY_HIS.unicode
  is '数据主键';
comment on column CDR_SURGERY_HIS.patient_id
  is '病人id';
comment on column CDR_SURGERY_HIS.visit_times
  is '就诊次数';
comment on column CDR_SURGERY_HIS.visit_no
  is '就诊流水号';
comment on column CDR_SURGERY_HIS.patient_name
  is '患者姓名';
comment on column CDR_SURGERY_HIS.operation_date
  is '手术日期';
comment on column CDR_SURGERY_HIS.start_time
  is '手术开始时间';
comment on column CDR_SURGERY_HIS.end_time
  is '手术结束时间';
comment on column CDR_SURGERY_HIS.surgery_name
  is '已行手术名称';
comment on column CDR_SURGERY_HIS.operation_id
  is '手术操作id';
comment on column CDR_SURGERY_HIS.treatment_id
  is '诊疗项目id';
comment on column CDR_SURGERY_HIS.operator_name
  is '主刀医师';
comment on column CDR_SURGERY_HIS.first_assistant_name
  is '第一助手';
comment on column CDR_SURGERY_HIS.secend_assistant_name
  is '第二助手';
comment on column CDR_SURGERY_HIS.nurse_name
  is '手术护士';
comment on column CDR_SURGERY_HIS.anesthe_begdate
  is '麻醉开始时间';
comment on column CDR_SURGERY_HIS.anesthe_enddate
  is '麻醉结束时间';
comment on column CDR_SURGERY_HIS.anesthesia_method
  is '麻醉方式';
comment on column CDR_SURGERY_HIS.anesthesia_type
  is '麻醉类型';
comment on column CDR_SURGERY_HIS.anesthesia_quality
  is '麻醉质量';
comment on column CDR_SURGERY_HIS.influsion_amount
  is '输液总量';
comment on column CDR_SURGERY_HIS.anesthesia_name
  is '麻醉医师';
comment on column CDR_SURGERY_HIS.oxygen_starttime
  is '输氧开始时间';
comment on column CDR_SURGERY_HIS.oxygen_endtime
  is '输氧结束时间';
comment on column CDR_SURGERY_HIS.incision_level
  is '切口类别 1 0类切口,2 Ⅰ类切口,3 Ⅱ类切口,4 Ⅲ类切口';
comment on column CDR_SURGERY_HIS.incision_heal_level
  is '愈合等级';
comment on column CDR_SURGERY_HIS.record_date
  is '记录日期';
comment on column CDR_SURGERY_HIS.creator
  is '记录人';
comment on column CDR_SURGERY_HIS.cancel_time
  is '取消时间';
comment on column CDR_SURGERY_HIS.cancel_operator
  is '取消人';
comment on column CDR_SURGERY_HIS.operation_condition
  is '手术情况';
comment on column CDR_SURGERY_HIS.asa
  is 'ASA分级';
comment on column CDR_SURGERY_HIS.is_again
  is '再次手术标志';
comment on column CDR_SURGERY_HIS.incision_level_code
  is '切口';
comment on column CDR_SURGERY_HIS.operation_level
  is '手术级别';
comment on column CDR_SURGERY_HIS.ready_days
  is '准备天数';
comment on column CDR_SURGERY_HIS.bacterial_time
  is '抗菌用药时间';
comment on column CDR_SURGERY_HIS.incision_site
  is '切口部位';
comment on column CDR_SURGERY_HIS.backagain_plan
  is '重返计划';
comment on column CDR_SURGERY_HIS.backagain_purpose
  is '重返目的';
comment on column CDR_SURGERY_HIS.incision_infect_flag
  is '切口感染标志0否1是';
comment on column CDR_SURGERY_HIS.is_opcomplicate
  is '手术并发症标志0否1是';
comment on column CDR_SURGERY_HIS.pre_bacterial_medicine
  is '术前抗菌用药标志0否1是';
comment on column CDR_SURGERY_HIS.bacterial_days
  is '抗菌用药天数标志0否1是';
comment on column CDR_SURGERY_HIS.surprised_surgery
  is '非预期的二次手术标志0否1是';
comment on column CDR_SURGERY_HIS.anesthesia_opcomplicate
  is '麻醉并发症标志0否1是';
comment on column CDR_SURGERY_HIS.reserved_flag
  is '术中异物遗留标志0否1是';
comment on column CDR_SURGERY_HIS.surgery_opcomplicate
  is '手术并发症标志0否1是';
comment on column CDR_SURGERY_HIS.pro_blood
  is '术后出血或血肿标志0否1是';
comment on column CDR_SURGERY_HIS.wound_dehiscence
  is '手术伤口裂开标志0否1是';
comment on column CDR_SURGERY_HIS.vein_thrombosis
  is '术后深静脉血栓标志0否1是';
comment on column CDR_SURGERY_HIS.metabolic_disturbance
  is '术后生理代谢紊乱标志0否1是';
comment on column CDR_SURGERY_HIS.raspiratory
  is '术后呼吸衰竭标志0否1是';
comment on column CDR_SURGERY_HIS.pulmonary_embolism
  is '术后肺栓塞标志0否1是';
comment on column CDR_SURGERY_HIS.hematosepsis
  is '术后败血症标志0否1是';
comment on column CDR_SURGERY_HIS.fracture
  is '术后髋关节骨折标志0否1是';
comment on column CDR_SURGERY_HIS.sort_no
  is '手术次序';
comment on column CDR_SURGERY_HIS.delete_flag
  is '删除标志';
comment on column CDR_SURGERY_HIS.last_update_time
  is '最后更新时间';









create table CDR_TOBASE64_TASK_INFO
(
    id               NUMBER generated always as identity,
    exec_time        DATE,
    data_max_time    DATE,
    base_info        VARCHAR2(20) not null,
    last_update_time DATE
)   ;
comment on column CDR_TOBASE64_TASK_INFO.id
  is '主键id';
comment on column CDR_TOBASE64_TASK_INFO.exec_time
  is '执行时间';
comment on column CDR_TOBASE64_TASK_INFO.data_max_time
  is '数据的最大时间';
comment on column CDR_TOBASE64_TASK_INFO.base_info
  is 'exam检验 ，check检查，bodyTest体检';
comment on column CDR_TOBASE64_TASK_INFO.last_update_time
  is '最后修改时间';





create table CDR_TRANSFERINFOQUERY
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    trans_recordid     VARCHAR2(20),
    inpatient_no       VARCHAR2(36),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(36),
    patient_id         VARCHAR2(36),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    trans_index        NUMBER(3),
    charge_doctorid    VARCHAR2(20),
    charge_doctor      VARCHAR2(50),
    respons_nurse_code VARCHAR2(20),
    respons_nurse      VARCHAR2(50),
    trans_out_date     DATE,
    origdept_code      VARCHAR2(20),
    origdept           VARCHAR2(50),
    origward_code      VARCHAR2(20),
    origward           VARCHAR2(50),
    origroom_code      VARCHAR2(20),
    origbed_code       VARCHAR2(20),
    current_doctorid   VARCHAR2(20),
    current_doctor     VARCHAR2(50),
    current_nurse_code VARCHAR2(20),
    current_nurse      VARCHAR2(50),
    trans_in_date      DATE,
    currentdept_code   VARCHAR2(20),
    currentdept        VARCHAR2(50),
    currentward_code   VARCHAR2(20),
    currentward        VARCHAR2(50),
    currentroomcode    VARCHAR2(20),
    currentbed_code    VARCHAR2(20),
    delete_flag        NUMBER(1),
    transfer_purpose   VARCHAR2(50),
    last_update_time   DATE
)
 ;
comment on column CDR_TRANSFERINFOQUERY.group_code
  is '集团编码';
comment on column CDR_TRANSFERINFOQUERY.organization_code
  is '组织编码';
comment on column CDR_TRANSFERINFOQUERY.domain_id
  is '系统域标识';
comment on column CDR_TRANSFERINFOQUERY.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_TRANSFERINFOQUERY.trans_recordid
  is '转科记录ID';
comment on column CDR_TRANSFERINFOQUERY.inpatient_no
  is '住院号';
comment on column CDR_TRANSFERINFOQUERY.visit_times
  is '就诊次数';
comment on column CDR_TRANSFERINFOQUERY.visit_no
  is '就诊流水号';
comment on column CDR_TRANSFERINFOQUERY.patient_id
  is '患者id';
comment on column CDR_TRANSFERINFOQUERY.patient_name
  is '患者姓名';
comment on column CDR_TRANSFERINFOQUERY.age
  is '年龄';
comment on column CDR_TRANSFERINFOQUERY.trans_index
  is '转科记录顺序号';
comment on column CDR_TRANSFERINFOQUERY.charge_doctorid
  is '责任医生工号';
comment on column CDR_TRANSFERINFOQUERY.charge_doctor
  is '责任医生';
comment on column CDR_TRANSFERINFOQUERY.respons_nurse_code
  is '责任护士工号';
comment on column CDR_TRANSFERINFOQUERY.respons_nurse
  is '责任护士';
comment on column CDR_TRANSFERINFOQUERY.trans_out_date
  is '转出时间';
comment on column CDR_TRANSFERINFOQUERY.origdept_code
  is '转出科室编码';
comment on column CDR_TRANSFERINFOQUERY.origdept
  is '转出科室';
comment on column CDR_TRANSFERINFOQUERY.origward_code
  is '转出病区编码';
comment on column CDR_TRANSFERINFOQUERY.origward
  is '转出病区';
comment on column CDR_TRANSFERINFOQUERY.origroom_code
  is '转出病房号';
comment on column CDR_TRANSFERINFOQUERY.origbed_code
  is '转出床号';
comment on column CDR_TRANSFERINFOQUERY.current_doctorid
  is '责任医生工号';
comment on column CDR_TRANSFERINFOQUERY.current_doctor
  is '责任医生';
comment on column CDR_TRANSFERINFOQUERY.current_nurse_code
  is '责任护士工号';
comment on column CDR_TRANSFERINFOQUERY.current_nurse
  is '责任护士';
comment on column CDR_TRANSFERINFOQUERY.trans_in_date
  is '转入时间';
comment on column CDR_TRANSFERINFOQUERY.currentdept_code
  is '转入科室编码';
comment on column CDR_TRANSFERINFOQUERY.currentdept
  is '转入科室';
comment on column CDR_TRANSFERINFOQUERY.currentward_code
  is '转入病区编码';
comment on column CDR_TRANSFERINFOQUERY.currentward
  is '转入病区';
comment on column CDR_TRANSFERINFOQUERY.currentroomcode
  is '转入病房号';
comment on column CDR_TRANSFERINFOQUERY.currentbed_code
  is '转入床号';
comment on column CDR_TRANSFERINFOQUERY.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_TRANSFERINFOQUERY.transfer_purpose
  is '转科目的';
comment on column CDR_TRANSFERINFOQUERY.last_update_time
  is '最后修改时间';





create table CDR_TRANSFERINFOQUERY_RECORDS
(
    group_code         VARCHAR2(20),
    organization_code  VARCHAR2(20),
    domain_id          VARCHAR2(2),
    unicode            VARCHAR2(30) not null,
    trans_recordid     VARCHAR2(20),
    inpatient_no       VARCHAR2(36),
    visit_times        NUMBER(3),
    visit_no           VARCHAR2(36),
    patient_id         VARCHAR2(36),
    patient_name       VARCHAR2(20),
    age                VARCHAR2(30),
    trans_index        NUMBER(3),
    charge_doctorid    VARCHAR2(20),
    charge_doctor      VARCHAR2(50),
    respons_nurse_code VARCHAR2(20),
    respons_nurse      VARCHAR2(50),
    trans_out_date     DATE,
    origdept_code      VARCHAR2(20),
    origdept           VARCHAR2(50),
    origward_code      VARCHAR2(20),
    origward           VARCHAR2(50),
    origroom_code      VARCHAR2(20),
    origbed_code       VARCHAR2(20),
    current_doctorid   VARCHAR2(20),
    current_doctor     VARCHAR2(50),
    current_nurse_code VARCHAR2(20),
    current_nurse      VARCHAR2(50),
    trans_in_date      DATE,
    currentdept_code   VARCHAR2(20),
    currentdept        VARCHAR2(50),
    currentward_code   VARCHAR2(20),
    currentward        VARCHAR2(50),
    currentroomcode    VARCHAR2(20),
    currentbed_code    VARCHAR2(20),
    delete_flag        NUMBER(1),
    transfer_purpose   VARCHAR2(50),
    last_update_time   DATE
)
 ;





create table CDR_TRANSFERREDRECORD
(
    group_code                     VARCHAR2(6),
    organization_code              VARCHAR2(9),
    domain_id                      VARCHAR2(6),
    unicode                        VARCHAR2(462) not null,
    patient_id                     VARCHAR2(96),
    visittimes                     NUMBER(4) not null,
    visit_no                       VARCHAR2(219),
    createtime                     DATE,
    serial_number                  VARCHAR2(144),
    inpatient_no                   VARCHAR2(48) not null,
    id_card                        VARCHAR2(60),
    patient_name                   VARCHAR2(90),
    gendercode                     VARCHAR2(3),
    age                            VARCHAR2(612),
    age_unit                       VARCHAR2(54),
    record_createdate              DATE,
    record_personid                VARCHAR2(4000),
    record_person                  VARCHAR2(90),
    orgid_custodial                VARCHAR2(30),
    org_custodial                  VARCHAR2(48),
    transfer_out_datetime          DATE,
    transfer_out_doctor            VARCHAR2(4000),
    transfer_out_doctorid          VARCHAR2(90),
    shift_to_datetime              DATE,
    shift_to_doctorid              VARCHAR2(4000),
    shift_to_doctor                VARCHAR2(90),
    in_hospital_date               DATE,
    bed_no                         NUMBER(8),
    room_no                        VARCHAR2(75),
    department                     VARCHAR2(96),
    departmentid                   VARCHAR2(48),
    ward_code                      VARCHAR2(48),
    ward_name                      VARCHAR2(96),
    hospital_id                    VARCHAR2(30),
    hospital_name                  VARCHAR2(48),
    illness                        VARCHAR2(4000),
    admission_hospital_state       VARCHAR2(4000),
    admission_diagnosis_code       VARCHAR2(60),
    admission_diagnosis            VARCHAR2(600),
    admidiag_tcm_code              VARCHAR2(6),
    admidiag_tcm                   VARCHAR2(6),
    admidiag_tcm_syndromename      VARCHAR2(6),
    admidiag_tcm_syndromecode      VARCHAR2(6),
    current_situation              VARCHAR2(4000),
    currdiag_wm                    VARCHAR2(4000),
    currdiag_wm_code               VARCHAR2(6),
    currdiag_tcm_code              VARCHAR2(6),
    currdiag_tcm                   VARCHAR2(6),
    currdiag_tcm_syndromename      VARCHAR2(6),
    currdiag_tcm_syndromecode      VARCHAR2(6),
    tcm_observations               VARCHAR2(6),
    shift_treatment_plan           VARCHAR2(4000),
    therapeutic_principleandmethod VARCHAR2(6),
    notices                        VARCHAR2(4000),
    transfer_out_recordcode        VARCHAR2(3),
    transfer_out_record            VARCHAR2(240),
    transfer_out_departmentid      VARCHAR2(6),
    transfer_out_department        VARCHAR2(4000),
    transfer_out_area_code         VARCHAR2(6),
    transfer_out_area              VARCHAR2(6),
    shift_to_departmentid          VARCHAR2(6),
    shift_to_department            VARCHAR2(4000),
    shift_to_area_code             VARCHAR2(6),
    shift_to_area                  VARCHAR2(6),
    transfer_purpose               VARCHAR2(4000),
    tcm_decocting_ways             VARCHAR2(6),
    tcm_medication                 VARCHAR2(6),
    treatment_process_description  VARCHAR2(4000),
    last_update_time               DATE
)   ;
comment on column CDR_TRANSFERREDRECORD.group_code
  is '集团编码';
comment on column CDR_TRANSFERREDRECORD.organization_code
  is '组织编码';
comment on column CDR_TRANSFERREDRECORD.domain_id
  is '系统域标识';
comment on column CDR_TRANSFERREDRECORD.unicode
  is '唯一编码';
comment on column CDR_TRANSFERREDRECORD.patient_id
  is '患者ID';
comment on column CDR_TRANSFERREDRECORD.visittimes
  is '就诊次数 ';
comment on column CDR_TRANSFERREDRECORD.visit_no
  is '就诊流水号';
comment on column CDR_TRANSFERREDRECORD.createtime
  is '文档生成时间，如“20121024154823”';
comment on column CDR_TRANSFERREDRECORD.serial_number
  is '文档流水号';
comment on column CDR_TRANSFERREDRECORD.inpatient_no
  is '住院号';
comment on column CDR_TRANSFERREDRECORD.id_card
  is '患者身份证号';
comment on column CDR_TRANSFERREDRECORD.patient_name
  is '患者姓名';
comment on column CDR_TRANSFERREDRECORD.gendercode
  is '性别代码，生理性别代码表(GB/T 2261.1 )';
comment on column CDR_TRANSFERREDRECORD.age
  is '年龄';
comment on column CDR_TRANSFERREDRECORD.age_unit
  is '年龄单位（岁/月）';
comment on column CDR_TRANSFERREDRECORD.record_createdate
  is '文档创建日期';
comment on column CDR_TRANSFERREDRECORD.record_personid
  is '文档创建医生编码';
comment on column CDR_TRANSFERREDRECORD.record_person
  is '文档创建医生';
comment on column CDR_TRANSFERREDRECORD.orgid_custodial
  is '文档保存机构编号';
comment on column CDR_TRANSFERREDRECORD.org_custodial
  is '文档保存机构名称';
comment on column CDR_TRANSFERREDRECORD.transfer_out_datetime
  is '转出日期时间';
comment on column CDR_TRANSFERREDRECORD.transfer_out_doctor
  is '转出医生编码';
comment on column CDR_TRANSFERREDRECORD.transfer_out_doctorid
  is '转出医生姓名';
comment on column CDR_TRANSFERREDRECORD.shift_to_datetime
  is '转入日期时间';
comment on column CDR_TRANSFERREDRECORD.shift_to_doctorid
  is '转入医生编码';
comment on column CDR_TRANSFERREDRECORD.shift_to_doctor
  is '转入医生姓名';
comment on column CDR_TRANSFERREDRECORD.in_hospital_date
  is '入院日期时间，数字格式，“20210618112105”';
comment on column CDR_TRANSFERREDRECORD.bed_no
  is '病床号';
comment on column CDR_TRANSFERREDRECORD.room_no
  is '病房号';
comment on column CDR_TRANSFERREDRECORD.department
  is '科室名称';
comment on column CDR_TRANSFERREDRECORD.departmentid
  is '科室编码';
comment on column CDR_TRANSFERREDRECORD.ward_code
  is '病区编码';
comment on column CDR_TRANSFERREDRECORD.ward_name
  is '病区名称';
comment on column CDR_TRANSFERREDRECORD.hospital_id
  is '医疗机构代码';
comment on column CDR_TRANSFERREDRECORD.hospital_name
  is '医疗医疗机构名称';
comment on column CDR_TRANSFERREDRECORD.illness
  is '主诉';
comment on column CDR_TRANSFERREDRECORD.admission_hospital_state
  is '入院情况';
comment on column CDR_TRANSFERREDRECORD.admission_diagnosis_code
  is '入院诊断编码';
comment on column CDR_TRANSFERREDRECORD.admission_diagnosis
  is '入院诊断名称';
comment on column CDR_TRANSFERREDRECORD.admidiag_tcm_code
  is '入院诊断-中医病名代码,中医病证分类与代码表( GB/T 15657)';
comment on column CDR_TRANSFERREDRECORD.admidiag_tcm
  is '入院诊断-中医病名';
comment on column CDR_TRANSFERREDRECORD.admidiag_tcm_syndromename
  is '入院诊断-中医证候名称';
comment on column CDR_TRANSFERREDRECORD.admidiag_tcm_syndromecode
  is '入院诊断-中医证候代码，中医病证分类与代码表( GB/T 15657)';
comment on column CDR_TRANSFERREDRECORD.current_situation
  is '目前情况';
comment on column CDR_TRANSFERREDRECORD.currdiag_wm
  is '目前诊断-西医诊断名称';
comment on column CDR_TRANSFERREDRECORD.currdiag_wm_code
  is '目前诊断-西医诊断编码，诊断代码表ICD-10';
comment on column CDR_TRANSFERREDRECORD.currdiag_tcm_code
  is '目前诊断-中医病名代码,中医病证分类与代码表( GB/T 15657)';
comment on column CDR_TRANSFERREDRECORD.currdiag_tcm
  is '目前诊断-中医病名';
comment on column CDR_TRANSFERREDRECORD.currdiag_tcm_syndromename
  is '目前诊断-中医证候名称';
comment on column CDR_TRANSFERREDRECORD.currdiag_tcm_syndromecode
  is '目前诊断-中医证候代码，中医病证分类与代码表( GB/T 15657)';
comment on column CDR_TRANSFERREDRECORD.tcm_observations
  is '中医“四诊”观察结果';
comment on column CDR_TRANSFERREDRECORD.shift_treatment_plan
  is '转入诊疗计划';
comment on column CDR_TRANSFERREDRECORD.therapeutic_principleandmethod
  is '治则治法';
comment on column CDR_TRANSFERREDRECORD.notices
  is '注意事项';
comment on column CDR_TRANSFERREDRECORD.transfer_out_recordcode
  is '转出记录代码, 转科记录类型代码表';
comment on column CDR_TRANSFERREDRECORD.transfer_out_record
  is '转出记录名称';
comment on column CDR_TRANSFERREDRECORD.transfer_out_departmentid
  is '转出科室编码';
comment on column CDR_TRANSFERREDRECORD.transfer_out_department
  is '转出科室名称';
comment on column CDR_TRANSFERREDRECORD.transfer_out_area_code
  is '转出病区代码';
comment on column CDR_TRANSFERREDRECORD.transfer_out_area
  is '转出病区名称';
comment on column CDR_TRANSFERREDRECORD.shift_to_departmentid
  is '转入科室编码';
comment on column CDR_TRANSFERREDRECORD.shift_to_department
  is '转入科室名称';
comment on column CDR_TRANSFERREDRECORD.shift_to_area_code
  is '转入病区代码';
comment on column CDR_TRANSFERREDRECORD.shift_to_area
  is '转入病区名称';
comment on column CDR_TRANSFERREDRECORD.transfer_purpose
  is '转科目的';
comment on column CDR_TRANSFERREDRECORD.tcm_decocting_ways
  is '中药煎煮方法';
comment on column CDR_TRANSFERREDRECORD.tcm_medication
  is '中药用药方法';
comment on column CDR_TRANSFERREDRECORD.treatment_process_description
  is '诊疗过程描述';
comment on column CDR_TRANSFERREDRECORD.last_update_time
  is '最后修改时间';











create table CDR_TYPE_COUNT
(
    type             VARCHAR2(20),
    num              NUMBER,
    last_update_time DATE
)   ;
comment on column CDR_TYPE_COUNT.type
  is '类型';
comment on column CDR_TYPE_COUNT.num
  is '数量';
comment on column CDR_TYPE_COUNT.last_update_time
  is '最后修改时间';





create table CDR_VIEW_QUERY_LOG
(
    user_id          VARCHAR2(20) not null,
    query_time       DATE not null,
    query_count      NUMBER not null,
    query_condition  VARCHAR2(500) not null,
    patient_name     VARCHAR2(100) not null,
    patient_id       VARCHAR2(100),
    id               NUMBER generated by default as identity,
    last_update_time DATE
)   ;
comment on table CDR_VIEW_QUERY_LOG
  is '历史查询表';
comment on column CDR_VIEW_QUERY_LOG.user_id
  is '用户ID';
comment on column CDR_VIEW_QUERY_LOG.query_time
  is '查询时间';
comment on column CDR_VIEW_QUERY_LOG.query_count
  is '查询次数';
comment on column CDR_VIEW_QUERY_LOG.query_condition
  is '查询条件';
comment on column CDR_VIEW_QUERY_LOG.patient_name
  is '患者姓名';
comment on column CDR_VIEW_QUERY_LOG.patient_id
  is '患者ID';
comment on column CDR_VIEW_QUERY_LOG.last_update_time
  is '最后修改时间';





create table CDR_ZY_ADMISSION_CZ
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(66) not null,
    pid               VARCHAR2(50),
    idno              VARCHAR2(50),
    pat_name          VARCHAR2(50),
    pat_sex           VARCHAR2(50),
    pat_brsdate       DATE,
    mari_code         VARCHAR2(50),
    pat_home_addr     VARCHAR2(200),
    pat_home_phno     VARCHAR2(50),
    contacts_name     VARCHAR2(50),
    contacts_relation VARCHAR2(50),
    contacts_addr     VARCHAR2(200),
    contacts_phno     VARCHAR2(50),
    pat_contact_idno  VARCHAR2(50),
    grdn_name         VARCHAR2(50),
    ocpt_code         VARCHAR2(50),
    edu_level_code    VARCHAR2(50),
    nation            VARCHAR2(50),
    ntvplc            VARCHAR2(50),
    pat_baddr         VARCHAR2(200),
    country_code      VARCHAR2(50),
    emp_name          VARCHAR2(50),
    pat_emp_phno      VARCHAR2(200),
    pat_hous_addr     VARCHAR2(200),
    phno              VARCHAR2(50),
    region            VARCHAR2(200),
    pat_card_type     VARCHAR2(50),
    pat_card_no       VARCHAR2(50),
    pat_card_pswd     VARCHAR2(50),
    appoint_sign      VARCHAR2(50),
    pat_nature        VARCHAR2(50),
    inp_source        VARCHAR2(50),
    adta_time         DATE,
    inp_reson         VARCHAR2(200),
    dept_id           VARCHAR2(50),
    inp_ward_id       VARCHAR2(50),
    bed_no            VARCHAR2(50),
    pay_type          VARCHAR2(50),
    dscplan_name      VARCHAR2(50),
    oprtr_name        VARCHAR2(50),
    inp_nature        VARCHAR2(50),
    inp_condition     VARCHAR2(1000),
    pat_type          VARCHAR2(100),
    emr_url           VARCHAR2(200),
    creationtime      DATE
)
 ;
comment on column CDR_ZY_ADMISSION_CZ.group_code
  is '集团编码';
comment on column CDR_ZY_ADMISSION_CZ.organization_code
  is '组织编码';
comment on column CDR_ZY_ADMISSION_CZ.domain_id
  is '系统域标识';
comment on column CDR_ZY_ADMISSION_CZ.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_ADMISSION_CZ.pid
  is '病人ID';
comment on column CDR_ZY_ADMISSION_CZ.idno
  is '身份证号';
comment on column CDR_ZY_ADMISSION_CZ.pat_name
  is '姓名';
comment on column CDR_ZY_ADMISSION_CZ.pat_sex
  is '性别';
comment on column CDR_ZY_ADMISSION_CZ.pat_brsdate
  is '出生日期';
comment on column CDR_ZY_ADMISSION_CZ.mari_code
  is '婚姻状况';
comment on column CDR_ZY_ADMISSION_CZ.pat_home_addr
  is '家庭住址';
comment on column CDR_ZY_ADMISSION_CZ.pat_home_phno
  is '家庭电话';
comment on column CDR_ZY_ADMISSION_CZ.contacts_name
  is '联系人姓名';
comment on column CDR_ZY_ADMISSION_CZ.contacts_relation
  is '联系人关系';
comment on column CDR_ZY_ADMISSION_CZ.contacts_addr
  is '联系地址';
comment on column CDR_ZY_ADMISSION_CZ.contacts_phno
  is '联系电话';
comment on column CDR_ZY_ADMISSION_CZ.pat_contact_idno
  is '联系人身份证号';
comment on column CDR_ZY_ADMISSION_CZ.grdn_name
  is '监护人姓名';
comment on column CDR_ZY_ADMISSION_CZ.ocpt_code
  is '职业';
comment on column CDR_ZY_ADMISSION_CZ.edu_level_code
  is '学历';
comment on column CDR_ZY_ADMISSION_CZ.nation
  is '民族';
comment on column CDR_ZY_ADMISSION_CZ.ntvplc
  is '籍贯';
comment on column CDR_ZY_ADMISSION_CZ.pat_baddr
  is '出生地';
comment on column CDR_ZY_ADMISSION_CZ.country_code
  is '国籍';
comment on column CDR_ZY_ADMISSION_CZ.emp_name
  is '工作单位';
comment on column CDR_ZY_ADMISSION_CZ.pat_emp_phno
  is '单位电话';
comment on column CDR_ZY_ADMISSION_CZ.pat_hous_addr
  is '户口地址';
comment on column CDR_ZY_ADMISSION_CZ.phno
  is '手机号';
comment on column CDR_ZY_ADMISSION_CZ.region
  is '区域';
comment on column CDR_ZY_ADMISSION_CZ.pat_card_type
  is '卡类别ID';
comment on column CDR_ZY_ADMISSION_CZ.pat_card_no
  is '卡号';
comment on column CDR_ZY_ADMISSION_CZ.pat_card_pswd
  is '密码';
comment on column CDR_ZY_ADMISSION_CZ.appoint_sign
  is '预约标志';
comment on column CDR_ZY_ADMISSION_CZ.pat_nature
  is '病人性质';
comment on column CDR_ZY_ADMISSION_CZ.inp_source
  is '入院方式';
comment on column CDR_ZY_ADMISSION_CZ.adta_time
  is '入院时间';
comment on column CDR_ZY_ADMISSION_CZ.inp_reson
  is '入院目的';
comment on column CDR_ZY_ADMISSION_CZ.dept_id
  is '入院科室ID';
comment on column CDR_ZY_ADMISSION_CZ.inp_ward_id
  is '病区ID';
comment on column CDR_ZY_ADMISSION_CZ.bed_no
  is '床号';
comment on column CDR_ZY_ADMISSION_CZ.pay_type
  is '医疗付款方式';
comment on column CDR_ZY_ADMISSION_CZ.dscplan_name
  is '费别';
comment on column CDR_ZY_ADMISSION_CZ.oprtr_name
  is '操作员姓名';
comment on column CDR_ZY_ADMISSION_CZ.inp_nature
  is '入院属性';
comment on column CDR_ZY_ADMISSION_CZ.inp_condition
  is '入院病况';
comment on column CDR_ZY_ADMISSION_CZ.pat_type
  is '病人类型';
comment on column CDR_ZY_ADMISSION_CZ.emr_url
  is '病历链接';
comment on column CDR_ZY_ADMISSION_CZ.creationtime
  is '创建时间';







create table CDR_ZY_ADMISSION_DETAIL
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    unicode                  VARCHAR2(30) not null,
    admission_records        VARCHAR2(36),
    patient_id               VARCHAR2(36),
    visit_no                 VARCHAR2(36),
    visit_times              NUMBER(3),
    inpatient_no             VARCHAR2(36),
    patient_name             VARCHAR2(20),
    gendercode               NUMBER(1),
    age                      VARCHAR2(30),
    birth_date               DATE,
    id_card                  VARCHAR2(18),
    marriage_code            VARCHAR2(4),
    nation_code              VARCHAR2(4),
    mobile                   VARCHAR2(13),
    relation_mobile          VARCHAR2(13),
    relation_name            VARCHAR2(20),
    relation_ship            VARCHAR2(20),
    live_address             VARCHAR2(200),
    live_street              VARCHAR2(200),
    work_place               VARCHAR2(200),
    occupation_code          VARCHAR2(20),
    doctor_code              VARCHAR2(20),
    doctor_name              VARCHAR2(50),
    admission_condition      NUMBER(1),
    admission_way            VARCHAR2(2),
    admission_reason         VARCHAR2(2),
    admission_dept_code      VARCHAR2(20),
    admission_dept           VARCHAR2(50),
    admission_ward_code      VARCHAR2(20),
    admission_ward           VARCHAR2(50),
    admission_sickroom       VARCHAR2(50),
    admission_bed_no         VARCHAR2(20),
    in_hospital_date         DATE,
    in_department_date       DATE,
    admission_register_code  VARCHAR2(20),
    admission_register       VARCHAR2(50),
    admission_register_date  DATE,
    doctor_directorid        VARCHAR2(20),
    doctor_director          VARCHAR2(50),
    charge_doctor_id         VARCHAR2(20),
    charge_doctor            VARCHAR2(50),
    refer_physicianid        VARCHAR2(20),
    refer_physician          VARCHAR2(50),
    respons_nurse_code       VARCHAR2(20),
    respons_nurse            VARCHAR2(50),
    admission_diagnosis_code VARCHAR2(40),
    admission_diagnosis      VARCHAR2(100),
    status_code              VARCHAR2(10),
    delete_flag              NUMBER(1),
    last_update_time         DATE,
    observation_flag         VARCHAR2(1)
);




















comment on column CDR_ZY_ADMISSION_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_ADMISSION_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_ADMISSION_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_ADMISSION_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_records
  is '入院记录ID';
comment on column CDR_ZY_ADMISSION_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_ADMISSION_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_ADMISSION_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_ADMISSION_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_ADMISSION_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_ADMISSION_DETAIL.gendercode
  is '性别代码';
comment on column CDR_ZY_ADMISSION_DETAIL.age
  is '年龄';
comment on column CDR_ZY_ADMISSION_DETAIL.birth_date
  is '出生日期';
comment on column CDR_ZY_ADMISSION_DETAIL.id_card
  is '身份证号码';
comment on column CDR_ZY_ADMISSION_DETAIL.marriage_code
  is '婚姻编码';
comment on column CDR_ZY_ADMISSION_DETAIL.nation_code
  is '民族编码';
comment on column CDR_ZY_ADMISSION_DETAIL.mobile
  is '电话';
comment on column CDR_ZY_ADMISSION_DETAIL.relation_mobile
  is '联系人电话';
comment on column CDR_ZY_ADMISSION_DETAIL.relation_name
  is '联系人';
comment on column CDR_ZY_ADMISSION_DETAIL.relation_ship
  is '联系人关系代码';
comment on column CDR_ZY_ADMISSION_DETAIL.live_address
  is '现住址';
comment on column CDR_ZY_ADMISSION_DETAIL.live_street
  is '详细街道';
comment on column CDR_ZY_ADMISSION_DETAIL.work_place
  is '工作单位';
comment on column CDR_ZY_ADMISSION_DETAIL.occupation_code
  is '职业代码';
comment on column CDR_ZY_ADMISSION_DETAIL.doctor_code
  is '门诊医生编号';
comment on column CDR_ZY_ADMISSION_DETAIL.doctor_name
  is '门诊医生';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_condition
  is '入院情况 1：危；2：急；9：一般';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_way
  is '入院途径代码';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_reason
  is '入院原因代码';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_dept_code
  is '入院科室编码';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_dept
  is '入院科室';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_ward_code
  is '入院病区编码';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_ward
  is '入院病区';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_sickroom
  is '病房号';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_bed_no
  is '入院床位';
comment on column CDR_ZY_ADMISSION_DETAIL.in_hospital_date
  is '入院时间';
comment on column CDR_ZY_ADMISSION_DETAIL.in_department_date
  is '入科时间';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_register_code
  is '入院登记员编号';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_register
  is '入院登记员';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_register_date
  is '入院登记时间';
comment on column CDR_ZY_ADMISSION_DETAIL.doctor_directorid
  is '主任(副主任)医生编号';
comment on column CDR_ZY_ADMISSION_DETAIL.doctor_director
  is '主任(副主任)医生';
comment on column CDR_ZY_ADMISSION_DETAIL.charge_doctor_id
  is '主治医生编码';
comment on column CDR_ZY_ADMISSION_DETAIL.charge_doctor
  is '主治医生';
comment on column CDR_ZY_ADMISSION_DETAIL.refer_physicianid
  is '住院医生编码';
comment on column CDR_ZY_ADMISSION_DETAIL.refer_physician
  is '住院医生';
comment on column CDR_ZY_ADMISSION_DETAIL.respons_nurse_code
  is '责任护士编码';
comment on column CDR_ZY_ADMISSION_DETAIL.respons_nurse
  is '责任护士';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_diagnosis_code
  is '入院诊断编码,ICD-10';
comment on column CDR_ZY_ADMISSION_DETAIL.admission_diagnosis
  is '入院诊断';
comment on column CDR_ZY_ADMISSION_DETAIL.status_code
  is '在院状态 1在院 2退院 ';
comment on column CDR_ZY_ADMISSION_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_ZY_ADMISSION_DETAIL.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_ADMISSION_DETAIL.observation_flag
  is '留观标志 0 住院；1留观';






create table CDR_ZY_ADMISSION_DETAIL_RECORDS
(
    group_code               VARCHAR2(20),
    organization_code        VARCHAR2(20),
    domain_id                VARCHAR2(2),
    unicode                  VARCHAR2(30) not null,
    admission_records        VARCHAR2(36),
    patient_id               VARCHAR2(36),
    visit_no                 VARCHAR2(36),
    visit_times              NUMBER(3),
    inpatient_no             VARCHAR2(36),
    patient_name             VARCHAR2(20),
    gendercode               NUMBER(1),
    age                      VARCHAR2(30),
    birth_date               DATE,
    id_card                  VARCHAR2(18),
    marriage_code            VARCHAR2(4),
    nation_code              VARCHAR2(4),
    mobile                   VARCHAR2(13),
    relation_mobile          VARCHAR2(13),
    relation_name            VARCHAR2(20),
    relation_ship            VARCHAR2(20),
    live_address             VARCHAR2(200),
    live_street              VARCHAR2(200),
    work_place               VARCHAR2(200),
    occupation_code          VARCHAR2(20),
    doctor_code              VARCHAR2(20),
    doctor_name              VARCHAR2(50),
    admission_condition      NUMBER(1),
    admission_way            VARCHAR2(2),
    admission_reason         VARCHAR2(2),
    admission_dept_code      VARCHAR2(20),
    admission_dept           VARCHAR2(50),
    admission_ward_code      VARCHAR2(20),
    admission_ward           VARCHAR2(50),
    admission_sickroom       VARCHAR2(50),
    admission_bed_no         VARCHAR2(20),
    in_hospital_date         DATE,
    in_department_date       DATE,
    admission_register_code  VARCHAR2(20),
    admission_register       VARCHAR2(50),
    admission_register_date  DATE,
    doctor_directorid        VARCHAR2(20),
    doctor_director          VARCHAR2(50),
    charge_doctor_id         VARCHAR2(20),
    charge_doctor            VARCHAR2(50),
    refer_physicianid        VARCHAR2(20),
    refer_physician          VARCHAR2(50),
    respons_nurse_code       VARCHAR2(20),
    respons_nurse            VARCHAR2(50),
    admission_diagnosis_code VARCHAR2(40),
    admission_diagnosis      VARCHAR2(100),
    status_code              VARCHAR2(10),
    delete_flag              NUMBER(1),
    last_update_time         DATE,
    observation_flag         VARCHAR2(1)
)
 ;





create table CDR_ZY_ADVANCE_PAYMENT
(
    group_code        VARCHAR2(6),
    organization_code VARCHAR2(9),
    domain_id         VARCHAR2(6),
    hospital_id       VARCHAR2(30),
    hospital_name     VARCHAR2(48),
    unicode           VARCHAR2(153) not null,
    patient_id        NUMBER(18),
    visittimes        NUMBER(18),
    visit_no          VARCHAR2(243),
    inpatient_no      NUMBER(18),
    patient_name      VARCHAR2(300),
    gendername        VARCHAR2(12),
    gendercode        VARCHAR2(3),
    age               VARCHAR2(60),
    birthtime         DATE,
    id_card           VARCHAR2(54),
    occupation        VARCHAR2(240),
    nation            VARCHAR2(60),
    nationality       VARCHAR2(90),
    marriage          VARCHAR2(12),
    mobile            VARCHAR2(150),
    payment_money     NUMBER(16,5),
    charge_status     VARCHAR2(3),
    trans_no          VARCHAR2(150),
    receipt_no        VARCHAR2(24),
    payment           VARCHAR2(60),
    payment_code      VARCHAR2(60),
    operator          VARCHAR2(60),
    operator_code     VARCHAR2(18),
    charge_time       DATE,
    last_update_time  DATE
)   ;
comment on column CDR_ZY_ADVANCE_PAYMENT.group_code
  is '集团编码';
comment on column CDR_ZY_ADVANCE_PAYMENT.organization_code
  is '组织编码';
comment on column CDR_ZY_ADVANCE_PAYMENT.domain_id
  is '系统域标识';
comment on column CDR_ZY_ADVANCE_PAYMENT.hospital_id
  is '医疗机构代码';
comment on column CDR_ZY_ADVANCE_PAYMENT.hospital_name
  is '医疗机构';
comment on column CDR_ZY_ADVANCE_PAYMENT.unicode
  is '唯一键';
comment on column CDR_ZY_ADVANCE_PAYMENT.patient_id
  is '个人标识号';
comment on column CDR_ZY_ADVANCE_PAYMENT.visittimes
  is '就诊次数';
comment on column CDR_ZY_ADVANCE_PAYMENT.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_ADVANCE_PAYMENT.inpatient_no
  is '住院号';
comment on column CDR_ZY_ADVANCE_PAYMENT.patient_name
  is '患者姓名';
comment on column CDR_ZY_ADVANCE_PAYMENT.gendername
  is '性别名称';
comment on column CDR_ZY_ADVANCE_PAYMENT.gendercode
  is '性别编码';
comment on column CDR_ZY_ADVANCE_PAYMENT.age
  is '年龄';
comment on column CDR_ZY_ADVANCE_PAYMENT.birthtime
  is '出生日期';
comment on column CDR_ZY_ADVANCE_PAYMENT.id_card
  is '身份证号码';
comment on column CDR_ZY_ADVANCE_PAYMENT.occupation
  is '职业';
comment on column CDR_ZY_ADVANCE_PAYMENT.nation
  is '民族';
comment on column CDR_ZY_ADVANCE_PAYMENT.nationality
  is '国籍';
comment on column CDR_ZY_ADVANCE_PAYMENT.marriage
  is '婚姻状况';
comment on column CDR_ZY_ADVANCE_PAYMENT.mobile
  is '手机号';
comment on column CDR_ZY_ADVANCE_PAYMENT.payment_money
  is '支付金额';
comment on column CDR_ZY_ADVANCE_PAYMENT.charge_status
  is '预交状态（1-正常收，2退款的负记录，3退款的正记录）';
comment on column CDR_ZY_ADVANCE_PAYMENT.trans_no
  is '交易流水号';
comment on column CDR_ZY_ADVANCE_PAYMENT.receipt_no
  is '单据号';
comment on column CDR_ZY_ADVANCE_PAYMENT.payment
  is '付款方式名称';
comment on column CDR_ZY_ADVANCE_PAYMENT.payment_code
  is '付款方式编码';
comment on column CDR_ZY_ADVANCE_PAYMENT.operator
  is '操作员姓名';
comment on column CDR_ZY_ADVANCE_PAYMENT.operator_code
  is '操作员编码';
comment on column CDR_ZY_ADVANCE_PAYMENT.charge_time
  is '收款时间';
comment on column CDR_ZY_ADVANCE_PAYMENT.last_update_time
  is '最后修改时间';






create table CDR_ZY_CHARGE_CZ_DETAIL
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    visit_no               VARCHAR2(50),
    visit_times            NUMBER(3),
    patient_id             VARCHAR2(36),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    inpatient_no           VARCHAR2(20),
    detail_itemid          VARCHAR2(36),
    order_detailid         VARCHAR2(36),
    charge_settleid        VARCHAR2(36),
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              VARCHAR2(20),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(20),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(20),
    exec_dept              VARCHAR2(50),
    exec_doctor_code       VARCHAR2(20),
    exec_doctor            VARCHAR2(50),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(64),
    detail_itemunit        VARCHAR2(12),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empcode         VARCHAR2(20),
    charge_emp             VARCHAR2(50),
    charge_deptcode        VARCHAR2(20),
    charge_dept            VARCHAR2(50),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(36),
    last_update_time       DATE,
    charge_cz_type         VARCHAR2(36)
);




















comment on column CDR_ZY_CHARGE_CZ_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.age
  is '年龄';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_itemid
  is '收费明细ID';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.order_detailid
  is '医嘱明细ID';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_settleid
  is '费用结算ID';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_happentime
  is '费用发生时间';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_reporttime
  is '费用上账时间';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_settletime
  is '费用结算时间';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.dept_code
  is '开单科室编码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.dept_name
  is '开单科室';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.doctor_code
  is '开单医生编号';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.doctor_name
  is '开单医生';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.exec_dept
  is '执行科室';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.exec_doctor_code
  is '执行人员编号';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.exec_doctor
  is '执行人员';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_item_type
  is '收费项目类别代码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_type_hospital
  is '费用收入归类代码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_itemcode
  is '明细项目代码 ';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_itemname
  is '明细项目名称';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_itemunit
  is '明细项目单位';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_itemunit_price
  is '明细项目单价';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_item_quantity
  is '明细项目数量';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_item_receivable
  is '明细项目应收金额';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.detail_item_received
  is '明细项目实收金额';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_empcode
  is '收/退费员编码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_emp
  is '收/退费员';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_deptcode
  is '收/退费科室编码';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_dept
  is '收/退费科室';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_status
  is '收费状态';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.delete_flag
  is '修改标志0：正常（选填默认）1：撤销';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.delete_unicode
  is '被退费明细ID';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_CHARGE_CZ_DETAIL.charge_cz_type
  is '长照收费项目类别代码，0：伙食费
1：长照险抵扣（长照护理险报销）
2：照护费
3：其他
4：床位费
5：营养费
6：电费
7水费
';





create table CDR_ZY_CHARGE_DETAIL
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    visit_no               VARCHAR2(50),
    visit_times            NUMBER(3),
    patient_id             VARCHAR2(36),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    inpatient_no           VARCHAR2(20),
    detail_itemid          VARCHAR2(36),
    order_detailid         VARCHAR2(36),
    charge_settleid        VARCHAR2(36),
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              VARCHAR2(20),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(20),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(20),
    exec_dept              VARCHAR2(100),
    exec_doctor_code       VARCHAR2(20),
    exec_doctor            VARCHAR2(50),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(300),
    detail_itemunit        VARCHAR2(30),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empcode         VARCHAR2(20),
    charge_emp             VARCHAR2(50),
    charge_deptcode        VARCHAR2(20),
    charge_dept            VARCHAR2(50),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(36),
    last_update_time       DATE
);



comment on column CDR_ZY_CHARGE_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_CHARGE_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_CHARGE_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_CHARGE_DETAIL.unicode
  is '主键';
comment on column CDR_ZY_CHARGE_DETAIL.visit_no
  is '就诊流水号';
comment on column CDR_ZY_CHARGE_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_CHARGE_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_CHARGE_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_CHARGE_DETAIL.age
  is '年龄';
comment on column CDR_ZY_CHARGE_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_CHARGE_DETAIL.detail_itemid
  is '收费明细ID';
comment on column CDR_ZY_CHARGE_DETAIL.order_detailid
  is '医嘱明细ID';
comment on column CDR_ZY_CHARGE_DETAIL.charge_settleid
  is '费用结算ID';
comment on column CDR_ZY_CHARGE_DETAIL.charge_happentime
  is '费用发生时间';
comment on column CDR_ZY_CHARGE_DETAIL.charge_reporttime
  is '费用上账时间';
comment on column CDR_ZY_CHARGE_DETAIL.charge_settletime
  is '费用结算时间';
comment on column CDR_ZY_CHARGE_DETAIL.dept_code
  is '开单科室编码';
comment on column CDR_ZY_CHARGE_DETAIL.dept_name
  is '开单科室';
comment on column CDR_ZY_CHARGE_DETAIL.doctor_code
  is '开单医生编码';
comment on column CDR_ZY_CHARGE_DETAIL.doctor_name
  is '开单医生';
comment on column CDR_ZY_CHARGE_DETAIL.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_CHARGE_DETAIL.exec_dept
  is '执行科室';
comment on column CDR_ZY_CHARGE_DETAIL.exec_doctor_code
  is '执行人编码';
comment on column CDR_ZY_CHARGE_DETAIL.exec_doctor
  is '执行人';
comment on column CDR_ZY_CHARGE_DETAIL.charge_item_type
  is '收费项目类别代码';
comment on column CDR_ZY_CHARGE_DETAIL.charge_type_hospital
  is '费用收入归类代码';
comment on column CDR_ZY_CHARGE_DETAIL.detail_itemcode
  is '明细项目代码';
comment on column CDR_ZY_CHARGE_DETAIL.detail_itemname
  is '明细项目名称';
comment on column CDR_ZY_CHARGE_DETAIL.detail_itemunit
  is '明细项目单位';
comment on column CDR_ZY_CHARGE_DETAIL.detail_itemunit_price
  is '明细项目单价';
comment on column CDR_ZY_CHARGE_DETAIL.detail_item_quantity
  is '明细项目数量';
comment on column CDR_ZY_CHARGE_DETAIL.detail_item_receivable
  is '明细项目应收金额';
comment on column CDR_ZY_CHARGE_DETAIL.detail_item_received
  is '明细项目实收金额';
comment on column CDR_ZY_CHARGE_DETAIL.charge_empcode
  is '收/退费员编码';
comment on column CDR_ZY_CHARGE_DETAIL.charge_emp
  is '收/退费员';
comment on column CDR_ZY_CHARGE_DETAIL.charge_deptcode
  is '收/退费科室编码';
comment on column CDR_ZY_CHARGE_DETAIL.charge_dept
  is '收/退费科室';
comment on column CDR_ZY_CHARGE_DETAIL.charge_status
  is '收费状态1未缴费2已缴费3退费';
comment on column CDR_ZY_CHARGE_DETAIL.delete_flag
  is '修改标志';
comment on column CDR_ZY_CHARGE_DETAIL.delete_unicode
  is '被退费明细ID';
comment on column CDR_ZY_CHARGE_DETAIL.last_update_time
  is '最后更新时间';








create table CDR_ZY_CHARGE_DETAIL_BACKUP
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    visit_no               VARCHAR2(50),
    visit_times            NUMBER(3),
    patient_id             VARCHAR2(36),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    inpatient_no           VARCHAR2(20),
    detail_itemid          VARCHAR2(36),
    order_detailid         VARCHAR2(36),
    charge_settleid        VARCHAR2(36),
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              VARCHAR2(20),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(20),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(20),
    exec_dept              VARCHAR2(100),
    exec_doctor_code       VARCHAR2(20),
    exec_doctor            VARCHAR2(50),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(300),
    detail_itemunit        VARCHAR2(30),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empcode         VARCHAR2(20),
    charge_emp             VARCHAR2(50),
    charge_deptcode        VARCHAR2(20),
    charge_dept            VARCHAR2(50),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(36),
    last_update_time       DATE
)
 ;





create table CDR_ZY_CHARGE_DETAIL_BAK
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    visit_no               VARCHAR2(50),
    visit_times            NUMBER(3),
    patient_id             VARCHAR2(36),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    inpatient_no           VARCHAR2(20),
    detail_itemid          VARCHAR2(36),
    order_detailid         VARCHAR2(36),
    charge_settleid        VARCHAR2(36),
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              VARCHAR2(20),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(20),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(20),
    exec_dept              VARCHAR2(50),
    exec_doctor_code       VARCHAR2(20),
    exec_doctor            VARCHAR2(50),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(300),
    detail_itemunit        VARCHAR2(24),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empcode         VARCHAR2(20),
    charge_emp             VARCHAR2(50),
    charge_deptcode        VARCHAR2(20),
    charge_dept            VARCHAR2(50),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(36),
    last_update_time       DATE
)
 ;
comment on column CDR_ZY_CHARGE_DETAIL_BAK.group_code
  is '集团编码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.organization_code
  is '组织编码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.domain_id
  is '系统域标识';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.visit_times
  is '就诊次数';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.patient_id
  is '个人标识号';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.patient_name
  is '患者姓名';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.age
  is '年龄';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.inpatient_no
  is '住院号';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_itemid
  is '收费明细ID';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.order_detailid
  is '医嘱明细ID';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_settleid
  is '费用结算ID';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_happentime
  is '费用发生时间';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_reporttime
  is '费用上账时间';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_settletime
  is '费用结算时间';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.dept_code
  is '开单科室编码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.dept_name
  is '开单科室';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.doctor_code
  is '开单医生编号';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.doctor_name
  is '开单医生';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.exec_dept
  is '执行科室';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.exec_doctor_code
  is '执行人员编号';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.exec_doctor
  is '执行人员';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_item_type
  is '收费项目类别代码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_type_hospital
  is '费用收入归类代码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_itemcode
  is '明细项目代码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_itemname
  is '明细项目名称';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_itemunit
  is '明细项目单位';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_itemunit_price
  is '明细项目单价';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_item_quantity
  is '明细项目数量';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_item_receivable
  is '明细项目应收金额';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.detail_item_received
  is '明细项目实收金额';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_empcode
  is '收/退费员编码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_emp
  is '收/退费员';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_deptcode
  is '收/退费科室编码';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_dept
  is '收/退费科室';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.charge_status
  is '收费状态 1未缴费2已缴费3退费';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.delete_flag
  is '修改标志0：正常（选填默认）1：撤销';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.delete_unicode
  is '被退费明细ID';
comment on column CDR_ZY_CHARGE_DETAIL_BAK.last_update_time
  is '最后修改时间';








create table CDR_ZY_CHARGE_DETAIL_RE90
(
    group_code             CHAR(6),
    organization_code      CHAR(9),
    domain_id              CHAR(6),
    unicode                NUMBER(18) not null,
    visit_no               NUMBER,
    visit_times            NUMBER(5) not null,
    patient_id             NUMBER(18) not null,
    patient_name           VARCHAR2(300),
    age                    VARCHAR2(60),
    inpatient_no           NUMBER,
    detail_itemid          NUMBER(18) not null,
    order_detailid         NUMBER(18),
    charge_settleid        NUMBER(18),
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              NUMBER(18),
    dept_name              VARCHAR2(300),
    doctor_code            NUMBER,
    doctor_name            VARCHAR2(123),
    exec_dept_code         NUMBER(18),
    exec_dept              VARCHAR2(300),
    exec_doctor_code       NUMBER,
    exec_doctor            VARCHAR2(60),
    charge_item_type       CHAR(6),
    charge_type_hospital   VARCHAR2(3),
    detail_itemcode        NUMBER(18) not null,
    detail_itemname        VARCHAR2(240),
    detail_itemunit        VARCHAR2(60),
    detail_itemunit_price  NUMBER(16,5),
    detail_item_quantity   NUMBER,
    detail_item_receivable NUMBER(20,5),
    detail_item_received   NUMBER(20,5),
    charge_empcode         NUMBER,
    charge_emp             VARCHAR2(60),
    charge_deptcode        NUMBER,
    charge_dept            VARCHAR2(300),
    charge_status          VARCHAR2(3),
    delete_flag            CHAR(3),
    delete_unicode         NUMBER
)
 ;





create table CDR_ZY_CHARGE_DETAIL_RECORDS
(
    group_code             VARCHAR2(20),
    organization_code      VARCHAR2(20),
    domain_id              VARCHAR2(2),
    unicode                VARCHAR2(30) not null,
    visit_no               VARCHAR2(50),
    visit_times            NUMBER(3),
    patient_id             VARCHAR2(36),
    patient_name           VARCHAR2(20),
    age                    VARCHAR2(30),
    inpatient_no           VARCHAR2(20),
    detail_itemid          VARCHAR2(36),
    order_detailid         VARCHAR2(36),
    charge_settleid        VARCHAR2(36),
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              VARCHAR2(20),
    dept_name              VARCHAR2(50),
    doctor_code            VARCHAR2(20),
    doctor_name            VARCHAR2(50),
    exec_dept_code         VARCHAR2(20),
    exec_dept              VARCHAR2(100),
    exec_doctor_code       VARCHAR2(20),
    exec_doctor            VARCHAR2(50),
    charge_item_type       VARCHAR2(4),
    charge_type_hospital   VARCHAR2(4),
    detail_itemcode        VARCHAR2(36),
    detail_itemname        VARCHAR2(300),
    detail_itemunit        VARCHAR2(30),
    detail_itemunit_price  NUMBER(12,4),
    detail_item_quantity   NUMBER(8,3),
    detail_item_receivable NUMBER(12,4),
    detail_item_received   NUMBER(12,4),
    charge_empcode         VARCHAR2(20),
    charge_emp             VARCHAR2(50),
    charge_deptcode        VARCHAR2(20),
    charge_dept            VARCHAR2(50),
    charge_status          NUMBER(1),
    delete_flag            NUMBER(1),
    delete_unicode         VARCHAR2(36),
    last_update_time       DATE
)
 ;





create table CDR_ZY_CHARGE_DETAIL_SE90
(
    group_code             CHAR(6),
    organization_code      CHAR(9),
    domain_id              CHAR(6),
    unicode                NUMBER(18) not null,
    visit_no               NUMBER,
    visit_times            NUMBER(5) not null,
    patient_id             NUMBER(18) not null,
    patient_name           VARCHAR2(300),
    age                    VARCHAR2(60),
    inpatient_no           NUMBER,
    detail_itemid          NUMBER(18) not null,
    order_detailid         NUMBER(18),
    charge_settleid        NUMBER(18) not null,
    charge_happentime      DATE,
    charge_reporttime      DATE,
    charge_settletime      DATE,
    dept_code              NUMBER(18),
    dept_name              VARCHAR2(300),
    doctor_code            NUMBER,
    doctor_name            VARCHAR2(123),
    exec_dept_code         NUMBER(18),
    exec_dept              VARCHAR2(300),
    exec_doctor_code       NUMBER,
    exec_doctor            VARCHAR2(60),
    charge_item_type       CHAR(6),
    charge_type_hospital   VARCHAR2(3),
    detail_itemcode        NUMBER(18) not null,
    detail_itemname        VARCHAR2(240),
    detail_itemunit        VARCHAR2(60),
    detail_itemunit_price  NUMBER(16,5),
    detail_item_quantity   NUMBER,
    detail_item_receivable NUMBER(20,5),
    detail_item_received   NUMBER(20,5),
    charge_empcode         NUMBER,
    charge_emp             VARCHAR2(60),
    charge_deptcode        NUMBER,
    charge_dept            VARCHAR2(300),
    charge_status          VARCHAR2(3),
    delete_flag            CHAR(3),
    delete_unicode         NUMBER
)
 ;





create table CDR_ZY_CHARGE_UNICODE
(
    id NUMBER(18) not null
)
 ;





create table CDR_ZY_CUR_DETAIL
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    unicode              VARCHAR2(30) not null,
    creattime            DATE,
    patient_id           VARCHAR2(36),
    inpatient_no         VARCHAR2(50),
    visit_times          NUMBER(10),
    visit_no             VARCHAR2(20),
    patient_name         VARCHAR2(20),
    age                  VARCHAR2(30),
    gender               NUMBER(1),
    department_code      VARCHAR2(20),
    department           VARCHAR2(50),
    ward_code            VARCHAR2(20),
    ward                 VARCHAR2(50),
    sickroom_no          VARCHAR2(20),
    bed_no               VARCHAR2(36),
    mobile               VARCHAR2(12),
    relation_mobile      VARCHAR2(20),
    relation_name        VARCHAR2(20),
    relation_ship        VARCHAR2(20),
    live_address         VARCHAR2(200),
    live_street          VARCHAR2(200),
    work_place           VARCHAR2(200),
    job_code             VARCHAR2(5),
    job_name             VARCHAR2(100),
    birthtime            DATE,
    nationality_code     VARCHAR2(5),
    nationality_name     VARCHAR2(100),
    nation_code          VARCHAR2(5),
    nation_name          VARCHAR2(100),
    marry_status         VARCHAR2(5),
    marry_name           VARCHAR2(100),
    id_card              VARCHAR2(18),
    cur_deptcode         VARCHAR2(50),
    cur_deptname         VARCHAR2(100),
    cur_wardcode         VARCHAR2(50),
    cur_wardname         VARCHAR2(100),
    in_hospital_date     DATE,
    in_department_date   DATE,
    observation_flag     VARCHAR2(1),
    resident_doctor_code VARCHAR2(36),
    resident_doctor_name VARCHAR2(40),
    doctor_directorid    VARCHAR2(20),
    doctor_director      VARCHAR2(40),
    charge_doctor_id     VARCHAR2(20),
    charge_doctor        VARCHAR2(50),
    respons_nurse_code   VARCHAR2(20),
    respons_nurse_name   VARCHAR2(50),
    nursing_level        VARCHAR2(20),
    delete_flag          NUMBER(1)
)
 ;
comment on column CDR_ZY_CUR_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_CUR_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_CUR_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_CUR_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_CUR_DETAIL.creattime
  is '创建时间';
comment on column CDR_ZY_CUR_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_CUR_DETAIL.inpatient_no
  is '住院号标识';
comment on column CDR_ZY_CUR_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_CUR_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_CUR_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_CUR_DETAIL.age
  is '年龄';
comment on column CDR_ZY_CUR_DETAIL.gender
  is '性别编码';
comment on column CDR_ZY_CUR_DETAIL.department_code
  is '病人所在科室编码';
comment on column CDR_ZY_CUR_DETAIL.department
  is '病人所在科室';
comment on column CDR_ZY_CUR_DETAIL.ward_code
  is '病人所在病区编码';
comment on column CDR_ZY_CUR_DETAIL.ward
  is '病人所在病区';
comment on column CDR_ZY_CUR_DETAIL.sickroom_no
  is '病房编号';
comment on column CDR_ZY_CUR_DETAIL.bed_no
  is '病床号';
comment on column CDR_ZY_CUR_DETAIL.mobile
  is '手机号';
comment on column CDR_ZY_CUR_DETAIL.relation_mobile
  is '联系人电话';
comment on column CDR_ZY_CUR_DETAIL.relation_name
  is '联系人姓名';
comment on column CDR_ZY_CUR_DETAIL.relation_ship
  is '联系人关系';
comment on column CDR_ZY_CUR_DETAIL.live_address
  is '居住地址';
comment on column CDR_ZY_CUR_DETAIL.live_street
  is '居住街道';
comment on column CDR_ZY_CUR_DETAIL.work_place
  is '工作单位';
comment on column CDR_ZY_CUR_DETAIL.job_code
  is '职业类别代码 ';
comment on column CDR_ZY_CUR_DETAIL.job_name
  is '职业类别描述';
comment on column CDR_ZY_CUR_DETAIL.birthtime
  is '出生日期';
comment on column CDR_ZY_CUR_DETAIL.nationality_code
  is '国籍编码';
comment on column CDR_ZY_CUR_DETAIL.nationality_name
  is '国籍名称';
comment on column CDR_ZY_CUR_DETAIL.nation_code
  is '民族编码';
comment on column CDR_ZY_CUR_DETAIL.nation_name
  is '民族名称';
comment on column CDR_ZY_CUR_DETAIL.marry_status
  is '婚姻状况代码';
comment on column CDR_ZY_CUR_DETAIL.marry_name
  is '婚姻状况名称';
comment on column CDR_ZY_CUR_DETAIL.id_card
  is '身份证号码';
comment on column CDR_ZY_CUR_DETAIL.cur_deptcode
  is '入院科室编码';
comment on column CDR_ZY_CUR_DETAIL.cur_deptname
  is '入院科室名称';
comment on column CDR_ZY_CUR_DETAIL.cur_wardcode
  is '入院病区编码';
comment on column CDR_ZY_CUR_DETAIL.cur_wardname
  is '入院病区名称';
comment on column CDR_ZY_CUR_DETAIL.in_hospital_date
  is '入院日期';
comment on column CDR_ZY_CUR_DETAIL.in_department_date
  is '入科时间';
comment on column CDR_ZY_CUR_DETAIL.observation_flag
  is '留观标志';
comment on column CDR_ZY_CUR_DETAIL.resident_doctor_code
  is '住院医师编号';
comment on column CDR_ZY_CUR_DETAIL.resident_doctor_name
  is '住院医师姓名';
comment on column CDR_ZY_CUR_DETAIL.doctor_directorid
  is '主任(副主任)医师编号';
comment on column CDR_ZY_CUR_DETAIL.doctor_director
  is '主任(副主任)医师姓名';
comment on column CDR_ZY_CUR_DETAIL.charge_doctor_id
  is '主治医师编码';
comment on column CDR_ZY_CUR_DETAIL.charge_doctor
  is '主治医师名称';
comment on column CDR_ZY_CUR_DETAIL.respons_nurse_code
  is '责任护士编码';
comment on column CDR_ZY_CUR_DETAIL.respons_nurse_name
  is '责任护士名称';
comment on column CDR_ZY_CUR_DETAIL.nursing_level
  is '护理等级';
comment on column CDR_ZY_CUR_DETAIL.delete_flag
  is '删除标志';




create table CDR_ZY_DIAGNOSE_DETAIL
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    visit_no                    VARCHAR2(36),
    visit_times                 NUMBER(3),
    patient_id                  VARCHAR2(36),
    patient_name                VARCHAR2(36),
    age                         VARCHAR2(30),
    inpatient_no                VARCHAR2(20),
    department_code             VARCHAR2(20),
    department                  VARCHAR2(50),
    ward_code                   VARCHAR2(20),
    ward                        VARCHAR2(50),
    list_unicode                VARCHAR2(30) not null,
    diagnosed_id                VARCHAR2(36),
    diagnosed_method            NUMBER(1),
    diagnosed_primary_secondary NUMBER(2),
    sort_no                     NUMBER(2),
    diagnosis_code              VARCHAR2(32),
    diagnosis                   VARCHAR2(200),
    suspecteddiagnosis          NUMBER(2),
    diag_class_code             NUMBER(4),
    diagnosed_type              VARCHAR2(50),
    diagnosis_doc_code          VARCHAR2(10),
    diagnosis_doc               VARCHAR2(36),
    record_time                 DATE,
    revoke_time                 DATE,
    last_edit_time              DATE,
    last_edit_code              VARCHAR2(20),
    last_editor                 VARCHAR2(50),
    tcm_pattern_code            VARCHAR2(2),
    tcm_pattern_name            VARCHAR2(200),
    delete_flag                 NUMBER(1),
    last_update_time            DATE
);




















comment on column CDR_ZY_DIAGNOSE_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_DIAGNOSE_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_DIAGNOSE_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_DIAGNOSE_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_DIAGNOSE_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_DIAGNOSE_DETAIL.age
  is '年龄';
comment on column CDR_ZY_DIAGNOSE_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_DIAGNOSE_DETAIL.department_code
  is '病人所在科室编码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.department
  is '病人所在科室';
comment on column CDR_ZY_DIAGNOSE_DETAIL.ward_code
  is '病人所在病区编码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.ward
  is '病人所在病区';
comment on column CDR_ZY_DIAGNOSE_DETAIL.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosed_id
  is '诊断记录ID';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosed_method
  is '诊断方法代码 01：西医；02：中医';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosed_primary_secondary
  is '诊断主次代码 01：主要诊断；02：次要诊断';
comment on column CDR_ZY_DIAGNOSE_DETAIL.sort_no
  is '诊断顺序';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosis_code
  is '诊断代码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosis
  is '诊断名称';
comment on column CDR_ZY_DIAGNOSE_DETAIL.suspecteddiagnosis
  is '是否疑诊 01：疑诊；02：非疑诊';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diag_class_code
  is '诊断分类代码 1：出院诊断2：门诊诊断3：入院诊断4：术前诊断5：术后诊断6：尸检诊断7：放射诊断8：超声诊断9：病理诊断10：并发症诊断99：其他';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosed_type
  is '诊断类型代码 1：初步诊断2：修正诊断3：确诊诊断';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosis_doc_code
  is '诊断医生编码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.diagnosis_doc
  is '诊断医生';
comment on column CDR_ZY_DIAGNOSE_DETAIL.record_time
  is '诊断录入时间';
comment on column CDR_ZY_DIAGNOSE_DETAIL.revoke_time
  is '撤销时间';
comment on column CDR_ZY_DIAGNOSE_DETAIL.last_edit_time
  is '最后编辑时间';
comment on column CDR_ZY_DIAGNOSE_DETAIL.last_edit_code
  is '最后编辑人编码';
comment on column CDR_ZY_DIAGNOSE_DETAIL.last_editor
  is '最后编辑人';
comment on column CDR_ZY_DIAGNOSE_DETAIL.tcm_pattern_code
  is '中医病证区别代码 01：病；02：证；诊断方法代码为02 时填写 ';
comment on column CDR_ZY_DIAGNOSE_DETAIL.tcm_pattern_name
  is '中医证候名';
comment on column CDR_ZY_DIAGNOSE_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_ZY_DIAGNOSE_DETAIL.last_update_time
  is '最后修改时间';





create table CDR_ZY_DIAGNOSE_DETAIL_20240531
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    visit_no                    VARCHAR2(36),
    visit_times                 NUMBER(3),
    patient_id                  VARCHAR2(36),
    patient_name                VARCHAR2(36),
    age                         VARCHAR2(30),
    inpatient_no                VARCHAR2(20),
    department_code             VARCHAR2(20),
    department                  VARCHAR2(50),
    ward_code                   VARCHAR2(20),
    ward                        VARCHAR2(50),
    list_unicode                VARCHAR2(30) not null,
    diagnosed_id                VARCHAR2(36),
    diagnosed_method            NUMBER(1),
    diagnosed_primary_secondary NUMBER(2),
    sort_no                     NUMBER(2),
    diagnosis_code              VARCHAR2(32),
    diagnosis                   VARCHAR2(200),
    suspecteddiagnosis          NUMBER(2),
    diag_class_code             NUMBER(4),
    diagnosed_type              VARCHAR2(50),
    diagnosis_doc_code          VARCHAR2(10),
    diagnosis_doc               VARCHAR2(36),
    record_time                 DATE,
    revoke_time                 DATE,
    last_edit_time              DATE,
    last_edit_code              VARCHAR2(20),
    last_editor                 VARCHAR2(50),
    tcm_pattern_code            VARCHAR2(2),
    tcm_pattern_name            VARCHAR2(200),
    delete_flag                 NUMBER(1),
    last_update_time            DATE
)
 ;





create table CDR_ZY_DIAGNOSE_DETAIL_RECORDS
(
    group_code                  VARCHAR2(20),
    organization_code           VARCHAR2(20),
    domain_id                   VARCHAR2(2),
    visit_no                    VARCHAR2(36),
    visit_times                 NUMBER(3),
    patient_id                  VARCHAR2(36),
    patient_name                VARCHAR2(36),
    age                         VARCHAR2(30),
    inpatient_no                VARCHAR2(20),
    department_code             VARCHAR2(20),
    department                  VARCHAR2(50),
    ward_code                   VARCHAR2(20),
    ward                        VARCHAR2(50),
    list_unicode                VARCHAR2(30) not null,
    diagnosed_id                VARCHAR2(36),
    diagnosed_method            NUMBER(1),
    diagnosed_primary_secondary NUMBER(2),
    sort_no                     NUMBER(2),
    diagnosis_code              VARCHAR2(32),
    diagnosis                   VARCHAR2(200),
    suspecteddiagnosis          NUMBER(2),
    diag_class_code             NUMBER(4),
    diagnosed_type              VARCHAR2(50),
    diagnosis_doc_code          VARCHAR2(10),
    diagnosis_doc               VARCHAR2(36),
    record_time                 DATE,
    revoke_time                 DATE,
    last_edit_time              DATE,
    last_edit_code              VARCHAR2(20),
    last_editor                 VARCHAR2(50),
    tcm_pattern_code            VARCHAR2(2),
    tcm_pattern_name            VARCHAR2(100),
    delete_flag                 NUMBER(1),
    last_update_time            DATE
)
 ;





create table CDR_ZY_DISCHARGEREG
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    discharge_records VARCHAR2(36),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    inpatient_no      VARCHAR2(20),
    patient_name      VARCHAR2(20),
    id_card           VARCHAR2(18),
    gendername        VARCHAR2(8),
    gendercode        VARCHAR2(1),
    age               VARCHAR2(30),
    birthtime         DATE,
    out_dept_no       VARCHAR2(20),
    out_dept          VARCHAR2(50),
    out_ward_code     VARCHAR2(20),
    out_ward          VARCHAR2(50),
    bed_no            VARCHAR2(5),
    doctor_code       VARCHAR2(36),
    out_register_code VARCHAR2(20),
    out_register      VARCHAR2(50),
    out_hospital_date DATE,
    insurance_type    VARCHAR2(5),
    nonlocal_flag     NUMBER(1),
    special_flag      NUMBER(3),
    outcome_code      VARCHAR2(5),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    doctor_name       VARCHAR2(36),
    observation_flag  VARCHAR2(1)
);




















comment on column CDR_ZY_DISCHARGEREG.group_code
  is '集团编码';
comment on column CDR_ZY_DISCHARGEREG.organization_code
  is '组织编码';
comment on column CDR_ZY_DISCHARGEREG.domain_id
  is '系统域标识';
comment on column CDR_ZY_DISCHARGEREG.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_DISCHARGEREG.discharge_records
  is '出院记录ID';
comment on column CDR_ZY_DISCHARGEREG.patient_id
  is '个人标识号';
comment on column CDR_ZY_DISCHARGEREG.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_DISCHARGEREG.visit_times
  is '就诊次数';
comment on column CDR_ZY_DISCHARGEREG.inpatient_no
  is '住院号';
comment on column CDR_ZY_DISCHARGEREG.patient_name
  is '患者姓名';
comment on column CDR_ZY_DISCHARGEREG.id_card
  is '身份证号码';
comment on column CDR_ZY_DISCHARGEREG.gendername
  is '性别';
comment on column CDR_ZY_DISCHARGEREG.gendercode
  is '性别代码';
comment on column CDR_ZY_DISCHARGEREG.age
  is '年龄';
comment on column CDR_ZY_DISCHARGEREG.birthtime
  is '出生日期';
comment on column CDR_ZY_DISCHARGEREG.out_dept_no
  is '出院科室编码';
comment on column CDR_ZY_DISCHARGEREG.out_dept
  is '出院科室';
comment on column CDR_ZY_DISCHARGEREG.out_ward_code
  is '出院病区编码';
comment on column CDR_ZY_DISCHARGEREG.out_ward
  is '出院病区';
comment on column CDR_ZY_DISCHARGEREG.bed_no
  is '床位号';
comment on column CDR_ZY_DISCHARGEREG.doctor_code
  is '责任医生编号';
comment on column CDR_ZY_DISCHARGEREG.out_register_code
  is '出院登记人编码';
comment on column CDR_ZY_DISCHARGEREG.out_register
  is '出院登记人';
comment on column CDR_ZY_DISCHARGEREG.out_hospital_date
  is '出院时间';
comment on column CDR_ZY_DISCHARGEREG.insurance_type
  is '医疗费用类型代码';
comment on column CDR_ZY_DISCHARGEREG.nonlocal_flag
  is '外地标志 1：本市；2：外地；3：境外（港澳台）；4：外国；5：未知';
comment on column CDR_ZY_DISCHARGEREG.special_flag
  is '特需标志 0非特需，1特需';
comment on column CDR_ZY_DISCHARGEREG.outcome_code
  is '病情转归代码';
comment on column CDR_ZY_DISCHARGEREG.delete_flag
  is '修改标志 0：出院（选填默认）1：出院召回';
comment on column CDR_ZY_DISCHARGEREG.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_DISCHARGEREG.doctor_name
  is '责任医生名称';
comment on column CDR_ZY_DISCHARGEREG.observation_flag
  is '留观标志 0 住院；1留观';





create table CDR_ZY_DISCHARGEREG_20240109
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    discharge_records VARCHAR2(36),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    inpatient_no      VARCHAR2(20),
    patient_name      VARCHAR2(20),
    id_card           VARCHAR2(18),
    gendername        VARCHAR2(4),
    gendercode        VARCHAR2(1),
    age               VARCHAR2(30),
    birthtime         DATE,
    out_dept_no       VARCHAR2(20),
    out_dept          VARCHAR2(50),
    out_ward_code     VARCHAR2(20),
    out_ward          VARCHAR2(50),
    bed_no            VARCHAR2(5),
    doctor_code       VARCHAR2(36),
    out_register_code VARCHAR2(20),
    out_register      VARCHAR2(50),
    out_hospital_date DATE,
    insurance_type    VARCHAR2(5),
    nonlocal_flag     NUMBER(1),
    special_flag      NUMBER(3),
    outcome_code      VARCHAR2(5),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    doctor_name       VARCHAR2(36),
    observation_flag  VARCHAR2(1)
)
 ;





create table CDR_ZY_DISCHARGEREG_BACKUP
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    discharge_records VARCHAR2(36),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    inpatient_no      VARCHAR2(20),
    patient_name      VARCHAR2(20),
    id_card           VARCHAR2(18),
    gendername        VARCHAR2(4),
    gendercode        VARCHAR2(1),
    age               VARCHAR2(30),
    birthtime         DATE,
    out_dept_no       VARCHAR2(20),
    out_dept          VARCHAR2(50),
    out_ward_code     VARCHAR2(20),
    out_ward          VARCHAR2(50),
    bed_no            VARCHAR2(5),
    doctor_code       VARCHAR2(36),
    out_register_code VARCHAR2(20),
    out_register      VARCHAR2(50),
    out_hospital_date DATE,
    insurance_type    VARCHAR2(5),
    nonlocal_flag     NUMBER(1),
    special_flag      NUMBER(3),
    outcome_code      VARCHAR2(5),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    doctor_name       VARCHAR2(36),
    observation_flag  VARCHAR2(1)
)
 ;





create table CDR_ZY_DISCHARGEREG_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    discharge_records VARCHAR2(36),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    inpatient_no      VARCHAR2(20),
    patient_name      VARCHAR2(20),
    id_card           VARCHAR2(18),
    gendername        VARCHAR2(8),
    gendercode        VARCHAR2(1),
    age               VARCHAR2(30),
    birthtime         DATE,
    out_dept_no       VARCHAR2(20),
    out_dept          VARCHAR2(50),
    out_ward_code     VARCHAR2(20),
    out_ward          VARCHAR2(50),
    bed_no            VARCHAR2(5),
    doctor_code       VARCHAR2(36),
    out_register_code VARCHAR2(20),
    out_register      VARCHAR2(50),
    out_hospital_date DATE,
    insurance_type    VARCHAR2(5),
    nonlocal_flag     NUMBER(1),
    special_flag      NUMBER(3),
    outcome_code      VARCHAR2(5),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    doctor_name       VARCHAR2(36),
    observation_flag  VARCHAR2(1)
)
 ;





create table CDR_ZY_DRUGORDER
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    patient_id              VARCHAR2(36),
    patient_name            VARCHAR2(20),
    visit_no                VARCHAR2(50),
    visit_times             NUMBER(3),
    inpatient_no            VARCHAR2(20),
    age                     VARCHAR2(30),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    bed_no                  VARCHAR2(10),
    list_unicode            VARCHAR2(30) not null,
    order_detailid          VARCHAR2(36),
    order_time_typecode     VARCHAR2(2),
    item_type               VARCHAR2(2),
    exec_statuscode         NUMBER(1),
    order_issuedate         DATE,
    order_issuerid          VARCHAR2(20),
    order_issuer            VARCHAR2(50),
    order_issuedepartmentid VARCHAR2(20),
    order_issuedepartment   VARCHAR2(50),
    order_content           VARCHAR2(200),
    exec_dept_code          VARCHAR2(10),
    exec_dept               VARCHAR2(50),
    order_reviewerid        VARCHAR2(20),
    order_reviewer          VARCHAR2(50),
    order_reviewdate        DATE,
    order_starttime         DATE,
    order_endtime           DATE,
    order_confirm_nursecode VARCHAR2(20),
    order_confirm_nurse     VARCHAR2(50),
    order_confirm_time      DATE,
    order_stop_doctorcode   VARCHAR2(20),
    order_stop_doctor       VARCHAR2(50),
    order_stop_doctortime   DATE,
    order_stop_nursecode    VARCHAR2(20),
    order_stop_nurse        VARCHAR2(50),
    order_stoptime          DATE,
    order_cancellerid       VARCHAR2(20),
    order_canceller         VARCHAR2(50),
    order_cancellertiem     DATE,
    order_illustration      VARCHAR2(500),
    order_sortno            NUMBER(8),
    parent_orderno          VARCHAR2(36),
    order_detailcode        VARCHAR2(36),
    order_detailname        VARCHAR2(256),
    drug_specification      VARCHAR2(180),
    dosage_formcode         VARCHAR2(20),
    drug_flag               NUMBER(3),
    batchno                 VARCHAR2(500),
    drug_instruction        VARCHAR2(600),
    drug_frequency_code     VARCHAR2(20),
    every_dosage            NUMBER(8,3),
    every_dosageunit        VARCHAR2(16),
    every_quantity          NUMBER(8,3),
    every_quantityunit      VARCHAR2(10),
    speed                   VARCHAR2(20),
    character               NUMBER(1),
    clinic_path             NUMBER(1),
    drug_purpose            VARCHAR2(150),
    skin_test_resultno      VARCHAR2(20),
    tcm_decocting_method    VARCHAR2(50),
    notices                 VARCHAR2(100),
    delete_flag             NUMBER(1),
    last_update_time        DATE,
    days                    NUMBER
);




















comment on column CDR_ZY_DRUGORDER.group_code
  is '集团编码';
comment on column CDR_ZY_DRUGORDER.organization_code
  is '组织编码';
comment on column CDR_ZY_DRUGORDER.domain_id
  is '系统域标识';
comment on column CDR_ZY_DRUGORDER.patient_id
  is '个人标识号';
comment on column CDR_ZY_DRUGORDER.patient_name
  is '病人姓名';
comment on column CDR_ZY_DRUGORDER.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_DRUGORDER.visit_times
  is '就诊次数';
comment on column CDR_ZY_DRUGORDER.inpatient_no
  is '住院号';
comment on column CDR_ZY_DRUGORDER.age
  is '年龄';
comment on column CDR_ZY_DRUGORDER.department_code
  is '病人所在科室编码';
comment on column CDR_ZY_DRUGORDER.department
  is '病人所在科室';
comment on column CDR_ZY_DRUGORDER.ward_code
  is '病人所在病区编码';
comment on column CDR_ZY_DRUGORDER.ward
  is '病人所在病区';
comment on column CDR_ZY_DRUGORDER.bed_no
  is '床位';
comment on column CDR_ZY_DRUGORDER.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_DRUGORDER.order_detailid
  is '医嘱明细ID';
comment on column CDR_ZY_DRUGORDER.order_time_typecode
  is '医嘱时间类别代码 1长期、2临时，9其它，医嘱类别代码表';
comment on column CDR_ZY_DRUGORDER.item_type
  is '诊疗项目类别编码 1:西药 2:中成药 3:中药饮片';
comment on column CDR_ZY_DRUGORDER.exec_statuscode
  is '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废';
comment on column CDR_ZY_DRUGORDER.order_issuedate
  is '医嘱开立时间';
comment on column CDR_ZY_DRUGORDER.order_issuerid
  is '医嘱开立医生编码';
comment on column CDR_ZY_DRUGORDER.order_issuer
  is '医嘱开立医生';
comment on column CDR_ZY_DRUGORDER.order_issuedepartmentid
  is '医嘱开立科室编码';
comment on column CDR_ZY_DRUGORDER.order_issuedepartment
  is '医嘱开立科室';
comment on column CDR_ZY_DRUGORDER.order_content
  is '医嘱内容';
comment on column CDR_ZY_DRUGORDER.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_DRUGORDER.exec_dept
  is '执行科室';
comment on column CDR_ZY_DRUGORDER.order_reviewerid
  is '医嘱审核医生编码';
comment on column CDR_ZY_DRUGORDER.order_reviewer
  is '医嘱审核医生';
comment on column CDR_ZY_DRUGORDER.order_reviewdate
  is '医嘱审核时间';
comment on column CDR_ZY_DRUGORDER.order_starttime
  is '医嘱开始时间';
comment on column CDR_ZY_DRUGORDER.order_endtime
  is '医嘱停止时间';
comment on column CDR_ZY_DRUGORDER.order_confirm_nursecode
  is '医嘱确认护士编码';
comment on column CDR_ZY_DRUGORDER.order_confirm_nurse
  is '医嘱确认护士';
comment on column CDR_ZY_DRUGORDER.order_confirm_time
  is '医嘱确认时间';
comment on column CDR_ZY_DRUGORDER.order_stop_doctorcode
  is '停嘱医生编号';
comment on column CDR_ZY_DRUGORDER.order_stop_doctor
  is '停嘱医生';
comment on column CDR_ZY_DRUGORDER.order_stop_doctortime
  is '医生停嘱时间';
comment on column CDR_ZY_DRUGORDER.order_stop_nursecode
  is '确认停嘱护士编号';
comment on column CDR_ZY_DRUGORDER.order_stop_nurse
  is '确认停嘱护士';
comment on column CDR_ZY_DRUGORDER.order_stoptime
  is '护士确认停嘱时间';
comment on column CDR_ZY_DRUGORDER.order_cancellerid
  is '医嘱作废医生编码';
comment on column CDR_ZY_DRUGORDER.order_canceller
  is '医嘱作废医生';
comment on column CDR_ZY_DRUGORDER.order_cancellertiem
  is '医嘱作废时间';
comment on column CDR_ZY_DRUGORDER.order_illustration
  is '医嘱说明';
comment on column CDR_ZY_DRUGORDER.order_sortno
  is '医嘱序号';
comment on column CDR_ZY_DRUGORDER.parent_orderno
  is '父医嘱ID';
comment on column CDR_ZY_DRUGORDER.order_detailcode
  is '医嘱项目代码';
comment on column CDR_ZY_DRUGORDER.order_detailname
  is '医嘱项目名称';
comment on column CDR_ZY_DRUGORDER.drug_specification
  is '药品规格';
comment on column CDR_ZY_DRUGORDER.dosage_formcode
  is '药物剂型代码';
comment on column CDR_ZY_DRUGORDER.drug_flag
  is '毒麻标志 0，非毒麻，1毒麻药品';
comment on column CDR_ZY_DRUGORDER.batchno
  is '药品批次';
comment on column CDR_ZY_DRUGORDER.drug_instruction
  is '医嘱用法';
comment on column CDR_ZY_DRUGORDER.drug_frequency_code
  is '医嘱频率代码';
comment on column CDR_ZY_DRUGORDER.every_dosage
  is '每次使用剂量';
comment on column CDR_ZY_DRUGORDER.every_dosageunit
  is '每次使用剂量单位';
comment on column CDR_ZY_DRUGORDER.every_quantity
  is '每次使用数量';
comment on column CDR_ZY_DRUGORDER.every_quantityunit
  is '每次使用数量单位';
comment on column CDR_ZY_DRUGORDER.speed
  is '滴速';
comment on column CDR_ZY_DRUGORDER.character
  is '医嘱费用性质类型 0,自备、1,嘱托、2外配、9常规';
comment on column CDR_ZY_DRUGORDER.clinic_path
  is '医嘱临床路径标志 0径内，2径外';
comment on column CDR_ZY_DRUGORDER.drug_purpose
  is '用药目的';
comment on column CDR_ZY_DRUGORDER.skin_test_resultno
  is '皮试记录号';
comment on column CDR_ZY_DRUGORDER.tcm_decocting_method
  is '中药煎煮法';
comment on column CDR_ZY_DRUGORDER.notices
  is '备注';
comment on column CDR_ZY_DRUGORDER.delete_flag
  is '修改标志 0：正常1：撤销';
comment on column CDR_ZY_DRUGORDER.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_DRUGORDER.days
  is '用药天数';







create table CDR_ZY_DRUGORDER_BF
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    patient_id              VARCHAR2(36),
    patient_name            VARCHAR2(20),
    visit_no                VARCHAR2(50),
    visit_times             NUMBER(3),
    inpatient_no            VARCHAR2(20),
    age                     VARCHAR2(30),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    bed_no                  VARCHAR2(10),
    list_unicode            VARCHAR2(30) not null,
    order_detailid          VARCHAR2(36),
    order_time_typecode     VARCHAR2(2),
    item_type               VARCHAR2(2),
    exec_statuscode         NUMBER(1),
    order_issuedate         DATE,
    order_issuerid          VARCHAR2(20),
    order_issuer            VARCHAR2(50),
    order_issuedepartmentid VARCHAR2(20),
    order_issuedepartment   VARCHAR2(50),
    order_content           VARCHAR2(200),
    exec_dept_code          VARCHAR2(10),
    exec_dept               VARCHAR2(50),
    order_reviewerid        VARCHAR2(20),
    order_reviewer          VARCHAR2(50),
    order_reviewdate        DATE,
    order_starttime         DATE,
    order_endtime           DATE,
    order_confirm_nursecode VARCHAR2(20),
    order_confirm_nurse     VARCHAR2(50),
    order_confirm_time      DATE,
    order_stop_doctorcode   VARCHAR2(20),
    order_stop_doctor       VARCHAR2(50),
    order_stop_doctortime   DATE,
    order_stop_nursecode    VARCHAR2(20),
    order_stop_nurse        VARCHAR2(50),
    order_stoptime          DATE,
    order_cancellerid       VARCHAR2(20),
    order_canceller         VARCHAR2(50),
    order_cancellertiem     DATE,
    order_illustration      VARCHAR2(500),
    order_sortno            NUMBER(8),
    parent_orderno          VARCHAR2(36),
    order_detailcode        VARCHAR2(36),
    order_detailname        VARCHAR2(256),
    drug_specification      VARCHAR2(180),
    dosage_formcode         VARCHAR2(20),
    drug_flag               NUMBER(3),
    batchno                 VARCHAR2(80),
    drug_instruction        VARCHAR2(600),
    drug_frequency_code     VARCHAR2(20),
    every_dosage            NUMBER(8,3),
    every_dosageunit        VARCHAR2(16),
    every_quantity          NUMBER(8,3),
    every_quantityunit      VARCHAR2(10),
    speed                   VARCHAR2(20),
    character               NUMBER(1),
    clinic_path             NUMBER(1),
    drug_purpose            VARCHAR2(100),
    skin_test_resultno      VARCHAR2(20),
    tcm_decocting_method    VARCHAR2(50),
    notices                 VARCHAR2(100),
    delete_flag             NUMBER(1),
    last_update_time        DATE,
    days                    NUMBER
);




















comment on column CDR_ZY_DRUGORDER_BF.group_code
  is '集团编码';
comment on column CDR_ZY_DRUGORDER_BF.organization_code
  is '组织编码';
comment on column CDR_ZY_DRUGORDER_BF.domain_id
  is '系统域标识';
comment on column CDR_ZY_DRUGORDER_BF.patient_id
  is '个人标识号';
comment on column CDR_ZY_DRUGORDER_BF.patient_name
  is '病人姓名';
comment on column CDR_ZY_DRUGORDER_BF.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_DRUGORDER_BF.visit_times
  is '就诊次数';
comment on column CDR_ZY_DRUGORDER_BF.inpatient_no
  is '住院号';
comment on column CDR_ZY_DRUGORDER_BF.age
  is '年龄';
comment on column CDR_ZY_DRUGORDER_BF.department_code
  is '病人所在科室编码';
comment on column CDR_ZY_DRUGORDER_BF.department
  is '病人所在科室';
comment on column CDR_ZY_DRUGORDER_BF.ward_code
  is '病人所在病区编码';
comment on column CDR_ZY_DRUGORDER_BF.ward
  is '病人所在病区';
comment on column CDR_ZY_DRUGORDER_BF.bed_no
  is '床位';
comment on column CDR_ZY_DRUGORDER_BF.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_DRUGORDER_BF.order_detailid
  is '医嘱明细ID';
comment on column CDR_ZY_DRUGORDER_BF.order_time_typecode
  is '医嘱时间类别代码 1长期、2临时，9其它，医嘱类别代码表';
comment on column CDR_ZY_DRUGORDER_BF.item_type
  is '诊疗项目类别编码 1:西药 2:中成药 3:中药饮片';
comment on column CDR_ZY_DRUGORDER_BF.exec_statuscode
  is '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废';
comment on column CDR_ZY_DRUGORDER_BF.order_issuedate
  is '医嘱开立时间';
comment on column CDR_ZY_DRUGORDER_BF.order_issuerid
  is '医嘱开立医生编码';
comment on column CDR_ZY_DRUGORDER_BF.order_issuer
  is '医嘱开立医生';
comment on column CDR_ZY_DRUGORDER_BF.order_issuedepartmentid
  is '医嘱开立科室编码';
comment on column CDR_ZY_DRUGORDER_BF.order_issuedepartment
  is '医嘱开立科室';
comment on column CDR_ZY_DRUGORDER_BF.order_content
  is '医嘱内容';
comment on column CDR_ZY_DRUGORDER_BF.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_DRUGORDER_BF.exec_dept
  is '执行科室';
comment on column CDR_ZY_DRUGORDER_BF.order_reviewerid
  is '医嘱审核医生编码';
comment on column CDR_ZY_DRUGORDER_BF.order_reviewer
  is '医嘱审核医生';
comment on column CDR_ZY_DRUGORDER_BF.order_reviewdate
  is '医嘱审核时间';
comment on column CDR_ZY_DRUGORDER_BF.order_starttime
  is '医嘱开始时间';
comment on column CDR_ZY_DRUGORDER_BF.order_endtime
  is '医嘱停止时间';
comment on column CDR_ZY_DRUGORDER_BF.order_confirm_nursecode
  is '医嘱确认护士编码';
comment on column CDR_ZY_DRUGORDER_BF.order_confirm_nurse
  is '医嘱确认护士';
comment on column CDR_ZY_DRUGORDER_BF.order_confirm_time
  is '医嘱确认时间';
comment on column CDR_ZY_DRUGORDER_BF.order_stop_doctorcode
  is '停嘱医生编号';
comment on column CDR_ZY_DRUGORDER_BF.order_stop_doctor
  is '停嘱医生';
comment on column CDR_ZY_DRUGORDER_BF.order_stop_doctortime
  is '医生停嘱时间';
comment on column CDR_ZY_DRUGORDER_BF.order_stop_nursecode
  is '确认停嘱护士编号';
comment on column CDR_ZY_DRUGORDER_BF.order_stop_nurse
  is '确认停嘱护士';
comment on column CDR_ZY_DRUGORDER_BF.order_stoptime
  is '护士确认停嘱时间';
comment on column CDR_ZY_DRUGORDER_BF.order_cancellerid
  is '医嘱作废医生编码';
comment on column CDR_ZY_DRUGORDER_BF.order_canceller
  is '医嘱作废医生';
comment on column CDR_ZY_DRUGORDER_BF.order_cancellertiem
  is '医嘱作废时间';
comment on column CDR_ZY_DRUGORDER_BF.order_illustration
  is '医嘱说明';
comment on column CDR_ZY_DRUGORDER_BF.order_sortno
  is '医嘱序号';
comment on column CDR_ZY_DRUGORDER_BF.parent_orderno
  is '父医嘱ID';
comment on column CDR_ZY_DRUGORDER_BF.order_detailcode
  is '医嘱项目代码';
comment on column CDR_ZY_DRUGORDER_BF.order_detailname
  is '医嘱项目名称';
comment on column CDR_ZY_DRUGORDER_BF.drug_specification
  is '药品规格';
comment on column CDR_ZY_DRUGORDER_BF.dosage_formcode
  is '药物剂型代码';
comment on column CDR_ZY_DRUGORDER_BF.drug_flag
  is '毒麻标志 0，非毒麻，1毒麻药品';
comment on column CDR_ZY_DRUGORDER_BF.batchno
  is '药品批次';
comment on column CDR_ZY_DRUGORDER_BF.drug_instruction
  is '医嘱用法';
comment on column CDR_ZY_DRUGORDER_BF.drug_frequency_code
  is '医嘱频率代码';
comment on column CDR_ZY_DRUGORDER_BF.every_dosage
  is '每次使用剂量';
comment on column CDR_ZY_DRUGORDER_BF.every_dosageunit
  is '每次使用剂量单位';
comment on column CDR_ZY_DRUGORDER_BF.every_quantity
  is '每次使用数量';
comment on column CDR_ZY_DRUGORDER_BF.every_quantityunit
  is '每次使用数量单位';
comment on column CDR_ZY_DRUGORDER_BF.speed
  is '滴速';
comment on column CDR_ZY_DRUGORDER_BF.character
  is '医嘱费用性质类型 0,自备、1,嘱托、2外配、9常规';
comment on column CDR_ZY_DRUGORDER_BF.clinic_path
  is '医嘱临床路径标志 0径内，2径外';
comment on column CDR_ZY_DRUGORDER_BF.drug_purpose
  is '用药目的';
comment on column CDR_ZY_DRUGORDER_BF.skin_test_resultno
  is '皮试记录号';
comment on column CDR_ZY_DRUGORDER_BF.tcm_decocting_method
  is '中药煎煮法';
comment on column CDR_ZY_DRUGORDER_BF.notices
  is '备注';
comment on column CDR_ZY_DRUGORDER_BF.delete_flag
  is '修改标志 0：正常1：撤销';
comment on column CDR_ZY_DRUGORDER_BF.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_DRUGORDER_BF.days
  is '用药天数';





create table CDR_ZY_DRUGORDER_RECORDS
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    patient_id              VARCHAR2(36),
    patient_name            VARCHAR2(20),
    visit_no                VARCHAR2(50),
    visit_times             NUMBER(3),
    inpatient_no            VARCHAR2(20),
    age                     VARCHAR2(30),
    department_code         VARCHAR2(20),
    department              VARCHAR2(50),
    ward_code               VARCHAR2(20),
    ward                    VARCHAR2(50),
    bed_no                  VARCHAR2(10),
    list_unicode            VARCHAR2(30) not null,
    order_detailid          VARCHAR2(36),
    order_time_typecode     VARCHAR2(2),
    item_type               VARCHAR2(2),
    exec_statuscode         NUMBER(1),
    order_issuedate         DATE,
    order_issuerid          VARCHAR2(20),
    order_issuer            VARCHAR2(50),
    order_issuedepartmentid VARCHAR2(20),
    order_issuedepartment   VARCHAR2(50),
    order_content           VARCHAR2(200),
    exec_dept_code          VARCHAR2(10),
    exec_dept               VARCHAR2(50),
    order_reviewerid        VARCHAR2(20),
    order_reviewer          VARCHAR2(50),
    order_reviewdate        DATE,
    order_starttime         DATE,
    order_endtime           DATE,
    order_confirm_nursecode VARCHAR2(20),
    order_confirm_nurse     VARCHAR2(50),
    order_confirm_time      DATE,
    order_stop_doctorcode   VARCHAR2(20),
    order_stop_doctor       VARCHAR2(50),
    order_stop_doctortime   DATE,
    order_stop_nursecode    VARCHAR2(20),
    order_stop_nurse        VARCHAR2(50),
    order_stoptime          DATE,
    order_cancellerid       VARCHAR2(20),
    order_canceller         VARCHAR2(50),
    order_cancellertiem     DATE,
    order_illustration      VARCHAR2(500),
    order_sortno            NUMBER(8),
    parent_orderno          VARCHAR2(36),
    order_detailcode        VARCHAR2(36),
    order_detailname        VARCHAR2(256),
    drug_specification      VARCHAR2(180),
    dosage_formcode         VARCHAR2(20),
    drug_flag               NUMBER(3),
    batchno                 VARCHAR2(500),
    drug_instruction        VARCHAR2(600),
    drug_frequency_code     VARCHAR2(20),
    every_dosage            NUMBER(8,3),
    every_dosageunit        VARCHAR2(16),
    every_quantity          NUMBER(8,3),
    every_quantityunit      VARCHAR2(10),
    speed                   VARCHAR2(20),
    character               NUMBER(1),
    clinic_path             NUMBER(1),
    drug_purpose            VARCHAR2(150),
    skin_test_resultno      VARCHAR2(20),
    tcm_decocting_method    VARCHAR2(50),
    notices                 VARCHAR2(100),
    delete_flag             NUMBER(1),
    last_update_time        DATE,
    days                    NUMBER
)
 ;





create table CDR_ZY_MEDICAL_PLAN
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    inpatient_no      VARCHAR2(20),
    order_detailid    VARCHAR2(36),
    list_unicode      VARCHAR2(30) not null,
    record_id         VARCHAR2(20),
    plan_exec_time    DATE,
    real_exec_time    DATE,
    drug_exec         NUMBER(8,3),
    qty_unit          VARCHAR2(20),
    exec_status       NUMBER(1),
    exec_opera_code   VARCHAR2(20),
    exec_opera        VARCHAR2(50),
    exec_dept_code    VARCHAR2(20),
    exec_dept         VARCHAR2(50),
    exec_wardcode     VARCHAR2(20),
    exec_ward         VARCHAR2(50),
    p_bar_code        VARCHAR2(20),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    charge_status     VARCHAR2(20)
);


comment on column CDR_ZY_MEDICAL_PLAN.group_code
  is '集团编码';
comment on column CDR_ZY_MEDICAL_PLAN.organization_code
  is '组织编码';
comment on column CDR_ZY_MEDICAL_PLAN.domain_id
  is '系统域标识';
comment on column CDR_ZY_MEDICAL_PLAN.patient_id
  is '个人标识号';
comment on column CDR_ZY_MEDICAL_PLAN.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_MEDICAL_PLAN.visit_times
  is '就诊次数';
comment on column CDR_ZY_MEDICAL_PLAN.patient_name
  is '患者姓名';
comment on column CDR_ZY_MEDICAL_PLAN.age
  is '年龄';
comment on column CDR_ZY_MEDICAL_PLAN.inpatient_no
  is '住院号';
comment on column CDR_ZY_MEDICAL_PLAN.order_detailid
  is '医嘱ID';
comment on column CDR_ZY_MEDICAL_PLAN.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_MEDICAL_PLAN.record_id
  is '执行记录ID';
comment on column CDR_ZY_MEDICAL_PLAN.plan_exec_time
  is '计划执行时间';
comment on column CDR_ZY_MEDICAL_PLAN.real_exec_time
  is '实际执行时间';
comment on column CDR_ZY_MEDICAL_PLAN.drug_exec
  is '用量';
comment on column CDR_ZY_MEDICAL_PLAN.qty_unit
  is '用量单位';
comment on column CDR_ZY_MEDICAL_PLAN.exec_status
  is '执行状态 0未执行,1已执行,2已撤销,3已暂停，4执行中';
comment on column CDR_ZY_MEDICAL_PLAN.exec_opera_code
  is '执行人编码';
comment on column CDR_ZY_MEDICAL_PLAN.exec_opera
  is '执行人';
comment on column CDR_ZY_MEDICAL_PLAN.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_MEDICAL_PLAN.exec_dept
  is '执行科室';
comment on column CDR_ZY_MEDICAL_PLAN.exec_wardcode
  is '执行病区编码';
comment on column CDR_ZY_MEDICAL_PLAN.exec_ward
  is '执行病区';
comment on column CDR_ZY_MEDICAL_PLAN.p_bar_code
  is '条形码';
comment on column CDR_ZY_MEDICAL_PLAN.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_ZY_MEDICAL_PLAN.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_MEDICAL_PLAN.charge_status
  is '费用状态 0执行单转计费 1执行销账';




create table CDR_ZY_MEDICAL_PLAN_BACKUP
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    inpatient_no      VARCHAR2(20),
    order_detailid    VARCHAR2(36),
    list_unicode      VARCHAR2(30) not null,
    record_id         VARCHAR2(20),
    plan_exec_time    DATE,
    real_exec_time    DATE,
    drug_exec         NUMBER(8,3),
    qty_unit          VARCHAR2(10),
    exec_status       NUMBER(1),
    exec_opera_code   VARCHAR2(20),
    exec_opera        VARCHAR2(50),
    exec_dept_code    VARCHAR2(20),
    exec_dept         VARCHAR2(50),
    exec_wardcode     VARCHAR2(20),
    exec_ward         VARCHAR2(50),
    p_bar_code        VARCHAR2(20),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    charge_status     VARCHAR2(20)
);




















comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.group_code
  is '集团编码';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.organization_code
  is '组织编码';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.domain_id
  is '系统域标识';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.patient_id
  is '个人标识号';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.visit_times
  is '就诊次数';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.patient_name
  is '患者姓名';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.age
  is '年龄';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.inpatient_no
  is '住院号';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.order_detailid
  is '医嘱ID';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.record_id
  is '执行记录ID';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.plan_exec_time
  is '计划执行时间';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.real_exec_time
  is '实际执行时间';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.drug_exec
  is '用量';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.qty_unit
  is '用量单位';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_status
  is '执行状态 0未执行,1已执行,2已撤销,3已暂停，4执行中';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_opera_code
  is '执行人编码';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_opera
  is '执行人';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_dept
  is '执行科室';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_wardcode
  is '执行病区编码';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.exec_ward
  is '执行病区';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.p_bar_code
  is '条形码';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_MEDICAL_PLAN_BACKUP.charge_status
  is '费用状态 0执行单转计费 1执行销账';





create table CDR_ZY_MEDICAL_PLAN_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    patient_id        VARCHAR2(36),
    visit_no          VARCHAR2(50),
    visit_times       NUMBER(3),
    patient_name      VARCHAR2(20),
    age               VARCHAR2(30),
    inpatient_no      VARCHAR2(20),
    order_detailid    VARCHAR2(36),
    list_unicode      VARCHAR2(30) not null,
    record_id         VARCHAR2(20),
    plan_exec_time    DATE,
    real_exec_time    DATE,
    drug_exec         NUMBER(8,3),
    qty_unit          VARCHAR2(20),
    exec_status       NUMBER(1),
    exec_opera_code   VARCHAR2(20),
    exec_opera        VARCHAR2(50),
    exec_dept_code    VARCHAR2(20),
    exec_dept         VARCHAR2(50),
    exec_wardcode     VARCHAR2(20),
    exec_ward         VARCHAR2(50),
    p_bar_code        VARCHAR2(20),
    delete_flag       NUMBER(1),
    last_update_time  DATE,
    charge_status     VARCHAR2(20)
)
 ;





create table CDR_ZY_OTHERORDER
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    patient_id                 VARCHAR2(36),
    patient_name               VARCHAR2(20),
    age                        VARCHAR2(30),
    visit_no                   VARCHAR2(50),
    visit_times                NUMBER(3),
    inpatient_no               VARCHAR2(20),
    department_code            VARCHAR2(20),
    department                 VARCHAR2(50),
    ward_code                  VARCHAR2(20),
    ward                       VARCHAR2(50),
    bed_no                     VARCHAR2(10),
    list_unicode               VARCHAR2(30) not null,
    order_detailid             VARCHAR2(36),
    order_time_typecode        VARCHAR2(2),
    item_type                  VARCHAR2(2),
    order_creattime            DATE,
    order_doctorcode           VARCHAR2(20),
    order_doctor               VARCHAR2(50),
    order_deptcode             VARCHAR2(20),
    order_dept                 VARCHAR2(50),
    order_reviewerid           VARCHAR2(20),
    order_reviewer             VARCHAR2(50),
    order_reviewdate           DATE,
    order_starttime            DATE,
    order_endtime              DATE,
    order_confirm_nursecode    VARCHAR2(36),
    order_confirm_nurse        VARCHAR2(50),
    order_confirmtime          DATE,
    order_stop_doctorcode      VARCHAR2(36),
    order_stop_doctor          VARCHAR2(50),
    order_stop_doctortime      DATE,
    order_stop_nursecode       VARCHAR2(36),
    order_stop_nurse           VARCHAR2(50),
    order_stoptime             DATE,
    order_cancellerid          VARCHAR2(5),
    order_canceller            VARCHAR2(50),
    doctoradvice_cancellertiem DATE,
    exec_statuscode            VARCHAR2(20),
    exec_dept_code             VARCHAR2(20),
    exec_dept                  VARCHAR2(50),
    order_illustration         VARCHAR2(500),
    order_detailcode           VARCHAR2(36),
    order_detailname           VARCHAR2(256),
    execution_frequency        VARCHAR2(72),
    character                  NUMBER(1),
    clinic_path                NUMBER(1),
    notices                    VARCHAR2(1024),
    batchno                    VARCHAR2(20),
    delete_flag                NUMBER(1),
    last_update_time           DATE,
    days                       NUMBER,
    every_quantity             VARCHAR2(5),
    every_quantityunit         VARCHAR2(20),
    order_comment              VARCHAR2(50)
);




















comment on column CDR_ZY_OTHERORDER.group_code
  is '集团编码';
comment on column CDR_ZY_OTHERORDER.organization_code
  is '组织编码';
comment on column CDR_ZY_OTHERORDER.domain_id
  is '系统域标识';
comment on column CDR_ZY_OTHERORDER.patient_id
  is '个人标识号';
comment on column CDR_ZY_OTHERORDER.patient_name
  is '病人姓名';
comment on column CDR_ZY_OTHERORDER.age
  is '年龄';
comment on column CDR_ZY_OTHERORDER.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_OTHERORDER.visit_times
  is '就诊次数';
comment on column CDR_ZY_OTHERORDER.inpatient_no
  is '住院号';
comment on column CDR_ZY_OTHERORDER.department_code
  is '病人所在科室编码';
comment on column CDR_ZY_OTHERORDER.department
  is '病人所在科室';
comment on column CDR_ZY_OTHERORDER.ward_code
  is '病人所在病区编码';
comment on column CDR_ZY_OTHERORDER.ward
  is '病人所在病区';
comment on column CDR_ZY_OTHERORDER.bed_no
  is '床位';
comment on column CDR_ZY_OTHERORDER.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_OTHERORDER.order_detailid
  is '医嘱明细ID';
comment on column CDR_ZY_OTHERORDER.order_time_typecode
  is '医嘱时间类别代码 1长期、2临时，9其它';
comment on column CDR_ZY_OTHERORDER.item_type
  is '诊疗项目类别编码 04:卫生材料05:检验06:检查07:手术08:护理09:床位10:治疗11:麻醉12:输血13:输氧99:其他';
comment on column CDR_ZY_OTHERORDER.order_creattime
  is '医嘱开立时间';
comment on column CDR_ZY_OTHERORDER.order_doctorcode
  is '医嘱开立医生编码';
comment on column CDR_ZY_OTHERORDER.order_doctor
  is '医嘱开立医生';
comment on column CDR_ZY_OTHERORDER.order_deptcode
  is '医嘱开立科室编码';
comment on column CDR_ZY_OTHERORDER.order_dept
  is '医嘱开立科室';
comment on column CDR_ZY_OTHERORDER.order_reviewerid
  is '医嘱审核医生编码';
comment on column CDR_ZY_OTHERORDER.order_reviewer
  is '医嘱审核医生';
comment on column CDR_ZY_OTHERORDER.order_reviewdate
  is '医嘱审核时间';
comment on column CDR_ZY_OTHERORDER.order_starttime
  is '医嘱开始时间';
comment on column CDR_ZY_OTHERORDER.order_endtime
  is '医嘱停止时间';
comment on column CDR_ZY_OTHERORDER.order_confirm_nursecode
  is '医嘱确认护士编号';
comment on column CDR_ZY_OTHERORDER.order_confirm_nurse
  is '医嘱确认护士';
comment on column CDR_ZY_OTHERORDER.order_confirmtime
  is '医嘱确认时间';
comment on column CDR_ZY_OTHERORDER.order_stop_doctorcode
  is '停嘱医生编号';
comment on column CDR_ZY_OTHERORDER.order_stop_doctor
  is '停嘱医生';
comment on column CDR_ZY_OTHERORDER.order_stop_doctortime
  is '医生停嘱时间';
comment on column CDR_ZY_OTHERORDER.order_stop_nursecode
  is '确认停嘱护士编号';
comment on column CDR_ZY_OTHERORDER.order_stop_nurse
  is '确认停嘱护士';
comment on column CDR_ZY_OTHERORDER.order_stoptime
  is '护士确认停嘱时间';
comment on column CDR_ZY_OTHERORDER.order_cancellerid
  is '医嘱作废医生编码';
comment on column CDR_ZY_OTHERORDER.order_canceller
  is '医嘱作废医生';
comment on column CDR_ZY_OTHERORDER.doctoradvice_cancellertiem
  is '医嘱作废时间';
comment on column CDR_ZY_OTHERORDER.exec_statuscode
  is '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废';
comment on column CDR_ZY_OTHERORDER.exec_dept_code
  is '执行科室编码';
comment on column CDR_ZY_OTHERORDER.exec_dept
  is '执行科室';
comment on column CDR_ZY_OTHERORDER.order_illustration
  is '医嘱说明';
comment on column CDR_ZY_OTHERORDER.order_detailcode
  is '医嘱项目代码';
comment on column CDR_ZY_OTHERORDER.order_detailname
  is '医嘱项目名称';
comment on column CDR_ZY_OTHERORDER.execution_frequency
  is '执行频率代码';
comment on column CDR_ZY_OTHERORDER.character
  is '医嘱费用性质类型 0,自备、1,嘱托、2外配';
comment on column CDR_ZY_OTHERORDER.clinic_path
  is '医嘱临床路径标志 0径内，2径外';
comment on column CDR_ZY_OTHERORDER.notices
  is '备注';
comment on column CDR_ZY_OTHERORDER.batchno
  is '卫材批次';
comment on column CDR_ZY_OTHERORDER.delete_flag
  is '修改标志 0：正常1：撤销';
comment on column CDR_ZY_OTHERORDER.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_OTHERORDER.days
  is '用药天数';
comment on column CDR_ZY_OTHERORDER.every_quantity
  is '每次使用数量';
comment on column CDR_ZY_OTHERORDER.every_quantityunit
  is '每次使用数量单位';
comment on column CDR_ZY_OTHERORDER.order_comment
  is '执行时间方案';






create table CDR_ZY_OTHERORDER_BF
(
    group_code                 VARCHAR2(20),
    organization_code          VARCHAR2(20),
    domain_id                  VARCHAR2(2),
    patient_id                 VARCHAR2(36),
    patient_name               VARCHAR2(20),
    age                        VARCHAR2(30),
    visit_no                   VARCHAR2(50),
    visit_times                NUMBER(3),
    inpatient_no               VARCHAR2(20),
    department_code            VARCHAR2(20),
    department                 VARCHAR2(50),
    ward_code                  VARCHAR2(20),
    ward                       VARCHAR2(50),
    bed_no                     VARCHAR2(10),
    list_unicode               VARCHAR2(30) not null,
    order_detailid             VARCHAR2(36),
    order_time_typecode        VARCHAR2(2),
    item_type                  VARCHAR2(2),
    order_creattime            DATE,
    order_doctorcode           VARCHAR2(20),
    order_doctor               VARCHAR2(50),
    order_deptcode             VARCHAR2(20),
    order_dept                 VARCHAR2(50),
    order_reviewerid           VARCHAR2(20),
    order_reviewer             VARCHAR2(50),
    order_reviewdate           DATE,
    order_starttime            DATE,
    order_endtime              DATE,
    order_confirm_nursecode    VARCHAR2(36),
    order_confirm_nurse        VARCHAR2(50),
    order_confirmtime          DATE,
    order_stop_doctorcode      VARCHAR2(36),
    order_stop_doctor          VARCHAR2(50),
    order_stop_doctortime      DATE,
    order_stop_nursecode       VARCHAR2(36),
    order_stop_nurse           VARCHAR2(50),
    order_stoptime             DATE,
    order_cancellerid          VARCHAR2(5),
    order_canceller            VARCHAR2(50),
    doctoradvice_cancellertiem DATE,
    exec_statuscode            VARCHAR2(20),
    exec_dept_code             VARCHAR2(20),
    exec_dept                  VARCHAR2(50),
    order_illustration         VARCHAR2(500),
    order_detailcode           VARCHAR2(36),
    order_detailname           VARCHAR2(256),
    execution_frequency        VARCHAR2(72),
    character                  NUMBER(1),
    clinic_path                NUMBER(1),
    notices                    VARCHAR2(1024),
    batchno                    VARCHAR2(20),
    delete_flag                NUMBER(1),
    last_update_time           DATE,
    days                       NUMBER,
    every_quantity             VARCHAR2(5),
    every_quantityunit         VARCHAR2(20)
)
 ;





create table CDR_ZY_PADVANCEPAYMENT_DETAIL
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    patient_id        VARCHAR2(36),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(36),
    inpatient_no      VARCHAR2(20),
    patient_name      VARCHAR2(36),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    payment_money     NUMBER(12,4),
    charge_status     NUMBER(1),
    trans_no          VARCHAR2(20),
    receipt_no        VARCHAR2(20),
    payment_code      VARCHAR2(20),
    operator_code     VARCHAR2(20),
    operator          VARCHAR2(50),
    charge_time       DATE,
    delete_flag       NUMBER(1),
    delete_unicode    VARCHAR2(50),
    last_update_time  DATE
)
 ;
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.age
  is '年龄';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.department_code
  is '病人所在科室编码';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.department
  is '病人所在科室';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.ward_code
  is '病人所在病区编码';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.ward
  is '病人所在病区';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.payment_money
  is '预交金额';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.charge_status
  is '预交状态 1、收款，2、退款，3、冲账';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.trans_no
  is '交易流水号';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.receipt_no
  is '单据号';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.payment_code
  is '付款方式编码 01：现金02：支票03：汇款存款04：内部转账05：单位记账06：账户金07：统筹金08：银行卡09：微信10：支付宝11：银联99：其他';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.operator_code
  is '收费员编码';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.operator
  is '收费员';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.charge_time
  is '收款时间';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.delete_unicode
  is '被退预交金记录ID';
comment on column CDR_ZY_PADVANCEPAYMENT_DETAIL.last_update_time
  is '最后修改时间';





create table CDR_ZY_PADVANCEPAYMENT_DETAIL_RECORDS
(
    group_code        VARCHAR2(20),
    organization_code VARCHAR2(20),
    domain_id         VARCHAR2(2),
    unicode           VARCHAR2(30) not null,
    patient_id        VARCHAR2(36),
    visit_times       NUMBER(3),
    visit_no          VARCHAR2(36),
    inpatient_no      VARCHAR2(20),
    patient_name      VARCHAR2(36),
    age               VARCHAR2(30),
    department_code   VARCHAR2(20),
    department        VARCHAR2(50),
    ward_code         VARCHAR2(20),
    ward              VARCHAR2(50),
    payment_money     NUMBER(12,4),
    charge_status     NUMBER(1),
    trans_no          VARCHAR2(20),
    receipt_no        VARCHAR2(20),
    payment_code      VARCHAR2(20),
    operator_code     VARCHAR2(20),
    operator          VARCHAR2(50),
    charge_time       DATE,
    delete_flag       NUMBER(1),
    delete_unicode    VARCHAR2(50),
    last_update_time  DATE
)
 ;





create table CDR_ZY_PAYMENT_DETAIL
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    visit_no             VARCHAR2(36),
    visit_times          NUMBER(3),
    patient_id           VARCHAR2(36),
    patient_name         VARCHAR2(20),
    age                  VARCHAR2(30),
    settle_recordid      VARCHAR2(36),
    settle_status        NUMBER(1),
    list_unicode         VARCHAR2(30) not null,
    payment_id           VARCHAR2(36),
    payment_way          VARCHAR2(2),
    payment_money        NUMBER(12,4),
    settle_time          DATE,
    settlement_clerkcode VARCHAR2(20),
    settlement_clerk     VARCHAR2(50),
    payment_serialno     VARCHAR2(100),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    last_update_time     DATE,
    payment_name         VARCHAR2(36)
);




















comment on column CDR_ZY_PAYMENT_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_PAYMENT_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_PAYMENT_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_PAYMENT_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_PAYMENT_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_PAYMENT_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_PAYMENT_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_PAYMENT_DETAIL.age
  is '年龄';
comment on column CDR_ZY_PAYMENT_DETAIL.settle_recordid
  is '结算记录ID';
comment on column CDR_ZY_PAYMENT_DETAIL.settle_status
  is '记录收费状态';
comment on column CDR_ZY_PAYMENT_DETAIL.list_unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_PAYMENT_DETAIL.payment_id
  is '支付方式记录ID';
comment on column CDR_ZY_PAYMENT_DETAIL.payment_way
  is '支付方式代码 01：现金02：支票03：汇款存款04：内部转账05：单位记账06：账户金07：统筹金08：银行卡09：微信10：支付宝11：银联99：其他';
comment on column CDR_ZY_PAYMENT_DETAIL.payment_money
  is '支付金额';
comment on column CDR_ZY_PAYMENT_DETAIL.settle_time
  is '费用结算时间';
comment on column CDR_ZY_PAYMENT_DETAIL.settlement_clerkcode
  is '结算人员编号';
comment on column CDR_ZY_PAYMENT_DETAIL.settlement_clerk
  is '结算人员';
comment on column CDR_ZY_PAYMENT_DETAIL.payment_serialno
  is '支付流水号';
comment on column CDR_ZY_PAYMENT_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：取消结算';
comment on column CDR_ZY_PAYMENT_DETAIL.delete_unicode
  is '对应被取消结算的支付记录ID';
comment on column CDR_ZY_PAYMENT_DETAIL.last_update_time
  is '最后修改时间';
comment on column CDR_ZY_PAYMENT_DETAIL.payment_name
  is '支付方式名称';




create table CDR_ZY_PAYMENT_DETAIL_BAK
(
    group_code           CHAR(2),
    organization_code    CHAR(3),
    domain_id            CHAR(2),
    visit_no             VARCHAR2(81),
    visit_times          NUMBER(5) not null,
    patient_id           NUMBER(18),
    patient_name         VARCHAR2(300),
    age                  VARCHAR2(60),
    settle_recordid      NUMBER(18) not null,
    settle_status        CHAR(1),
    list_unicode         NUMBER(18) not null,
    payment_id           NUMBER(18) not null,
    payment_way          CHAR(2),
    payment_money        NUMBER,
    settle_time          VARCHAR2(19),
    settlement_clerkcode NUMBER,
    settlement_clerk     VARCHAR2(60),
    payment_serialno     NUMBER(18) not null,
    delete_flag          CHAR(1)
)
 ;





create table CDR_ZY_PAYMENT_DETAIL_RECORDS
(
    group_code           VARCHAR2(20),
    organization_code    VARCHAR2(20),
    domain_id            VARCHAR2(2),
    visit_no             VARCHAR2(36),
    visit_times          NUMBER(3),
    patient_id           VARCHAR2(36),
    patient_name         VARCHAR2(20),
    age                  VARCHAR2(30),
    settle_recordid      VARCHAR2(36),
    settle_status        NUMBER(1),
    list_unicode         VARCHAR2(30) not null,
    payment_id           VARCHAR2(36),
    payment_way          VARCHAR2(2),
    payment_money        NUMBER(12,4),
    settle_time          DATE,
    settlement_clerkcode VARCHAR2(20),
    settlement_clerk     VARCHAR2(50),
    payment_serialno     VARCHAR2(100),
    delete_flag          NUMBER(1),
    delete_unicode       VARCHAR2(50),
    last_update_time     DATE,
    payment_name         VARCHAR2(36)
)  ;





create table CDR_ZY_SETTLE_CZ_DETAIL
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    visit_no                VARCHAR2(36),
    inpatient_no            VARCHAR2(20),
    visit_times             NUMBER(3),
    patient_id              VARCHAR2(36),
    patient_name            VARCHAR2(20),
    age                     VARCHAR2(30),
    out_hospital_date       DATE,
    settle_recordid         VARCHAR2(36),
    settle_status           NUMBER(1),
    settle_receiptno        VARCHAR2(200),
    settle_scene            NUMBER(1),
    settle_time             DATE,
    medical_payment_method  VARCHAR2(2),
    settle_total_money      NUMBER(12,4),
    personal_expenses       NUMBER(10,2),
    settlement_clerkcode    VARCHAR2(20),
    settlement_clerk        VARCHAR2(50),
    receipt_time            DATE,
    print_code              VARCHAR2(10),
    printer                 VARCHAR2(50),
    electronic_invoice      VARCHAR2(20),
    insurance_personal_code VARCHAR2(20),
    insurance_code          VARCHAR2(20),
    ybtcqbm                 VARCHAR2(20),
    trade_no                VARCHAR2(20),
    delete_flag             NUMBER(1),
    delete_unicode          VARCHAR2(50),
    last_update_time        DATE
);




















comment on column CDR_ZY_SETTLE_CZ_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.age
  is '年龄';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.out_hospital_date
  is '出院时间';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settle_recordid
  is '结算记录ID';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settle_status
  is '记录收费状态';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settle_receiptno
  is '结算发票号';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settle_scene
  is '结算场景代码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settle_time
  is '费用结算时间';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.medical_payment_method
  is '医疗付费方式代码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settle_total_money
  is '费用结算总金额';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.personal_expenses
  is '个人承担费用金额';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settlement_clerkcode
  is '结算人员编号';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.settlement_clerk
  is '结算人员';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.receipt_time
  is '开票时间';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.print_code
  is '开票人编码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.printer
  is '开票人';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.electronic_invoice
  is '电子发票代码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.insurance_personal_code
  is '医保个人编码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.insurance_code
  is '医保就诊编码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.ybtcqbm
  is '医保统筹区编码';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.trade_no
  is '医保交易流水号';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.delete_flag
  is '修改标志';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.delete_unicode
  is '对应被取消结算ID';
comment on column CDR_ZY_SETTLE_CZ_DETAIL.last_update_time
  is '最后修改时间';





create table CDR_ZY_SETTLE_DETAIL
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    visit_no                VARCHAR2(36),
    inpatient_no            VARCHAR2(20),
    visit_times             NUMBER(3),
    patient_id              VARCHAR2(36),
    patient_name            VARCHAR2(20),
    age                     VARCHAR2(30),
    out_hospital_date       DATE,
    settle_recordid         VARCHAR2(36),
    settle_status           NUMBER(1),
    settle_receiptno        VARCHAR2(200),
    settle_scene            NUMBER(1),
    settle_time             DATE,
    medical_payment_method  VARCHAR2(2),
    settle_total_money      NUMBER(12,4),
    personal_expenses       NUMBER(10,2),
    settlement_clerkcode    VARCHAR2(20),
    settlement_clerk        VARCHAR2(50),
    receipt_time            DATE,
    print_code              VARCHAR2(10),
    printer                 VARCHAR2(50),
    electronic_invoice      VARCHAR2(20),
    insurance_personal_code VARCHAR2(50),
    insurance_code          VARCHAR2(20),
    ybtcqbm                 VARCHAR2(20),
    trade_no                VARCHAR2(40),
    delete_flag             NUMBER(1),
    delete_unicode          VARCHAR2(50),
    last_update_time        DATE
);




















comment on column CDR_ZY_SETTLE_DETAIL.group_code
  is '集团编码';
comment on column CDR_ZY_SETTLE_DETAIL.organization_code
  is '组织编码';
comment on column CDR_ZY_SETTLE_DETAIL.domain_id
  is '系统域标识';
comment on column CDR_ZY_SETTLE_DETAIL.unicode
  is '数据记录主键，作为数据记录唯一行';
comment on column CDR_ZY_SETTLE_DETAIL.visit_no
  is '住院就诊流水号';
comment on column CDR_ZY_SETTLE_DETAIL.inpatient_no
  is '住院号';
comment on column CDR_ZY_SETTLE_DETAIL.visit_times
  is '就诊次数';
comment on column CDR_ZY_SETTLE_DETAIL.patient_id
  is '个人标识号';
comment on column CDR_ZY_SETTLE_DETAIL.patient_name
  is '患者姓名';
comment on column CDR_ZY_SETTLE_DETAIL.age
  is '年龄';
comment on column CDR_ZY_SETTLE_DETAIL.out_hospital_date
  is '出院时间';
comment on column CDR_ZY_SETTLE_DETAIL.settle_recordid
  is '结算记录ID';
comment on column CDR_ZY_SETTLE_DETAIL.settle_status
  is '记录收费状态 1：收费；2：退费';
comment on column CDR_ZY_SETTLE_DETAIL.settle_receiptno
  is '结算发票号';
comment on column CDR_ZY_SETTLE_DETAIL.settle_scene
  is '结算场景代码 1：住院中途结算；2：住院出院结算';
comment on column CDR_ZY_SETTLE_DETAIL.settle_time
  is '费用结算时间';
comment on column CDR_ZY_SETTLE_DETAIL.medical_payment_method
  is '医疗付费方式代码';
comment on column CDR_ZY_SETTLE_DETAIL.settle_total_money
  is '费用结算总金额';
comment on column CDR_ZY_SETTLE_DETAIL.personal_expenses
  is '个人承担费用金额';
comment on column CDR_ZY_SETTLE_DETAIL.settlement_clerkcode
  is '结算人员编号';
comment on column CDR_ZY_SETTLE_DETAIL.settlement_clerk
  is '结算人员';
comment on column CDR_ZY_SETTLE_DETAIL.receipt_time
  is '开票时间';
comment on column CDR_ZY_SETTLE_DETAIL.print_code
  is '开票人编码';
comment on column CDR_ZY_SETTLE_DETAIL.printer
  is '开票人';
comment on column CDR_ZY_SETTLE_DETAIL.electronic_invoice
  is '电子发票代码';
comment on column CDR_ZY_SETTLE_DETAIL.insurance_personal_code
  is '医保个人编码';
comment on column CDR_ZY_SETTLE_DETAIL.insurance_code
  is '医保就诊编码';
comment on column CDR_ZY_SETTLE_DETAIL.ybtcqbm
  is '医保统筹区编码';
comment on column CDR_ZY_SETTLE_DETAIL.trade_no
  is '医保交易流水号';
comment on column CDR_ZY_SETTLE_DETAIL.delete_flag
  is '修改标志 0：正常（选填默认）1：撤销';
comment on column CDR_ZY_SETTLE_DETAIL.delete_unicode
  is '对应被取消结算ID';
comment on column CDR_ZY_SETTLE_DETAIL.last_update_time
  is '最后修改时间';





create table CDR_ZY_SETTLE_DETAIL_RECORDS
(
    group_code              VARCHAR2(20),
    organization_code       VARCHAR2(20),
    domain_id               VARCHAR2(2),
    unicode                 VARCHAR2(30) not null,
    visit_no                VARCHAR2(36),
    inpatient_no            VARCHAR2(20),
    visit_times             NUMBER(3),
    patient_id              VARCHAR2(36),
    patient_name            VARCHAR2(20),
    age                     VARCHAR2(30),
    out_hospital_date       DATE,
    settle_recordid         VARCHAR2(36),
    settle_status           NUMBER(1),
    settle_receiptno        VARCHAR2(200),
    settle_scene            NUMBER(1),
    settle_time             DATE,
    medical_payment_method  VARCHAR2(2),
    settle_total_money      NUMBER(12,4),
    personal_expenses       NUMBER(10,2),
    settlement_clerkcode    VARCHAR2(20),
    settlement_clerk        VARCHAR2(50),
    receipt_time            DATE,
    print_code              VARCHAR2(10),
    printer                 VARCHAR2(50),
    electronic_invoice      VARCHAR2(20),
    insurance_personal_code VARCHAR2(50),
    insurance_code          VARCHAR2(20),
    ybtcqbm                 VARCHAR2(20),
    trade_no                VARCHAR2(40),
    delete_flag             NUMBER(1),
    delete_unicode          VARCHAR2(50),
    last_update_time        DATE
)
 ;

