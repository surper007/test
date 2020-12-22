package com.example.demo.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxController {
	@RequestMapping("/a1")
	public void ajax(String name,HttpServletResponse response) throws IOException {
		if("admin".equals(name)) {
			
			response.getWriter().print("true");
		}else {
			System.out.println(name);
			response.getWriter().print("false");
		}
	}

}
