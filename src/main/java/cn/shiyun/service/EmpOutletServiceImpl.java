package cn.shiyun.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.EmpOutletDao;

@Service
public class EmpOutletServiceImpl implements EmpOutletService {

	@Resource
	private EmpOutletDao empOutletDao;
	
	@Override
	public List<Map<String, Object>> getOutletByEmp(String userName) {
		return empOutletDao.getOutletByEmp(userName);
	}

	@Override
	public int insertEmpOutlet(List<HashMap<String,Object>> params) {
		return empOutletDao.insertEmpOutlet(params);
	}

	@Override
	public int deleteEmpOutlet(Map<String,Object> params) {
		return empOutletDao.deleteEmpOutlet(params);
	}

}
