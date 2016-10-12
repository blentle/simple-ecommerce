/*
 * (C) 2013 NTCO platform Milipp
 */

/**
 * (C) 2010 Fivewh platform platform.com
 */
package top.melody.ecommerce.common.util.quartz;

import org.quartz.Job;
import org.quartz.JobDataMap;

public abstract class AbstractQuartzJob implements Job {
    private JobDataMap jobDataMap = new JobDataMap();

    public void setJobData(String key, Object obj) {
        jobDataMap.put(key, obj);
    }

    public Object getJobData(String key) {
        return jobDataMap.get(key);
    }

    public JobDataMap getJobDataMap() {
        return jobDataMap;
    }
}
