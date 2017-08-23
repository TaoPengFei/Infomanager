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
public class BrandControllerTest {

	@Resource
	private BrandController brandController;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(brandController).build();
	}

	@Test
	public void testSelectBrand() throws Exception {
		ResultActions resultActions = this.mockMvc.perform(MockMvcRequestBuilders.post("/brand/selectBrand.do"));
		
        MvcResult mvcResult = resultActions.andReturn();
        String result = mvcResult.getResponse().getContentAsString();
        System.out.println("=====客户端获得反馈数据:" + result);
        // 也可以从response里面取状态码，header,cookies...
//        System.out.println(mvcResult.getResponse().getStatus());
	}

	@Test
	public void testAddBrand() throws Exception {
		       
        JSONArray json = new JSONArray();
        JSONObject jo1 = new JSONObject();
        jo1.put("pBrandId", "1");
		jo1.put("BrandCode", "苏丹红1号");
		jo1.put("BrandName", "苏丹红1号");
       
//   这个就是前段需要传的json的array     [{"outletid":2,"username":"admin"},{"outletid":3,"username":"admin"}]
        String requestjson = jo1.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/brand/addBrand.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();

		System.out.println(responseString);
	}
	
	@Test
	public void testDeleteBrand() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		
		JSONArray json1 = new JSONArray();
		json1.put(2);
		json1.put(3);
		json1.put(4);
        JSONObject jo = new JSONObject();
        jo.put("BrandSeq", 1);
        jo.put("pBrandId", json1);
        
//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/brand/deleteBrand.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}
	
	@Test
	public void testUpdateBrand() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		
		
        JSONObject jo = new JSONObject();
        jo.put("BrandId", 17);
        jo.put("pBrandId", 0);
        jo.put("BrandCode", "1");
        jo.put("BrandName", "1");
       
//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/brand/updateBrand.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}

}
