package com.yooai.dao;

import java.util.List;

import com.yooai.dto.HoneyFriendDTO;
import com.yooai.modal.Friend;
import com.yooai.modal.FriendKey;
import com.yooai.modal.User;

public interface FriendMapper {
    int deleteByPrimaryKey(FriendKey key);

    List<Integer> selectFriendList(int userId);
    
    int insertSelective(Friend record);
    
    List<HoneyFriendDTO> selectTopFiveByUserId(int userId);
    
    Friend selectByPrimaryKey(FriendKey key);

    int updateByPrimaryKeySelective(Friend record);
}