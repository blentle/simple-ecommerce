package top.melody.ecommerce.platform.api.dto;


import top.melody.ecommerce.platform.api.domain.basedata.BasedataRegion;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * CreateUser: renhuan
 * Email:richiedryday@gmail.com
 * CreateTime: 2015/2/3 16:07
 * ModifyUser: renhuan
 * ModifyTime: 2015/2/3 16:07
 * Class Description:
 * To change this template use File | Settings | File Templates.
 */
public class RegionDTO implements Serializable{

    private BasedataRegion region;
    //direct parent (exclude grandfather)
    private BasedataRegion parent;

    public BasedataRegion getRegion() {
        return region;
    }

    public void setRegion(BasedataRegion region) {
        this.region = region;
    }

    public BasedataRegion getParent() {
        return parent;
    }

    public void setParent(BasedataRegion parent) {
        this.parent = parent;
    }
}
