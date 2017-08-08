package cn.shiyun.service;

import java.util.List;
import java.util.Map;

import cn.shiyun.entity.Password;
import cn.shiyun.entity.User;

public interface UserService {
	public User getUser(User user);

	public User getUserByUserName(String userName);

	public List<Map<String, Object>> queryUser(String userName);

	public int addUser(User user);

	public int updateUser(User user);

	public int changePassword(Password password);
}
