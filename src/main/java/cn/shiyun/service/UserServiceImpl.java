package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.shiyun.dao.UserDao;
import cn.shiyun.entity.Password;
import cn.shiyun.entity.User;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	@Override
	public User getUser(User user) {
		user = userDao.getUser(user);
		return user;
	}

	@Override
	public List<Map<String, Object>> queryUser(String userName) {
		return userDao.getUsers(userName);
	}

	@Override
	@Transactional
	public int addUser(User user) {
		User u = userDao.getUser(user);
		int intResult = 0;
		if(u != null ){
			intResult = -2;
		}else{
			userDao.insertUsers(user);
			intResult =userDao.insertUserRole(user);
		}
		return intResult;
		
	}

	@Override
	@Transactional
	public int updateUser(User user) {
		if(user.getOldRole()!=null && user.getOldRole() !="" 
				&& user.getRole() != null && user.getRole() !=""
				&& !user.getRole().equals(user.getOldRole())){
			List<Map<String, Object>>  userRoles = userDao.getUserRole(user);
			if(userRoles != null && userRoles.size() > 0){
				return -2;
			}else{
				userDao.updateUserRole(user);
			}
			
		}
		return userDao.updateUsers(user);
	}

	@Override
	public int changePassword(Password password) {
		return userDao.changePassword(password);
	}

	@Override
	public User getUserByUserName(String userName) {
		User user = userDao.getUserByUserName(userName);
		return user;
	}

	@Override
	public User getUserForeName(User user) {

		return userDao.getUserForeName(user);
	}
}
