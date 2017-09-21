package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.GuestNoTypeDao;

@Service("guestNoTypeService")
public class GuestNoTypeServiceImpl implements GuestNoTypeService {
	
	@Resource
	private GuestNoTypeDao guestNoTypeDao;

	//查询人数档次
	@Override
	public List<Map<String, Object>> getGuestNoType() {
		 
		return guestNoTypeDao.getGuestNoType();
	}

	//查询人数档次数量
	@Override
	public int GuestNoTypeCount() {
		 
		return guestNoTypeDao.GuestNoTypeCount();
	}

	// 新增人数档次
	@Override
	public int addGuestNoType(Map<String, Object> param) {
		 
		return guestNoTypeDao.addGuestNoType(param);
	}

	// 更新人数档次
	@Override
	public int updateGuestNoType(Map<String, Object> param) {
		 
		return guestNoTypeDao.updateGuestNoType(param);
	}

	// 删除人数档次
	@Override
	public int deleteGuestNoType(Map<String, Object> param) {
		 
		return guestNoTypeDao.deleteGuestNoType(param);
	}


}
