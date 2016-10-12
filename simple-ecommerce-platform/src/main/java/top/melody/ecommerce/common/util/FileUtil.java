package top.melody.ecommerce.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class FileUtil {

    private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

    public static String SYSTEM_FILE_SEPARATOR = System.getProperty("file.separator");

    public static boolean isFileOrDirExist(String fileOrDirName) {
        boolean returnValue = false;

        File fileOrDir = new File(fileOrDirName);
        if (fileOrDir.exists()) {
            returnValue = true;
        }

        fileOrDir = null;

        return returnValue;
    }

    public static boolean createDirectory(String directoryName)
            throws FileNotFoundException {
        return createDirectory(directoryName, SYSTEM_FILE_SEPARATOR, false);
    }

    public static boolean createDirectory(String directoryName,
                                          String dirSeparator, boolean recursion)
            throws FileNotFoundException {
        File direct = null;

        if (recursion) {
            if (dirSeparator == null || "".equals(dirSeparator)) {
                dirSeparator = SYSTEM_FILE_SEPARATOR;
            }

            String[] tempDirs = StringUtil.replace(directoryName, dirSeparator, "/", 1).split("/");
            String curDirName = "";

            if (tempDirs == null || tempDirs.length < 1) {
                throw new FileNotFoundException(
                        "File or direction name is incorrect.");
            }

            for (int i = 0; i < tempDirs.length; i++) {
                curDirName += tempDirs[i] + dirSeparator;
                direct = new File(curDirName);

                if (direct.exists()) {
                    continue;
                }

                if (!direct.mkdir()) {
                    return false;
                }
            }

            return true;
        } else {
            direct = new File(directoryName);

            if (direct.exists()) {
                return true;
            }

            return direct.mkdirs();
        }
    }

    /**
     *
     * @param inputStream
     * @param fileName eg :a.xls
     * @param response
     * @throws IOException
     * desc: used for file download or export
     */
    public static void download(InputStream inputStream,String fileName,HttpServletResponse response,boolean isExcel) throws IOException {
        byte[] buffer = new byte[8192];
        OutputStream outputStream = null;
        try {
            response.setCharacterEncoding("utf-8");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"),"iso8859-1"));
            if(isExcel) {
                //resolve the filename show's problem in IE explorer
                response.setContentType("application/msexcel");
            } else {
                response.setContentType("application/x-download");
            }
            outputStream = new BufferedOutputStream(response.getOutputStream());
            int hasRead = 0;
            while ((hasRead =inputStream.read(buffer)) != -1) {
                outputStream.write(buffer,0,hasRead);
            }
            outputStream.flush();
        } finally {
            if(outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    logger.error("close output stram error",e);
                    e.printStackTrace();
                }
            }
            if(inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    logger.error("close input stram error",e);
                    e.printStackTrace();
                }
            }
        }
    }
}
