package cn.shiyun.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by 陶鹏飞 on 2017/7/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = { "classpath:spring-mvc.xml",  
        "classpath:spring-mybatis.xml"})
public class EmpShopServiceImplTest {
	@Resource
	private EmpShopService empShopService;
	
	private String userName;
	private HashMap<String,Object> map1 = new HashMap<String,Object>();
	private HashMap<String,Object> map2 = new HashMap<String,Object>();
	private List<HashMap<String,Object>> params = new ArrayList<HashMap<String,Object>>();
	@SuppressWarnings("rawtypes")
	private ArrayList list;
	
	private HashMap<String,Object> params2 = new HashMap<String,Object>();
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Before
	public void setUp() throws Exception {
		setUserName("admin");
		
		list = new ArrayList();
		list.add(3);
		list.add(4);
		list.add(2);
		map1.put("username", "admin");
		map1.put("shopid", 3);
		map2.put("username", "admin");
		map2.put("shopid", 2);
		
		params.add(map1);
		params.add(map2);
		params2.put("username", "admin");
		params2.put("shopid", list);
	}

	@Test
	public void testGetShopByEmp() {
		List<Map<String,Object>> list1 = empShopService.getShopByEmp(getUserName());
		System.out.println(list1);
	}

	@Test
	public void testInsertEmpShop() {
		int cnt = empShopService.insertEmpShop(params);
		System.out.println(cnt);
	}

	@Test
	public void testDeleteEmpShop() {
		int cnt = empShopService.deleteEmpShop(params2);
		System.out.println(cnt);
	}

}
