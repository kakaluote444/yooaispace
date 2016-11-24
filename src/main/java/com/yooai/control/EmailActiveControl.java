package com.yooai.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.service.RegisterService;
import com.yooai.util.MD5Util;

@Controller
public class EmailActiveControl {
	@Autowired
	private RegisterService registerService;
	
	private String yanzhi="fefg2354gdb";
	@ResponseBody
	@RequestMapping("/email/geturl/{id}")
	public String getEmailActiveURL(@PathVariable("id")String id){
		String  activeUrl = "www.liuburu.cn/yooaispace/user/"+MD5Util.encode(id)+yanzhi+"/"+id+"/active";
		return activeUrl;
	}
	/**
	 * 邮箱激活
	 */
	@RequestMapping("/user/{encode}/{id}/active")
	public String dealActiveUser(@PathVariable("encode")String encode,@PathVariable("id")Integer id){
		if(!((MD5Util.encode(id+"")+yanzhi).equals(encode))){//加密地址+盐值
			throw new RuntimeException("邮件激活地址错误");
		}
		//更新激活用户的状态
		registerService.activeYooAiUser(id);
		return "redirect:/login.jsp";
	}
}
