package top.melody.ecommerce.webapps.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Date: 15-1-30 下午4:53
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Controller
public class AboutController {
    private static final Logger logger = LoggerFactory.getLogger(AboutController.class);

    private static final String ABOUT_VIEW = "about";
    private static final String USER_AGREEMENT = "userAgreement";
    private static final String USER_TERMS = "userTerms";

    @RequestMapping("/about")
    public ModelAndView about(){
        return new ModelAndView(ABOUT_VIEW);
    }

    @RequestMapping("/user/agreement")
    public ModelAndView userAgreement() {
        return new ModelAndView(USER_AGREEMENT);
    }

    @RequestMapping("/user/terms")
    public ModelAndView userTerms() {
        return new ModelAndView(USER_TERMS);
    }
}
