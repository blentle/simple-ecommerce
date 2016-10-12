package top.melody.ecommerce.webapps.console.propertyeditors;

import org.springframework.beans.propertyeditors.PropertiesEditor;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/25 10:35
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/25 10:35
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public final class GoodsTypeEditor extends PropertiesEditor {

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
//        if(!StringUtil.isEmpty(text))
//            setValue(GoodsType.getByCode(text));
    }
}
