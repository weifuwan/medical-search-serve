
package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.sys.dto.SysRoleDTO;
import com.jiayuan.modules.sys.service.SysRolePermissionService;
import com.jiayuan.modules.sys.service.SysRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色管理
 *
 * @author lijiankui
 */
@RestController
@RequestMapping("/sys/role")
@Api(tags = "角色管理")
@RequiredArgsConstructor
public class SysRoleController {
    private final SysRoleService sysRoleService;
    private final SysRolePermissionService sysRolePermissionService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "name", value = "角色名", paramType = "query", dataType = "String")
    })
    public Result<PageData<SysRoleDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<SysRoleDTO> page = sysRoleService.page(params);
        return Result.ok(page);
    }

    @GetMapping("list")
    @ApiOperation("列表")
    public Result<List<SysRoleDTO>> list() {
        List<SysRoleDTO> data = sysRoleService.list(new HashMap<>(1));

        return Result.ok(data);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysRoleDTO> get(@PathVariable("id") Long id) {
        SysRoleDTO data = sysRoleService.get(id);

        //查询角色对应的菜单
        List<Long> menuIdList = sysRolePermissionService.getMenuIdList(id);
        data.setMenuIdList(menuIdList);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("角色保存")
    @LogOperation("角色保存")
    public Result save(@RequestBody SysRoleDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        sysRoleService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("角色修改")
    @LogOperation("角色修改")
    public Result update(@RequestBody SysRoleDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        sysRoleService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("角色删除")
    @LogOperation("角色删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        sysRoleService.delete(ids);

        return Result.ok();
    }
}