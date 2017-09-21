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

import cn.shiyun.service.ItemCatService;


@Controller
@RequestMapping("/itemcategory/")
public class ItemCatController {
	
	@Resource
	private ItemCatService itemCatService;
	
	@RequestMapping("itemcategory.do")
	public String itemdeptment() {
		
		return "itemcategory";
	}

	//查询商品分类
	@RequestMapping("getItemCat.do")
	@ResponseBody
	public Map<String, Object> getItemCat(){
		Map<String,Object> restmap = new HashMap<String,Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		int count = itemCatService.itemCatCount();
		list = itemCatService.getItemCat();
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
	
	// 新增商品分类
	@RequestMapping("addItemCat.do")
	@ResponseBody
	public Map<String, Object> addItemCat(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = itemCatService.addItemCat(param);
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
	
	// 更新商品分类
	@RequestMapping("updateItemCat.do")
	@ResponseBody
	public Map<String, Object> updateItemCat(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = itemCatService.updateItemCat(param);
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
	
	// 删除商品分类
	@RequestMapping("deleteItemCat.do")
	@ResponseBody
	public Map<String, Object> deleteItemCat(@RequestBody Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		ArrayList array = (ArrayList) param.get("ItemCatId");

		int ItemDeptId;

		for (int i = 0; i < array.size(); i++) {
			ItemDeptId = (int) array.get(i);
			if (ItemDeptId == 0) {
				result.put("code", 0);
				result.put("msg", "删除失败");
				return result;
			}

		}

		int rowCount = itemCatService.deleteItemCat(param);
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
