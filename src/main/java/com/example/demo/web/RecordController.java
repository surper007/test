package com.example.demo.web;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.pojo.Pages;
import com.example.demo.pojo.Record;
import com.example.demo.pojo.ResponseResult;
import com.example.demo.pojo.User;
import com.example.demo.service.RecordService;
import com.example.demo.util.UploadUtil;

@Controller
public class RecordController {
	
	@Autowired
	private RecordService recordService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(path ="/login.action")
	@ResponseBody
	public ResponseResult login(String name,String pwd, HttpSession session)  {
		ResponseResult<User> result = new ResponseResult<User>();
		boolean flag = recordService.login(name,pwd);
		if(flag){ 
			//登录成功
			session.setAttribute("current", name);
			result.setStatus("success");
		}else{
			//登录失败
			result.setStatus("error");
			result.setMsg("用户名或者密码错误");
		}
		
		return result;
	}
	
	/**
	 * 事件分页
	 * @param pages
	 * @return
	 */
	@RequestMapping("/jsp/index.action")
	public String RecordtList(Pages<Record> pages) {
		recordService.findInfo(pages);
		return "forward:/WEB-INF/jsp/index.jsp";
	}
	/**
	 * 回显要修改的事件
	 * @param material_ID
	 * @return
	 */
	@RequestMapping("/findRecord.action")
	public String findRecord(String id) {
		
		recordService.findRecord(id);
		return "forward:/WEB-INF/jsp/updateRecord.jsp";
	}
	/**
	 * 修改事件
	 * @param productinfo
	 * @return
	 */
	@RequestMapping("/updateRecord.action")
	public String updateRecord(Record record){
		System.out.println(record);
		recordService.updateRecord(record);
		return "redirect:/jsp/index.action";
	}
	
	
	/**
	 * 批量删除
	 * @param id
	 */
	@RequestMapping("/batchDelRecord.action")
	public String batchDelRecord(String[] ids){
		recordService.batchDelRecord(ids);
		return "forward:/WEB-INF/jsp/msg.jsp";
	}
	/**
	 * 添加事件
	 */
	@RequestMapping("/insertRecord.action")
	public String insertRecord(Model model){
		return "forward:/WEB-INF/jsp/addRecord.jsp";
	
	}
	@RequestMapping("/addRecord.action")
	public String addRecord(Record record){
		 recordService.addaddRecord(record);
		 System.out.println("hh");
		return "redirect:/jsp/index.action";
		
	
	}
	
	/**
	 * 注册
	 * @return
	 */
	@RequestMapping("/addUser.action")
	public String Regiest() {
		return "forward:/WEB-INF/jsp/addUser.jsp";
		
	}
	
	@PostMapping("/regist.action")
	public String addUser(User user, MultipartFile  upload) throws IllegalStateException, IOException {
		
			// 获取标签的name属性:  getName()
			//得到上传的文件名  getOriginalFilename();
			String  uploadFileName = upload.getOriginalFilename();
			System.out.println("===========================");
			System.out.println(uploadFileName);
			//生产的文件名
			String saveFileName = UUID.randomUUID().toString()+uploadFileName.substring(uploadFileName.lastIndexOf("."));
			//保存  transferTo
			upload.transferTo(new File(UploadUtil.getSavePath(),saveFileName));
			//把保存的文件名赋给user的photo属性
			user.setPhoto(saveFileName);
			System.out.println(user);
			recordService.addUser(user);
				
			
		
			return "redirect:/jsp/index.action";
		
	}
	
	/*@RequestMapping(path="/upload",method=RequestMethod.POST)
	public String addUser(MultipartFile  upload) throws IllegalStateException, IOException {
		
		String  uploadFileName = upload.getOriginalFilename();
		System.out.println(uploadFileName);
		String saveFileName = UUID.randomUUID().toString()+uploadFileName.substring(uploadFileName.lastIndexOf("."));
		//保存  transferTo
		upload.transferTo(new File(UploadUtil.getSavePath(),saveFileName));
		System.out.println("===========================");
		return "redirect:/jsp/index.action";
		
	}
	*/
	@RequestMapping("/userlist")
	public String userlist(Pages<User> pages) {
		recordService.queryUserlist(pages);
		return "forward:/WEB-INF/jsp/userlist.jsp";
	}
	
	
	
	
	
	

}
