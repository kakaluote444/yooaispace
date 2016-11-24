package com.yooai.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.dto.HoneyFriendDTO;
import com.yooai.modal.User;
import com.yooai.service.UserService;

@Controller
public class UserControl {
	
	@Autowired
	private UserService userService;
	/**
	 * 用户模糊查询接口
	 */
	@RequestMapping(value="findUser",method=RequestMethod.GET)
	@ResponseBody
	public List<User> fuzzySelectUser(@RequestParam(value="userName",required=false) String userName,HttpServletResponse response){
		//response.setHeader("Access-Control-Allow-Origin", "*");
		if(userName==null||userName.equals("")){
				return null;
		}
		return userService.fuzzySelectByUserName(userName);
	}
	@ResponseBody
	@RequestMapping("getHoneyList/{userId}")
	public List<HoneyFriendDTO> getUserMsg(@PathVariable("userId")int userId){
		return userService.getTopFiveHoney(userId);
	}
	
	@RequestMapping("getUser/{userId}")
	@ResponseBody
	public User getUser(@PathVariable("userId")Integer userId){
		User user = userService.getUserInfo(userId);
		user.setUserPassword(null);
		return user;
	}
}
