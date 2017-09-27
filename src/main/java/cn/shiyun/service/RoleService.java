package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import cn.shiyun.entity.Role;

public interface RoleService {

	public List<String> loadRoles();

	public List<Map<String, Object>> getRolesByName(String roleName);

	public int addRole(Role role);

	public int delRole(String roleName);

	public List<Map<String, Object>> batchExportList(String userName);

	//修改角色描述
	public int updateRole(Role role);

}
