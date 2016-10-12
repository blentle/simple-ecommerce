package top.melody.ecommerce.platform.handler.enums;


import top.melody.ecommerce.common.util.StringUtil;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public final class OrderStatus implements Serializable {
    private static Map<String, OrderStatus> map = new HashMap<String, OrderStatus>();

    private static Map<String, OrderStatus> wmsOrderStatusMap = new HashMap<String, OrderStatus>();

    private static Map<String, OrderStatus> queryStatusMap = new HashMap<String, OrderStatus>();

    private String code;
    //是否可见
    private boolean isVisible;

    private static final Integer ENABLE_VISIBLE = 1;

    //是否是库房订单状态
    private static final Integer IS_WMS_ORDER_STATUS = 2;
    //是否可打印
    private boolean enablePrint;
    private static final Integer ENABLE_PRINT = 4;
    //是否可退回
    private boolean enableReBack;
    private static final Integer ENABLE_RE_BACK = 8;
    //是否需要虚拟库存
    private boolean releaseVirtual;
    private static final Integer RELEASE_VIRTUAL = 16;

    //是否是库房订单状态
    private static final Integer IS_QUERY_ORDER_STATUS = 32;

    // 是否可以重置物流公司
    private boolean enableResetLogistics;
    private static final Integer ENABLE_RESET_LOGISTICS = 64;

    // def
    public static OrderStatus DEF = new OrderStatus("def", 0);

    // unconfirmed 未确认(待确认)
    public static OrderStatus UNCONFIRMED = new OrderStatus("unconfirmed", ENABLE_RE_BACK + RELEASE_VIRTUAL + IS_QUERY_ORDER_STATUS + ENABLE_RESET_LOGISTICS);

    // canceled 已取消
    public static OrderStatus CANCELED = new OrderStatus("Canceled", IS_WMS_ORDER_STATUS + IS_QUERY_ORDER_STATUS);

    // distribute 准备发货
    public static OrderStatus DISTRIBUTE = new OrderStatus("Distribute", ENABLE_VISIBLE + IS_WMS_ORDER_STATUS + ENABLE_RE_BACK + ENABLE_RESET_LOGISTICS + RELEASE_VIRTUAL + IS_QUERY_ORDER_STATUS);

    // distributing 发货中
    public static OrderStatus DISTRIBUTING = new OrderStatus("Distributing", ENABLE_VISIBLE + IS_WMS_ORDER_STATUS + ENABLE_PRINT + IS_QUERY_ORDER_STATUS+ENABLE_RESET_LOGISTICS);

    // sorting 物流筛单中
    public static OrderStatus SORTING = new OrderStatus("Sorting", IS_WMS_ORDER_STATUS + ENABLE_PRINT + ENABLE_RE_BACK + RELEASE_VIRTUAL+ENABLE_RESET_LOGISTICS);

    // sorted 已确认物流
    public static OrderStatus SORTED = new OrderStatus("Sorted", IS_WMS_ORDER_STATUS + ENABLE_PRINT + ENABLE_RE_BACK + RELEASE_VIRTUAL+ENABLE_RESET_LOGISTICS);

    // picking 订单已打印 分拣中...
    public static OrderStatus PICKING = new OrderStatus("Picking", IS_WMS_ORDER_STATUS + ENABLE_RE_BACK +ENABLE_PRINT + ENABLE_RESET_LOGISTICS);

    // pickup 分拣完成
    public static OrderStatus PICKUP = new OrderStatus("PickUp", IS_WMS_ORDER_STATUS + ENABLE_RE_BACK + ENABLE_PRINT + ENABLE_RESET_LOGISTICS);

    // 分箱完成
    public static OrderStatus BOXED = new OrderStatus("Boxed", IS_WMS_ORDER_STATUS + ENABLE_PRINT + ENABLE_RESET_LOGISTICS);

    // 已验证
    public static OrderStatus CHECKED = new OrderStatus("Checked", IS_WMS_ORDER_STATUS + ENABLE_PRINT + ENABLE_RESET_LOGISTICS);

    // packaged 已打包
    public static OrderStatus PACKAGED = new OrderStatus("Packaged", ENABLE_VISIBLE + IS_WMS_ORDER_STATUS + ENABLE_PRINT);

    // weighted 已称重
    public static OrderStatus WEIGHTED = new OrderStatus("Weighted", IS_WMS_ORDER_STATUS + ENABLE_PRINT);

    // wait shipping 等待物流取货
    public static OrderStatus WAIT_SHIPPING = new OrderStatus("WaitShipping", IS_WMS_ORDER_STATUS + ENABLE_PRINT);

    // shipped 已发货
    public static OrderStatus SHIPPED = new OrderStatus("shipped", ENABLE_VISIBLE + IS_WMS_ORDER_STATUS + ENABLE_PRINT + IS_QUERY_ORDER_STATUS);

    // complete 已完成
    public static OrderStatus COMPLETE = new OrderStatus("complete", ENABLE_VISIBLE + IS_WMS_ORDER_STATUS + ENABLE_PRINT + IS_QUERY_ORDER_STATUS);

    // OutOfStock 缺货
    public static OrderStatus OUT_OF_STOCK = new OrderStatus("OutOfStock", ENABLE_VISIBLE + IS_WMS_ORDER_STATUS + ENABLE_PRINT + ENABLE_RE_BACK + RELEASE_VIRTUAL + IS_QUERY_ORDER_STATUS);

    // 返回财务
    public static OrderStatus RE_BACK = new OrderStatus("ReBack", IS_WMS_ORDER_STATUS + RELEASE_VIRTUAL + IS_QUERY_ORDER_STATUS);

    // 拒收
    public static OrderStatus DECLINED = new OrderStatus("Declined", IS_WMS_ORDER_STATUS+IS_QUERY_ORDER_STATUS);

    // 退货
    public static OrderStatus RETURN_GOODS = new OrderStatus("ReturnGoods", IS_WMS_ORDER_STATUS+IS_QUERY_ORDER_STATUS);

    // 换货
    public static OrderStatus REPLACEMENT = new OrderStatus("Replacement", IS_QUERY_ORDER_STATUS);

    // 补货
    public static OrderStatus REPLENISHMENT = new OrderStatus("Replenishment", IS_QUERY_ORDER_STATUS);

    // 分拣返库
    public static OrderStatus PICK_BACK = new OrderStatus("PickBack", IS_WMS_ORDER_STATUS);


    private OrderStatus(String code, Integer enableValue) {
        if (!StringUtil.isEmpty(code)) {
            this.code = code.toLowerCase();
            this.isVisible = (enableValue & ENABLE_VISIBLE) > 0;
            this.enablePrint = (enableValue & ENABLE_PRINT) > 0;
            this.enableReBack = (enableValue & ENABLE_RE_BACK) > 0;
            this.releaseVirtual = (enableValue & RELEASE_VIRTUAL) > 0;
            this.enableResetLogistics = (enableValue & ENABLE_RESET_LOGISTICS) > 0;
            map.put(this.code, this);

            if ((enableValue & IS_WMS_ORDER_STATUS) > 0) {
                wmsOrderStatusMap.put(this.code, this);
            }
            if ((enableValue & IS_QUERY_ORDER_STATUS) > 0) {
                queryStatusMap.put(this.code, this);
            }
        }
    }

    public String getCode() {
        return code;
    }

    public boolean isEnablePrint() {
        return enablePrint;
    }

    public boolean isVisible() {
        return this.isVisible;
    }

    public boolean isReleaseVirtual() {
        return this.releaseVirtual;
    }

    public boolean isEnableReBack() {
        return enableReBack;
    }

    public boolean isEnableResetLogistics() {
        return enableResetLogistics;
    }

    public static Map<String, OrderStatus> getOrderStatusMap() {
        return map;
    }

    public String toString() {
        return "OrderStatus code is " + code;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj instanceof OrderStatus) {
            return code.equalsIgnoreCase(((OrderStatus) obj).getCode());
        } else {
            return false;
        }
    }

    public int hashCode() {
        return code.hashCode();
    }

    public static OrderStatus getByCode(String c) {
        if (StringUtil.isEmpty(c)) {
            return null;
        }
        return map.get(c);
    }

    public static Collection<OrderStatus> getAll() {
        return map.values();
    }

    public static Collection<OrderStatus> getAllWmsOrderStatus() {
        return wmsOrderStatusMap.values();
    }

    public static Collection<OrderStatus> getQueryOrderStatus() {
        return queryStatusMap.values();
    }
}
