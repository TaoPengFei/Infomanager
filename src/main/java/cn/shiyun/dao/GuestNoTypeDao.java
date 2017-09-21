package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.ItemDeptment;

@Repository
public interface GuestNoTypeDao {

	//查询人数档次
	List<Map<String, Object>> getGuestNoType();

	//查询人数档次数量
	int GuestNoTypeCount();

	// 新增人数档次
	int addGuestNoType(Map<String, Object> param);

	// 更新人数档次
	int updateGuestNoType(Map<String, Object> param);

	// 删除人数档次
	int deleteGuestNoType(Map<String, Object> param);

	
}
