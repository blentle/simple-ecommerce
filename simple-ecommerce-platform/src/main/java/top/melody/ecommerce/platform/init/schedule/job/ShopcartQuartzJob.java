package top.melody.ecommerce.platform.init.schedule.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import top.melody.ecommerce.common.util.quartz.AbstractQuartzJob;
import top.melody.ecommerce.platform.api.service.GoodsService;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/4/15 15:41
 * ModifyUser: renhuan
 * ModifyTime: 2015/4/15 15:41
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class ShopcartQuartzJob extends AbstractQuartzJob {

    private static final Logger logger = LoggerFactory.getLogger(ShopcartQuartzJob.class);
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        if(logger.isDebugEnabled()) {
            logger.debug("check goods is locked quartz job executing started ...");
        }
        GoodsService goodsService = (GoodsService)jobExecutionContext.getJobDetail().getJobDataMap().get(GoodsService.class.getName());
        try {
//            goodsService.checkAndUpdateStatus();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("update goods status error");
        }
    }
}
