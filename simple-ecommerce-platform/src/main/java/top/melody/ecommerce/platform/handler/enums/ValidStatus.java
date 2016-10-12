package top.melody.ecommerce.platform.handler.enums;


import top.melody.ecommerce.common.util.StringUtil;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 */
@SuppressWarnings("serial")
public class ValidStatus implements Serializable {

    private static Map<String, ValidStatus> map = new HashMap<String, ValidStatus>();

    public static ValidStatus VALID = new ValidStatus("valid");
    public static ValidStatus INVALID = new ValidStatus("invalid");
    public static ValidStatus REMOVED = new ValidStatus("removed");

    private String code;

    private ValidStatus(String code) {
        if (!StringUtil.isEmpty(code)) {
            this.code = code.toLowerCase();
            map.put(this.code, this);
        }
    }

    private ValidStatus() {

    }

    public String getCode() {
        return code;
    }


    public static Map<String, ValidStatus> getStatusMap() {
        return map;
    }

    public String toString() {
        return "ValidStatus code:" + code;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj instanceof ValidStatus) {
            return code.equalsIgnoreCase(((ValidStatus) obj).getCode());
        } else {
            return false;
        }
    }

    public int hashCode() {
        return code.hashCode();
    }

    public static ValidStatus getByCode(String c) {
        if (StringUtil.isEmpty(c))
            return null;
        return map.get(c);
    }

    public static Collection<ValidStatus> getAll() {
        return map.values();
    }
}
