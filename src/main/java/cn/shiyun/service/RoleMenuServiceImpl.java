package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.RoleMenuDao;

@Service
public class RoleMenuServiceImpl implements RoleMenuService{

	@Resource
	private RoleMenuDao roleMenuDao;

	@Override
	public List<Map<String, Object>> getMenuByRole(String roleName) {
		return roleMenuDao.getMenuByRole(roleName);
	}

	@Override
	public List<Map<String, Object>> getMenuNotInRoleMenu(String roleName) {
		return roleMenuDao.getMenuNotInRoleMenu(roleName);
	}

	@Override
	public int insertRoleMenu(String roleName,String[] menuIds) {
		return roleMenuDao.insertRoleMenu(roleName,menuIds);
	}

	@Override
	public int deleteRoleMenu(String roleName, String[] menuIds) {
		return roleMenuDao.deleteRoleMenu(roleName,menuIds);
	}

}
