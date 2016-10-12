package top.melody.ecommerce.webapps.console.controller.order;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.platform.api.service.AccountService;
import top.melody.ecommerce.platform.api.service.OrderService;
import top.melody.ecommerce.platform.handler.enums.ActStatus;
import top.melody.ecommerce.platform.handler.enums.OrderStatus;
import top.melody.ecommerce.webapps.console.controller.common.BaseController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;


/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/30 9:19
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/30 9:19
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
    @Resource
    private OrderService orderService;
    @Resource
    private AccountService accountService;

    @RequestMapping("/list")
    public ModelAndView queryOrderDtoList(@RequestParam(required = false)String orderCode,
                                          @RequestParam(required = false)String orderStatus,
                                          @RequestParam(required = false)String shipStatus,
                                          @RequestParam(required = false)String paymentStatus,
                                          @RequestParam(required = false)String orderType,
                                          @RequestParam(value = "pager.offset", required = false, defaultValue = "0") Integer pagerOffset,
                                          @RequestParam(value = "maxPageItems", required = false, defaultValue = "10") Integer pageSize) {
        String logicViewName = "order/order-list";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {
//            Orders queryEntity = new Orders();
//            if(!StringUtil.isEmpty(orderCode)) {
//                queryEntity.setOrderCode(orderCode);
//            }
//            if(!StringUtil.isEmpty(orderStatus)) {
//                queryEntity.setOrderStatus(OrderStatus.getByCode(orderStatus));
//            }
//            if(!StringUtil.isEmpty(shipStatus)) {
//                queryEntity.setShipStatus(ActStatus.getByCode(shipStatus));
//            }
//            if(!StringUtil.isEmpty(paymentStatus)) {
//                queryEntity.setPaymentStatus(ActStatus.getByCode(paymentStatus));
//            }
//            if(!StringUtil.isEmpty(orderType)) {
//                queryEntity.setNeedDistribute(OrderType.getByCode(orderType));
//            }
//            Page<Orders> page = new Page<Orders>(pagerOffset / pageSize + 1, pageSize);
//            Map<String,Object> returnMap = orderService.queryOrderDTOListByPage(page,queryEntity);
            paramMap.put("orderCode",orderCode);
            paramMap.put("orderStatus",orderStatus);
            paramMap.put("shipStatus",shipStatus);
            paramMap.put("paymentStatus",paymentStatus);
            paramMap.put("orderType",orderType);
            paramMap.put("orderStatusList", OrderStatus.getAll());
            paramMap.put("shipStatusList", ActStatus.getAll());
            paramMap.put("paymentStatusList",ActStatus.getAll());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("query order list error",e);
            logicViewName = "error/500";
        }
        return new ModelAndView(logicViewName,paramMap);
    }

    @RequestMapping("/detail/{orderCode}")
    public ModelAndView getOrderDetail(@PathVariable("orderCode")String orderCode) {
        String logicViewName = "order/order-detail";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {
//            Orders order = orderService.getOrder(orderCode);
//            if(order != null) {
//                Account account = accountService.getByAccountId(order.getAccountId());
//                OrderContactInfo contactInfo = orderService.getOrderContact(orderCode);
//                AccountBookingDTO accountBooking = accountService.getAccountBookingByRelationId(orderCode);
//                paramMap.put("account",account);
//                paramMap.put("orderDetailList",orderService.queryOrderDetailListByOrderCode(orderCode));
//                paramMap.put("order",order);
//                paramMap.put("accountBooking",accountBooking);
//                paramMap.put("orderContact",contactInfo);
//                paramMap.put("postOrderType",OrderType.POST);
//                paramMap.put("bySelfOrderType",OrderType.BYSELF);
//            }
        } catch (Exception e) {
            logicViewName = "error/500";
            logger.error("query order detail error !",e);
        }
        return new ModelAndView(logicViewName,paramMap);
    }
}
