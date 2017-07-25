package cn.shiyun.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface EmpOutletDao {
	//已设置人员营业区数据查询
	public List<Map<String, Object>> getOutletByEmp(String userName);

	//批量， params 2条记录  1个key userName, value userName的值，1个outletid的list, key outletid,value就是具体的list
	public int insertEmpOutlet(List<HashMap<String, Object>> params);

	//删除人员营业区关系，批量
	public int deleteEmpOutlet(Map<String, Object> params);
	
}
