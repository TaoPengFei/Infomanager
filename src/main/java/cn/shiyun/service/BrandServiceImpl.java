package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.BrandDao;
import cn.shiyun.dao.RoleDao;
import cn.shiyun.entity.Brand;
import org.springframework.web.bind.annotation.RequestBody;

@Service("brandService")
public class BrandServiceImpl implements BrandService {
	
	@Resource
	private BrandDao brandDao;

	//查询品牌
	@Override
	public List<Map<String, Object>> selectBrand() {
		
		return brandDao.selectBrand();
	}
	
	//查询品牌数量
	@Override
	public int selectBrandCount() {
		
		return brandDao.selectBrandCount();
	}

	//新增品牌
	@Override
	public int addBrand(Map<String,Object> param) {
		int intResult = brandDao.addBrand(param);
		return intResult;
	}

	//删除品牌
	@Override
	public int deleteBrand(Map<String, Object> param) {
		
		return brandDao.deleteBrand(param);
	}

	//跟新品牌
	@Override
	public int updateBrand(Map<String, Object> param) {
		
		return brandDao.updateBrand(param);
	}

}
