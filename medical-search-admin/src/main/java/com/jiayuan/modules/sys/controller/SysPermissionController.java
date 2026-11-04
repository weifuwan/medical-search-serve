
package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.modules.security.service.ShiroService;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.dto.SysPermissionDTO;
import com.jiayuan.modules.sys.enums.MenuTypeEnum;
import com.jiayuan.modules.sys.service.SysPermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * 菜单管理
 *
 * @author lijiankui
 */
@RestController
@RequestMapping("/sys/menu")
@Api(tags = "菜单管理")
@RequiredArgsConstructor
public class SysPermissionController {
    private final SysPermissionService sysPermissionService;
    private final ShiroService shiroService;

    @GetMapping("nav")
    @ApiOperation("导航")
    public Result<List<SysPermissionDTO>> nav() {
        UserDetail user = SecurityUser.getUser();
        List<SysPermissionDTO> list = sysPermissionService.getUserMenuList(user, MenuTypeEnum.MENU.value());

        return Result.ok(list);
    }

    @GetMapping("permissions")
    @ApiOperation("权限标识")
    public Result<Set<String>> permissions() {
        UserDetail user = SecurityUser.getUser();
        Set<String> set = shiroService.getUserPermissions(user);

        return Result.ok(set);
    }

    @GetMapping("list")
    @ApiOperation("列表")
    @ApiImplicitParam(name = "type", value = "菜单类型 0：菜单 1：按钮  null：全部", paramType = "query", dataType = "int")
    public Result<List<SysPermissionDTO>> list(Integer type) {
        List<SysPermissionDTO> list = sysPermissionService.getAllMenuList(type);

        return Result.ok(list);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysPermissionDTO> get(@PathVariable("id") Long id) {
        SysPermissionDTO data = sysPermissionService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    public Result save(@RequestBody SysPermissionDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, DefaultGroup.class);

        sysPermissionService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    public Result update(@RequestBody SysPermissionDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, DefaultGroup.class);

        sysPermissionService.update(dto);

        return Result.ok();
    }

    @DeleteMapping("{id}")
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@PathVariable("id") Long id) {
        //效验数据
        AssertUtils.isNull(id, "id");

        //判断是否有子菜单或按钮
        List<SysPermissionDTO> list = sysPermissionService.getListPid(id);
        if (list.size() > 0) {
            return Result.error(ErrorCode.SUB_MENU_EXIST.getCode());
        }

        sysPermissionService.delete(id);

        return Result.ok();
    }

    @GetMapping("select")
    @ApiOperation("用户权限菜单")
    public Result<List<SysPermissionDTO>> select() {
        UserDetail user = SecurityUser.getUser();
        List<SysPermissionDTO> list = sysPermissionService.getUserMenuList(user, null);

        return Result.ok(list);
    }
}