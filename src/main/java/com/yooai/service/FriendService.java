package com.yooai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.FriendMapper;

@Service
public class FriendService {
	@Autowired
	private FriendMapper friendDao;
	public List<Integer> getFriendIDs(int userId){
		return friendDao.selectFriendList(userId);
	}
}
