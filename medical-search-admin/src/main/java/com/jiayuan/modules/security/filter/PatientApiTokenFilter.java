package com.jiayuan.modules.security.filter;

import com.google.gson.Gson;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.utils.Result;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * Authenticates the patient count/list APIs with a dedicated shared API token.
 *
 * <p>This filter deliberately does not create a Shiro subject or user identity.
 * The token must be supplied in the X-API-Token header and is configured outside
 * the repository through MEDICAL_SEARCH_PATIENT_API_TOKEN.</p>
 */
public class PatientApiTokenFilter extends AccessControlFilter {

    public static final String TOKEN_HEADER = "X-API-Token";
    public static final String API_CLIENT_ATTRIBUTE = "apiClient";
    public static final String API_CLIENT_NAME = "patient-api";

    private final String expectedToken;

    public PatientApiTokenFilter(String expectedToken) {
        this.expectedToken = expectedToken;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Let the CORS layer handle preflight requests without requiring credentials.
        if ("OPTIONS".equalsIgnoreCase(httpRequest.getMethod())) {
            return true;
        }

        String suppliedToken = httpRequest.getHeader(TOKEN_HEADER);
        if (!isTokenValid(suppliedToken)) {
            return false;
        }

        // Used by operation logging; this is not a Shiro authenticated principal.
        request.setAttribute(API_CLIENT_ATTRIBUTE, API_CLIENT_NAME);
        return true;
    }

    boolean isTokenValid(String suppliedToken) {
        if (StringUtils.isBlank(expectedToken) || StringUtils.isBlank(suppliedToken)) {
            return false;
        }

        return MessageDigest.isEqual(
                expectedToken.getBytes(StandardCharsets.UTF_8),
                suppliedToken.getBytes(StandardCharsets.UTF_8)
        );
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        httpResponse.setCharacterEncoding(StandardCharsets.UTF_8.name());
        httpResponse.setContentType("application/json;charset=UTF-8");
        httpResponse.setHeader("Cache-Control", "no-store");

        // Keep the same CORS behavior as the existing OAuth2 filter for browser clients.
        String origin = httpRequest.getHeader("Origin");
        if (StringUtils.isNotBlank(origin)) {
            httpResponse.setHeader("Access-Control-Allow-Origin", origin);
            httpResponse.setHeader("Access-Control-Allow-Credentials", "true");
            httpResponse.setHeader("Vary", "Origin");
        }

        httpResponse.getWriter().write(
                new Gson().toJson(Result.error(ErrorCode.UNAUTHORIZED.getCode()))
        );
        return false;
    }
}
