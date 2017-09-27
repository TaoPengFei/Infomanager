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
		Role r = roleDao.getRole(role);
		System.out.println(r+"角色已经比对过");
		int a = 0;
		if( r!=null ) {
			return -2;
		}else {
			a = roleDao.addRole(role);
		}
		return a;
	}

	@Override
	public int delRole(String roleName) {
		return roleDao.delRole(roleName);
	}

	@Override
	public List<Map<String, Object>> batchExportList(String userName) {
		return roleDao.batchExportList(userName);
	}

	//修改角色描述
	@Override
	public int updateRole(Role role) {
		return roleDao.updateRole(role);
	}
	
	
}
