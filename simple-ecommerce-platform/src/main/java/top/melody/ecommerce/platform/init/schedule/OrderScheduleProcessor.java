package top.melody.ecommerce.platform.init.schedule;

import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import top.melody.ecommerce.platform.api.service.GoodsService;
import top.melody.ecommerce.platform.api.service.OrderService;
import top.melody.ecommerce.platform.init.schedule.trigger.OrderQuartzTrigger;
import top.melody.ecommerce.platform.props.GlobalConfig;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/4/15 14:51
 * ModifyUser: renhuan
 * ModifyTime: 2015/4/15 14:51
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Component
public class OrderScheduleProcessor implements ApplicationListener<ContextRefreshedEvent> {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrderScheduleProcessor.class);
    @Resource
    private GoodsService goodsService;
    @Resource
    private OrderService orderService;
    @Resource
    private GlobalConfig globalConfig;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if(event.getApplicationContext().getParent() == null) {
            try {
                OrderQuartzTrigger trigger = new OrderQuartzTrigger(globalConfig, orderService);
                trigger.init();
                trigger.start();
            } catch (SchedulerException e) {
                LOGGER.error("occured exception when excute order timer....", e);
                e.printStackTrace();
            }
        }
    }
}
