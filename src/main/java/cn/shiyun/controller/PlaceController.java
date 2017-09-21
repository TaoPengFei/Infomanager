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

import cn.shiyun.service.PlaceService;


@Controller
@RequestMapping("/place/")
public class PlaceController {
	
	@Resource
	private PlaceService placeService;
	
	@RequestMapping("place.do")
	public String itemdeptment() {
		
		return "place";
	}

	//查询商圈
	@RequestMapping("getPlace.do")
	@ResponseBody
	public Map<String, Object> getPlace(){
		Map<String,Object> restmap = new HashMap<String,Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		int count = placeService.placeCount();
		list = placeService.getPlace();
		if(list != null & list.size()>0) {
			restmap.put("count", count);
			restmap.put("date", list);
			restmap.put("code", 1);
		}else {
			restmap.put("count", 0);
			restmap.put("code", 0);
			restmap.put("date", "没有餐品部门");
		}
		
		
		return restmap;
	}
	
	// 新增商圈
	@RequestMapping("addPlace.do")
	@ResponseBody
	public Map<String, Object> addPlace(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = placeService.addPlace(param);
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
	
	// 更新商圈
	@RequestMapping("updatePlace.do")
	@ResponseBody
	public Map<String, Object> updatePlace(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = placeService.updatePlace(param);
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
	
	// 删除商圈
	@RequestMapping("deletePlace.do")
	@ResponseBody
	public Map<String, Object> deletePlace(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		ArrayList array = (ArrayList) param.get("PlaceId");

		int ItemDeptId;

		for (int i = 0; i < array.size(); i++) {
			ItemDeptId = (int) array.get(i);
			if (ItemDeptId == 0) {
				result.put("code", 0);
				result.put("msg", "删除失败");
				return result;
			}

		}

		int rowCount = placeService.deletePlace(param);
		if (rowCount > 0) {
			result.put("code", 1);
			result.put("msg", "删除成功");
		} else {
			result.put("code", 0);
			result.put("msg", "删除失败");
		}
		return result;
	}
}
