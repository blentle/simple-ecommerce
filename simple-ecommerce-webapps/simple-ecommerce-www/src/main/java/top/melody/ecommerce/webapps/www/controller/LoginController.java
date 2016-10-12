package top.melody.ecommerce.webapps.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.common.util.StringUtil;
import top.melody.ecommerce.common.util.security.DES3;
import top.melody.ecommerce.platform.api.service.AccountService;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.www.base.UserSession;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Date: 15-2-11 下午1:54
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Controller
public class LoginController extends BaseController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource
    private ResourceBundleMessageSource i18nSource;

    @Resource
    private AccountService accountService;

    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();

        return new ModelAndView("/login", paramMap);
    }

    @RequestMapping(value = "/phone/login")
    @ResponseBody
    public String phoneLogin(HttpServletRequest request,
                             @RequestParam(value = "phone", required = true) String phone,
                             @RequestParam(value = "password", required = true) String password,
                             @RequestParam(value = "validateCode", required = true) String validateCode) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E);

        try {
            // verifyCode
            if (StringUtil.isEmpty(validateCode) || StringUtil.isEmpty(getVerifyCode(request))) {
                resultMsg.setMsg(i18nSource.getMessage("error.verify.code.empty", null, Locale.CHINA));
                return JsonMapper.nonEmptyMapper().toJson(resultMsg);
            }
            //ignore case
            if (!validateCode.equalsIgnoreCase(getVerifyCode(request))) {
                resultMsg.setMsg(i18nSource.getMessage("error.verify.code.error", null, Locale.CHINA));
                return JsonMapper.nonEmptyMapper().toJson(resultMsg);
            }

//            Account account = accountService.getByAccountName(phone);
//
//            if (account != null && DES3.encode(password).equals(account.getAccountPassword())) {
//                // set session
//                UserSession userSession = new UserSession();
//                userSession.setAccount(account);
//                saveUserInSession(request, userSession);
//            }

            resultMsg.setStatusCode(ResultMsg.CODE_S);
        } catch (Exception e) {
            logger.error("phone login occurred error.", e);
            resultMsg.setMsg(i18nSource.getMessage("error.exception", null, Locale.CHINA));
        }

        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) {
        removeUserFromSession(request);
        return new ModelAndView("redirect:/login");
    }
}
