package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.GuestGradeTypeDao;

@Service("guestGradeTypeService")
public class GuestGradeTypeServiceImpl implements GuestGradeTypeService {
	
	@Resource
	private GuestGradeTypeDao guestGradeTypeDao;

	//查询顾客档次
	@Override
	public List<Map<String, Object>> getGuestGradeType() {
		 
		return guestGradeTypeDao.getGuestGradeType();
	}

	//查询顾客档次数量
	@Override
	public int GuestGradeTypeCount() {
		 
		return guestGradeTypeDao.GuestGradeTypeCount();
	}

	// 新增顾客档次
	@Override
	public int addGuestGradeType(Map<String, Object> param) {
		 
		return guestGradeTypeDao.addGuestGradeType(param);
	}

	// 更新顾客档次
	@Override
	public int updateGuestGradeType(Map<String, Object> param) {
		 
		return guestGradeTypeDao.updateGuestGradeType(param);
	}

	// 删除顾客档次
	@Override
	public int deleteGuestGradeType(Map<String, Object> param) {
		 
		return guestGradeTypeDao.deleteGuestGradeType(param);
	}

	
	
	
	

}
