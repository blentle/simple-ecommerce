package top.melody.ecommerce.platform.handler.enums;


import top.melody.ecommerce.common.util.StringUtil;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zxdev on 15/1/15.
 */
public class ActStatus implements Serializable{

    private static Map<String, ActStatus> map = new HashMap<String, ActStatus>();

    public static ActStatus UNACT = new ActStatus("n");
    public static ActStatus ACTED = new ActStatus("y");

    private String code;

    private ActStatus() {

    }

    private ActStatus(String code) {
        if (!StringUtil.isEmpty(code)) {
            this.code = code.toLowerCase();
            map.put(this.code, this);
        }
    }

    public String getCode() {
        return this.code;
    }




    public static Collection<ActStatus> getAll() {
        return map.values();
    }

    public static ActStatus getByCode(String code) {
        if (!StringUtil.isEmpty(code)) {
            return map.get(code.toLowerCase());
        }
        return null;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj instanceof ActStatus) {
            return code.equalsIgnoreCase(((ActStatus) obj).getCode());
        } else {
            return false;
        }
    }


    @Override
    public String toString() {
        return this.code.toString();
    }

    @Override
    public int hashCode() {
        return this.code.hashCode();
    }
}
