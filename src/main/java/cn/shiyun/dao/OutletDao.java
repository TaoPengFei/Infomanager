package cn.shiyun.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.Outlet;

@Repository
public interface OutletDao {
	public Outlet getOutlet(Outlet outlet);
	
	public List<Map<String, Object>> getOutlets();
	
	public List<Map<String, Object>> getAllOutlets(String outletName);
	
	public int insertOutlets(List<Map<String, Object>> outlet);
	
	public List<Map<String, Object>> getAreas();
	
	public List<Map<String, Object>> getPlaces();
	
	public List<Map<String, Object>> getBrands();
	
	public int updateApbs(Map<String, Object> outlet);
	
	public int deleteOutlets(Map<String,Object> outlet);
	
	
	
}
