package cn.shiyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.service.RoleMenuService;

@Controller
@RequestMapping("/roleMenu/")
public class RoleMenuController {
	
	@Resource
	private RoleMenuService roleMenuService;
	
	@RequestMapping("roleMenu.do")
	public String roleMenu(){
		return "roleMenu";
	}
	
	@RequestMapping("getMenus.do")
	@ResponseBody
	public Map<String, Object> getMenus(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		//角色已有的菜单
		List<Map<String,Object>> menuWithRole = roleMenuService.getMenuByRole(roleName);
		//角色没有的菜单
		List<Map<String,Object>> menuWithoutRole = roleMenuService.getMenuNotInRoleMenu(roleName);
		if((menuWithRole != null && menuWithRole.size() > 0)|| (menuWithoutRole != null && menuWithoutRole.size() > 0)){
			result.put("code", 1);
			result.put("menuWithRole", menuWithRole);
			result.put("menuWithoutRole", menuWithoutRole);
		}else{
			result.put("code", 0);
			result.put("msg", "无角色数据");
		}
		return result;
	}
	
	@RequestMapping("getMenuByRole.do")
	@ResponseBody
	public Map<String, Object> getMenuByRole(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Map<String,Object>> menuList = roleMenuService.getMenuByRole(roleName);
		if(menuList != null && menuList.size() > 0){
			result.put("code", 1);
			result.put("data", menuList);
		}else{
			result.put("code", 0);
			result.put("msg", "无角色数据");
		}
		return result;
	}
	
	@RequestMapping("getMenuWithoutRole.do")
	@ResponseBody
	public Map<String, Object> getMenuWithoutRole(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Map<String,Object>> menuList = roleMenuService.getMenuNotInRoleMenu(roleName);
		if(menuList != null && menuList.size() > 0){
			result.put("code", 1);
			result.put("data", menuList);
		}else{
			result.put("code", 0);
			result.put("msg", "无角色数据");
		}
		return result;
	}
	
	@RequestMapping("insertRoleMenu.do")
	@ResponseBody
	public Map<String, Object> insertRoleMenu(String roleName,@RequestParam(value="menuIds[]")String[] menuIds){
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = roleMenuService.insertRoleMenu(roleName,menuIds);
		if(rowCount > 0){
			result.put("code", 1);
			result.put("msg", "新增成功");
		}else{
			result.put("code", 0);
			result.put("msg", "新增失败");
		}
		return result;
	}
	
	@RequestMapping("deleteRoleMenu.do")
	@ResponseBody
	public Map<String, Object> deleteRoleMenu(String roleName,@RequestParam(value="menuIds[]")String[] menuIds){
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = roleMenuService.deleteRoleMenu(roleName,menuIds);
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
