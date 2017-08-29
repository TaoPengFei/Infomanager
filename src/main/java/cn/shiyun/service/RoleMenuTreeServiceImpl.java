package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import cn.shiyun.dao.RoleMenuDao;
import cn.shiyun.dao.RoleMenuTreeDao;

@Service
public class RoleMenuTreeServiceImpl implements RoleMenuTreeService{

	@Resource
	private RoleMenuTreeDao roleMenuTreeDao;

	//查询已有的权限
	@Override
	public List<Map<String, Object>> getMenuTreeByRole(String roleName) {
		return roleMenuTreeDao.getMenuTreeByRole(roleName);
	}

	//查询没有的权限
	@Override
	public List<Map<String, Object>> getMenuNotInRoleMenuTree(String roleName) {
		return roleMenuTreeDao.getMenuNotInRoleMenuTree(roleName);
	}

	//新增权限
	@Override
	public int insertRoleMenuTree(Map<String,Object> param) {
		return roleMenuTreeDao.insertRoleMenuTree(param);
	}

	//删除权限
	@Override
	public int deleteRoleMenuTree(@RequestBody Map<String,Object> param) {
		return roleMenuTreeDao.deleteRoleMenuTree(param);
	}

	//查询全部权限
	@Override
	public List<Map<String, Object>> getAllMenuTree() {

		return roleMenuTreeDao.getAllMenuTree();
	}

}
