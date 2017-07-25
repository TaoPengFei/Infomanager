package cn.shiyun.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.EmpShopDao;

@Service
public class EmpShopServiceImpl implements EmpShopService {

	@Resource
	private EmpShopDao empShopDao;
	
	@Override
	public List<Map<String, Object>> getShopByEmp(String userName) {
		return empShopDao.getShopByEmp(userName);
	}

	@Override
	public int insertEmpShop(List<HashMap<String,Object>> params) {
		return empShopDao.insertEmpShop(params);
	}

	@Override
	public int deleteEmpShop(Map params) {
		return empShopDao.deleteEmpShop(params);
	}

}
