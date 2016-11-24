package com.yooai.dao;

import com.yooai.modal.Request;
import com.yooai.modal.RequestKey;

public interface RequestMapper {
    int deleteByPrimaryKey(RequestKey key);

    int insert(Request record);

    int insertSelective(Request record);

    Request selectByPrimaryKey(RequestKey key);

    int updateByPrimaryKeySelective(Request record);

    int updateByPrimaryKey(Request record);
}