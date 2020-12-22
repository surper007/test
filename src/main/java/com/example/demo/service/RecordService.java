package com.example.demo.service;


import com.example.demo.pojo.Pages;
import com.example.demo.pojo.Record;
import com.example.demo.pojo.User;

public interface RecordService {

	boolean login(String name, String pwd);

	void findInfo(Pages<Record> pages);

	void updateRecord(Record record);

	void findRecord(String id);

	void batchDelRecord(String[] ids);

	void addaddRecord(Record record);

	void addUser(User user);

	void queryUserlist(Pages<User> pages);



}
