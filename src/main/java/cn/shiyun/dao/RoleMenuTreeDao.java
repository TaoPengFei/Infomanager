package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

@Repository
public interface RoleMenuTreeDao {

	//查询已有的权限
	public List<Map<String, Object>> getMenuTreeByRole(String roleName);

	//新增权限
	public int insertRoleMenuTree(Map<String, Object> param);

	//删除权限
	public int deleteRoleMenuTree(@RequestBody Map<String, Object> params);

	//查询没有的权限
	public List<Map<String, Object>> getMenuNotInRoleMenuTree(String roleName);

	//查询全部权限
	public List<Map<String, Object>> getAllMenuTree();
	
}
