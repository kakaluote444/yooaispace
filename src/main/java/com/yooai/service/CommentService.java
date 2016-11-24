package com.yooai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.CommentMapper;
import com.yooai.modal.Comment;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper commentDao;
	
	/**
	 * 新增评论
	 * @param comment
	 * @return 影响结果集
	 */
	public int addComment(Comment comment){
		return commentDao.insertSelective(comment);
	}
}
