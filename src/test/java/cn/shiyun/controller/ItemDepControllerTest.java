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
public class ItemDepControllerTest {

	@Resource
	private ItemDepController itemDepController;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(itemDepController).build();
	}

	@Test
	public void testGetItemDep() throws Exception {
		ResultActions resultActions = this.mockMvc.perform(MockMvcRequestBuilders.post("/itemdeptment/getItemDep.do"));
		
        MvcResult mvcResult = resultActions.andReturn();
        String result = mvcResult.getResponse().getContentAsString();
        System.out.println("=====客户端获得反馈数据:" + result);
        // 也可以从response里面取状态码，header,cookies...
//        System.out.println(mvcResult.getResponse().getStatus());
	}

	@Test
	public void testAddItemDep() throws Exception {
        //JSONArray json = new JSONArray();
		JSONObject json = new JSONObject();
        //ItemDeptment itemDep = new ItemDeptment();
        //itemDep.setItemDeptCode("1");
        //itemDep.setItemDeptName("1");
       	//json.put(itemDep);
		json.put("ItemDeptCode", "2");
		json.put("ItemDeptName", "2");
		json.put("ItemDeptShortName", "2");

		json.put("ItemDeptDesc", "2");
		json.put("pItemDeptId", 2);
		json.put("ItemDeptSeq", 2);
		json.put("Status", 2);
		/*json.put("pItemDeptId", 2);
		json.put("ItemDeptSeq", 2);
		json.put("Status", 2);*/

//   这个就是前段需要传的json的array     [{"outletid":2,"username":"admin"},{"outletid":3,"username":"admin"}]
        String requestjson = json.toString();
        System.out.println(requestjson);
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/itemdeptment/addItemDep.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		System.out.println(responseString);
	}
	
	@Test
	public void testDeleteItemDep() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		
		JSONArray json1 = new JSONArray();
		json1.put(30);
        JSONObject jo = new JSONObject();
        jo.put("ItemDeptId", json1);
        
//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/itemdeptment/deleteItemDep.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}
	
	@Test
	public void testUpdateItemDep() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式
		JSONObject jo = new JSONObject();
		jo.put("ItemDeptCode", "1111");
		jo.put("ItemDeptName", "中華11中華");
		jo.put("pItemDeptId",11);
		jo.put("Status",11);

		jo.put("ItemDeptShortName", "中華11中華");
		jo.put("ItemDeptDesc", "中華11中華");

		jo.put("ItemDeptId", 30);
		jo.put("ItemDeptSeq", 2);

//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
		String requestjson = jo.toString();
		System.out.println(requestjson);


//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/itemdeptment/updateItemDep.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
				.andReturn().getResponse().getContentAsString();


		System.out.println(responseString);
	}
	/*public void testUpdateItemDep() throws  Exception  {
//		delete 需要传的参数和insert不一样，是 BrandSeq:1 pBrandId:[2,3] 这种json格式

        JSONObject jo = new JSONObject();
		jo.put("ItemDeptCode", "21");
		*//*jo.put("ItemDeptName", "1212");
		jo.put("ItemDeptShortName", "1212");
		jo.put("ItemDeptDesc", "1212");
		jo.put("pItemDeptId", "1212");
		jo.put("Status", 0);*//*
		jo.put("ItemDeptId", 30);
		jo.put("ItemDeptSeq", 1212);

        *//*jo.put("ItemDeptSeq", 0);
        jo.put("ItemDeptCode", "1");
        jo.put("ItemDeptName", "中華");*//*
       
//   这个就是前段需要传的json的array     {"outletid":[2,3],"userName":"admin"}
        String requestjson = jo.toString();
        System.out.println(requestjson);
        
		
//json格式的传输不能使用get方法中的paran这样的方法来处理了，必须是下面的方式
		String responseString = mockMvc.perform(MockMvcRequestBuilders.post("/itemdeptment/updateItemDep.do").contentType(MediaType.APPLICATION_JSON).content(requestjson))
                .andReturn().getResponse().getContentAsString();
		

		System.out.println(responseString);
	}*/


}
