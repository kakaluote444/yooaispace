package com.yooai.dao;

import com.yooai.modal.LeaveMsg;

public interface LeaveMsgMapper {
    int deleteByPrimaryKey(Integer lmsgId);

    int insert(LeaveMsg record);

    int insertSelective(LeaveMsg record);

    LeaveMsg selectByPrimaryKey(Integer lmsgId);

    int updateByPrimaryKeySelective(LeaveMsg record);

    int updateByPrimaryKeyWithBLOBs(LeaveMsg record);

    int updateByPrimaryKey(LeaveMsg record);
}