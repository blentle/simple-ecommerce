package top.melody.ecommerce.platform.handler.enums;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/1/28 16:11
 * ModifyUser: renhuan
 * ModifyTime: 2015/1/28 16:11
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public final class RegionLevel implements Serializable {

    private static Map<Integer, RegionLevel> map = new HashMap<Integer, RegionLevel>();

    public static RegionLevel PROVINCE = new RegionLevel(1);
    public static RegionLevel CITY = new RegionLevel(2);
    public static RegionLevel DISTRICT = new RegionLevel(3);
    public static RegionLevel STREET = new RegionLevel(4);
    private int code;

    private RegionLevel() {

    }

    private RegionLevel(int code) {
        if (code > 0) {
            this.code = code;
            map.put(this.code, this);
        }
    }

    public int getCode() {
        return code;
    }


    public static Map<Integer, RegionLevel> getRegionTypeMap() {
        return map;
    }

    public String toString() {
        return "region code:" + code;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj instanceof RegionLevel) {
            return code == (((RegionLevel) obj).getCode());
        } else {
            return false;
        }
    }

    public int hashCode() {
        return Integer.valueOf(code).hashCode();
    }

    public static RegionLevel getByCode(int code) {
        if (code < 0) {
            return null;
        }
        return map.get(code);
    }

    public static Collection<RegionLevel> getAll() {
        return map.values();
    }
}
