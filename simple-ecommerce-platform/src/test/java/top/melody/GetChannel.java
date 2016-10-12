package top.melody;

import java.io.FileInputStream;

import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/4/7 15:32
 * ModifyUser: renhuan
 * ModifyTime: 2015/4/7 15:32
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class GetChannel {

    private final static int BSIZE = 1024;

    public static void main(String[] args) throws Exception {
        if(args.length < 2) {
            System.out.println("please input source file path and dest file path");
            System.exit(0);
        }
        FileChannel in = new FileInputStream(args[0]).getChannel();
        FileChannel out = new FileOutputStream(args[1]).getChannel();

        ByteBuffer buff = ByteBuffer.allocate(1024);

//        while(in.read(buff) !=-1) {
//            buff.flip();
//            out.write(buff);
//            buff.clear();
//        }
        //method 2:
        in.transferTo(0,in.size(),out);
    }
}
