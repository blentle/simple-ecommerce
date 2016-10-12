/*
 * (C) 2013 NTCO platform Milipp
 */

package top.melody.ecommerce.common.util.quartz;

import org.quartz.SchedulerException;

public interface QuartzCronTrigger {
    //
    public void init() throws SchedulerException;

    //
    public void start() throws SchedulerException;
}
