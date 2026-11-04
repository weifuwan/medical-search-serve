package com.jiayuan.modules.common;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.dto.KeyValue;
import com.jiayuan.common.utils.EnumExtendUtil;
import com.jiayuan.common.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Title: CommonController
 * @Package: com.jiayuan.modules.common
 * @Description: 通用接口
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/14
 */
@Api(tags = "通用接口")
@RequestMapping(value = "/common")
@RestController
public class CommonController {

    @GetMapping("logicList")
    @ApiOperation("逻辑符号列表")
    public Result<List> logicList() {
        List<HashMap<String, Object>> list = EnumSet.allOf(Symbol.LogicEnum.class).stream().map(e ->
                new HashMap<String, Object>() {
                    {
                        put("code", e.getCode());
                        put("name", e.getName());
                        put("desc", e.getDesc());
                    }
                }).collect(Collectors.toList());

        return Result.ok(list);
    }

    @GetMapping("relationalList")
    @ApiOperation("关系符号列表")
    public Result<List> relationalList() {
        List<HashMap<String, Object>> list = EnumSet.allOf(Symbol.RelationalEnum.class).stream().map(e ->
                new HashMap<String, Object>() {
                    {
                        put("code", e.getCode());
                        put("name", e.getName());
                        put("desc", e.getDesc());
                    }
                }).collect(Collectors.toList());

        return Result.ok(list);
    }


}
