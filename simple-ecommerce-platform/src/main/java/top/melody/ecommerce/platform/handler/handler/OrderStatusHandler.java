package top.melody.ecommerce.platform.handler.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import top.melody.ecommerce.platform.handler.enums.OrderStatus;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/3/22 9:49
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/22 9:49
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class OrderStatusHandler implements TypeHandler<OrderStatus> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, OrderStatus status, JdbcType jdbcType) throws SQLException {
        if(status == null){
            preparedStatement.setNull(i, Types.VARCHAR);
            return;
        }
        preparedStatement.setString(i, status.getCode());
    }

    @Override
    public OrderStatus getResult(ResultSet resultSet, String s) throws SQLException {
        String code = resultSet.getString(s);
        return OrderStatus.getByCode(code);

    }

    @Override
    public OrderStatus getResult(ResultSet resultSet, int i) throws SQLException {
        String code = resultSet.getString(i);
        return OrderStatus.getByCode(code);
    }

    @Override
    public OrderStatus getResult(CallableStatement callableStatement, int i) throws SQLException {
        String code = callableStatement.getString(i);
        return OrderStatus.getByCode(code);
    }
}
