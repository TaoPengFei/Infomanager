package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import cn.shiyun.entity.ItemDeptment;

public interface BiDateService {

	//查询日历
	List<Map<String, Object>> getBiDate();

	// 更新日历
	int updateBiDate(Map<String, Object> param);

	
}
