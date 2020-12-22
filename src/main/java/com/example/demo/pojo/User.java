package com.example.demo.pojo;





import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class User {
	//用户id
	private Integer id;
	//用户名
	private String name;
	//登录密码
	private String pwd;
	//相片
	private String photo;
	//是否是管理员
	private Integer admin;
	//生日
	private Date brithday;
	//状态
	private Integer state;
	

}
