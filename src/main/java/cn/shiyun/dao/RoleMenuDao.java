package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleMenuDao {

	public List<Map<String, Object>> getMenuByRole(String roleName);

	public int insertRoleMenu(@Param("roleName") String roleName, @Param("menuIds") String[] menuIds);

	public int deleteRoleMenu(@Param("roleName") String roleName, @Param("menuIds") String[] menuIds);

	public List<Map<String, Object>> getMenuNotInRoleMenu(String roleName);
	
}
