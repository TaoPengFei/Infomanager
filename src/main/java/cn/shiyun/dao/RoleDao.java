package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.Role;


@Repository
public interface RoleDao {

	public List<String> loadRoles() ;

	public List<Map<String, Object>> getRolesByName(String roleName);

	public int addRole(Role role);

	public int delRole(String roleName);

	public List<Map<String, Object>> batchExportList(String userName);

	public Role getRole(Role role);

	//修改角色描述
	public int updateRole(Role role);

}
