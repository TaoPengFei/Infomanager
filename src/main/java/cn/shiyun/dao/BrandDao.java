package cn.shiyun.dao;

import cn.shiyun.entity.Brand;
import cn.shiyun.entity.Role;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;





@Repository
public interface BrandDao {

	//查询品牌
	List<Map<String, Object>> selectBrand();

	//查询品牌数量
	int selectBrandCount();

	//新增品牌
	int addBrand( Map<String,Object> param);

	//删除品牌
	int deleteBrand(Map<String, Object> paramd);

	//跟新品牌
	int updateBrand(Map<String, Object> param);

	//拖拽品牌
	int dropBrand(Map<String, Object> param);

	

}
