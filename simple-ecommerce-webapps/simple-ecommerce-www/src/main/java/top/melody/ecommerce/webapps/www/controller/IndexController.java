package top.melody.ecommerce.webapps.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import top.melody.ecommerce.platform.props.GlobalConfig;

import javax.servlet.http.HttpServletRequest;

/**
 * Date: 15-1-30 下午2:38
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Controller
public class IndexController {
    private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

    private static final String INDEX = "index";

    @Autowired
    private GlobalConfig globalConfig;

    @RequestMapping(value = {"/index","/"}, method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++");
        request.getSession().getServletContext().setAttribute("imgDomain", globalConfig.getImgDomain());
        return new ModelAndView(INDEX);
    }
}
