package top.melody.ecommerce.webapps.console.controller.store;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.common.util.StringUtil;
import top.melody.ecommerce.platform.api.service.BasedataService;
import top.melody.ecommerce.platform.api.service.StoreService;
import top.melody.ecommerce.webapps.console.base.Constant;
import top.melody.ecommerce.webapps.console.controller.common.BaseController;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/5 19:47
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/5 19:47
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/store")
public class StoreController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(StoreController.class);

    private final static String DEFAULT_DELIMITER = ",";
    @Resource
    private BasedataService basedataService;
    @Resource
    private StoreService storeService;
    @Resource
    private ResourceBundleMessageSource i18nSource;
    @RequestMapping("/store/list")
    public ModelAndView queryStoreListByPage(@RequestParam(required = false)String countryCode,
                                             @RequestParam(required = false,defaultValue = "0")int operatorId,
                                             @RequestParam(required = false)String storeName,
                                             @RequestParam(value = "pager.offset", required = false, defaultValue = "0") Integer pagerOffset,
                                             @RequestParam(value = "maxPageItems", required = false, defaultValue = "10") Integer pageSize){
        String logicViewName = "store/store-list";
        Map<String,Object> paramMap = new HashMap<String,Object>();
        try {
//            paramMap.put("countryList",basedataService.queryBasedataCountry(new BasedataCountry()));
//            paramMap.put("operatorList",basedataService.queryBasedataOperator(operator));
//            paramMap.put("countryCode",countryCode);
//            paramMap.put("operatorId",operatorId);
//            paramMap.put("storeName",storeName);
        } catch (Exception e) {
            logger.error("query store list error...",e);
            logicViewName = "error/500";
        }
        return new ModelAndView(logicViewName,paramMap);
    }
}
