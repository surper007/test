package com.example.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class AjaxControllera {
	@RequestMapping("/ajax")
	@ResponseBody
	 public Boolean login(String userName,String pwd){
		System.out.println("===============================================65656556");
		  System.out.println(userName+":"+pwd);
		  if("流星".equals(userName) && "456".equals(pwd)){
		   return true;
		  }
		  return false;
		 }

}
