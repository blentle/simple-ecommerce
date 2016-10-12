package top.melody;

import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/13 10:23
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/13 10:23
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class BinaryTest {
    public static void main(String[] args) {
//        int a = 32;
//        int b = 1023;
//        int c = a&b;
//        int c = 1 << 9;
//        System.err.println("c>>>" + c);
//        String mobile = "13717-83-2007";
//        if (StringUtil.isEmpty(mobile))
//            throw new NullPointerException("mobile should not be null");
//        char[] a = mobile.toCharArray();
//        for(char b : a) {
//            if(Character.isDigit(b)) {
//                System.out.println(b);
//            } else {
//                System.err.println(b+" is not a number");
//            }
//
//        }
//        Map<Integer,Integer> map = new HashMap<Integer,Integer>();
//        map.put(1,1);
//        map.put(2,2);
//        map.put(3,3);
//        map.put(4,4);
//        Map<Integer,Integer> list = map;
//        list.remove(1);
//        for(int a : list.values()) {
//            System.out.println(a);
//        }
//        for(int b : map.values()) {
//            System.err.println(b);
//        }

//        String mobile = "13333333333";
//        Map<Integer,Integer> exclude = new HashMap<Integer,Integer>();
//        exclude.putAll(GlobalConfig.getDigitsMap());
//        int result = 0;
//        char[] charArr = mobile.toCharArray();
//        for(char b : charArr) {
//            if(Character.isDigit(b)) {
//                int digit = Integer.parseInt(String.valueOf(b));
//                if(exclude.containsKey(digit)) {
//                    exclude.remove(digit);
//                }
//            }
//        }
//        for(int value : exclude.values()) {
//            result += value;
//        }
//        System.out.println(result);
//        Goods g = new Goods();
//        System.out.println("class>>>>" + Goods.class);
//        System.out.println("instance>>>" + g.getClass());
        Properties p = System.getProperties();
    }


}
