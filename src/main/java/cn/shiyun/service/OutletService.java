package cn.shiyun.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.shiyun.entity.Outlet;

public interface OutletService {
	public Outlet getOutlet(Outlet outlet);
	
	public List<Map<String, Object>> queryOutlet();
	
	public int insertOutlets(List<Map<String, Object>> outlet);
	
	public List<Map<String, Object>> queryAllOutlet(String outletName);
	
	public List<Map<String, Object>> queryArea();
	
	public List<Map<String, Object>> queryPlace();
	
	public List<Map<String, Object>> queryBrand();

	public int updateApb(Map<String, Object> outlet);

	public int deleteOutlets(Map<String, Object> outlet);

	

}
