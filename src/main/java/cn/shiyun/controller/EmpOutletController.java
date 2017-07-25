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

import cn.shiyun.service.EmpOutletService;

@Controller
@RequestMapping("/empoutlet/")
public class EmpOutletController {

	@Resource
	private EmpOutletService empOutletService;
	
	@RequestMapping(value="/{userName}")
	@ResponseBody
	public Map<String, Object> getEmpOutlet(@PathVariable String userName){
		Map<String, Object> result = new HashMap<String, Object>();
		//人员对应的营业区
		List<Map<String,Object>> outletwithUser = empOutletService.getOutletByEmp(userName);
		
		if((outletwithUser != null && outletwithUser.size() > 0)) {
			result.put("code", 1);
			result.put("outletwithUser", outletwithUser);
		}else{
			result.put("code", 0);
			result.put("msg", "无对应的营业区数据");
		}
		return result;
	}
	
	@RequestMapping("/insertEmpOutlet.do")
	@ResponseBody
	public Map<String, Object> insertEmpOutlet(@RequestBody List<HashMap<String,Object>> param){
		Map<String, Object> result = new HashMap<String, Object>();
		HashMap<String,Object> map = param.get(0);
		System.out.println(map);
		int rowCount = empOutletService.insertEmpOutlet(param);
		if(rowCount > 0){
			result.put("code", 1);
			result.put("msg", "新增成功");
		}else{
			result.put("code", 0);
			result.put("msg", "新增失败");
		}
		return result;
	}
	
	@RequestMapping("/deleteEmpOutlet.do")
	@ResponseBody
	public Map<String, Object> deleteEmpOutlet(@RequestBody Map<String,Object> param){
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = empOutletService.deleteEmpOutlet(param);
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
