package top.melody.ecommerce.platform.dal.basedata;

import java.util.List;
import org.springframework.stereotype.Repository;
import top.melody.ecommerce.platform.api.domain.basedata.BasedataRegion;

/**
 * dal Interface:BasedataRegion
 * @author melody
 * @date 2015-1-28
 */
@Repository
public interface BasedataRegionMapper {

    List<BasedataRegion> selectAll();

    List<BasedataRegion> select(BasedataRegion record);

    Integer selectCount(BasedataRegion record);

    BasedataRegion selectByPrimaryKey(Object key);


    Integer insert(BasedataRegion record);

    Integer insertSelective(BasedataRegion record);


    Integer delete(BasedataRegion record);

    Integer deleteByPrimaryKey(Object key);


    Integer updateByPrimaryKey(BasedataRegion record);

    Integer updateByPrimaryKeySelective(BasedataRegion record);








}