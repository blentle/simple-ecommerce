package top.melody.ecommerce.webapps.console.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/1/26 17:08
 * ModifyUser: renhuan
 * ModifyTime: 2015/1/26 17:08
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class HomeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/")
    public ModelAndView home() {
        String logicViewName = "home";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        //todo: may be put account infomation relative ...

        LOGGER.debug("--->>>query privilege tree");
        return new ModelAndView(logicViewName, paramMap);
    }

    @RequestMapping("/index")
    public ModelAndView index() {
        String logicViewName = "index/index";
        Map<String, Object> paramMap = new HashMap<String, Object>();
        //todo: may be put account infomation relative ...
        return new ModelAndView(logicViewName, paramMap);
    }

}
