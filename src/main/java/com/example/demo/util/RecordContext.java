package com.example.demo.util;



import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.example.demo.pojo.Pages;
import com.example.demo.pojo.Record;
import com.example.demo.pojo.User;

public class RecordContext {
	/**
	 * 当前登录的Record在session的key
	 */
	private static String PAGES_IN_SESSION_KEY = "pages";
	private static String INFOLIST_IN_SESSION_KEY = "info";
	
	
	/**
	 * 得到Session对象
	 * @return
	 */
	private static HttpSession getSession(){
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
	}
	/**
	 * 把分页对象保存到session中
	 * @param pages
	 */
	public static void setPage(Pages<Record> pages) {
		getSession().setAttribute(PAGES_IN_SESSION_KEY,pages);
		
	}
	
	/**
	 * 从session获取分页对象
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Pages<Record> getPage(){
		return (Pages<Record>) getSession().getAttribute(PAGES_IN_SESSION_KEY);
	}
	/**
	 * 把修改时回显的对象存入session中
	 * @param recordlist
	 */
	public static void setInfo(Record recordlist) {
		getSession().setAttribute(INFOLIST_IN_SESSION_KEY,recordlist);
		
	}
	/**
	 * 从session中获取回显对象
	 * @return
	 */
	public Record getInfo(){
		return (Record) getSession().getAttribute(INFOLIST_IN_SESSION_KEY);
	}
	
	/**
	 * 用户存在session域中
	 * @param pages
	 */
	public static void setUserlistPage(Pages<User> pages) {
		getSession().setAttribute(PAGES_IN_SESSION_KEY, pages);
		
	}
	
	
	

}
