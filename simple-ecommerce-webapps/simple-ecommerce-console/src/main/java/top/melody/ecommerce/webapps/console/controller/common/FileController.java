package top.melody.ecommerce.webapps.console.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.melody.ecommerce.common.util.JsonMapper;
import top.melody.ecommerce.platform.handler.enums.ResultMsg;
import top.melody.ecommerce.platform.props.GlobalConfig;
import top.melody.ecommerce.webapps.console.base.Constant;

import javax.annotation.Resource;
import java.util.Locale;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/12 17:03
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/12 17:03
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/ajax/file")
public class FileController {

    private final static Logger logger = LoggerFactory.getLogger(FileController.class);
    @Resource
    private ResourceBundleMessageSource i18nSource;
    @Resource
    private GlobalConfig globalConfig;

    @RequestMapping("/images/upload")
    @ResponseBody
    public String uploadAndCut(@RequestParam("file")MultipartFile file) {
        ResultMsg resultMsg = new ResultMsg(ResultMsg.CODE_E,i18nSource.getMessage(Constant.ERROR_OPERATE_FAILED,null, Locale.CHINA));
        try {
            if(file != null) {
                String fileName = file.getOriginalFilename();
                logger.debug("file name is:【{}】",fileName);
                String rootPath = globalConfig.getFileRootPath();
                String server = globalConfig.getFileServer();

                resultMsg.setMsg(JsonMapper.nonEmptyMapper().toJson(rootPath));
                resultMsg.setStatusCode(ResultMsg.CODE_S);
            }
        } catch (Exception e) {
            logger.error("upload images failed",e);
        }
        return JsonMapper.nonEmptyMapper().toJson(resultMsg);
    }

}
