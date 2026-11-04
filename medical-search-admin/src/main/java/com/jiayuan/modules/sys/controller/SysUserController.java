
package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.dto.*;
import com.jiayuan.modules.sys.excel.SysUserExcel;
import com.jiayuan.modules.sys.service.SysUserRoleService;
import com.jiayuan.modules.sys.service.SysUserService;
import com.jiayuan.modules.task.AsyncTaskScheduledService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 用户管理
 *
 * @author lijiankui
 */
@RestController
@RequestMapping("/sys/user")
@Api(tags = "用户管理")
@RequiredArgsConstructor
public class SysUserController {
    private final SysUserService sysUserService;
    private final SysUserRoleService sysUserRoleService;
    private final AsyncTaskScheduledService asyncTaskScheduledService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "username", value = "用户名", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "realName", value = "姓名", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "gender", value = "性别", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.START_DATE, value = "开始时间(yyyy-MM-dd)", paramType = "query", dataType = "String", format = "yyyy-mm-dd"),
            @ApiImplicitParam(name = Constant.END_DATE, value = "结束时间(yyyy-MM-dd)", paramType = "query", dataType = "String", format = "yyyy-mm-dd")
    })
    public Result<PageData<SysUserDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<SysUserDTO> page = sysUserService.pageOfUser(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysUserDTO> get(@PathVariable("id") Long id) {
        SysUserDTO data = sysUserService.get(id);

        //用户角色列表
        List<KeyValueDTO> roleIdList = sysUserRoleService.getRoleList(id);
        data.setRoleList(roleIdList);

        return Result.ok(data);
    }

    @GetMapping("info")
    @ApiOperation("登录用户信息")
    public Result<SysUserDTO> info() {
        UserDetail user = SecurityUser.getUser();
        SysUserDTO data = ConvertUtils.sourceToTarget(user, SysUserDTO.class);
        data.setUsername(user.getUserName());
        data.setLoginId(user.getLoginId());
        return Result.ok(data);
    }

    @PutMapping("password")
    @ApiOperation("修改密码")
    @LogOperation("修改密码")
    public Result password(@RequestBody PasswordDTO dto) {
        return sysUserService.updatePassword(dto);
    }

    @PostMapping("resetPassword")
    @ApiOperation("重置密码")
    @LogOperation("重置密码")
    public Result resetPassword(@RequestBody ResetPasswordDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto);

        sysUserService.updatePassword(dto.getId(), dto.getPassword());

        return Result.ok();
    }

    @PostMapping
    @ApiOperation("用户保存")
    @LogOperation("用户保存")
    public Result save(@RequestBody SysUserRoleDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);

        sysUserService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("用户修改")
    @LogOperation("用户修改")
    public Result update(@RequestBody SysUserRoleDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        sysUserService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("用户删除")
    @LogOperation("用户删除")
    public Result delete(@RequestBody Long[] ids) {
        sysUserService.deletedSysUserLogicallyBatchIds(ids);
        return Result.ok();
    }

    @DeleteMapping("/pause")
    @ApiOperation("用户停用")
    @LogOperation("用户停用")
    public Result pause(@RequestBody Long[] ids) {
        sysUserService.deletedSysUserLogicallyBatchIds(ids);
        return Result.ok();
    }

    @GetMapping("export")
    @ApiOperation("导出")
    @LogOperation("导出")
    @ApiImplicitParam(name = "username", value = "用户名", paramType = "query", dataType = "String")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<SysUserDTO> list = sysUserService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, SysUserExcel.class);
    }

    @GetMapping("batch/sync")
    @ApiOperation("批量同步")
    @LogOperation("导出")
    public void batchSync() throws Exception {
        asyncTaskScheduledService.taskOfSyncAccount();
    }


}