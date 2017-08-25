package cn.shiyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.service.RoleMenuService;
import cn.shiyun.service.RoleMenuTreeService;

@Controller
@RequestMapping("/roleMenuTree/")
public class RoleMenuTreeController {
	
	@Resource
	private RoleMenuTreeService roleMenuTreeService;
	
	@RequestMapping("roleMenuTree.do")
	public String roleMenu(){
		return "roleMenu";
	}
	
	//查询权限
	@RequestMapping(value="/{roleName}")
	@ResponseBody
	public Map<String, Object> getMenusTree(@PathVariable String roleName){
		//String roleName = param.get("roleName").toString();
		Map<String, Object> result = new HashMap<String, Object>();
		
		//角色已有的菜单
		List<Map<String,Object>> menuWithRole = roleMenuTreeService.getMenuTreeByRole(roleName);
		//角色没有的菜单
		List<Map<String,Object>> menuWithoutRole = roleMenuTreeService.getMenuNotInRoleMenuTree(roleName);
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
	
	//新增权限
	@RequestMapping("insertRoleMenuTree.do")
	@ResponseBody
	public Map<String, Object> insertRoleMenuTree(@RequestBody Map<String,Object> param){
		
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = roleMenuTreeService.insertRoleMenuTree(param);
		if(rowCount > 0){
			result.put("code", 1);
			result.put("msg", "新增成功");
		}else{
			result.put("code", 0);
			result.put("msg", "新增失败");
		}
		return result;
	}
	
	//删除权限
	@RequestMapping("deleteRoleMenuTree.do")
	@ResponseBody
	public Map<String, Object> deleteRoleMenuTree(@RequestBody Map<String,Object> param){
		Map<String, Object> result = new HashMap<String, Object>();
		int rowCount = roleMenuTreeService.deleteRoleMenuTree(param);
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
