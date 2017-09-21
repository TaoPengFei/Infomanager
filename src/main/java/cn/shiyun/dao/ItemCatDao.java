package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.ItemDeptment;

@Repository
public interface ItemCatDao {

	//查询商品分类
	List<Map<String, Object>> getIemCat();

	//查询商品分类数量
	int itemCatCount();

	// 新增商品分类
	int addItemCat(Map<String, Object> param);

	// 更新商品分类
	int updateItemCat(Map<String, Object> param);

	// 删除商品分类
	int deleteItemCat(Map<String, Object> param);

	

}
