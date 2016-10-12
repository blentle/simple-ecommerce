package top.melody.ecommerce.webapps.console.controller.account;

import org.apache.shiro.authc.Account;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.common.util.StringUtil;
import top.melody.ecommerce.common.util.page.PageRows;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.console.base.Constant;
import top.melody.ecommerce.webapps.console.controller.common.BaseController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/11 17:57
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/11 17:57
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
    @Resource
    private ResourceBundleMessageSource i18nSource;

    @RequestMapping("/list")
    public ModelAndView queryAccountListByPage(@RequestParam(required = false)String loginName,
                                               @RequestParam(required = false)String nickName,
                                               @RequestParam(required = false)String countryCode,
                                               @RequestParam(value = "startDate",required = false)String registerStartDate,
                                               @RequestParam(value = "endDate",required = false)String registerEndDate,
                                               @RequestParam(value = "pager.offset", required = false, defaultValue = "0") Integer pagerOffset,
                                               @RequestParam(value = "maxPageItems", required = false, defaultValue = "10") Integer pageSize) {
        String logicViewName = "account/account-list";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {
            PageRows<Account> page = new PageRows<Account>();
            Map<String,Object> queryMap = new HashMap<String,Object>();
            if(!StringUtil.isEmpty(loginName)) {
                queryMap.put("loginName",loginName);
            }
            if(!StringUtil.isEmpty(nickName)) {
                queryMap.put("nickName",nickName);
            }
            if(!StringUtil.isEmpty(countryCode)) {
                queryMap.put("countryCode",countryCode);
            }
            if(!StringUtil.isEmpty(registerStartDate)) {
                queryMap.put("startDate",registerStartDate);
            }
            if(!StringUtil.isEmpty(registerEndDate)) {
                queryMap.put("endDate",registerEndDate);
            }

            paramMap.put("loginName",loginName);
            paramMap.put("nickName",nickName);
            paramMap.put("countryCode",countryCode);
            paramMap.put("startDate",registerStartDate);
            paramMap.put("endDate",registerEndDate);
        } catch (Exception e) {
            logicViewName = "error/500";
            logger.error("query account list by page error",e);
        }
        return new ModelAndView(logicViewName,paramMap);
    }

    @RequestMapping("/information/detail/{accountId}")
    public ModelAndView getAccountDetail(@PathVariable("accountId")int accountId) {
        String logicViewName = "account/account-information-detail";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {
            Account account = null;
            if(account != null) {
                //more....
            }
        } catch (Exception e) {
            logicViewName = "error/500";
            logger.error("get account information detail error",e);
        }
        return new ModelAndView(logicViewName,paramMap);
    }

    @RequestMapping("/operate")
    @ResponseBody
    public String operateAccount(int accountId) {
        ResultMsg resultMsg = new ResultMsg(i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED,null, Locale.CHINA));
        try {
//            Account account = accountService.getByAccountId(accountId);
//            if (account.getAccountStatus().equals(ActStatus.ACTED)) {
//                account.setAccountStatus(ActStatus.UNACT);
//                resultMsg.setMsg(i18nSource.getMessage("def.account.status.n.name",null,Locale.CHINA));
//            } else {
//                account.setAccountStatus(ActStatus.ACTED);
//                resultMsg.setMsg(i18nSource.getMessage("def.account.status.y.name", null, Locale.CHINA));
//            }
//            accountService.updateAccount(account);
            resultMsg.setStatusCode(ResultMsg.CODE_S);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("operate account failed", e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }
}
