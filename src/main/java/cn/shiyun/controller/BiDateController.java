package cn.shiyun.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.service.BiDateService;


@Controller
@RequestMapping("/bidate/")
public class BiDateController {
	
	@Resource
	private BiDateService biDateService;
	
	@RequestMapping("bidate.do")
	public String bidate() {
		
		return "bidate";
	}

	//查询日历
	@RequestMapping("getBiDate.do")
	@ResponseBody
	public Map<String, Object> getBiDate(){
		Map<String,Object> restmap = new HashMap<String,Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		list = biDateService.getBiDate();
		 
		
		if(list != null & list.size()>0) {
			 
			restmap.put("date", list);
			restmap.put("code", 1);
		}else {
			 
			restmap.put("code", 0);
			restmap.put("date", "没有餐品部门");
		}
		
		
		return restmap;
	}
	
	// 更新日历
	@RequestMapping("updateBiDate.do")
	@ResponseBody
	public Map<String, Object> updateBiDate(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = biDateService.updateBiDate(param);
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
		return result;
	}

}
