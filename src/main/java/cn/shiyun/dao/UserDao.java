package cn.shiyun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.shiyun.entity.Password;
import cn.shiyun.entity.User;

@Repository
public interface UserDao {
	public User getUser(User user);

	public User getUserByUserName(String userName);
	
	public List<Map<String, Object>> getUsers(String userName);
	
	public List<Map<String, Object>> getUserRole(User user);

	public int insertUsers(User user);

	public int insertUserRole(User user);

	public int updateUsers(User user);
	
	public int updateUserRole(User user);

	public int changePassword(Password password);
}
