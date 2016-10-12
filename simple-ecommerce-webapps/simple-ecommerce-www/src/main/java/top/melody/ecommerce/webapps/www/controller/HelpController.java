package top.melody.ecommerce.webapps.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Date: 15-2-9 下午3:31
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
@Controller
public class HelpController {
    private static final String HELP_VIEW_PREFIX = "/help/";
    private static final String HELP_DEFAULT_VIEW = "/help/help";

    @RequestMapping(value = "/help")
    public ModelAndView defaultHelp(HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("panel","panel-1");
        paramMap.put("pageName", "faq");
        paramMap.put("url", "/help/faq");

        return new ModelAndView(HELP_DEFAULT_VIEW, paramMap);
    }

    @RequestMapping(value = "/help/{pageName}")
    public ModelAndView helpTabPage(HttpServletRequest request,
                                    @PathVariable("pageName") String pageName) {
        Map<String, Object> paramMap = new HashMap<String, Object>();

        String[] str = pageName.split("#");
        String page = str[0];

        if(str.length>=2){
            paramMap.put("tab", str[1]);
        }

        return new ModelAndView(HELP_VIEW_PREFIX + page, paramMap);
    }

    // 帮助页，定位URL：panel第?层面板，pageName?个页面
    @RequestMapping(value = "/help/{panel}/{pageName}")
    public ModelAndView helpPanelTab(HttpServletRequest request,
                                     @PathVariable("panel") String panel,
                                     @PathVariable("pageName") String pageName) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("panel", panel);
        paramMap.put("pageName", pageName);
        paramMap.put("url", "/help/" + pageName);

        return new ModelAndView(HELP_DEFAULT_VIEW, paramMap);
    }

}
