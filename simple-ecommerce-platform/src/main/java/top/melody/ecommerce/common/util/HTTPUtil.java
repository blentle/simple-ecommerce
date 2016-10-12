package top.melody.ecommerce.common.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.StringTokenizer;

public class HTTPUtil {

    private static final String HEADER_USER_AGENT = "User-Agent";

    public static final String ENCODE_UTF8 = "UTF-8";

    public static String getRemoteAddr(HttpServletRequest request) {
        String ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("x-forwarded-for");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        // 多级反向代理
        if (null != ip && !"".equals(ip.trim())) {
            StringTokenizer st = new StringTokenizer(ip, ",");
            String ipTmp = "";
            if (st.countTokens() > 1) {
                while (st.hasMoreTokens()) {
                    ipTmp = st.nextToken();
                    if (ipTmp != null && ipTmp.length() != 0
                            && !"unknown".equalsIgnoreCase(ipTmp)) {
                        ip = ipTmp;
                        break;
                    }
                }
            }
        }
        return ip;
    }

    public static String getCookieValue(HttpServletRequest request, String key) throws UnsupportedEncodingException {
        String value = null;
        key = URLEncoder.encode(key, ENCODE_UTF8);
        if (request != null && request.getCookies() != null) {
            for (Cookie c : request.getCookies()) {
                if (c.getName().equals(key)) {
                    value = URLDecoder.decode(c.getValue(),ENCODE_UTF8);
                    break;
                }
            }
        }
        return value;
    }

    public static void setCookie(HttpServletResponse resp, Cookie sessionCookie) {
        resp.addCookie(sessionCookie);
    }

    public static void setCookie(HttpServletResponse resp, String name, String value) throws UnsupportedEncodingException {
        name = URLEncoder.encode(name,ENCODE_UTF8);
        value = URLEncoder.encode(value,ENCODE_UTF8);
        resp.addCookie(new Cookie(name, value));
    }

    public static void removeCookie(HttpServletResponse resp, Cookie c) {
        c.setValue(null);
        c.setMaxAge(0);
        resp.addCookie(c);
    }

    public static String getRedr(HttpServletRequest request) {
        String redr = "";
        if (request.getMethod().equalsIgnoreCase("get")) {
            redr = getRequestedUrl(request);
        } else {
            redr = request.getHeader("referer");
        }

        redr = StringUtil.nullToblank(redr);

        try {
            redr = URLEncoder.encode(redr,ENCODE_UTF8);
        } catch (UnsupportedEncodingException e) {

        }

        return redr;
    }

    public static String getRequestedUrl(HttpServletRequest request) {
        StringBuffer urlBuf = new StringBuffer(16);

        urlBuf.append(request.getRequestURL());

        if (!StringUtil.isEmpty(request.getQueryString())) {
            urlBuf.append("?").append(request.getQueryString());
        }

        return urlBuf.toString();
    }

    public static String getRequestedURIQueryString(HttpServletRequest request) {
        StringBuffer urlBuf = new StringBuffer();

        urlBuf.append(request.getRequestURI());

        if (!StringUtil.isEmpty(request.getQueryString())) {
            urlBuf.append("?").append(request.getQueryString());
        }

        return urlBuf.toString();
    }

    public static String getURIQueryString(String url) {
        StringBuffer urlBuf = new StringBuffer();

        try {
            URL urlObj = new URL(url);

            if (urlObj != null) {
                urlBuf.append(urlObj.getFile());
            }
        } catch (Exception e) {
            //
        }

        return urlBuf.toString();
    }

    public static void writeJson(HttpServletResponse response, String jsonStr) throws IOException {
        response.setContentType("text/plain");

        PrintWriter pw = null;
        try {
            pw = response.getWriter();
            pw.write(jsonStr);
        } finally {
            if (pw != null) {
                pw.close();
            }
        }
    }

}
