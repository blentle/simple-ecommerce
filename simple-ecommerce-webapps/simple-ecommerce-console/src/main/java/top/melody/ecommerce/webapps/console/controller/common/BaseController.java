package top.melody.ecommerce.webapps.console.controller.common;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import top.melody.ecommerce.platform.api.domain.basedata.BasedataRegion;
import top.melody.ecommerce.platform.api.service.BasedataService;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * base controller
 * Created by zxdev on 15/2/2.
 * updateUser:renhuan
 * updateTime:2015/2/25 10:35
 * desc:add initBinder for properties editor convert
 */


public class BaseController  {
    @Resource
    private BasedataService basedataService;

    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        //binder.registerCustomEditor(GoodsType.class, new GoodsTypeEditor());
        //date binder,and more ...

    }

    public List<BasedataRegion> listProvince() throws Exception{
        List<BasedataRegion> returnValue = new ArrayList<BasedataRegion>();

        return returnValue;
    }

    public List<BasedataRegion> listDirectChildren(String regionId) throws Exception{
        List<BasedataRegion> returnValue = new ArrayList<BasedataRegion>();

        return returnValue;
    }
}
