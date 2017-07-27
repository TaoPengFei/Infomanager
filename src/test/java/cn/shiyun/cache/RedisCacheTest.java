package cn.shiyun.cache;

import cn.shiyun.service.EmpOutletService;
import cn.shiyun.service.EmpShopService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 陶鹏飞 on 2017/7/27.
 */
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"classpath:spring-redis.xml"})
@ContextConfiguration(locations = { "classpath:spring-mvc.xml", "classpath:spring-mybatis.xml","classpath:spring-redis.xml"})
public class RedisCacheTest {
    private static final Logger logger = LoggerFactory.getLogger(RedisCacheTest.class);

    @Resource
    private EmpOutletService empOutletService;

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
        list.add(5);
        map1.put("username", "admin");
        map1.put("outletid", 3);
        map2.put("username", "admin");
        map2.put("outletid", 4);

        params.add(map1);
        params.add(map2);
        params2.put("username", "admin");
        params2.put("outletid", list);
    }
    /*
     *  二级缓存测试
     */
    @Test
    public void testGetOutletByEmp() {
        List<Map<String,Object>> list1 = empOutletService.getOutletByEmp(getUserName());
        System.out.println(list1);
    }
    /*
    @Autowired
    private EmpShopService empShopService;
    */
    /*
     * 二级缓存测试
    @Test
    public void testCache2() {
        PageInfo<Site> page1 = service.querySite("", 1, 2, "", "");
        logger.info(page1.getList().get(1).getName());

        PageInfo<Site> page2 = service.querySite("", 2, 2, "", "");
        logger.info(page2.getList().get(0).getName());

        PageInfo<Site> page3 = service.querySite("", 1, 2, "", "");
        logger.info(page3.getList().get(0).getName());
    }
    */

}
