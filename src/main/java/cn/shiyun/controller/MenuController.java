package cn.shiyun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/menu/")
public class MenuController {
	@RequestMapping("menu.do")
	public String menu(){
		return "menu";
	}

}
