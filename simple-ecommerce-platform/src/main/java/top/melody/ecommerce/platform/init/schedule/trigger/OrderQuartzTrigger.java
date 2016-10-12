package top.melody.ecommerce.platform.init.schedule.trigger;

import org.quartz.SchedulerException;
import top.melody.ecommerce.common.util.quartz.AbstractQuartzCronTrigger;
import top.melody.ecommerce.platform.api.service.OrderService;
import top.melody.ecommerce.platform.init.schedule.job.OrderQuartzJob;
import top.melody.ecommerce.platform.props.GlobalConfig;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/4/16 14:24
 * ModifyUser: renhuan
 * ModifyTime: 2015/4/16 14:24
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class OrderQuartzTrigger extends AbstractQuartzCronTrigger {

    private GlobalConfig globalConfig;
    private OrderService orderService;

    public OrderQuartzTrigger(GlobalConfig globalConfig, OrderService orderService) throws SchedulerException {
        this.globalConfig = globalConfig;
        this.orderService = orderService;
    }

    @Override
    public void init() throws SchedulerException {
        OrderQuartzJob orderQuartzJob = new OrderQuartzJob();
        orderQuartzJob.setJobData(orderService.getClass().getName(),orderService);
        addTriggerJob(orderQuartzJob, "orderTrigger", "orderJob", "orderGroup", globalConfig.getOrderCornExpression());
    }
}
