package com.yooai.dao;

import com.yooai.modal.Suggestion;

public interface SuggestionMapper {
    int deleteByPrimaryKey(Integer suggestionId);

    int insert(Suggestion record);

    int insertSelective(Suggestion record);

    Suggestion selectByPrimaryKey(Integer suggestionId);

    int updateByPrimaryKeySelective(Suggestion record);

    int updateByPrimaryKeyWithBLOBs(Suggestion record);

    int updateByPrimaryKey(Suggestion record);
}