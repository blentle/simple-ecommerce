package top.melody.ecommerce.webapps.console.controller.goods;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.platform.api.service.BasedataService;
import top.melody.ecommerce.platform.api.service.GoodsService;
import top.melody.ecommerce.platform.api.service.StoreService;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.console.base.Constant;
import top.melody.ecommerce.webapps.console.controller.common.BaseController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/3 15:37
 * ModifyUser: renhuan
 * ModifyTime: 2015/3/3 15:37
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
    @Resource
    private GoodsService goodsService;
    @Resource
    private BasedataService basedataService;
    @Resource
    private StoreService storeService;
    @Resource
    private ResourceBundleMessageSource i18nSource;

    @RequestMapping("/onsale/offsale")
    @ResponseBody
    public String onSaleOffSale(int goodsId) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E, i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED, null, Locale.CHINA));
        try {

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("onsale or offsale goods failed", e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }


}
