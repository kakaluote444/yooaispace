package com.yooai.interceptor;
/**
 * 空间好友访问过滤器
 */
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yooai.modal.User;
import com.yooai.service.FriendService;
import com.yooai.service.UserService;

public class UserAccessPermitHandlerInterceptor implements HandlerInterceptor {
	@Autowired
	private FriendService friendService;
	@Autowired
	private UserService userService;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.err.println("空间访问拦截器启动.....\n");
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if(loginUser==null){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		List<Integer> friendIDs = friendService.getFriendIDs(loginUser.getUserId());
		//被访问的对象id
		String targetID = request.getParameter("uid");
		if(friendIDs.contains(Integer.parseInt(targetID))){
			User friendUser = userService.getUserInfo(Integer.parseInt(targetID));
			request.setAttribute("userId", friendUser.getUserId());
			request.setAttribute("userId", friendUser.getUserName());
			return true;
		}else{
			User friendUser = userService.getUserInfo(Integer.parseInt(targetID));
			friendUser.setUserPassword(null);
			request.setAttribute("friendUser", friendUser);
			request.getRequestDispatcher("accessdeny").forward(request, response);
			return false;
		}
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
		// TODO Auto-generated method stub

	}

}
