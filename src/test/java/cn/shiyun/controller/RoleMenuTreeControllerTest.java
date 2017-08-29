package cn.shiyun.controller;

import static org.junit.Assert.*;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-mvc.xml",  
        "classpath:spring-mybatis.xml"})
public class RoleMenuTreeControllerTest {

	@Resource
	private RoleMenuTreeController roleMenuTreeController;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(roleMenuTreeController).build();
	}

	@Test
	public void testGetMenusTree() throws Exception {
		
		ResultActions resultActions = this.mockMvc.perform(MockMvcRequestBuilders.post("/roleMenuTree/Admin"));
        MvcResult mvcResult = resultActions.andReturn();
        String result = mvcResult.getResponse().getContentAsString();
        System.out.println("=====客户端获得反馈数据:" + result);
	}

	@Test
	public void testInsertRoleMenuTree() throws Exception {
		       
		JSONArray json1 = new JSONArray();
		json1.put(1001);
		json1.put(1002);
        JSONObject jo = new JSONObject();
        jo.put("roleName", "陶鹏飞");
        jo.put("menuIds", json1);
       
//   这个就是前段需要传的json的array     {"roleName":"bb","menuIds":[1001,1002]}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/roleMenuTree/insertRoleMenuTree.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();

		System.out.println(responseString);
	}
	
	@Test
	public void testDeleteRoleMenuTree() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		
		JSONArray json1 = new JSONArray();
		json1.put(1001);
		json1.put(1002);
        JSONObject jo = new JSONObject();
        jo.put("roleName", "陶鹏飞");
        jo.put("menuIds", json1);
        
//   这个就是前段需要传的json的array    {"roleName":"bb","menuIds":[1001,1002]}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/roleMenuTree/deleteRoleMenuTree.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}

	@Test
	public void getAllMenuTree() throws Exception {

		ResultActions resultActions = this.mockMvc.perform(MockMvcRequestBuilders.post("/roleMenuTree/getAllMenuTree.do "));
				MvcResult mvcResult = resultActions.andReturn();
		String result = mvcResult.getResponse().getContentAsString();
		System.out.println("=====客户端获得反馈数据:" + result);
	}



}
