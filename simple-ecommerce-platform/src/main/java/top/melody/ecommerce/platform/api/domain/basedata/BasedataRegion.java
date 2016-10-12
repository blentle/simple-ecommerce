package top.melody.ecommerce.platform.api.domain.basedata;



import top.melody.ecommerce.platform.handler.enums.ActStatus;
import top.melody.ecommerce.platform.handler.enums.RegionLevel;
import top.melody.ecommerce.platform.handler.enums.ValidStatus;

import java.io.Serializable;
import java.util.Date;

/**
 * entity:BasedataRegion
 * 
 * @author melody
 * @date 2015-1-28
 */
public class BasedataRegion implements Serializable {
	
	private String	id;		 /* 地区ID */ 
	private String	regionName;		 /* 名称 */ 
	private RegionLevel regionLevel;		 /* 地区级别 */
	private String	regionPid;		 /* 上级地区编码 */ 
	private ValidStatus validStatus;		 /* 状态 */
	private String	remark1;		
	private String	remark2;		
	private String	remark3;		
	private Integer	seqKey;		 /* 排序值 */ 
	private ActStatus removeStatus;
	private Date createTime;
	private Date	updateTime;

	// Constructor
	public BasedataRegion() {
	}

	/**
	 * full Constructor
	 */
	public BasedataRegion(String id, String regionName, RegionLevel regionLevel, String regionPid, ValidStatus validStatus, String remark1, String remark2, String remark3, Integer seqKey, ActStatus removeStatus, Date createTime, Date updateTime) {
		this.id = id;
		this.regionName = regionName;
		this.regionLevel = regionLevel;
		this.regionPid = regionPid;
		this.validStatus = validStatus;
		this.remark1 = remark1;
		this.remark2 = remark2;
		this.remark3 = remark3;
		this.seqKey = seqKey;
		this.removeStatus = removeStatus;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	// getter && setter
	// 在setter方法最后加上"return this;"并把返回参数改为BasedataRegion可以实现连缀设置属性
	
	public String getId() {
		return id;
	}

	public BasedataRegion setId(String id) {
		this.id = id;
		return this;
	}

	
	public String getRegionName() {
		return regionName;
	}

	public BasedataRegion setRegionName(String regionName) {
		this.regionName = regionName;
		return this;
	}

	
	public RegionLevel getRegionLevel() {
		return regionLevel;
	}

	public BasedataRegion setRegionLevel(RegionLevel regionLevel) {
		this.regionLevel = regionLevel;
		return this;
	}

	
	public String getRegionPid() {
		return regionPid;
	}

	public BasedataRegion setRegionPid(String regionPid) {
		this.regionPid = regionPid;
		return this;
	}

	
	public ValidStatus getValidStatus() {
		return validStatus;
	}

	public BasedataRegion setValidStatus(ValidStatus validStatus) {
		this.validStatus = validStatus;
		return this;
	}

	
	public String getRemark1() {
		return remark1;
	}

	public BasedataRegion setRemark1(String remark1) {
		this.remark1 = remark1;
		return this;
	}

	
	public String getRemark2() {
		return remark2;
	}

	public BasedataRegion setRemark2(String remark2) {
		this.remark2 = remark2;
		return this;
	}

	
	public String getRemark3() {
		return remark3;
	}

	public BasedataRegion setRemark3(String remark3) {
		this.remark3 = remark3;
		return this;
	}

	
	public Integer getSeqKey() {
		return seqKey;
	}

	public BasedataRegion setSeqKey(Integer seqKey) {
		this.seqKey = seqKey;
		return this;
	}

	
	public ActStatus getRemoveStatus() {
		return removeStatus;
	}

	public BasedataRegion setRemoveStatus(ActStatus removeStatus) {
		this.removeStatus = removeStatus;
		return this;
	}

	
	public Date getCreateTime() {
		return createTime;
	}

	public BasedataRegion setCreateTime(Date createTime) {
		this.createTime = createTime;
		return this;
	}

	
	public Date getUpdateTime() {
		return updateTime;
	}

	public BasedataRegion setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
		return this;
	}

	@Override
	public String toString() {
		return "BasedataRegion [" + "id=" + id + ", regionName=" + regionName + ", regionLevel=" + regionLevel + ", regionPid=" + regionPid + ", validStatus=" + validStatus + ", remark1=" + remark1 + ", remark2=" + remark2 + ", remark3=" + remark3 + ", seqKey=" + seqKey + ", removeStatus=" + removeStatus + ", createTime=" + createTime + ", updateTime=" + updateTime +  "]";
	}
}
