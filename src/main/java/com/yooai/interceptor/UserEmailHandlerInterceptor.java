package com.yooai.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yooai.modal.User;
import com.yooai.service.LoginService;

/**
 * 拦截未激活的用户
 * 
 * @author asusasus
 *
 */
public class UserEmailHandlerInterceptor implements HandlerInterceptor {
	
	@Autowired
	private LoginService loginService;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("邮件激活拦截器执行了");
		String userName = request.getParameter("userName");
		User loginUser = loginService.getUserByName(userName);
		if(loginUser.getEmailEable()==1){
			return true;
		}else{
			//检测到用户还未激活，则跳转回登陆界面
			request.setAttribute("login_info", "您的邮箱还未进行激活呢");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
