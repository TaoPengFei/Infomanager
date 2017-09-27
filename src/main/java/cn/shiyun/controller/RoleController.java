package cn.shiyun.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.shiyun.entity.Role;
import cn.shiyun.service.RoleService;

@Controller
@RequestMapping("/role/")
public class RoleController {
	
	@Resource
	private RoleService roleService;
	
	@RequestMapping("role.do")
	public String User(){
		return "role";
	}
	
	@RequestMapping("roleLoad.do")
	@ResponseBody
	public Map<String, Object> loadRoles(){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<String> roles = roleService.loadRoles();
		if(roles != null && roles.size() > 0){
			result.put("code", 1);
			result.put("data", roles);
		}else{
			result.put("code", 0);
			result.put("msg", "无用户角色");
		}
		
		return result;
	}
	
	@RequestMapping("getRoles.do")
	@ResponseBody
	public Map<String, Object> getRolesByName(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<Map<String, Object>> roleList = roleService.getRolesByName(roleName);
		if(roleList != null && roleList.size() > 0){
			result.put("code", 1);
			result.put("data", roleList);
		}else{
			result.put("code", 0);
			result.put("msg", "无用户角色");
		}
		
		return result;
	}
	
	@RequestMapping("addRole.do")
	@ResponseBody
	public Map<String, Object> addRole(Role role){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
		int rowCount = roleService.addRole(role);
			if(rowCount > 0){
				result.put("code", 1);
				result.put("msg", "新增成功");
			}else if (rowCount == -2) {
				result.put("code", -2);
				result.put("msg", "此角色已存在，不允许重复添加");
			}else{
				result.put("code", 0);
				result.put("msg", "新增失败");
			}
		}catch(Exception e){
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("delRole.do")
	@ResponseBody
	public Map<String, Object> delRole(String roleName){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
		int rowCount = roleService.delRole(roleName);
			if(rowCount > 0){
				result.put("code", 1);
				result.put("msg", "删除成功");
			}else{
				result.put("code", 0);
				result.put("msg", "删除失败");
			}
		}catch(Exception e){
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	//修改角色描述
	@RequestMapping("updateRole.do")
	@ResponseBody
	public Map<String, Object> updateRole(Role role){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
		int rowCount = roleService.updateRole(role);
			if(rowCount > 0){
				result.put("code", 1);
				result.put("msg", "修改成功");
			}else{
				result.put("code", 0);
				result.put("msg", "修改失败");
			}
		}catch(Exception e){
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	
	/*@RequestMapping("delRoleMul.do")
	@ResponseBody
	public Map<String, Object> delRoleMul(List<Role> role){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
		int rowCount = roleService.delRole(roleName);
			if(rowCount > 0){
				result.put("code", 1);
				result.put("msg", "删除成功");
			}else{
				result.put("code", 0);
				result.put("msg", "删除失败");
			}
		}catch(Exception e){
			result.put("code", -1);
			result.put("msg", e.getMessage());
		}
		return result;
	}*/
	
	
	/**
	 * 批次导出
	 * @param map
	 * @return
	 */
	/*@RequestMapping("batchExportList.do")
	@ResponseBody
	public void batchExportList(String userName,HttpServletRequest request,HttpServletResponse response,HttpSession session){

		List<Map<String, Object>> downList = roleService.batchExportList(userName);


		if(downList != null && downList.size() > 0){
			OutputStream os = null;
			try {
				//设这输出的类型和文件格式
				response.setContentType("application/vnd.ms-excel;charset=UTF-8");
				//设置文件名和并且解决中文名不能下载
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			    String date = format.format(new Date());
			    String fileName ="项目批次报表"+date+".xls";
                HttpUtil.setFileNameDownloadHeader(request, response, fileName);
                //创建输出流
				os = response.getOutputStream();
				createDownloadMoodListDatas(os, downList);
				} catch (Exception e) {
					String msg = "[批次导出错误] 代理商id：{0},错误信息：{1}";
					//logger.error(MessageFormat.format(msg,user.getAgentId(),e.getMessage()));
			   }finally{
					try {
						if(os != null){
							os.close();
							os.flush();
							response.flushBuffer();
						}
					} catch (IOException e) {
						//String msg = "[批次导出任务,关闭os流错误] 代理商id：{0},错误信息：{1}";
					}
			   }
		}

	}


	private  void createDownloadMoodListDatas(OutputStream os,List<Map<String, Object>> downList)
			throws IOException, RowsExceededException, WriteException {
		WritableWorkbook wbook = Workbook.createWorkbook(os);
		//生成名为“sheet1”的工作表，参数0表示这是第一页   a
		WritableSheet sheet=wbook.createSheet("项目列表",0);
		//字体样式
		WritableFont times16font = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.GRAY_50);
		WritableCellFormat times16format = new WritableCellFormat (times16font);
		//表头
		List<String> list = new ArrayList<String>();
		list.add("角色名称 ");
		list.add("角色描叙");

		for(int i=0;i<list.size();i++){
			Label label = new Label(i,0,list.get(i), times16format);

			sheet.addCell(label);
		}

		if(downList != null && downList.size() >0){
			for(int i=0;i<downList.size();i++){
				Map<String, Object> vo = downList.get(i);
				int j = i+1;
				Label label01 = new Label(0,j,vo.get("roleName")==null?"":vo.get("roleName").toString(), times16format);
				sheet.addCell(label01);
				Label label02 = new Label(1,j,vo.get("roleDesc")==null?"":vo.get("roleDesc").toString(), times16format);
				sheet.addCell(label02);
			}


			//写入数据并关闭文件

		wbook.write();
		wbook.close();
		}
	}*/
}
