package com.yooai.dao;

import com.yooai.modal.CollectionKey;

public interface CollectionMapper {
    int deleteByPrimaryKey(CollectionKey key);

    int insertSelective(CollectionKey record);
    
    int selectCollectRecord(CollectionKey collectionKey);
}