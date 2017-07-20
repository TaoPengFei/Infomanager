package cn.shiyun.service;

import java.util.List;
import java.util.Map;

public interface RoleMenuService {

	public List<Map<String, Object>> getMenuByRole(String roleName);

	public List<Map<String, Object>> getMenuNotInRoleMenu(String roleName);

	public int insertRoleMenu(String roleName,String[] menuIds);

	public int deleteRoleMenu(String roleName, String[] menuIds);

}
