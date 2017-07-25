package cn.shiyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.service.EmpShopService;

@Controller
@RequestMapping("/empshop/")
public class EmpShopController {

	@Resource
	private EmpShopService empShopService;
	
	@RequestMapping(value="/{userName}")
	@ResponseBody
	public Map<String, Object> getEmpShop(@PathVariable String userName){
		Map<String, Object> result = new HashMap<String, Object>();
		//人员对应的酒店
		List<Map<String,Object>> shopwithUser = empShopService.getShopByEmp(userName);
		
		if((shopwithUser != null && shopwithUser.size() > 0)) {
			result.put("code", 1);
			result.put("shopwithUser", shopwithUser);
		}else{
			result.put("code", 0);
			result.put("msg", "无对应的酒店数据");
		}
		return result;
	}
	
	@RequestMapping("insertEmpShop.do")
	@ResponseBody
	public Map<String, Object> insertEmpShop(@RequestBody List<HashMap<String,Object>> param){
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = empShopService.insertEmpShop(param);
		if(rowCount > 0){
			result.put("code", 1);
			result.put("msg", "新增成功");
		}else{
			result.put("code", 0);
			result.put("msg", "新增失败");
		}
		return result;
	}
	
	@RequestMapping("deleteEmpShop.do")
	@ResponseBody
	public Map<String, Object> deleteEmpShop(@RequestBody Map<String,Object> param){
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = empShopService.deleteEmpShop(param);
		if(rowCount > 0){
			result.put("code", 1);
			result.put("msg", "删除成功");
		}else{
			result.put("code", 0);
			result.put("msg", "删除失败");
		}
		return result;
	}
}
