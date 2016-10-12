package top.melody.ecommerce.webapps.console.base;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/1/29 14:05
 * ModifyUser: renhuan
 * ModifyTime: 2015/1/29 14:05
 * Class Description:System constant,eg secret key,i18n key,or others
 * To change this template use File | Settings | File Templates.
 */
public final class Constant {
    //-------------------------global error(for i18n)--------------------------//
    public static final String ERROR_OPERATE_FAILED = "error.operate.failed";

    //-------------------------warehouse validate error(for i18n)--------------------------//
    public static final String ERROR_GOODS_DETAIL_CARD_CARDNO_EXISTED = "error.goods.detail.cardno.existed";

    public static final String ERROR_GOODS_DETAIL_MOBILE_EXISTED = "error.goods.detail.mobile.existed";

    public static final String ERROR_GOODS_DETAIL_CARD_BIND_NOT_NULL = "error.goods.detail.cardno.bind.not.null";

    public static final String ERROR_GOODS_DETAIL_PACKAGES_BIND_NOT_NULL = "error.goods.detail.packages.bind.not.null";

    public static final String ERROR_ENTRY_ENTRYBILL_HAS_COMPLETED = "error.entry.entrybill.already.completed";

    //----------------------goods error-----------------------------------//
    public static final String ERROR_GOODS_STATUS_LOCKED = "error.goods.status.locked";

    public static final String ERROR_GOODS_STATUS_SOLD = "error.goods.status.sold";

    //-------------------------------goods entry detail excel import----------------------------------//
    public static final String GOODS_ENTRY_DETAIL_CARD_EXCEL_IMPORT_TEMPLATE_NAME = "template.excel.goods.entry.detail.card.name";

    public static final String GOODS_ENTRY_DETAIL_MOBILE_EXCEL_IMPORT_TEMPLATE_NAME = "template.excel.goods.entry.detail.mobile.name";


    //----------------------others-----------------------------------//
    public static final String PURCHASE_ENTRY_BILL_PREFIX = "CR-";

    public static final String TEMPLATE_ROOT_PATH = "templates";


    //
    public static final String CURRENT_USER = "currentUser";


}
