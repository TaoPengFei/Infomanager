package cn.shiyun.service;

import java.util.List;
import java.util.Map;

public interface AreaService {

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

	//拖拽地区
	int dropArea(Map<String, Object> param);

}
