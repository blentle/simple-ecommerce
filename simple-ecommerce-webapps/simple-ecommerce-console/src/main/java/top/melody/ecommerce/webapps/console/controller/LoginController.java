package top.melody.ecommerce.webapps.console.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.console.base.Constant;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zxdev on 15/3/12.
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private ResourceBundleMessageSource i18nSource;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        String view = "login";
        return new ModelAndView(view, new ModelMap());
    }


    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam(required = true) String userId,
                              @RequestParam(required = true) String password) {
        String view = "redirect:/";

        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_S);
        Map reMap = new HashMap();

//        Subject subject = SecurityUtils.getSubject();
//        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(userId, password);
//
//
//        try {
//            subject.login(usernamePasswordToken);
//        } catch (UnknownAccountException e) {
//            //error = "用户名/密码错误";
//            resultMsg.setMsg("用户名/密码错误");
//            reMap.put("resultMsg", resultMsg);
//            view = "/login";
//        } catch (IncorrectCredentialsException e) {
////            error = "用户名/密码错误";
//            resultMsg.setMsg("用户名/密码错误");
//            reMap.put("resultMsg", resultMsg);
//            view = "/login";
//        } catch (AuthenticationException e) { //其他错误,比如锁定,如果想单独处理请单独 catch 处理 error = "其他错误:" + e.getMessage();
//            resultMsg.setMsg("锁定");
//            reMap.put("resultMsg", resultMsg);
//            view = "/login";
//        }
//
//        subject.getSession().setAttribute(Constant.CURRENT_USER,subject.getPrincipal());

        return new ModelAndView(view, reMap);
    }


    @RequestMapping("/logout")
    public String logout() {
        return "redirect:/";
    }
}