package cn.shiyun.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class HttpUtil {
	  /***
	   * 设置文件下载文件名头
	   * @param request
	   * @param response
	   * @param fileName
	   */
	  public static void setFileNameDownloadHeader(HttpServletRequest request, HttpServletResponse response, String fileName) {
	         final String userAgent = request.getHeader("USER-AGENT");
	         try {
	             String finalFileName = null;
	             if(StringUtils.contains(userAgent, "MSIE")){
	                 finalFileName = URLEncoder.encode(fileName,"UTF8");
	             }else if(StringUtils.contains(userAgent, "Mozilla")){
	                 finalFileName = new String(fileName.getBytes("gbk"), "ISO8859-1");
	             }else{
	                 finalFileName = URLEncoder.encode(fileName,"UTF8");
	             }
	             response.setHeader("Content-Disposition", "attachment; filename=\"" + finalFileName + "\"");
	         } catch (UnsupportedEncodingException e) {
	        	 e.printStackTrace();
	         }
	   }
}
