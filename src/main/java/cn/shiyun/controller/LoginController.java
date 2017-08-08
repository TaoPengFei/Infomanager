package cn.shiyun.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.security.UsernamePasswordToken;

/**
 * @author abel.lin
 */
@Controller  
public class LoginController {

	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		
		return "login";
	}
	
	@RequestMapping("/login/auth")
	public String doLogin(@RequestBody HashMap<String,Object> user){
		String username = (String) user.get("username");
		String pwd = (String)user.get("pwd");
		String captcha = (String)user.get("captcha");
		UsernamePasswordToken token = new UsernamePasswordToken(username, pwd, captcha); 
		Subject currentUser = SecurityUtils.getSubject(); 
		try {
			currentUser.login(token);  
			System.out.println("login sucess");
			//return String.valueOf(1);
			return "redirect:main";
			//return "redirect:../main.jsp";
		} catch(AuthenticationException ae) {
			System.out.println(ae.getMessage());
		}
		//return "redirect:login";
		return "redirect:login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		SecurityUtils.getSubject().logout();  
		return "redirect:login";
	}
	
	/** 
     * 获取验证码图片和文本(验证码文本会保存在HttpSession中) 
     */  
    @RequestMapping("/genCaptcha")  
    public void genCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {  
        //设置页面不缓存  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);  
        //将验证码放到HttpSession里面  
        request.getSession().setAttribute(Constants.VALIDATE_CODE, verifyCode);  
        System.out.println("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中...");
        //设置输出的内容的类型为JPEG图像  
        response.setContentType("image/jpeg");  
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 5, true, Color.WHITE, null, null);  
        //写给浏览器  
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());  
    }  
    
}
