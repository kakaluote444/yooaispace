package com.yooai.dao;

import com.yooai.modal.SayTypeKey;

public interface SayTypeMapper {
    int deleteByPrimaryKey(SayTypeKey key);

    int insert(SayTypeKey record);

    int insertSelective(SayTypeKey record);
}