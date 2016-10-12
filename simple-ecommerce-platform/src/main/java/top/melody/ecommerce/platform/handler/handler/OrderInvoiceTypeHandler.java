package top.melody.ecommerce.platform.handler.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import top.melody.ecommerce.platform.handler.enums.OrderInvoiceType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/26 9:49
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/26 9:49
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class OrderInvoiceTypeHandler implements TypeHandler<OrderInvoiceType> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, OrderInvoiceType type, JdbcType jdbcType) throws SQLException {
        if(type == null){
            preparedStatement.setNull(i, Types.VARCHAR);
            return;
        }
        preparedStatement.setString(i, type.getCode());
    }

    @Override
    public OrderInvoiceType getResult(ResultSet resultSet, String s) throws SQLException {
        String code = resultSet.getString(s);
        return OrderInvoiceType.getByCode(code);

    }

    @Override
    public OrderInvoiceType getResult(ResultSet resultSet, int i) throws SQLException {
        String code = resultSet.getString(i);
        return OrderInvoiceType.getByCode(code);
    }

    @Override
    public OrderInvoiceType getResult(CallableStatement callableStatement, int i) throws SQLException {
        String code = callableStatement.getString(i);
        return OrderInvoiceType.getByCode(code);
    }
}
