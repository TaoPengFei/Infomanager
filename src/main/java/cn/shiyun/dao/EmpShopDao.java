package cn.shiyun.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpShopDao {
		//已设置人员酒店数据查询
		public List<Map<String, Object>> getShopByEmp(String userName);

		//批量， params 2条记录  1个key userName, value userName的值，1个shopid的list, key shopid,value就是具体的list
		public int insertEmpShop(List<HashMap<String, Object>> params);

		//删除人员酒店关系，批量
		public int deleteEmpShop(Map params);
}
