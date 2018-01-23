package cn.shiyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.shiyun.service.OutletService;

@Controller("outlet")
@RequestMapping("/outlet/")
public class OutletController {
	
	@Autowired
	private OutletService outletService;
	
	@RequestMapping("outlet.do")
	public String Outlet(HttpServletRequest request,HttpServletResponse response) {
		return "outlet";
	}


//	@RequestMapping(value="/{outletName}")//alue="/{outletName}"
	@RequestMapping("doOutlet.do")
	@ResponseBody
	public Map<String, Object> doOutlet(/*@PathVariable*/ String outletName) {
		Map<String, Object> result = new HashMap<String, Object>();

		List<Map<String, Object>> outlet = outletService.queryOutlet();
		if(outlet != null && outlet.size() > 0){
			int rowCount = outletService.insertOutlets(outlet);
			if(rowCount > 0){
				List<Map<String, Object>> alloutlets = outletService.queryAllOutlet(outletName);
				if (alloutlets != null && alloutlets.size() > 0) {
					result.put("code", 1);
					result.put("data", alloutlets);
				} else {
					result.put("code", 0);
					result.put("msg", "操作失败1");
				}
			}else{
				result.put("code", 0);
				result.put("msg", "新增失败2");
			}
		}else{
			List<Map<String, Object>> alloutlets1 = outletService.queryAllOutlet(outletName);
			result.put("code", 1);
			result.put("data", alloutlets1);
		}

		return result;
	}

	
	@RequestMapping("queryArea.do")
	@ResponseBody
	public Map<String, Object> queryArea() {
		Map<String, Object> result = new HashMap<String, Object>();

		List<Map<String, Object>> areas = outletService.queryArea();
		if (areas != null && areas.size() > 0) {
			result.put("code", 1);
			result.put("data", areas);
		} else {
			result.put("code", 0);
			result.put("msg", "操作失败");
		}

		return result;
	}
	
	@RequestMapping("queryPlace.do")
	@ResponseBody
	public Map<String, Object> queryPlace() {
		Map<String, Object> result = new HashMap<String, Object>();

		List<Map<String, Object>> places = outletService.queryPlace();
		if (places != null && places.size() > 0) {
			result.put("code", 1);
			result.put("data", places);
		} else {
			result.put("code", 0);
			result.put("msg", "操作失败");
		}

		return result;
	}
	
	@RequestMapping("queryBrand.do")
	@ResponseBody
	public Map<String, Object> queryBrand() {
		Map<String, Object> result = new HashMap<String, Object>();

		List<Map<String, Object>> brands = outletService.queryBrand();
		if (brands != null && brands.size() > 0) {
			result.put("code", 1);
			result.put("data", brands);
		} else {
			result.put("code", 0);
			result.put("msg", "操作失败");
		}

		return result;
	}
	
	@RequestMapping("updateApb.do")
	@ResponseBody
	public Map<String, Object> updateApb(@RequestBody Map<String, Object> outlet) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = outletService.updateApb(outlet);
			System.out.println(rowCount);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "操作成功");
			}else if (rowCount == -2) {
				result.put("code", -2);
				result.put("msg", "已存在");
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
	
	@RequestMapping("deleteOutlet.do")
	@ResponseBody
	public Map<String, Object> deleteOutlets(@RequestBody Map<String, Object> outlet) {
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = outletService.deleteOutlets(outlet);
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
