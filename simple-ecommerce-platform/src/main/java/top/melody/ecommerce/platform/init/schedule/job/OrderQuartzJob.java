package top.melody.ecommerce.platform.init.schedule.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import top.melody.ecommerce.common.util.quartz.AbstractQuartzJob;
import top.melody.ecommerce.platform.api.service.OrderService;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/4/17 16:13
 * ModifyUser: renhuan
 * ModifyTime: 2015/4/17 16:13
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class OrderQuartzJob extends AbstractQuartzJob {

    private static final Logger logger = LoggerFactory.getLogger(OrderQuartzJob.class);
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        if(logger.isDebugEnabled()) {
            logger.debug("check goods is locked quartz job executing started ...");
        }
        OrderService orderService = (OrderService)jobExecutionContext.getJobDetail().getJobDataMap().get(OrderService.class.getName());
        try {
            //orderService.checkOrderAndAutoCancel();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("update goods status error");
        }
    }
}
