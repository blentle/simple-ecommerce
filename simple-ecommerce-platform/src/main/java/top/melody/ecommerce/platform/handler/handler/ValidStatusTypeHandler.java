package top.melody.ecommerce.platform.handler.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import top.melody.ecommerce.platform.handler.enums.ValidStatus;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

//@MappedJdbcTypes(JdbcType.VARCHAR)
public class ValidStatusTypeHandler implements TypeHandler<ValidStatus> {
	@Override
    public void setParameter(PreparedStatement preparedStatement, int i, ValidStatus validStatus, JdbcType jdbcType) throws SQLException {
        if(validStatus == null){
            preparedStatement.setNull(i, Types.VARCHAR);
        }
        preparedStatement.setString(i, validStatus.getCode());
    }

    @Override
    public ValidStatus getResult(ResultSet resultSet, String s) throws SQLException {
        String validCode = resultSet.getString(s);
        return ValidStatus.getByCode(validCode);

    }

    @Override
    public ValidStatus getResult(ResultSet resultSet, int i) throws SQLException {
        String validCode = resultSet.getString(i);
        return ValidStatus.getByCode(validCode);
    }

    @Override
    public ValidStatus getResult(CallableStatement callableStatement, int i) throws SQLException {
        String validCode = callableStatement.getString(i);
        return ValidStatus.getByCode(validCode);
    }

	
}
