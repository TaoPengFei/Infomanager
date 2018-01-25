package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.shiyun.dao.AreaDao;

@Service("areaService")
public class AreaServiceImpl implements AreaService {
	
	@Resource
	private AreaDao areaDao;

	//查询地区
	@Override
	public List<Map<String, Object>> getArea() {
		
		return areaDao.getArea();
	}

	//查询地区数量	
	@Override
	public int getAreaCount() {
		
		return areaDao.getAreaCount();
	}

	//新增地区
	@Override
	public int addArea(Map<String, Object> param) {
		
		return areaDao.addArea(param);
	}

	//删除地区
	@Override
	public int deleteArea(Map<String, Object> param) {
		
		return areaDao.deleteArea(param);
	}

	//跟新地区
	@Override
	public int updateArea(Map<String, Object> param) {
		
		return areaDao.updateArea(param);
	}

	//拖拽地区
	@Override
	public int dropArea(Map<String, Object> param) {

		return areaDao.dropArea(param);
	}

}
