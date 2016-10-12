package top.melody.ecommerce.webapps.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.platform.api.service.AccountService;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.www.base.Constant;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Locale;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/24 17:48
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/24 17:48
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
    @Resource
    private AccountService accountService;
    @Resource
    private ResourceBundleMessageSource i18nSource;

    @RequestMapping("/address/create")
    @ResponseBody
    public String createDeliverAddress(HttpServletRequest request,
                                       String realName,
                                       String province,
                                       String city,
                                       String district,
                                       String address,
                                       String mobile,
                                       String email) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E,i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED,null, Locale.CHINA));
        try {

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("create delivery address error",e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }

    @RequestMapping("/address/delete/{addressId}")
    @ResponseBody
    public String removeDeliverAddress(@PathVariable("addressId") int addressId, HttpServletRequest request) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E, i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED, null, Locale.CHINA));
        try {

        } catch (Exception e) {
            logger.error("delete delivery address error", e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }
}
