package com.example.demo.service.impl;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.RecordMapper;
import com.example.demo.pojo.Pages;
import com.example.demo.pojo.Record;
import com.example.demo.pojo.User;
import com.example.demo.service.RecordService;
import com.example.demo.util.RecordContext;



@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
	private RecordMapper recordMapper;
    /**
           * 用户名密码登录
     */
	@Override
	public boolean login(String name, String pwd) {
		return recordMapper.queryByNameAndPwd(name,pwd)==null?false:true;
	}
	/**
	 * 分页
	 */
	@Override
	public  void  findInfo(Pages<Record> pages) {
		int Index = 1;
		if(pages.getPageIndex() != 0) {
			Index = pages.getPageIndex();
		}
		int Size = 5;
		if(pages.getPageSize() != 0) {
			Size = pages.getPageSize();
		}
		pages.setPageIndex(Index);
		pages.setPageSize(Size);
		pages.setStart((Index-1)*Size);
		pages.setEnd(Index*Size);
		pages.setTotalCount(recordMapper.findCount(pages));
		pages.setDatas(recordMapper.findInfo(pages));
		RecordContext.setPage(pages);
		
	}
	@Override
	public void findRecord(String id) {
		Record recordlist =	recordMapper.findRecord(id);
		RecordContext.setInfo(recordlist);
	}
	@Override
	public void updateRecord(Record record) {
		
		recordMapper.updateRecord(record);
	}
	@Override
	public void batchDelRecord(String[] ids) {
		recordMapper.batchDelRecord(ids);
		
	}
	@Override
	public void addaddRecord(Record record) {
		recordMapper.addaddRecord(record);
		
	}
	@Override
	public void addUser(User user) {
		
		recordMapper.addUser(user);
	}
	@Override
	public void queryUserlist(Pages<User> pages) {
		int Index = 1;
		if(pages.getPageIndex() != 0) {
			Index = pages.getPageIndex();
		}
		int Size = 5;
		if(pages.getPageSize() != 0) {
			Size = pages.getPageSize();
		}
		pages.setPageIndex(Index);
		pages.setPageSize(Size);
		pages.setStart((Index-1)*Size);
		pages.setEnd(Index*Size);
		pages.setTotalCount(recordMapper.findUserlistCount(pages));
		pages.setDatas(recordMapper.findUserInfo(pages));
		RecordContext.setUserlistPage(pages);
		
	}
	
	
	
	
	

}
