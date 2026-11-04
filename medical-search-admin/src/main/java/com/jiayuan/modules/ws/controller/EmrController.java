package com.jiayuan.modules.ws.controller;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.ws.dto.EmrDTO;
import com.jiayuan.modules.ws.service.EmrService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Title: com.jiayuan.modules.ws.controller
 * @Package: EmrController
 * @Description: 电子病历接口
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/19
 */
@RestController
@RequestMapping(value = "ws")
@RequiredArgsConstructor
@Api(tags = "电子病历接口")
public class EmrController {

    private final EmrService emrService;


    /**
     * 电子病历查询接口
     */
    @GetMapping("queryEmr")
    @ApiOperation(value = "电子病历查询接口")
    public Result queryEmr(EmrDTO emrDTO) {
        emrService.queryEmr(emrDTO);
        return Result.ok();
    }
}
