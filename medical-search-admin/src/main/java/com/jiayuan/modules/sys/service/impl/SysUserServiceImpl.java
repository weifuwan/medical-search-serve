
package com.jiayuan.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jiayuan.common.cache.SysConfigCache;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.constant.SysConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.modules.security.password.PasswordUtils;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sso.service.SsoService;
import com.jiayuan.modules.sys.dao.SysUserDao;
import com.jiayuan.modules.sys.dto.PasswordDTO;
import com.jiayuan.modules.sys.dto.SysUserDTO;
import com.jiayuan.modules.sys.dto.SysUserRoleDTO;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import com.jiayuan.modules.sys.entity.SysUserRoleEntity;
import com.jiayuan.modules.sys.enums.SuperAdminEnum;
import com.jiayuan.modules.sys.service.SysUserRoleService;
import com.jiayuan.modules.sys.service.SysUserService;
import com.jiayuan.modules.task.dto.Person;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;


/**
 * @Title: SysUserServiceImpl
 * @Package: com.jiayuan.modules.sys.service.impl
 * @Description: 系统用户
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-25
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class SysUserServiceImpl extends CrudServiceImpl<SysUserDao, SysUserEntity, SysUserDTO> implements SysUserService {
    @Resource
    private SysUserRoleService sysUserRoleService;
    private final CustomConfig customConfig;

    private final SsoService ssoService;

    @Override
    public QueryWrapper<SysUserEntity> getWrapper(Map<String, Object> params) {
        String username = (String) params.get("username");
        String gender = (String) params.get("gender");
        String realName = (String) params.get("realName");
        String startDate = (String) params.get(Constant.START_DATE);
        String endDate = (String) params.get(Constant.END_DATE);
        String userStatus = (String) params.get("userStatus");

        String loginId = (String) params.get("loginId");
        String mobile = (String) params.get("mobile");


        QueryWrapper<SysUserEntity> wrapper = new QueryWrapper<>();

        // 仅当 userStatus 不为空时，添加过滤条件
        if (StrUtil.isNotBlank(userStatus)) {
            wrapper.eq("user_status", userStatus);
        } else {
            wrapper.eq("user_status", true);
        }

        if (StrUtil.isNotBlank(loginId)) {
            wrapper.eq(StrUtil.isNotBlank(loginId), "login_id", mobile);
        }

        if (StrUtil.isNotBlank(mobile)) {
            wrapper.eq(StrUtil.isNotBlank(mobile), "mobile", mobile);
        }

        wrapper.like(StrUtil.isNotBlank(username), "user_name", username)
                .like(StrUtil.isNotBlank(realName), "user_name", realName)
                .apply(StrUtil.isNotBlank(startDate),
                        "create_time >= TO_DATE('" + startDate + "', 'YYYY-MM-DD HH24:MI:SS')")
                .apply(StrUtil.isNotBlank(endDate),
                        "create_time < TO_DATE('" + endDate + "', 'YYYY-MM-DD HH24:MI:SS')")
                .eq(StrUtil.isNotBlank(gender), "gender", gender);

        return wrapper;
    }


    //    @Override
//    public PageData<SysUserDTO> pageOfUser(Map<String, Object> params) {
//        Page<SysUserEntity> iPage = (Page) getPage(params, null, false);
////        iPage.addOrder(OrderItem.desc("status"));
//        iPage.addOrder(OrderItem.desc("create_time"));
//        IPage<SysUserEntity> page = baseDao.selectPage(
//                iPage,
//                getWrapper(params).eq("SYS_ID", "CBDSES")
//        );
//
//        PageData<SysUserDTO> pages = getPageData(page, SysUserDTO.class);
//
//        // 填充角色信息
//        pages.getList().stream().forEach(m -> {
//            m.setRoleList(sysUserRoleService.getRoleList(m.getUserId()));
//        });
//
//        return pages;
//    }
    @Override
    public PageData<SysUserDTO> pageOfUser(Map<String, Object> params) {
        Page<SysUserEntity> iPage = (Page<SysUserEntity>) getPage(params, null, false);
        iPage.addOrder(OrderItem.desc("CREATE_TIME"));

        IPage<SysUserEntity> page = baseDao.selectPage(
                iPage,
                getWrapper(params).eq("SYS_ID", "CBDSES")
        );

        // 获取基础分页数据
        PageData<SysUserDTO> pages = new PageData<>();
        List<SysUserDTO> dtoList = new ArrayList<>();

        for (SysUserEntity entity : page.getRecords()) {
            SysUserDTO dto = new SysUserDTO();

            // 基本属性复制
            BeanUtils.copyProperties(entity, dto);

            // 手动映射 createTime → createDate
            dto.setCreateDate(entity.getCreateTime());
            dto.setUsername(entity.getUserName());
            dto.setLoginId(entity.getLoginId());
            // 映射 fgAdmin（"Y"/"N"）→ superAdmin（1/0）
            String fgAdmin = entity.getFgAdmin();
            dto.setSuperAdmin("Y".equalsIgnoreCase(fgAdmin) ? 1 : 0);

            // 设置角色列表
            dto.setRoleList(sysUserRoleService.getRoleList(entity.getUserId()));

            dtoList.add(dto);
        }

        pages.setList(dtoList);
        pages.setTotal((int) page.getTotal());

        return pages;
    }


    @Override
    public List<SysUserDTO> list(Map<String, Object> params) {

        List<SysUserEntity> entityList = baseDao.selectList(getWrapper(params));

        return ConvertUtils.sourceToTarget(entityList, SysUserDTO.class);
    }

    @Override
    public SysUserDTO get(Long id) {
        SysUserEntity entity = baseDao.selectOne(Wrappers.<SysUserEntity>lambdaQuery()
                .eq(SysUserEntity::getUserId, id)
                .eq(SysUserEntity::getSysId, "CBDSES")
                .eq(SysUserEntity::getUserStatus, "1"));

        if (entity == null) {
            throw new RuntimeException("用户不存在");
        }

        SysUserDTO sysUserDTO = ConvertUtils.sourceToTarget(entity, SysUserDTO.class);
        sysUserDTO.setUsername(entity.getUserName());
        return sysUserDTO;
    }

    @Override
    public SysUserDTO getByUsername(String username) {
        SysUserEntity entity = baseDao.selectOne(Wrappers.<SysUserEntity>lambdaQuery()
                .eq(SysUserEntity::getLoginId, username)
                .eq(SysUserEntity::getSysId, "CBDSES")
                .eq(SysUserEntity::getUserStatus, "1"));

        if (entity == null) {
            throw new RuntimeException("用户不存在！");
        }

        SysUserDTO sysUserDTO = ConvertUtils.sourceToTarget(entity, SysUserDTO.class);
        sysUserDTO.setUsername(entity.getUserName());
        return sysUserDTO;
    }

    @Override
    public SysUserDTO getByUserId(String userId) {
        SysUserEntity entity = baseDao.selectOne(Wrappers.<SysUserEntity>lambdaQuery()
                .eq(SysUserEntity::getUserId, userId)
                .eq(SysUserEntity::getSysId, "CBDSES")
                .eq(SysUserEntity::getUserStatus, "1"));

        if (entity == null) {
            throw new RuntimeException("用户不存在！");
        }

        SysUserDTO sysUserDTO = ConvertUtils.sourceToTarget(entity, SysUserDTO.class);
        sysUserDTO.setUsername(entity.getUserName());
        return sysUserDTO;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(SysUserRoleDTO dto) {
        // 检查用户名是否已存在
        SysUserEntity existing = baseDao.selectOne(new QueryWrapper<SysUserEntity>()
                .eq("login_id", dto.getLoginId())
                .eq("sys_id", "CBDSES")
                .eq("user_status", "1"));

        if (existing != null) {
            throw new BizException("用户名已存在，请更换用户名");
        }

        SysUserEntity entity = new SysUserEntity();
        entity.setUserId(IdWorker.getId());
        entity.setUserName(dto.getUsername());
        entity.setLoginId(dto.getLoginId());
        entity.setEmail(dto.getEmail());
        entity.setMobile(dto.getMobile());

        // 设置密码（默认或手动）
        String password = Strings.isBlank(dto.getPassword()) ?
                customConfig.getUserDefaultPassword() : dto.getPassword();
        entity.setPassword(PasswordUtils.encode(password));

        // 设置默认属性
        entity.setUserStatus("1"); // 启用
        entity.setFgAdmin(SuperAdminEnum.NO.value() + ""); // 非超级管理员
        entity.setSysId("CBDSES");
        entity.setCreateTime(new Date());

        // 插入用户
        insert(entity);

        // 保存用户角色关系
        sysUserRoleService.saveOrUpdate(entity.getUserId(), dto.getRoleIdList());

        // 注册单点登录
        ssoService.ssoUserRegister(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysUserRoleDTO dto) {
        SysUserEntity entity = baseDao.selectOne(Wrappers.<SysUserEntity>lambdaQuery()
                .eq(SysUserEntity::getUserId, dto.getId())
                .eq(SysUserEntity::getSysId, "CBDSES")
                .eq(SysUserEntity::getUserStatus, "1"));
        if (entity == null) {
            throw new RuntimeException("用户不存在");
        }
        BeanUtils.copyProperties(dto, entity);
        // 更新用户
        baseDao.updateById(entity);
        // 更新角色用户关系
        sysUserRoleService.saveOrUpdate(entity.getUserId(), dto.getRoleIdList());
        // 注册单点登录
        ssoService.ssoUserRegister(entity);
    }


    @Override
    public void delete(Long[] ids) {
        //删除用户
        baseDao.deleteBatchIds(Arrays.asList(ids));

        //删除角色用户关系
        sysUserRoleService.deleteByUserIds(ids);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updatePassword(Long id, String newPassword) {
        baseDao.update(null, Wrappers.<SysUserEntity>lambdaUpdate()
                .eq(SysUserEntity::getUserId, id)
                .eq(SysUserEntity::getSysId, "CBDSES")
                .set(SysUserEntity::getPassword, PasswordUtils.encode(newPassword)));
    }

    @Override
    public SysUserEntity getUserById(Long id) {
        LambdaQueryWrapper<SysUserEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUserEntity::getUserId, id);
        wrapper.eq(SysUserEntity::getSysId, "CBDSES");
        return this.selectOneWithWrapper(wrapper);
//        return this.selectById(id);
    }

    @Override
    public List<SysUserEntity> list(List<Long> userIds) {
        return this.baseDao.selectBatchIds(userIds);
    }

    @Override
    public Result updatePassword(PasswordDTO passwordDTO) {
        //效验数据
        ValidatorUtils.validateEntity(passwordDTO);
        UserDetail user = SecurityUser.getUser();
        //原密码不正确
        if (!PasswordUtils.matches(passwordDTO.getPassword(), user.getPassword())) {
            return Result.error(ErrorCode.PASSWORD_ERROR.getCode());
        }

        //是否允许修改密码与上次相同
        String newPassword = passwordDTO.getNewPassword();
        String sameLastSwitch = SysConfigCache.getConfigValue(SysConstant.USER_PASSWORD_UNIQUE);
        if (SysConstant.NO.equalsIgnoreCase(sameLastSwitch)) {
            if (PasswordUtils.matches(newPassword, user.getPassword())) {
                return Result.error("系统不允许新旧密码一致");
            }
        }

        //密码强度判断
        String pwdStrengthLevel = SysConfigCache.getConfigValue(SysConstant.USER_PASSWORD_STRENGTH);
        switch (pwdStrengthLevel) {
            case "1": {
                if (!PasswordUtils.checkPasswordRuleHigh(newPassword, user.getUserName())) {
                    return Result.error("1、密码长度限制必须在8—20之间，必须包括大写字母、小写字母、数字、特殊符号中的4种,密码不能包含用户名");
                }
                break;
            }
            case "2": {
                if (!PasswordUtils.checkPassword(newPassword)) {
                    return Result.error("2、密码长度限制必须在8—20之间，不能是纯数字或字母");
                }
                break;
            }
        }

        this.updatePassword(user.getUserId(), newPassword);
        return Result.ok();
    }

    @Override
    public void syncSysUser(List<Person> data) {
        String defaultPwd = PasswordUtils.encode(customConfig.getUserDefaultPassword());

        // 提取所有的employmentId用于查询
        List<String> employmentIds = data.stream()
                .filter(e -> BooleanEnum.TRUE.getCode().equals(e.getSTATUS()))
                .map(Person::getCODE)
                .collect(Collectors.toList());

        log.info("employmentIds size is " + employmentIds.size());

        if (CollectionUtil.isEmpty(employmentIds)) {
            return;
        }

        // 查询已存在的employmentId
        Set<String> existingIds = this.baseDao.findExistingEmploymentIds(employmentIds);

        log.info("existingIds size is " + existingIds.size());

        // 过滤出需要新增的记录
        List<SysUserEntity> newUsers = data.stream()
                .filter(e -> BooleanEnum.TRUE.getCode().equals(e.getSTATUS()))
                .filter(p -> !existingIds.contains(p.getCODE()))  // 只保留不存在的记录
                .map(p -> {
                    SysUserEntity entity = new SysUserEntity();
                    entity.setUserName(p.getNAME());
                    entity.setLoginId(p.getCODE());
                    entity.setEmploymentId(p.getCODE());
                    entity.setDeptNo(p.getDEPT_SN());
                    entity.setGender(p.getSEX());
                    entity.setIdCard(p.getSOCIAL_NO());
                    entity.setMobile(p.getPHONE_NUMBER());
                    entity.setSysId("CBDSES");
                    entity.setPassword(defaultPwd);
                    entity.setUserId(IdUtil.getSnowflakeNextId());
                    return entity;
                }).collect(Collectors.toList());

        Map<String, String> userDeptMap = newUsers.stream()
                .collect(Collectors.toMap(
                        SysUserEntity::getLoginId,
                        SysUserEntity::getDeptNo,
                        (existing, replacement) -> existing  // 如果key重复，保留现有的值
                ));

        log.info("newUsers size is " + newUsers.size());

        for (SysUserEntity newUser : newUsers) {
            log.info("新增用户ID [ {} ] 用户名 [ {} ]", newUser.getEmploymentId(), newUser.getUserName());
        }


        if (CollectionUtil.isNotEmpty(newUsers)) {
            for (SysUserEntity newUser : newUsers) {
                newUser.setUserStatus("1");
                newUser.setModifiedDate(new Date());
                newUser.setCreateTime(new Date());
                baseDao.insert(newUser);
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            // 为新增用户分配基础角色
            if (CollectionUtil.isNotEmpty(newUsers)) {

                Long baseRoleId = customConfig.getBaseRoleId();
                Long superRoleId = customConfig.getSuperRoleId();

                if (baseRoleId == null || superRoleId == null) {
                    throw new RuntimeException("role id没有配置");
                }

                // 重新查询新增用户的完整信息（包含生成的userId）
                List<String> newEmploymentIds = newUsers.stream()
                        .map(SysUserEntity::getEmploymentId)
                        .collect(Collectors.toList());

                List<SysUserEntity> completeNewUsers = this.baseDao.selectList(
                        Wrappers.<SysUserEntity>lambdaQuery()
                                .eq(SysUserEntity::getSysId, "CBDSES")
                                .in(SysUserEntity::getEmploymentId, newEmploymentIds)
                );

                List<SysUserRoleEntity> userRoles = completeNewUsers.stream().map(e -> {
                    Long roleId;
                    String roleType;
                    String deptNo = userDeptMap.get(e.getLoginId());
                    if (deptNo == null) {
                        throw new RuntimeException("部门编号为null");
                    }
                    if (deptNo.equals("0020")) {
                        roleId = superRoleId;
                        roleType = "管理员";
                    } else {
                        roleId = baseRoleId;
                        roleType = "普通用户";
                    }
                    SysUserRoleEntity userRole = new SysUserRoleEntity();
                    userRole.setUserId(e.getUserId());

                    userRole.setRoleId(roleId);
                    userRole.setSysId("CBDSES");
                    userRole.setOperationTime(new Date());
                    log.info("新增角色 [ {} ] {}", roleType, roleId);
                    return userRole;
                }).collect(Collectors.toList());

                sysUserRoleService.saveOrUpdateBatch(userRoles, userRoles.size());
            }

            /*
             * 异步注册单点登录用户
             */
            log.info("异步注册单点登录用户 -> ");


            List<String> needSyncUsers = newUsers.stream().map(SysUserEntity::getEmploymentId)
                    .filter(Objects::nonNull).collect(Collectors.toList());

            // 重新查询所有同步用户的完整信息
            List<SysUserEntity> needSyncedUsers = this.baseDao.selectList(
                    Wrappers.<SysUserEntity>lambdaQuery()
                            .eq(SysUserEntity::getSysId, "CBDSES")
                            .in(SysUserEntity::getEmploymentId, needSyncUsers)
            );

            log.info("needSyncUsers size is " + needSyncedUsers.size());

            // 单点登录注册
            if (CollectionUtil.isNotEmpty(needSyncedUsers)) {
                needSyncedUsers.forEach(ssoService::ssoUserRegister);
            }
        }
    }
//    public void syncSysUser(List<Person> data) {
//        Long taskUserId = customConfig.getTaskUserId();
//        String defaultPwd = PasswordUtils.encode(customConfig.getUserDefaultPassword());
//        List<SysUserEntity> collect = data.stream().filter(e -> BooleanEnum.TRUE.getCode().equals(e.getSTATUS())).map(p -> {
//            SysUserEntity entity = new SysUserEntity();
//            entity.setUserName(p.getNAME());
//            entity.setLoginId(p.getCODE());
//            entity.setEmploymentId(p.getCODE());
//            entity.setGender(p.getSEX());
//            entity.setIdCard(p.getSOCIAL_NO());
//            entity.setMobile(p.getPHONE_NUMBER());
//            entity.setSysId("CBDSES");
////            entity.setCreator(taskUserId);
////            entity.setUpdater(taskUserId);
//            entity.setPassword(defaultPwd);
//            entity.setUserId(IdUtil.getSnowflakeNextId());
//            return entity;
//        }).collect(Collectors.toList());
//
//        if (CollectionUtil.isNotEmpty(collect)) {
//            log.info("single po -> " + collect.get(0));
//            //账号更新
//            this.baseDao.batchUpdateSysUser(collect);
//
//            //角色处理
//            List<String> employIds = collect.stream().map(SysUserEntity::getEmploymentId).collect(Collectors.toList());
//            List<Long> ids = collect.stream().map(SysUserEntity::getUserId).collect(Collectors.toList());
//            //id相同则为新增用户
//            List<SysUserEntity> addUserList = this.baseDao.selectList(Wrappers.<SysUserEntity>lambdaQuery()
//                    .eq(SysUserEntity::getSysId, "CBDSES")
//                    .in(SysUserEntity::getEmploymentId, employIds))
//                    .stream().filter(e -> ids.contains(e.getUserId())).collect(Collectors.toList());
//            if (CollectionUtil.isNotEmpty(addUserList)) {
//                Long baseRoleId = customConfig.getBaseRoleId();
//                Long superRoleId = customConfig.getSuperRoleId();
//                List<SysUserRoleEntity> sysUserList = addUserList.stream().map(e -> {
//                    SysUserRoleEntity userRole = new SysUserRoleEntity();
//                    userRole.setUserId(e.getUserId());
//                    userRole.setRoleId(baseRoleId);
//                    userRole.setSysId("CBDSES");
////                    userRole.setCreator(taskUserId);
//                    userRole.setOperationTime(new Date());
//                    return userRole;
//                }).collect(Collectors.toList());
//                sysUserRoleService.saveOrUpdateBatch(sysUserList, sysUserList.size());
//            }
//
//
//            /*
//             * 异步注册单点登录用户
//             */
//            //collect-addUserList = 更新用户
//            log.info("异步注册单点登录用户 -> ");
//            List<Long> addUserIds = addUserList.stream().map(SysUserEntity::getUserId).collect(Collectors.toList());
//            List<SysUserEntity> updateUserList = collect.stream().filter(e -> !addUserIds.contains(e.getUserId())).collect(Collectors.toList());
//            if (CollectionUtil.isNotEmpty(addUserList)) {
//                addUserList.forEach(entity -> {
//                    entity.setUserId(null);
//                    ssoService.ssoUserRegister(entity);
//                });
//            }
//            if (CollectionUtil.isNotEmpty(updateUserList)) {
//                updateUserList.forEach(ssoService::ssoUserRegister);
//            }
//        }
//    }


    @Override
    public void deletedSysUserLogicallyBatchIds(Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        baseDao.update(new SysUserEntity(), Wrappers.<SysUserEntity>lambdaUpdate()
                .in(SysUserEntity::getUserId, ids)
                .eq(SysUserEntity::getSysId, "CBDSES")
                .set(SysUserEntity::getUserStatus, BooleanEnum.FALSE.getCode()));
    }
}
