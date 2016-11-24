package com.yooai.control;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yooai.modal.User;
import com.yooai.service.LoginService;
import com.yooai.util.MsgTip;

@Controller
public class LoginContol {
		@Autowired
		private LoginService loginService;
		
		/**
		 * 用户登填写登陆信息进行登陆的逻辑处理
		 * @param user
		 * @param map
		 * @param request
		 * @return
		 */
		@RequestMapping(value="/login",method=RequestMethod.POST)
		public String loginHandler(User user,Map<String,Object> map,HttpServletRequest request,HttpServletResponse response){
				String loginResult = loginService.canLogin(user);
				if(loginResult.equals(MsgTip.LOGIN_SUCCESS)){//登陆成功		//1.把用户名设置到session中	
					int userId = loginService.getUserId(user);
					User loginUser = loginService.getUserById(userId);
					//一、保存用户的信息
					//1.保存到session中
					request.getSession().setAttribute("loginUser", loginUser);
					//2.保存到cookie中
					Cookie userCookie  = new Cookie("userName", loginUser.getUserEmail());
					userCookie.setMaxAge(3600 * 3);//保存三个小时在cookie上
					response.addCookie(userCookie);
					return "redirect:index/"+userId;
				}else if(loginResult.equals(MsgTip.PASSWORD_ERR)){//密码错误
					map.put("login_info", loginResult);
					return "forward:/login.jsp";
				}else if(loginResult.equals(MsgTip.NO_EXIST_USER)){//不存在用户
					map.put("login_info", loginResult);
					return "forward:/login.jsp";
				}else{
					return null;
				}
		}
		
		@RequestMapping("/logout")
		public String logoutHandler(HttpServletRequest request,HttpServletResponse response){
			//1.清空session
			request.getSession().invalidate();
			//2.清空cookie
			Cookie[] cookies = request.getCookies();
			for (Cookie temp : cookies) {
				if(temp.getName().equals("userName")){//把名称为userName的cookie清除
					Cookie cookie = new Cookie(temp.getName(),null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
			return "redirect:/login.jsp";
		}

}
