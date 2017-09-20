package cn.shiyun.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.event.TransactionalEventListener;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

import cn.shiyun.entity.Password;
import cn.shiyun.entity.User;
import cn.shiyun.service.UserService;
import cn.shiyun.util.HttpUtil;

@Controller("user")
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    User u = new User();

    @RequestMapping("user.do")
    public String User(HttpServletRequest request, HttpServletResponse response) {
        return "user";
    }

	/*@RequestMapping("/login.do")
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
	}*/

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

    @RequestMapping("updateUser.do")
    @ResponseBody
    public Map<String, Object> updateUser(User user) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            int rowCount = userService.updateUser(user);
            if (rowCount > 0) {
                result.put("code", 1);
                result.put("msg", "操作成功");
            } else if (rowCount == -2) {
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

    @RequestMapping("updatePassword.do")
    @ResponseBody
    public Map<String, Object> updatePassword(Password password) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            int rowCount = userService.changePassword(password);
            if (rowCount > 0) {
                result.put("code", 1);
                result.put("msg", "操作成功");
            } else {
                result.put("code", 0);
                result.put("msg", "帐户或密码不正确");
            }
        } catch (Exception e) {
            result.put("code", -1);
            result.put("msg", e.getMessage());
        }
        return result;
    }

    @RequestMapping("/login.do")
    @ResponseBody
    public Map<String, Object> login(User user, String kaptchaimage, HttpSession session, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        u.setName(user.getName());
        u.setPassword(user.getPassword());
        Subject currentUser = SecurityUtils.getSubject();
        String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if (kaptchaExpected.equals(kaptchaimage)) {

            String username = user.getName();
            String password = user.getPassword();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            // rememberme
            //token.setRememberMe(true);
            try {

                System.out.println("----> " + token.hashCode());

                currentUser.login(token);
                session.setAttribute("User", user);
                result.put("code", 1);
                result.put("msg", "success");
            } catch (AuthenticationException ae) {

                System.out.println("++++++> " + ae.getMessage());
                result.put("code", 0);
                result.put("msg", "帐户或密码错误");
            }
        } else {
            result.put("code", 2);
            result.put("msg", "验证码错误");
        }
        return result;
    }

    @RequestMapping("/getSessionUsername.do")
    @ResponseBody
    public Map<String, Object> getSessionUsername(){
        Map<String, Object> result = new HashMap<String, Object>();
        if(u == null){
            result.put("code",0);
        }else{
            result.put("code", u);
        }

        return result;
    }

}
