package com.jiayuan.modules.security.filter;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class PatientApiTokenFilterTest {

    @Test
    public void allowsRequestWithValidHeaderToken() {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("expected-token");
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader(PatientApiTokenFilter.TOKEN_HEADER, "expected-token");

        assertTrue(filter.isAllowed(request, new MockHttpServletResponse()));
        assertEquals(PatientApiTokenFilter.API_CLIENT_NAME,
                request.getAttribute(PatientApiTokenFilter.API_CLIENT_ATTRIBUTE));
    }

    @Test
    public void rejectsRequestWithoutToken() {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("expected-token");

        assertFalse(filter.isAllowed(new MockHttpServletRequest(), new MockHttpServletResponse()));
    }

    @Test
    public void rejectsRequestWithWrongToken() {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("expected-token");
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader(PatientApiTokenFilter.TOKEN_HEADER, "wrong-token");

        assertFalse(filter.isAllowed(request, new MockHttpServletResponse()));
        assertNull(request.getAttribute(PatientApiTokenFilter.API_CLIENT_ATTRIBUTE));
    }

    @Test
    public void rejectsWhenServerTokenIsNotConfigured() {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("");
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader(PatientApiTokenFilter.TOKEN_HEADER, "any-token");

        assertFalse(filter.isAllowed(request, new MockHttpServletResponse()));
    }

    @Test
    public void doesNotReadTokenFromQueryParameter() {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("expected-token");
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setParameter(PatientApiTokenFilter.TOKEN_HEADER, "expected-token");

        assertFalse(filter.isAllowed(request, new MockHttpServletResponse()));
    }

    @Test
    public void allowsCorsPreflightWithoutToken() {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("expected-token");
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.setMethod("OPTIONS");

        assertTrue(filter.isAllowed(request, new MockHttpServletResponse()));
    }

    @Test
    public void returnsUnauthorizedAndStandardErrorWhenAccessIsDenied() throws IOException {
        TestablePatientApiTokenFilter filter = new TestablePatientApiTokenFilter("expected-token");
        MockHttpServletRequest request = new MockHttpServletRequest();
        request.addHeader("Origin", "https://client.example");
        MockHttpServletResponse response = new MockHttpServletResponse();

        assertFalse(filter.deny(request, response));

        assertEquals(401, response.getStatus());
        assertEquals("https://client.example", response.getHeader("Access-Control-Allow-Origin"));
        assertTrue(response.getContentAsString().contains("\"code\":401"));
    }

    private static class TestablePatientApiTokenFilter extends PatientApiTokenFilter {

        private TestablePatientApiTokenFilter(String expectedToken) {
            super(expectedToken);
        }

        private boolean isAllowed(ServletRequest request, ServletResponse response) {
            return super.isAccessAllowed(request, response, null);
        }

        private boolean deny(ServletRequest request, ServletResponse response) throws IOException {
            return super.onAccessDenied(request, response);
        }
    }
}
