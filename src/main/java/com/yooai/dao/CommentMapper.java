package com.yooai.dao;

import com.yooai.modal.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer commentId);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

}