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

import cn.shiyun.service.GuestNoTypeService;


@Controller
@RequestMapping("/guestnotype/")
public class GuestNoTypeController {
	
	@Resource
	private GuestNoTypeService guestNoTypeService;
	
	@RequestMapping("guestnotype.do")
	public String guestgradetype() {
		
		return "guestnotype";
	}

	//查询人数档次
	@RequestMapping("getGuestNoType.do")
	@ResponseBody
	public Map<String, Object> getGuestNoType(){
		Map<String,Object> restmap = new HashMap<String,Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		list = guestNoTypeService.getGuestNoType();
		int count = guestNoTypeService.GuestNoTypeCount();
		
		if(list != null & list.size()>0) {
			restmap.put("count", count);
			restmap.put("data", list);
			restmap.put("code", 1);
		}else {
			restmap.put("count", 0);
			restmap.put("code", 0);
			restmap.put("data", "无数据！");
		}
		
		
		return restmap;
	}
	
	// 新增人数档次
	@RequestMapping("addGuestNoType.do")
	@ResponseBody
	public Map<String, Object> addGuestNoType(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = guestNoTypeService.addGuestNoType(param);
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
	
	// 更新人数档次
	@RequestMapping("updateGuestNoType.do")
	@ResponseBody
	public Map<String, Object> updateGuestNoType(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = guestNoTypeService.updateGuestNoType(param);
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
	
	// 删除人数档次
	@RequestMapping("deleteGuestNoType.do")
	@ResponseBody
	public Map<String, Object> deleteGuestNoType(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		/*ArrayList array = (ArrayList) param.get("GuestNoTypeId");

		int ItemDeptId;

		for (int i = 0; i < array.size(); i++) {
			ItemDeptId = (int) array.get(i);
			if (ItemDeptId == 0) {
				result.put("code", 0);
				result.put("msg", "删除失败");
				return result;
			}

		}*/

		int rowCount = guestNoTypeService.deleteGuestNoType(param);
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
