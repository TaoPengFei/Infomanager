package cn.shiyun.controller;

import java.io.UnsupportedEncodingException;

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
public class OutletControllerTest {

	@Resource
	private OutletController OutletController;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(OutletController).build();
	}

	@Test
	public void testDoOutlet1() throws Exception {
		
		ResultActions resultActions = this.mockMvc.perform(MockMvcRequestBuilders.post("/outlet/咖啡"));
        MvcResult mvcResult = resultActions.andReturn();
        String result = mvcResult.getResponse().getContentAsString();
        System.out.println("=====客户端获得反馈数据:" + result);
	}
	
	@Test
	public void testUpdateApb() throws Exception {
		 
        JSONObject jo = new JSONObject();
        jo.put("outletId", 11);
        jo.put("areaId", 1);
        //jo.put("placeId", 1);
        jo.put("brandId", 1);
        
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
        //json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/outlet/updateApb.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();

		System.out.println("更新是否成功:" + responseString);
	}
	
	@Test
	public void testDeleteOutlet() throws UnsupportedEncodingException, Exception {
//		delete 需要传的参数和insert不一样，是outletid:[2,3] 这种json格式
		JSONArray json1 = new JSONArray();
		json1.put(9);
		json1.put(10);
		json1.put(11);
		json1.put(12);
        JSONObject jo = new JSONObject();
        jo.put("outletId", json1);
        
//   这个就是前段需要传的json的array     {"outletid":[2,3]}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/outlet/deleteOutlet.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();

		System.out.println(responseString);
	}

}

