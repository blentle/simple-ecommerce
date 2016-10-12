package top.melody.ecommerce.webapps.www.base;

/**
 * Date: 15-2-11 上午9:43
 *
 * @Auther: <a mailto:xuyongming@milipp.com>Xu Yongming</a>
 * desc:
 */
public class Constant {

    public static final String SESSION_KEY = "accountSession";
    public static final String SESSION_HEADER_MENU_FLAG = "headerMenu";

    public static final String VERIFY_CODE = "verifyCode";
    public static final int ONE = 1;
    public static final int PACKAGES_INDEX_SIZE = 3;
    public static final int PACKAGES_LIST_SIZE = 6;
    public static final int NUMBERS_INDEX_SIZE=2;
    public static final int NUMBERS_LIST_SIZE=12;

    //-------------------------global error(for i18n)--------------------------//
    public static final String ERROR_OPERATE_FAILED = "error.operate.failed";

    //goods or other Cookie constant
    public static final String COOKIE_KEY_SHOPCART_PLAIN_TEXT = "unicall-trolley";

    //-------------------------order ------------------------------------------//
    public static final String ERROR_ORDER_DISTRIBUTE_ADDRESS_NOT_NULL = "error.distribute.address.not.null";

    public static final String ERROR_ORDER_DISTRIBUTE_SERVICESITE_NOT_NULL = "error.distribute.servicesite.not.null";

    public static final String ERROR_ORDER_DISTRIBUTE_CONTACT_NAME_NULL = "error.distribute.contact.name.not.null";

    public static final String ERROR_ORDER_DISTRIBUTE_CONTACT_MOBILE_NOT_NULL = "error.distribute.contact.mobile.not.null";
}
