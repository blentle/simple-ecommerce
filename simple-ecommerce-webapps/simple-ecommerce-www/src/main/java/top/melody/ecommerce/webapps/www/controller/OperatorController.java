package top.melody.ecommerce.webapps.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Date: 15-1-30 下午4:51
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Controller
public class OperatorController {
    private static final Logger logger = LoggerFactory.getLogger(OperatorController.class);

    private static final String OPERATOR_VIEW = "operators";

    @RequestMapping("/operator")
    public ModelAndView about() {
        return new ModelAndView(OPERATOR_VIEW);
    }
}
