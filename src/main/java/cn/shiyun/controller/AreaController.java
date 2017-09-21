package cn.shiyun.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.service.AreaService;

@Controller
@RequestMapping("/area/")
public class AreaController {
	
	@Resource
	private AreaService areaService;

	@RequestMapping("area.do")
	private String Area() {
		return "area";
	}
	
	//查询地区
	@RequestMapping("getArea.do")
	@ResponseBody
	private Map<String, Object> getArea(){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		int count;
		
		list = areaService.getArea();
		count = areaService.getAreaCount();
		if(list !=null && list.size()>0) {
			result.put("count", count);
			result.put("code", 1);
			result.put("data", list);
		}else {
			result.put("count", 0);
			result.put("code", 0);
			result.put("msg", "无此地区");
		}
		return result;
	}

	//增加地区
	@RequestMapping("addArea.do")
	@ResponseBody
	private Map<String, Object> addArea(@RequestBody Map<String, Object> param){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = 	areaService.addArea(param);
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
	
	//删除地区
		@RequestMapping("deleteArea.do")
		@ResponseBody
		public Map<String, Object> deleteArea(@RequestBody Map<String,Object> param){
			Map<String, Object> result = new HashMap<String, Object>();
			ArrayList array = (ArrayList) param.get("AreaId");

			int area ;
			for(int i = 0 ; i < array.size() ; i++) {
				area = (int) array.get(i);
				if (area == 0) {
					result.put("code", 0);
					result.put("msg", "禁止删除root!");
					return result;
				}
			}
			int rowCount = areaService.deleteArea(param);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "删除成功!");
			} else {
				result.put("code", -1);
				result.put("msg", "删除失败!");
			}
			return result;
		}
		
		//跟新地区
		@RequestMapping("updateArea.do")
		@ResponseBody
		public Map<String, Object> updateArea(@RequestBody Map<String,Object> param) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {
				int rowCount = areaService.updateArea(param);
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
