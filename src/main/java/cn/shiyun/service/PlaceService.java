package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import cn.shiyun.entity.ItemDeptment;

public interface PlaceService {

	//查询商圈数量
	int placeCount();

	//查询商圈
	List<Map<String, Object>> getPlace();

	// 新增商圈
	int addPlace(Map<String, Object> param);

	// 更新商圈
	int updatePlace(Map<String, Object> param);

	// 删除商圈
	int deletePlace(Map<String, Object> param);


}
