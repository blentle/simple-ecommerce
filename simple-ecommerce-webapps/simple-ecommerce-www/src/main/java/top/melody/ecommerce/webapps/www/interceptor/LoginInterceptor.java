package top.melody.ecommerce.webapps.www.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import top.melody.ecommerce.webapps.www.base.Constant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Date: 15-1-29 上午10:34
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
    //
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        Object obj = request.getSession().getAttribute(Constant.SESSION_KEY);
        if (obj == null) {
            try {
                response.sendRedirect(request.getContextPath() + "/login");
            } catch (IOException e) {
                logger.error("redirect login error", e);
            }
        }
        return true;
    }

}
