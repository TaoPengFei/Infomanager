package cn.shiyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.entity.Password;
import cn.shiyun.entity.User;
import cn.shiyun.service.UserService;

@Controller("user")
@RequestMapping("/user/")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("user.do")
	public String User(HttpServletRequest request,HttpServletResponse response) {
		return "user";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public Map<String, Object> login(User user, String kaptchaimage, HttpSession session, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		System.out.println(kaptchaExpected);
		if(kaptchaExpected.equals(kaptchaimage)){

			user = userService.getUser(user);
			if (user != null) {
				session.setAttribute("User", user);
				result.put("code", 1);
				result.put("msg", "success");
			} else {
				result.put("code", 0);
				result.put("msg", "帐户或密码错误");
			}
		}else{
			result.put("code", 2);
			result.put("msg", "验证码错误");
		}

		return result;
	}

	//查询用户
	@RequestMapping("queryUser.do")
	@ResponseBody
	public Map<String, Object> queryUser(String userName) {
		Map<String, Object> result = new HashMap<String, Object>();

		List<Map<String, Object>> users = userService.queryUser(userName);
		if (users != null && users.size() > 0) {
			result.put("code", 1);
			result.put("data", users);
		} else {
			result.put("code", 0);
			result.put("msg", "帐户或密码错误");
		}

		return result;
	}

	//增加用户
	@RequestMapping("addUser.do")
	@ResponseBody
	public Map<String, Object> addUser(User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = userService.addUser(user);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "操作成功");
			} else if (rowCount == -2) {
				result.put("code", -2);
				result.put("msg", "用户名已存在，不允许相同用户名");
			} else {
				result.put("code", 0);
				result.put("msg", "操作失败");
			}
		} catch (Exception e) {
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}

	//修改用户
	@RequestMapping("updateUser.do")
	@ResponseBody
	public Map<String, Object> updateUser(User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = userService.updateUser(user);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "操作成功");
			}else if (rowCount == -2) {
				result.put("code", -2);
				result.put("msg", "用户角色已存在，不允许重复设置");
			} else {
				result.put("code", 0);
				result.put("msg", "操作失败");
			}
		} catch (Exception e) {
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}

	//修改密码
	@RequestMapping("updatePassword.do")
	@ResponseBody
	public Map<String, Object> updatePassword(Password password){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int rowCount = userService.changePassword(password);
			if (rowCount > 0) {
				result.put("code", 1);
				result.put("msg", "操作成功");
			}else {
				result.put("code", 0);
				result.put("msg", "帐户或密码不正确");
			}
		} catch (Exception e) {
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
}
