package top.melody.ecommerce.platform.handler.handler;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import top.melody.ecommerce.platform.handler.enums.RegionLevel;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/3 9:49
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/3 9:49
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class RegionLevelHandler implements TypeHandler<RegionLevel> {
    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, RegionLevel regionType, JdbcType jdbcType) throws SQLException {
        if(regionType == null){
            preparedStatement.setInt(i, Types.INTEGER);
        }
        preparedStatement.setInt(i, regionType.getCode());
    }

    @Override
    public RegionLevel getResult(ResultSet resultSet, String s) throws SQLException {
        int code = resultSet.getInt(s);
        return RegionLevel.getByCode(code);
    }

    @Override
    public RegionLevel getResult(ResultSet resultSet, int i) throws SQLException {
        int code = resultSet.getInt(i);
        return RegionLevel.getByCode(code);
    }

    @Override
    public RegionLevel getResult(CallableStatement callableStatement, int i) throws SQLException {
        int code = callableStatement.getInt(i);
        return RegionLevel.getByCode(code);
    }
}
