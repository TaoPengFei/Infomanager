package cn.shiyun.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.entity.Brand;
import cn.shiyun.entity.Role;
import cn.shiyun.entity.User;
import cn.shiyun.service.BrandService;
import cn.shiyun.service.RoleService;

@Controller
@RequestMapping("/brand/")
public class BrandController {
	
	@Resource
	private BrandService brandService;
	
	@RequestMapping("brand.do")
	public String User(){
		return "brand";
	}
	//查询品牌
	@RequestMapping("selectBrand.do")
	@ResponseBody
	public Map<String, Object> selectBrand(){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Map<String, Object>> roles = brandService.selectBrand();
		int count = brandService.selectBrandCount();
		
		if(roles != null && roles.size() > 0){
			
			result.put("count", count);
			result.put("code", 1);
			result.put("data", roles);
		}else{
			result.put("count", count);
			result.put("code", 0);
			result.put("msg", "无此品牌");
		}
		
		return result;
	}
	//新增品牌
	@RequestMapping("addBrand.do")
	@ResponseBody
	public Map<String, Object> addBrand(@RequestBody Map<String,Object> param ){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if (param.get("BrandName").toString().equals("") && param.get("BrandCode").toString().equals("")) {
				result.put("code", 0);
				result.put("msg", "编码或者名称为空");
			} else {
				try {
					int rowCount = brandService.addBrand(param);
					if (rowCount > 0) {
						result.put("code", 1);
						result.put("msg", "操作成功");
					} else {
						result.put("code", 0);
						result.put("msg", "操作失败");
					}
				} catch (Exception e) {
					result.put("code", -1);
					result.put("msg", e.getMessage());
				}

			}
		}catch(Exception e){
			result.put("code", 0);
			result.put("msg", "编码或者名称为空");
			}

		return result;
	}
	
	//删除品牌
	@RequestMapping("deleteBrand.do")
	@ResponseBody
	public Map<String, Object> deleteBrand(@RequestBody Map<String,Object> param){

		Map<String, Object> result = new HashMap<String, Object>();
		if((Integer) param.get("BrandId")!=0) {
			int rowCount = brandService.deleteBrand(param);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "删除成功!");
			} else {
				result.put("code", 0);
				result.put("msg", "删除失败!");
			}
		}else{
			result.put("msg", "禁止删除Root!");
		}
		return result;
	}
	
	//跟新品牌
	@RequestMapping("updateBrand.do")
	@ResponseBody
	public Map<String, Object> updateUser(@RequestBody Map<String,Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = brandService.updateBrand(param);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "操作成功");
			}else if (rowCount == -2) {
				result.put("code", -2);
				result.put("msg", "用户角色已存在，不允许重复设置");
			} else {
				result.put("code", 0);
				result.put("msg", "操作失败");
			}
		} catch (Exception e) {
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
}
