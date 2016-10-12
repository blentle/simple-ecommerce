package top.melody.ecommerce.common.util;

import java.util.Collection;
import java.util.Map;

/**
 * @author <a href=mailto:xuyongming@milipp.com>Xu Yongming</a>
 */
public class CollectionUtil {

    public static <T> boolean isEmpty(Collection<T> c) {
        return c == null || c.isEmpty();
    }

    public static <K, V> boolean isEmpty(Map<K, V> m) {
        return m == null || m.isEmpty();
    }

    public static String join(Collection<String> c, String split) {
        StringBuffer strBuf = new StringBuffer();

        if (c != null) {
            int i = 1;
            int size = c.size();

            for (String s : c) {
                if (i < size) {
                    strBuf.append(s).append(split);
                } else {
                    strBuf.append(s);
                }

                i++;
            }
        }

        return strBuf.toString();
    }
}
