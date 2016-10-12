package top.melody.ecommerce.platform.handler.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import top.melody.ecommerce.platform.handler.enums.ActStatus;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Created by zx on 14/11/27.
 */
public class ActStatusTypeHandler implements TypeHandler<ActStatus> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, ActStatus actStatus, JdbcType jdbcType) throws SQLException {
        if(actStatus == null){
            preparedStatement.setNull(i, Types.VARCHAR);
            return;
        }
        preparedStatement.setString(i, actStatus.getCode());
    }

    @Override
    public ActStatus getResult(ResultSet resultSet, String s) throws SQLException {
        String actCode = resultSet.getString(s);
        return ActStatus.ACTED.getCode().equals(actCode) ? ActStatus.ACTED : ActStatus.UNACT;

    }

    @Override
    public ActStatus getResult(ResultSet resultSet, int i) throws SQLException {
        String actCode = resultSet.getString(i);
        return ActStatus.ACTED.getCode().equals(actCode) ? ActStatus.ACTED : ActStatus.UNACT;
    }

    @Override
    public ActStatus getResult(CallableStatement callableStatement, int i) throws SQLException {
        String actCode = callableStatement.getString(i);
        return ActStatus.ACTED.getCode().equals(actCode) ? ActStatus.ACTED : ActStatus.UNACT;
    }
}
