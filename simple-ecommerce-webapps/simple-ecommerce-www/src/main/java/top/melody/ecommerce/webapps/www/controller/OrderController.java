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
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.www.base.Constant;
import top.melody.ecommerce.platform.api.service.OrderService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/21 11:26
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/21 11:26
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
    @Resource
    private ResourceBundleMessageSource i18nSource;
    @Resource
    private OrderService orderService;

    @RequestMapping("/prepay/{orderCode}")
    public ModelAndView prePayOrder(@PathVariable("orderCode")String orderId) {
        String logicViewName = "order/order-generate-success";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {
//            Orders order = orderService.getOrder(orderId);
//            if(order == null) {
//                return new ModelAndView("error/404");
//            }
//            paramMap.put("order",order);
        } catch (Exception e) {
            logicViewName = "error/500";
            logger.error("order prepay error",e);
        }
        return new ModelAndView(logicViewName,paramMap);
    }

    @RequestMapping("/center")
    public ModelAndView queryOrderList(@RequestParam(value = "pager.offset", required = false, defaultValue = "0") Integer pagerOffset,
                                       @RequestParam(value = "maxPageItems", required = false, defaultValue = "10") Integer pageSize,
                                       HttpServletRequest request) {
        String logicViewName = "order/order-list";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {

        } catch (Exception e) {
            logger.error("occured exception when query invidual order !");
            e.printStackTrace();
            logicViewName = "error/500";
        }
        return new ModelAndView(logicViewName,paramMap);
    }
    @RequestMapping("/detail/{orderCode}")
    public ModelAndView getOrderDetetail(@PathVariable("orderCode")String orderCode) {
        String logicViewName = "order/order-detail";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        return new ModelAndView(logicViewName,paramMap);

    }
}
