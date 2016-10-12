package top.melody.ecommerce.platform.handler.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import top.melody.ecommerce.platform.handler.enums.PaymentType;

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
public class PaymentTypeHandler implements TypeHandler<PaymentType> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, PaymentType type, JdbcType jdbcType) throws SQLException {
        if(type == null){
            preparedStatement.setNull(i, Types.VARCHAR);
            return;
        }
        preparedStatement.setString(i, type.getCode());
    }

    @Override
    public PaymentType getResult(ResultSet resultSet, String s) throws SQLException {
        String code = resultSet.getString(s);
        return PaymentType.getByCode(code);

    }

    @Override
    public PaymentType getResult(ResultSet resultSet, int i) throws SQLException {
        String code = resultSet.getString(i);
        return PaymentType.getByCode(code);
    }

    @Override
    public PaymentType getResult(CallableStatement callableStatement, int i) throws SQLException {
        String code = callableStatement.getString(i);
        return PaymentType.getByCode(code);
    }
}
