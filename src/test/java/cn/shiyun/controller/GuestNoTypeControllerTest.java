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

import cn.shiyun.entity.ItemDeptment;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = { "classpath:spring-mvc.xml",  
        "classpath:spring-mybatis.xml"})
public class GuestNoTypeControllerTest {

	@Resource
	private GuestNoTypeController guestNoTypeController;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(guestNoTypeController).build();
	}

	@Test
	public void testGetGuestNoType() throws Exception {
		ResultActions resultActions = this.mockMvc.perform(MockMvcRequestBuilders.post("/guestnotype/getGuestGuestNoType.do"));
		
        MvcResult mvcResult = resultActions.andReturn();
        String result = mvcResult.getResponse().getContentAsString();
        System.out.println("=====客户端获得反馈数据:" + result);
        // 也可以从response里面取状态码，header,cookies...
//        System.out.println(mvcResult.getResponse().getStatus());
	}

	@Test
	public void testAddGuestNoType() throws Exception {
		       
        JSONArray json = new JSONArray();
        JSONObject jo1 = new JSONObject();
        jo1.put("GuestNoTypeName", "笑话");
        jo1.put("GuestNoTypeDesc", "笑话");
        jo1.put("BottomGuestQty", -100);
        jo1.put("TopGuestQty", -100);
        jo1.put("Status", 100);
       
       
//   这个就是前段需要传的json的array     [{"outletid":2,"username":"admin"},{"outletid":3,"username":"admin"}]
        String requestjson = jo1.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/guestnotype/addGuestNoType.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();

		System.out.println(responseString);
	}
	
	@Test
	public void testDeleteGuestNoType() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		
		JSONArray json1 = new JSONArray();
		json1.put(7);
        JSONObject jo = new JSONObject();
        jo.put("GuestNoTypeId", json1);
        
//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/guestnotype/deleteGuestNoType.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}
	
	@Test
	public void testUpdateGuestNoType() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		
		
        JSONObject jo = new JSONObject();
        jo.put("GuestNoTypeId", 7);
        jo.put("GuestNoTypeName", "中華");
        jo.put("GuestNoTypeDesc", "中華");
        jo.put("BottomGuestQty", 10);
        jo.put("TopGuestQty", 10);
        jo.put("Status", "0");
       
//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/guestnotype/updateGuestNoType.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}

}
