package cn.shiyun.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
	/*@RequestMapping(value="/{roleName}")*/
	@RequestMapping("getMenusTree.do")
	@ResponseBody
//	public Map<String, Object> getMenusTree(@PathVariable String roleName){
	public Map<String, Object> getMenusTree(@RequestParam String roleName) throws UnsupportedEncodingException {
		//String roleName = param.get("roleName").toString();
		Map<String, Object> result = new HashMap<String, Object>();
		roleName = new String(roleName.getBytes("ISO-8859-1"), "UTF-8");
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
			result.put("msg", "新增菜单成功！");
		}else{
			result.put("code", 0);
			result.put("msg", "新增菜单失败！");
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
			result.put("msg", "移除菜单成功！");
		}else{
			result.put("code", 0);
			result.put("msg", "移除菜单失败！");
		}
		return result;
	}

	//查询全部权限
	@RequestMapping("getAllMenuTree.do ")
			@ResponseBody
			public Map<String, Object> getAllMenuTree(){
			Map<String, Object> result = new HashMap<String, Object>();
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();


			list = roleMenuTreeService.getAllMenuTree();

			if(list !=null && list.size()>0) {

			result.put("code", 1);
				result.put("date", list);
			}else {

				result.put("code", 0);
				result.put("msg", "无此权限");
			}
				return result;
				}

			}
