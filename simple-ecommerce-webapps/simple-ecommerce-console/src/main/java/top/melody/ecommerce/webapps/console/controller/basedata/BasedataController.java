package top.melody.ecommerce.webapps.console.controller.basedata;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.platform.api.domain.basedata.BasedataRegion;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.webapps.console.base.Constant;
import top.melody.ecommerce.webapps.console.controller.common.BaseController;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/1/29 9:38
 * ModifyUser: renhuan
 * ModifyTime: 2015/1/29 9:38
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/basedata")
public class BasedataController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(BasedataController.class);
    @Resource
    private ResourceBundleMessageSource i18nSource;

	@RequestMapping("/logisticscompany/list")
	public ModelAndView queryLogisticsCompanyListByPage(@RequestParam(required = false)String companyName,
														@RequestParam(value = "items", required = false, defaultValue = "0") Integer items,
														@RequestParam(value = "pager.offset", required = false, defaultValue = "0") Integer pagerOffset,
														@RequestParam(value = "maxPageItems", required = false, defaultValue = "10") Integer pageSize) {
		String logicViewName = "basedata/logisticscompany-list";
		Map<String,Object> paramMap = new HashMap<String,Object>();
		try {
			paramMap.put("companyName",companyName);
		} catch (Exception e) {
			logicViewName = "error/500";
			e.printStackTrace();
		}
		return new ModelAndView(logicViewName,paramMap);
	}



	@RequestMapping("/region/list")
	public ModelAndView queryAreaListByPage(@RequestParam(value = "items", required = false, defaultValue = "0") Integer items,
											@RequestParam(value = "pager.offset", required = false, defaultValue = "0") Integer pagerOffset,
											@RequestParam(value = "maxPageItems", required = false, defaultValue = "10") Integer pageSize) {
		String logicViewName = "basedata/region-list";
		Map<String,Object> paramMap = new HashMap<String,Object>();
		try {
//
//			paramMap.put("rows",regionMap.get("rows"));
//			paramMap.put("pageInfo",regionMap.get("pageInfo"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occured exception when query region list");
			logicViewName = "error/500";
		}
		return new ModelAndView(logicViewName,paramMap);
	}



	@RequestMapping("/logisticscompany/precreate")
	public String preCreateLogisticsCompany() {
		return "basedata/logisticscompany-add";
	}


	@RequestMapping("/logisticscompany/create")
	@ResponseBody
	public String createLogisticsCompany(String logisticsName,
							             String contactName,
							             String phone,
							             String desc,
							             @RequestParam(required = false,defaultValue = "1")int orderIndex) {
		ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E,i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED,null, Locale.CHINA));

		return JsonMapper.nonEmptyMapper().toJson(resultMsg);
	}



	@RequestMapping("/logisticscompany/preedit/{logisticsId}")
	public ModelAndView preEditLogistics(@PathVariable("logisticsId")int logisticsId) {
		String logicViewName = "basedata/logisticscompany-edit";
		Map<String,Object> paramMap = new HashMap<String,Object>();

		return new ModelAndView(logicViewName,paramMap);
	}

	@RequestMapping("/logisticscompany/edit")
	@ResponseBody
	public String editLogisticsCompany(int logisticsId,
							 String logisticsName,
							 String contactName,
							 String phone,
							 String desc,
							 @RequestParam(required = false,defaultValue = "1")int orderIndex) {
		ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E,i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED,null, Locale.CHINA));

		return JsonMapper.nonEmptyMapper().toJson(resultMsg);
	}
}
