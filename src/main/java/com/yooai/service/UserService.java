package com.yooai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.FriendMapper;
import com.yooai.dao.UserMapper;
import com.yooai.dto.HoneyFriendDTO;
import com.yooai.modal.User;

/**
 * 用户登陆后应该做的一些基本业务逻辑
 * @author asusasus
 *
 */
@Service
public class UserService {
	@Autowired
	private FriendMapper friendDao;
	
	@Autowired
	private UserMapper userDao;
	
	/**
	 * 获取用户个人信息
	 * @param userId
	 * @return
	 */
	public User getUserInfo(int userId){
		return userDao.selectByPrimaryKey(userId);
	}
	
	/**
	 * 亲密好友列表
	 * @param userId
	 * @return
	 */
	public List<HoneyFriendDTO> getTopFiveHoney(int userId){
			List<HoneyFriendDTO> honeies = friendDao.selectTopFiveByUserId(userId);
			return honeies;
	}
	
	/**
	 * 用户名模糊匹配
	 * @param userName
	 * @return
	 */
	public List<User> fuzzySelectByUserName(String userName){
		return userDao.selectfuzzyByUserName(userName);
	}
}
