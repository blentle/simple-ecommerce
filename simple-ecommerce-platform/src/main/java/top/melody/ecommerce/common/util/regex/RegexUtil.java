package top.melody.ecommerce.common.util.regex;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtil {

    public static boolean contain(String src, Pattern p) {
        return p != null && p.matcher(src).matches();
    }

    /**
     * has one matches true,return true
     *
     * @param src
     * @param ps
     * @return
     */
    public static boolean contain(String src, Set<Pattern> ps) {
        boolean returnValue = false;

        if (ps == null) {
            return returnValue;
        }

        for (Pattern p : ps) {
            returnValue = returnValue || contain(src, p);
        }

        return returnValue;
    }

    public static boolean match(String src, Pattern p) {
        return p == null || p.matcher(src).matches();
    }

    /**
     * all matchs true,return true,
     *
     * @param src
     * @param ps
     * @return
     */
    public static boolean match(String src, Set<Pattern> ps) {
        boolean returnValue = true;

        if (ps == null) {
            return returnValue;
        }

        for (Pattern p : ps) {
            returnValue = returnValue && match(src, p);
        }

        return returnValue;
    }


    public static List<Map<String, String>> fetch(String src, Pattern p, Integer size) {
        List<Map<String, String>> returnValue = new ArrayList<Map<String, String>>();
        Matcher matcher = p.matcher(src);
        while (matcher.find()) {
//            Map<String, String> fetchData = new HashMap<String, String>();
//
//            fetchData.put(String.valueOf(0), matcher.group());
//            for (int i = 1; i <= matcher.groupCount(); i++) {
//                fetchData.put(String.valueOf(i), matcher.group(i));
//            }
            Map<String, String> fetchData = fetchData(matcher);
            returnValue.add(fetchData);
            if (size != null && returnValue.size() >= size) {
                break;
            }
        }

        return returnValue;
    }

    public static String replace(final String src, Pattern p, NamedTemplate template) {
        String returnValue = src;

        Matcher matcher = p.matcher(src);
        while (matcher.find()) {
            //fetch the data.
//            Map<String, String> fetchData = new HashMap<String, String>();
//
//            String original = matcher.group();
//            fetchData.put(String.valueOf(0), original);
//            for (int i = 1; i <= matcher.groupCount(); i++) {
//                fetchData.put(String.valueOf(i), matcher.group(i));
//            }
            Map<String, String> fetchData = fetchData(matcher);
            //replace with namedtemplate.
            if (template == null) {
                returnValue = returnValue.replace(fetchData.get("0"), "");
            } else {
                returnValue = returnValue.replace(fetchData.get("0"), template.format(fetchData));
            }
        }

        return returnValue;
    }

    /**
     * 利用正则表达式的源生模板替换，模板参数是$0-$9
     *
     * @param src        匹配的文本
     * @param p          正则表达式的pattern
     * @param template   模板其中能匹配的参数$0-$9 $0是匹配的全文本 $1-$9是捕获组的数据
     * @param replaceNum 替换的次数 -1匹配所有
     * @return
     */
    public static String replace(final String src, Pattern p, String template, int replaceNum) {
        Matcher matcher = p.matcher(src);
        StringBuffer resutlStringBuffer = new StringBuffer();

        int replaceIdx = 1;
        while (matcher.find() && (replaceIdx < replaceNum || replaceNum <= -1)) {
            matcher.appendReplacement(resutlStringBuffer, template);
            replaceIdx++;
        }
        matcher.appendTail(resutlStringBuffer);
        return resutlStringBuffer.toString();
    }

    //fetch data
    //key 0 is orignal partern string
    private static Map<String, String> fetchData(Matcher matcher) {
        Map<String, String> fetchData = new HashMap<String, String>();

        fetchData.put(String.valueOf(0), matcher.group());
        for (int i = 1; i <= matcher.groupCount(); i++) {
            fetchData.put(String.valueOf(i), matcher.group(i));
        }
        return fetchData;
    }
}
