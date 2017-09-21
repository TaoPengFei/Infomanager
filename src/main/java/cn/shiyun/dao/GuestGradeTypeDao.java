package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.ItemDeptment;

@Repository
public interface GuestGradeTypeDao {

	//查询顾客档次
	List<Map<String, Object>> getGuestGradeType();

	//查询顾客档次数量
	int GuestGradeTypeCount();

	// 新增顾客档次
	int addGuestGradeType(Map<String, Object> param);

	// 更新顾客档次
	int updateGuestGradeType(Map<String, Object> param);

	// 删除顾客档次
	int deleteGuestGradeType(Map<String, Object> param);

	


}
