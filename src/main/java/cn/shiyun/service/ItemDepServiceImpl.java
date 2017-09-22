package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.ItemDepDao;
import cn.shiyun.entity.ItemDeptment;

@Service("iemDepService")
public class ItemDepServiceImpl implements ItemDepService {
	
	@Resource
	private ItemDepDao itemDepDao;

	//查询餐品部门
	@Override
	public List<Map<String, Object>> getItemDep() {
		
		return itemDepDao.getItemDep();
	}

	//查询餐品数量
	@Override
	public int itemDepCount() {
		
		return itemDepDao.itemDepCount();
	}

	// 新增餐品部门
	@Override
	public int addItemDep(Map<String, Object> param) {
		int i = itemDepDao.addItemDep(param);
		return i;
	}

	// 更新餐品部门
	@Override
	public int updateItemDep(Map<String, Object> param) {
		
		return itemDepDao.updateItemDep(param);
	}

	// 删除餐品部门
	@Override
	public int deleteItemDep(Map<String, Object> param) {
		 
		return itemDepDao.deleteItemDep(param);
	}

}
