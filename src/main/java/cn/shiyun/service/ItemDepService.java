package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import cn.shiyun.entity.ItemDeptment;

public interface ItemDepService {

	//查询餐品部门
	List<Map<String, Object>> getItemDep();

	//查询餐品数量
	int itemDepCount();

	// 新增餐品部门
	int addItemDep(Map<String, Object> param);

	// 更新餐品部门
	int updateItemDep(Map<String, Object> param);

	// 删除餐品部门
	int deleteItemDep(Map<String, Object> param);

}
