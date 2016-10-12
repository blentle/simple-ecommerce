package top.melody.ecommerce.platform.api.service;

import java.io.InputStream;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/13 17:33
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/13 17:33
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public interface FileService {

    Map<String,String> saveUploadImgs(InputStream inputStream,String originalImgName) throws Exception;
}
