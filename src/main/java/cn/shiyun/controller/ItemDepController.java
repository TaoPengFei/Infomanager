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

import cn.shiyun.entity.ItemDeptment;
import cn.shiyun.service.ItemDepService;

@Controller
@RequestMapping("/itemdeptment/")
public class ItemDepController {
	
	@Resource
	private ItemDepService itemDepService;
	
	@RequestMapping("itemdeptment.do")
	public String itemdeptment() {
		
		return "itemdeptment";
	}

	//查询餐品部门
	@RequestMapping("getItemDep.do")
	@ResponseBody
	public Map<String, Object> getItemDep(){
		Map<String,Object> restmap = new HashMap<String,Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		int count = itemDepService.itemDepCount();
		list = itemDepService.getItemDep();
		if(list != null & list.size()>0) {
			restmap.put("count", count);
			restmap.put("data", list);
			restmap.put("code", 1);
		}else {
			restmap.put("count", 0);
			restmap.put("code", 0);
			restmap.put("data", "无数据!");
		}
		
		
		return restmap;
	}
	
	// 新增餐品部门
	@RequestMapping("addItemDep.do")
	@ResponseBody
	public Map<String, Object> addItemDep(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = itemDepService.addItemDep(param);
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
	
	// 更新餐品部门
	@RequestMapping("updateItemDep.do")
	@ResponseBody
	public Map<String, Object> updateItemDep(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = itemDepService.updateItemDep(param);
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
	
	// 删除餐品部门
	@RequestMapping("deleteItemDep.do")
	@ResponseBody
	public Map<String, Object> deleteItemDep(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		ArrayList array = (ArrayList) param.get("ItemDeptId");

		int ItemDeptId;

		for (int i = 0; i < array.size(); i++) {
			ItemDeptId = (int) array.get(i);
			if (ItemDeptId == 0) {
				result.put("code", 0);
				result.put("msg", "删除失败");
				return result;
			}

		}

		int rowCount = itemDepService.deleteItemDep(param);
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
