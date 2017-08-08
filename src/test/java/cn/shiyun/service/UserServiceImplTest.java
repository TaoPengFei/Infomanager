package cn.shiyun.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.shiyun.entity.User;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = { "classpath:spring-mvc.xml",  
        "classpath:spring-mybatis.xml"})
public class UserServiceImplTest {

	@Resource
	private UserService userService;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testGetUserByUserName() {
		String userName = "admin";
		User user = userService.getUserByUserName(userName);
		System.out.println(user.getName());
	}

}
