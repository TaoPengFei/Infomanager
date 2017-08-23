package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface AreaDao {

	//查询地区
	List<Map<String, Object>> getArea();

	//查询地区数量
	int getAreaCount();

	//新增地区
	int addArea(Map<String, Object> param);

	//删除地区
	int deleteArea(Map<String, Object> param);

	//跟新地区
	int updateArea(Map<String, Object> param);

}
