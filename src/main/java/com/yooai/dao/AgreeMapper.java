package com.yooai.dao;

import com.yooai.modal.AgreeKey;

public interface AgreeMapper {
    int deleteByPrimaryKey(AgreeKey key);

    int insertSelective(AgreeKey record);
}