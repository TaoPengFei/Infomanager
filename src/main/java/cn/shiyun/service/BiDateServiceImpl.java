package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.BiDateDao;

@Service("biDateService")
public class BiDateServiceImpl implements BiDateService {
	
	@Resource
	private BiDateDao biDateDao;

	//查询日历
	@Override
	public List<Map<String, Object>> getBiDate() {
		 
		return biDateDao.getBiDate();
	}

	// 更新日历
	@Override
	public int updateBiDate(Map<String, Object> param) {
		 
		return biDateDao.updateBiDate(param);
	}


}
