package top.melody.ecommerce.webapps.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.melody.ecommerce.common.util.CollectionUtil;
import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.platform.api.domain.basedata.BasedataRegion;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.www.base.Constant;


import javax.annotation.Resource;
import java.util.List;
import java.util.Locale;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/24 15:36
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/24 15:36
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/basedata")
public class BasedataController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(BasedataController.class);
    @Resource
    private ResourceBundleMessageSource i18nSource;

}
