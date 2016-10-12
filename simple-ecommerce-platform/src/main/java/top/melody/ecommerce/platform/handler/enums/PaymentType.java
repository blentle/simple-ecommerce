package top.melody.ecommerce.platform.handler.enums;


import top.melody.ecommerce.common.util.StringUtil;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/25 15:05
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/25 15:05
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public final class PaymentType implements Serializable{

    private static Map<String, PaymentType> map = new HashMap<String, PaymentType>();
    //在线支付
    public static PaymentType ONLINE = new PaymentType("online");

    private String code;

    private PaymentType() {

    }

    private PaymentType(String code) {
        if (!StringUtil.isEmpty(code)) {
            this.code = code.toLowerCase();
            map.put(this.code, this);
        }
    }

    public String getCode() {
        return this.code;
    }

    public static Collection<PaymentType> getAll() {
        return map.values();
    }

    public static PaymentType getByCode(String code) {
        if (!StringUtil.isEmpty(code)) {
            return map.get(code.toLowerCase());
        }
        return null;

    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj instanceof PaymentType) {
            return code.equalsIgnoreCase(((PaymentType) obj).getCode());
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
