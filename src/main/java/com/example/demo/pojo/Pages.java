package com.example.demo.pojo;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Pages<T> {
	private int pageIndex; /**当前页码*/
	private int pageSize; /**页容量*/
	private int totalCount; /**总记录数*/
	@SuppressWarnings("unused")
	private int totalPage; /**总页数*/
	private List<T> datas = new ArrayList<T>(); /**当前页容量*/
	@SuppressWarnings("unused")
	private int start;
	@SuppressWarnings("unused")
	private int end;
	private Integer id=-1;

	public int getStart(){

		return (pageIndex-1)*pageSize;
	}

	public int getEnd(){
		return pageIndex*pageSize;
	}
	
	public int getTotalPage() {
		return totalCount % pageSize == 0 ? totalCount /pageSize : totalCount / pageSize + 1 ;
	}
}
