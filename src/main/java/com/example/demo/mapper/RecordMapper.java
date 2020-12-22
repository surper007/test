package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.pojo.Pages;
import com.example.demo.pojo.Record;
import com.example.demo.pojo.User;

@Mapper
public interface RecordMapper {
    /**
          * 根据用户名和密码登录
     * @param name
     * @param pwd
     * @return
     */
	User queryByNameAndPwd(String name, String pwd);
   /**
        * 查询事件总记录数
    * @param pages
    * @return
    */
	int findCount(Pages<Record> pages);
	/**
	  * 对总记录数分页
	 * @param pages
	 * @return
	 */
	List<Record> findInfo(Pages<Record> pages);
	/**
	 * 回显事件
	 * @param id
	 * @return
	 */
	Record findRecord(String id);
	/**
	 * 修改事件
	 * @param record
	 */
	void updateRecord(Record record);
	/**
	 * 批量删除
	 * @param ids
	 */
	void batchDelRecord(String[] ids);
	/**
	 * 添加事件
	 * @param record
	 */
	void addaddRecord(Record record);
	
	/**
	 * 注册用户
	 * @param user
	 */
	void addUser(User user);
	
	/**
	 * 查询用户总记录数
	 * @param pages
	 * @return
	 */
	int findUserlistCount(Pages<User> pages);
	/**
	 * 用户分页
	 * @param pages
	 * @return
	 */
	List<User> findUserInfo(Pages<User> pages);
	
	

}
