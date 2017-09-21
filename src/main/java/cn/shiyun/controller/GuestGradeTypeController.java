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

import cn.shiyun.service.GuestGradeTypeService;


@Controller
@RequestMapping("/guestgradetype/")
public class GuestGradeTypeController {
	
	@Resource
	private GuestGradeTypeService guestGradeTypeService;
	
	@RequestMapping("guestgradetype.do")
	public String guestgradetype() {
		
		return "guestgradetype";
	}

	//查询顾客档次
	@RequestMapping("getGuestGradeType.do")
	@ResponseBody
	public Map<String, Object> getGuestGradeType(){
		Map<String,Object> restmap = new HashMap<String,Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		list = guestGradeTypeService.getGuestGradeType();
		int count = guestGradeTypeService.GuestGradeTypeCount();
		
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
	
	// 新增顾客档次
	@RequestMapping("addGuestGradeType.do")
	@ResponseBody
	public Map<String, Object> addGuestGradeType(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = guestGradeTypeService.addGuestGradeType(param);
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
	
	// 更新顾客档次
	@RequestMapping("updateGuestGradeType.do")
	@ResponseBody
	public Map<String, Object> updateGuestGradeType(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = guestGradeTypeService.updateGuestGradeType(param);
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
	
	// 删除顾客档次
	@RequestMapping("deleteGuestGradeType.do")
	@ResponseBody
	public Map<String, Object> deleteGuestGradeType(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		ArrayList array = (ArrayList) param.get("GuestGradeTypeId");

		int ItemDeptId;

		for (int i = 0; i < array.size(); i++) {
			ItemDeptId = (int) array.get(i);
			if (ItemDeptId == 0) {
				result.put("code", 0);
				result.put("msg", "删除失败");
				return result;
			}

		}

		int rowCount = guestGradeTypeService.deleteGuestGradeType(param);
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
