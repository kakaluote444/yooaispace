package com.yooai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.UserMapper;
import com.yooai.modal.User;
import com.yooai.util.EmailTool;
import com.yooai.util.MD5Util;
@Service
public class RegisterService {
		private String yanzhi="fefg2354gdb";
		
		@Autowired
		private UserMapper userDao;
		
		/**
		 * 添加友爱用户
		 * @param user
		 * @return
		 */
		public boolean addYooAiUser(User user,String configPath){
			int result=0;
			try {
				result = userDao.insertSelective(user);
				if(result==1){//用户注册成功，则发送邮件到该用户
					EmailTool emailTool = new EmailTool(configPath,"smtp.163.com", "18702604785","psw13870160279");
					String  activeUrl = "http://www.liuburu.cn/yooaispace/user/"+MD5Util.encode(user.getUserId()+"")+yanzhi+"/"+user.getUserId()+"/active";
					String activeHtml = "欢迎注册“友爱空间”账号^_^，<a href='"+activeUrl+"'>点我</a>激活账号";
					emailTool.setSubject("您收到一份来自“友爱空间”的验证");
					emailTool.setContent(activeHtml);
					emailTool.SendEmailMsg("18702604785@163.com", user.getUserEmail());
				}
			} catch (Exception e) {//重复注册
				e.printStackTrace();
				return false;
			}
			return true;
		}
		
		/**
		 * 激活友爱用户
		 * @param id
		 */
		public void activeYooAiUser(int id){
			User user = new User();
			user.setUserId(id);
			user.setEmailEable(1);
			int result = userDao.updateByPrimaryKeySelective(user);
			if(result==0){
				throw new RuntimeException("用户激活时候，更新用户状态异常");
			}
		}
		
		
}
