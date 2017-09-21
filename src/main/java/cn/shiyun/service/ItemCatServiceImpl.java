package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.ItemCatDao;
import cn.shiyun.entity.ItemDeptment;

@Service("iemCatService")
public class ItemCatServiceImpl implements ItemCatService {
	
	@Resource
	private ItemCatDao itemCatDao;

	//查询商品分类
	@Override
	public List<Map<String, Object>> getItemCat() {
		
		return itemCatDao.getIemCat();
	}

	//查询商品分类数量
	@Override
	public int itemCatCount() {
		
		return itemCatDao.itemCatCount();
	}

	// 新增商品分类
	@Override
	public int addItemCat(Map<String, Object> param) {
		int i = itemCatDao.addItemCat(param);
		return i;
	}

	// 更新商品分类
	@Override
	public int updateItemCat(Map<String, Object> param) {
		
		return itemCatDao.updateItemCat(param);
	}

	// 删除商品分类
	@Override
	public int deleteItemCat(Map<String, Object> param) {
		
		return itemCatDao.deleteItemCat(param);
	}

	

}
