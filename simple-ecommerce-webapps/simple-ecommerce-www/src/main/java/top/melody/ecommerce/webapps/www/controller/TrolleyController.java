package top.melody.ecommerce.webapps.www.controller;

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
import top.melody.ecommerce.platform.api.service.AccountService;
import top.melody.ecommerce.platform.api.service.BasedataService;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.www.base.Constant;

import top.melody.ecommerce.platform.api.service.GoodsService;
import top.melody.ecommerce.platform.api.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/18 15:26
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/18 15:26
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/trolley")
public class TrolleyController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(TrolleyController.class);
    @Resource
    private GoodsService goodsService;
    @Resource
    private OrderService orderService;
    @Resource
    private AccountService accountService;
    @Resource
    private BasedataService basedataService;
    @Resource
    private ResourceBundleMessageSource i18nSource;

    @RequestMapping("/goods/put")
    @ResponseBody
    public String putGoods(int goodsId,
                           HttpServletRequest request,
                           HttpServletResponse response) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E, i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED, null, Locale.CHINA));
        try {

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("put goods into trolley error", e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }

    @RequestMapping("/goods/show")
    public ModelAndView showTrolley(HttpServletRequest request) {
        String logicViewName = "trolley/trolley-goods-show";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        try {

        } catch (Exception e) {
            logger.error("occured exception when query account's shopcart detail list");
            logicViewName = "error/500";
        }
        return new ModelAndView(logicViewName, paramMap);
    }

    @RequestMapping("/goods/remove")
    @ResponseBody
    public String removeGoodsFromTrolley(@RequestParam(required = false) String goodsIds,
                                         HttpServletRequest request,
                                         HttpServletResponse response) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E, i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED, null, Locale.CHINA));
        try {

        } catch (Exception e) {
            logger.error("remove goods from trolley error", e);
            e.printStackTrace();
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }

    @RequestMapping("/commit/{data}")
    public ModelAndView commintTrolley(@PathVariable("data") String data,
                                       HttpServletRequest request) {
        //write distriute address......
        String logicViewName = "trolley/distribute-address-confirm";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        try {

        } catch (Exception e) {
            logicViewName = "error/500";
            e.printStackTrace();
        }
        return new ModelAndView(logicViewName, paramMap);
    }

    @RequestMapping("/order/commit")
    @ResponseBody
    public String generatorOrder(String detailIds,
                                 String orderType,
                                 @RequestParam(required = false, defaultValue = "0") int addressId,
                                 @RequestParam(required = false, defaultValue = "0") int serviceSiteId,
                                 @RequestParam(required = false) String bookingRealName,
                                 @RequestParam(required = false) String bookingMobile,
                                 @RequestParam(required = false, defaultValue = "def") String invoiceType,
                                 @RequestParam(required = false) String invoiceCompany,
                                 @RequestParam(required = false) String invoiceTitle,
                                 HttpServletRequest request) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E, i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED, null, Locale.CHINA));
        try {

        } catch (Exception e) {
            logger.error("generate order failed ...", e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }

    @RequestMapping("/buynow/{goodsIds}")
    public ModelAndView buyNow(@PathVariable("goodsIds")String goodsIds,
                               HttpServletRequest request) {
        String logicViewName = "trolley/buynow-confirm";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        try {

        } catch (Exception e) {
            logicViewName = "error/500";
            logger.error("buy now error !");
        }
        return new ModelAndView(logicViewName, paramMap);
    }
    @RequestMapping("/buynow/confirm")
    @ResponseBody
    public String buyNowDirectly(String detailIds,
                                 String orderType,
                                 @RequestParam(required = false, defaultValue = "0") int addressId,
                                 @RequestParam(required = false, defaultValue = "0") int serviceSiteId,
                                 @RequestParam(required = false) String bookingRealName,
                                 @RequestParam(required = false) String bookingMobile,
                                 @RequestParam(required = false, defaultValue = "def") String invoiceType,
                                 @RequestParam(required = false) String invoiceCompany,
                                 @RequestParam(required = false) String invoiceTitle,
                                 HttpServletRequest request) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E, i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED, null, Locale.CHINA));
        try {

        } catch (Exception e) {
            logger.error("generate order failed ...", e);
            e.printStackTrace();
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }
}