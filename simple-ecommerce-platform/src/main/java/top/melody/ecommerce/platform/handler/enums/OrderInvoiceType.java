package top.melody.ecommerce.platform.handler.enums;

import top.melody.ecommerce.common.util.StringUtil;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;


public final class OrderInvoiceType implements Serializable {
    private static Map<String, OrderInvoiceType> map = new HashMap<String, OrderInvoiceType>();
    //不需要发票
    public static OrderInvoiceType DEF = new OrderInvoiceType("def");
    // 个人
    public static OrderInvoiceType PERSONAL = new OrderInvoiceType("personal");

    // 公司
    public static OrderInvoiceType COMPANY = new OrderInvoiceType("company");

    private String code;

    public OrderInvoiceType(String code) {
        if (!StringUtil.isEmpty(code)) {
            this.code = code.toLowerCase();
            map.put(this.code, this);
        }
    }

    public String getCode() {
        return code;
    }


    public static Map<String, OrderInvoiceType> getWmsOrderStatusMap() {
        return map;
    }

    public String toString() {
        return "WmsOrderStatus code is " + code;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj instanceof OrderInvoiceType) {
            return code.equalsIgnoreCase(((OrderInvoiceType) obj).getCode());
        } else {
            return false;
        }
    }

    public int hashCode() {
        return code.hashCode();
    }

    public static OrderInvoiceType getByCode(String c) {
        if (StringUtil.isEmpty(c)) {
            return null;
        }

        return map.get(c);
    }

    public static Collection<OrderInvoiceType> getAll() {
        return map.values();
    }
}
