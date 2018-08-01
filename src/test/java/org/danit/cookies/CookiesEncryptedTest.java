package org.danit.cookies;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Locale;

import static org.junit.Assert.*;

public class CookiesEncryptedTest {

    static Logger log = LoggerFactory.getLogger(CookiesEncryptedTest.class);

    @Test
    public void main00() {
        Cookie[] cc = null;
        // standard
        Cookies cs = new CookiesStandard(cc);
        cs.add(new CookieTimed("s1", "VAL 1", 5));
        cs.add(new CookieTimed("s2", "VAL 2", 60));
        log.info("got value for key='k1': "+cs.get("s1"));
        log.info("got value for key='k2': "+cs.get("s2"));

        // encrypted
        Cookies ce = new CookiesEncrypted(new CookiesStandard());
        ce.add(new CookieTimed("k1", "value ONE", 10));
        ce.add(new CookieTimed("k2", "value TWO", 60));

        log.info("got value for key='k1': "+ce.get("k1"));
        log.info("got value for key='k2': "+ce.get("k2"));
        // but !!!
        HttpServletResponse r = new HttpServletResponse() {
            @Override
            public void addCookie(Cookie cookie) {
                log.debug("HttpServletResponse:addCookie:"+cookie.toString());
            }

            @Override
            public boolean containsHeader(String name) {
                return false;
            }

            @Override
            public String encodeURL(String url) {
                return null;
            }

            @Override
            public String encodeRedirectURL(String url) {
                return null;
            }

            @Override
            public String encodeUrl(String url) {
                return null;
            }

            @Override
            public String encodeRedirectUrl(String url) {
                return null;
            }

            @Override
            public void sendError(int sc, String msg) throws IOException {

            }

            @Override
            public void sendError(int sc) throws IOException {

            }

            @Override
            public void sendRedirect(String location) throws IOException {

            }

            @Override
            public void setDateHeader(String name, long date) {

            }

            @Override
            public void addDateHeader(String name, long date) {

            }

            @Override
            public void setHeader(String name, String value) {

            }

            @Override
            public void addHeader(String name, String value) {

            }

            @Override
            public void setIntHeader(String name, int value) {

            }

            @Override
            public void addIntHeader(String name, int value) {

            }

            @Override
            public void setStatus(int sc) {

            }

            @Override
            public void setStatus(int sc, String sm) {

            }

            @Override
            public int getStatus() {
                return 0;
            }

            @Override
            public String getHeader(String name) {
                return null;
            }

            @Override
            public Collection<String> getHeaders(String name) {
                return null;
            }

            @Override
            public Collection<String> getHeaderNames() {
                return null;
            }

            @Override
            public String getCharacterEncoding() {
                return null;
            }

            @Override
            public String getContentType() {
                return null;
            }

            @Override
            public ServletOutputStream getOutputStream() throws IOException {
                return null;
            }

            @Override
            public PrintWriter getWriter() throws IOException {
                return null;
            }

            @Override
            public void setCharacterEncoding(String charset) {

            }

            @Override
            public void setContentLength(int len) {

            }

            @Override
            public void setContentLengthLong(long len) {

            }

            @Override
            public void setContentType(String type) {

            }

            @Override
            public void setBufferSize(int size) {

            }

            @Override
            public int getBufferSize() {
                return 0;
            }

            @Override
            public void flushBuffer() throws IOException {

            }

            @Override
            public void resetBuffer() {

            }

            @Override
            public boolean isCommitted() {
                return false;
            }

            @Override
            public void reset() {

            }

            @Override
            public void setLocale(Locale loc) {

            }

            @Override
            public Locale getLocale() {
                return null;
            }
        };

        System.out.println("Standard:");
        cs.spill(r); // will spill clean

        System.out.println("Encrypted:");
        ce.spill(r); // will spill encrypted
    }
}