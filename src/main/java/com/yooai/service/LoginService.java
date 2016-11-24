package com.yooai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.UserMapper;
import com.yooai.modal.User;
import com.yooai.util.MsgTip;

/**
 * 登陆逻辑层
 * @author asusasus
 */
@Service
public class LoginService {
	@Autowired	
	private UserMapper userDao;
	
	/**
	 * 根据用户名和密码判断该用户是否可以登陆
	 * @param userName
	 * @param password
	 * @return   1：可登陆  0：无此用户  -1:密码错误
	 */
	public String canLogin(User user){
		String userName = user.getUserName();
		String userPassword = user.getUserPassword();
		if((userDao.selectByUserName(userName)==null)&&(userDao.selectByUserEmail(userName)==null)){
			return MsgTip.NO_EXIST_USER;
		}else{
			if(userDao.selectByNameAndEmail(userName,userPassword)==null){
				return MsgTip.PASSWORD_ERR;
			}else{
				return MsgTip.LOGIN_SUCCESS;
			}
		}
	}
	/**
	 * 查询用户的ID
	 * @param user
	 * @return
	 */
	public int getUserId(User user){
		return userDao.selectByNameAndEmail(user.getUserName(), user.getUserPassword()).getUserId();
	}
	
	/**
	 * 通过用户Id查询用户对象
	 * @param userId
	 * @return
	 */
	public User getUserById(int userId){
		return userDao.selectByPrimaryKey(userId);
	}
	
	public User getUserByName(String userName){

		return userDao.selectByUserName(userName);
	}
	
}
