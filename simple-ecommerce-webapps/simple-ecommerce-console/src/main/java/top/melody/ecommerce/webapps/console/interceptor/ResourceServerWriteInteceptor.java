package top.melody.ecommerce.webapps.console.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import top.melody.ecommerce.platform.props.GlobalConfig;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/12 13:47
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/12 13:47
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class ResourceServerWriteInteceptor extends HandlerInterceptorAdapter{
    @Resource
    private GlobalConfig globalConfig;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String resourceDomain = globalConfig.getImgDomain();
        if(modelAndView != null && modelAndView.getModel() != null) {
            modelAndView.getModel().put("resourceServer",resourceDomain);
        }
    }
}
