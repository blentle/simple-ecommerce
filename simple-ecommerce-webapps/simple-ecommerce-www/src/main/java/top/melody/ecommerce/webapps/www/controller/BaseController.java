package top.melody.ecommerce.webapps.www.controller;

import top.melody.ecommerce.common.util.HTTPUtil;
import top.melody.ecommerce.platform.api.service.BasedataService;
import top.melody.ecommerce.webapps.www.base.Constant;
import top.melody.ecommerce.webapps.www.base.UserSession;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * Date: 15-3-3 上午10:50
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
public class BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    protected static final String IDSPLIT = ",";
    @Resource
    private BasedataService basedataService;
	
    /**
     * 将用户保存到session中
     *
     * @param request
     * @param userSession
     */
    protected void saveUserInSession(HttpServletRequest request, UserSession userSession) {
        HttpSession session = request.getSession();
        if (null != session.getAttribute(Constant.SESSION_KEY)) {
            this.removeUserFromSession(request);
        }

        session.setAttribute(Constant.SESSION_KEY, userSession);
    }

    /**
     * 将用户从session中取出
     *
     * @param request
     * @return
     */
    protected UserSession getUserBySession(HttpServletRequest request) {
        Object obj = request.getSession().getAttribute(Constant.SESSION_KEY);
        if (obj != null) {
            return (UserSession) obj;
        }
        return null;
    }

    protected void removeUserFromSession(HttpServletRequest request) {
        request.getSession().removeAttribute(Constant.SESSION_KEY);
    }

    protected boolean userIsLogin(HttpServletRequest request) {
        UserSession userSession = getUserBySession(request);
        return userSession == null ? false : true;
    }

    protected String getVerifyCode(HttpServletRequest request){
        return request.getSession().getAttribute(Constant.VERIFY_CODE) == null ? null:String.valueOf(request.getSession().getAttribute(Constant.VERIFY_CODE));
    }

    /**
     * 得到ip，（通过Nginx的ip需要从请求头部取）
     *
     * @param request
     * @return
     */
    protected String getIp(HttpServletRequest request) {
        return HTTPUtil.getRemoteAddr(request);
    }

    protected Map<String, Object> putErrorMessage(String errorMessage) {
        Map<String, Object> mapMessage = new HashMap<String, Object>();
        mapMessage.put("message", errorMessage);
        return mapMessage;
    }
}
