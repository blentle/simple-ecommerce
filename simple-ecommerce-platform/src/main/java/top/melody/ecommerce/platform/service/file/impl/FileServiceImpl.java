package top.melody.ecommerce.platform.service.file.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import top.melody.ecommerce.platform.api.service.FileService;
import top.melody.ecommerce.platform.props.GlobalConfig;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/13 17:34
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/13 17:34
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
@Service
public class FileServiceImpl implements FileService{

    private static final Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);
    @Resource
    private GlobalConfig globalConfig;


    @Override
    public Map<String, String> saveUploadImgs(InputStream inputStream, String originalImgName) throws Exception {
        Map<String,String> imgMaps = new HashMap<String,String>();
        String rootPath = globalConfig.getFileRootPath();
        String fileServer = globalConfig.getFileServer();
        String pathPreffix = rootPath + fileServer;

        logger.debug("file root path is: 【{}】",rootPath);
        logger.debug("file server is: 【{}】",fileServer);
        return imgMaps;
    }
}
