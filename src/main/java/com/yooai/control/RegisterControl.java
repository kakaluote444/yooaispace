package com.yooai.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.modal.User;
import com.yooai.service.RegisterService;

@Controller
public class RegisterControl {
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String registerUser(User user,Map<String,Object> map,HttpServletRequest request){
		String configPath = request.getServletContext().getRealPath("/email");
		boolean flag = registerService.addYooAiUser(user,configPath);
		if(flag){
			map.put("login_info", "注册成功,需邮箱激活");
			return "forward:/login.jsp";
		}else{
			map.put("login_info", "用户名已被注册");
			return "forward:/login.jsp";
		}
	}
}
