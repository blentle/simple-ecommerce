package top.melody.ecommerce.platform.init;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/17 16:31
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/17 16:31
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Component
public class InitialCachePostProcessor implements ApplicationListener<ContextRefreshedEvent>{

    private static final Logger logger = LoggerFactory.getLogger(InitialCachePostProcessor.class);


    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if (event.getApplicationContext().getParent() == null) {
            logger.debug("begin to initial cache......");
            logger.debug("start to write BasedataDealer......");

        }
    }
}
