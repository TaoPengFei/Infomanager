package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.ItemDeptment;

@Repository
public interface ItemDepDao {

	//查询餐品部门
	List<Map<String, Object>> getItemDep();

	//查询餐品数量
	int itemDepCount();

	// 新增餐品部门
	int addItemDep(ItemDeptment itemDep);

	// 更新餐品部门
	int updateItemDep(Map<String, Object> param);

	// 删除餐品部门
	int deleteItemDep(Map<String, Object> param);

}
