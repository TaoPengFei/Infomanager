package cn.shiyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.entity.Role;
import cn.shiyun.service.RoleService;

@Controller
@RequestMapping("/role/")
public class RoleController {
	
	@Resource
	private RoleService roleService;
	
	@RequestMapping("role.do")
	public String User(){
		return "role";
	}
	
	@RequestMapping("roleLoad.do")
	@ResponseBody
	public Map<String, Object> loadRoles(){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<String> roles = roleService.loadRoles();
		if(roles != null && roles.size() > 0){
			result.put("code", 1);
			result.put("data", roles);
		}else{
			result.put("code", 0);
			result.put("msg", "无用户角色");
		}
		
		return result;
	}
	
	@RequestMapping("getRoles.do")
	@ResponseBody
	public Map<String, Object> getRolesByName(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Map<String, Object>> roleList = roleService.getRolesByName(roleName);
		if(roleList != null && roleList.size() > 0){
			result.put("code", 1);
			result.put("data", roleList);
		}else{
			result.put("code", 0);
			result.put("msg", "无用户角色");
		}
		
		return result;
	}
	
	@RequestMapping("addRole.do")
	@ResponseBody
	public Map<String, Object> addRole(Role role){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
		int rowCount = roleService.addRole(role);
			if(rowCount > 0){
				result.put("code", 1);
				result.put("msg", "新增成功");
			}else{
				result.put("code", 0);
				result.put("msg", "新增失败");
			}
		}catch(Exception e){
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("delRole.do")
	@ResponseBody
	public Map<String, Object> delRole(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
		int rowCount = roleService.delRole(roleName);
			if(rowCount > 0){
				result.put("code", 1);
				result.put("msg", "删除成功");
			}else{
				result.put("code", 0);
				result.put("msg", "删除失败");
			}
		}catch(Exception e){
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
}
