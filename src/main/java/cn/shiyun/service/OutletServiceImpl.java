package cn.shiyun.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.OutletDao;
import cn.shiyun.entity.Outlet;

@Service("outletService")
public class OutletServiceImpl implements OutletService{
	@Resource
	private OutletDao outletDao;

	@Override
	public Outlet getOutlet(Outlet outlet) {
		// TODO Auto-generated method stub
		outlet = outletDao.getOutlet(outlet);
		return outlet;
	}

	@Override
	public List<Map<String, Object>> queryOutlet() {
		// TODO Auto-generated method stub
		return outletDao.getOutlets();
	}
	
	@Override
	public int insertOutlets(List<Map<String, Object>> outlet) {
		// TODO Auto-generated method stub
		return outletDao.insertOutlets(outlet);
	}
	
	@Override
	public List<Map<String, Object>> queryAllOutlet(String outletName) {
		// TODO Auto-generated method stub
		return outletDao.getAllOutlets(outletName);
	}

	@Override
	public List<Map<String, Object>> queryArea() {
		// TODO Auto-generated method stub
		return outletDao.getAreas();
	}

	@Override
	public List<Map<String, Object>> queryPlace() {
		// TODO Auto-generated method stub
		return outletDao.getPlaces();
	}

	@Override
	public List<Map<String, Object>> queryBrand() {
		// TODO Auto-generated method stub
		return outletDao.getBrands();
	}

	@Override
	public int updateApb(Map<String, Object> outlet) {
		// TODO Auto-generated method stub
		return outletDao.updateApbs(outlet);
	}

	@Override
	public int deleteOutlets(Map<String, Object> outlet) {
		// TODO Auto-generated method stub
		return outletDao.deleteOutlets(outlet);
	}

}
