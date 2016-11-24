package com.yooai.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.dto.HoneyFriendDTO;
import com.yooai.modal.Log;
import com.yooai.modal.User;
import com.yooai.service.LogService;
import com.yooai.service.LoginService;
import com.yooai.service.UserService;

/**
 * 负责页面跳转的Control
 * @author asusasus
 */
@Controller
public class PageControl {
	@Autowired
	private LoginService loginService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private LogService logService;
	
	@RequestMapping("index")
	@ResponseBody
	public String toIndex(){
		return "";
	}
	/**
	 * 首页
	 * 对Session进行侦测，如果有用户session则进入indedx.jsp；
	 * 若没有session则返回到登陆界面
	 * @return
	 */
	@RequestMapping("index/{id}")
	public String toLoginPage(@PathVariable("id") int id,HttpServletRequest request) {
		//一、保存个人信息
		Cookie cookies[] = request.getCookies();
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				String userName =cookie.getName();
				if(cookie.equals("userName")){//cookie中有userName属性，此时应该去数据库中查询该属性并且放到session缓存中
					User loginUser = loginService.getUserByName(userName);
					request.getSession().setAttribute("loginUser", loginUser);
				}
			}
			
			//二、保存亲密好友排行榜的信息
			List<HoneyFriendDTO> honeies = userService.getTopFiveHoney(id);
			request.setAttribute("honeies", honeies);
			//三、保存说说分类信息
			
			//四、保存当前用户的说说信息
		}
		User user = (User) request.getSession().getAttribute("loginUser");
		
		if(user==null){//在cookie和session中都没有loginUser对象
			return "redirect:/login.jsp";//返回登陆界面
		}else{
			return "index";
		}
	}
	/**
	 * 去好友页面
	 * 
	 */
	@RequestMapping("user")
	public String toFriendPage(@RequestParam("uid") int userId,HttpServletRequest request){
		request.setAttribute("userId", userId);
		return "friend";
	}
	/**
	 * 去说说详情页面
	 * 
	 */
	@RequestMapping("detail")
	public String toDetailPage(@RequestParam("userId") int userId,@RequestParam("sayId") int sayId,HttpServletRequest request){
		request.setAttribute("userId", userId);
		request.setAttribute("sayId", sayId);
		return "saydetail";
	}

	/**
	 * 与我相关页面
	 * @return
	 */
	@RequestMapping("yuwoxg")
	public String toYuWoXGPage() {
		return "yuwoxg";
	}

	/**
	 * 日志页面
	 * @return
	 */
	@RequestMapping("rizhi")
	public String toRiZiPage() {
		return "rizhi";
	}

	/**
	 * 相册页面
	 * @return
	 */
	@RequestMapping("album")
	public String toAlbumPage() {
		return "album";
	}

	/**
	 * 留言页面
	 * @return
	 */
	@RequestMapping("liuyan")
	public String toLiuYanPage() {
		return "liuyan";
	}

	/**
	 * 个人中心页面
	 * @return
	 */
	@RequestMapping("gerenzx")
	public String toGeRenZXPage() {
		return "gerenzx";
	}
	/**
	 * 个人资料页面
	 * @return
	 */
	@RequestMapping("gerenzl")
	public String toGeRenZLPage() {
		return "gerenzl";
	}
	/**
	 * 个人资料页面
	 * @return
	 */
	@RequestMapping("accessdeny")
	public String toAccessDenyPage() {
		return "accessdeny";
	}
	/**
	 * 发表日志页面
	 */
	@RequestMapping("sendlog")
	public String toSendLogPage(){
		return "sendlog";
	}
	/**
	 * 日志更新页面
	 */
	@RequestMapping("logUpdate/{logId}")
	public String toUpdateLogPage(@PathVariable("logId")Integer logId,Map<String,Object> map){
		Log log = logService.queryLog(logId);
		map.put("updateLog", log);
		return "logupdate";
	}
	/**
	 * 日志更新页面
	 */
	@RequestMapping("logDetail/{logId}")
	public String toLogDetailPage(@PathVariable("logId")Integer logId,Map<String,Object> map){
		Log log = logService.queryLog(logId);
		map.put("detailLog", log);
		return "logdetail";
	}

	/**
	 * 友爱用户修改页面
	 * @return
	 */
	@RequestMapping("userDetail/{userId}")
	public String toUupdateUserPage(@PathVariable("userId")Integer userId,Map<String,Object>  map){
		User detailUser = userService.getUserInfo(userId);
		map.put("detailUser", detailUser);
		return "updateuser";
	}
}
