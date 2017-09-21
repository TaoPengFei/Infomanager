package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.ItemDeptment;

@Repository
public interface BiDateDao {

	//查询日历
	List<Map<String, Object>> getBiDate();

	// 更新日历
	int updateBiDate(Map<String, Object> param);

}
