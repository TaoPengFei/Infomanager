package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

public interface RoleMenuTreeService {

	//查询已有的权限
	public List<Map<String, Object>> getMenuTreeByRole(String roleName);

	//查询没有的权限
	public List<Map<String, Object>> getMenuNotInRoleMenuTree(String roleName);

	//新增权限
	public int insertRoleMenuTree(Map<String, Object> param);

	//删除权限
	public int deleteRoleMenuTree(@RequestBody Map<String, Object> param);

}
