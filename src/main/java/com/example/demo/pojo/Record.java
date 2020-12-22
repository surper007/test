package com.example.demo.pojo;



import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
public class Record {
	//标题号
	private String id;
	//标题名
	private String title;
	//标题内容
	private String content;
	//标题时间
	private Date occurrenceTime;
	//标题状态
	private String state;
	

}
