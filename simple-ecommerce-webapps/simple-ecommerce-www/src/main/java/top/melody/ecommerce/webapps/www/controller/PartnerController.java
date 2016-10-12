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
public class PartnerController {
    private static final Logger logger = LoggerFactory.getLogger(PartnerController.class);

    private static final String PARTNER_VIEW = "partners";

    @RequestMapping("/partner")
    public ModelAndView about() {
        return new ModelAndView(PARTNER_VIEW);
    }
}
