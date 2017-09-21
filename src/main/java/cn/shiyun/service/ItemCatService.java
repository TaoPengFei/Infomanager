package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import cn.shiyun.entity.ItemDeptment;

public interface ItemCatService {

	//查询商品分类
	int itemCatCount();

	//查询商品分类数量
	List<Map<String, Object>> getItemCat();

	// 新增商品分类
	int addItemCat(Map<String, Object> param);

	// 更新商品分类
	int updateItemCat(Map<String, Object> param);

	// 删除商品分类
	int deleteItemCat(Map<String, Object> param);

	

}
