package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.PlaceDao;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {
	
	@Resource
	private PlaceDao placeDao;

	//查询商圈数量
	@Override
	public int placeCount() {
		 
		return placeDao.placeCount();
	}

	//查询商圈
	@Override
	public List<Map<String, Object>> getPlace() {
		 
		return placeDao.getPlace();
	}

	// 新增商圈
	@Override
	public int addPlace(Map<String, Object> param) {
		 
		return  placeDao.addPlace(param);
	}

	// 更新商圈
	@Override
	public int updatePlace(Map<String, Object> param) {
		 
		return placeDao.updatePlace(param);
	}

	// 删除商圈
	@Override
	public int deletePlace(Map<String, Object> param) {
		
		return placeDao.deletePlace(param);
	}

	
	

}
