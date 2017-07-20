package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.shiyun.dao.RoleDao;
import cn.shiyun.entity.Role;

@Service("roleService")
public class RoleServiceImpl implements RoleService{

	@Resource
	private RoleDao roleDao;

	@Override
	public List<String> loadRoles() {
		return roleDao.loadRoles();
	}

	@Override
	public List<Map<String, Object>> getRolesByName(String roleName) {
		return roleDao.getRolesByName(roleName);
	}

	@Override
	public int addRole(Role role) {
		return roleDao.addRole(role);
	}

	@Override
	public int delRole(String roleName) {
		return roleDao.delRole(roleName);
	}
	
	
}
