package com.jiayuan.modules.share.controller;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.share.dto.ExpressionShareRequest;
import com.jiayuan.modules.share.dto.ExpressionSharePageQuery;
import com.jiayuan.modules.share.dto.ExpressionSharePageResult;
import com.jiayuan.modules.share.service.ExpressionShareService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/** Sharing is authorized separately from the V2 search and export endpoints. */
@RestController
@RequestMapping("/share/expression")
public class ExpressionShareController {
    private final ExpressionShareService service;

    public ExpressionShareController(ExpressionShareService service) {
        this.service = service;
    }

    @PostMapping
    public Result<Map<String, Object>> create(@RequestBody ExpressionShareRequest request) {
        return Result.ok(service.create(request));
    }

    @GetMapping("/mine")
    public Result<ExpressionSharePageResult<Map<String, Object>>> mine(
            @ModelAttribute ExpressionSharePageQuery query) {
        return Result.ok(service.mine(query));
    }

    @GetMapping("/received")
    public Result<ExpressionSharePageResult<Map<String, Object>>> received(
            @ModelAttribute ExpressionSharePageQuery query) {
        return Result.ok(service.received(query));
    }

    @GetMapping("/users")
    public Result<List<Map<String, Object>>> users(@RequestParam(required = false) String keyword) {
        return Result.ok(service.users(keyword));
    }

    @GetMapping("/favorites")
    public Result<ExpressionSharePageResult<Map<String, Object>>> favorites(
            @ModelAttribute ExpressionSharePageQuery query) {
        return Result.ok(service.favorites(query));
    }

    @PostMapping("/favorites")
    public Result<Map<String, Object>> favorite(@RequestBody ExpressionShareRequest request) {
        return Result.ok(service.addFavorite(request, null));
    }

    @DeleteMapping("/favorites/{id}")
    public Result<Void> deleteFavorite(@PathVariable String id) {
        service.deleteFavorite(id);
        return Result.ok();
    }

    @GetMapping("/{code}")
    public Result<Map<String, Object>> detail(@PathVariable String code) {
        return Result.ok(service.detail(code, true));
    }

    @PutMapping("/{code}")
    public Result<Map<String, Object>> update(@PathVariable String code,
                                               @RequestBody ExpressionShareRequest request) {
        return Result.ok(service.update(code, request));
    }

    @PostMapping("/{code}/revoke")
    public Result<Void> revoke(@PathVariable String code) {
        service.revoke(code);
        return Result.ok();
    }

    @GetMapping("/{code}/usage")
    public Result<List<Map<String, Object>>> usage(@PathVariable String code) {
        return Result.ok(service.usage(code));
    }

    @PostMapping("/{code}/copy")
    public Result<Map<String, Object>> copy(@PathVariable String code) {
        return Result.ok(service.addFavorite(new ExpressionShareRequest(), code));
    }
}
