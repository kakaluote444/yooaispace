package com.yooai.modal;

import java.util.Date;

public class Comment {
    private Integer commentId;

    private Integer sayId;

    private Integer commenterId;

    private Integer commenteredId;

    private Date commentDatatime;

    private String commentConent;

    
    public Comment() {
		super();
		this.commentDatatime = new Date();//默认评论时间为当前时间
	}

	public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getSayId() {
        return sayId;
    }

    public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }

    public Integer getCommenterId() {
        return commenterId;
    }

    public void setCommenterId(Integer commenterId) {
        this.commenterId = commenterId;
    }

    public Integer getCommenteredId() {
        return commenteredId;
    }

    public void setCommenteredId(Integer commenteredId) {
        this.commenteredId = commenteredId;
    }

    public Date getCommentDatatime() {
        return commentDatatime;
    }

    public void setCommentDatatime(Date commentDatatime) {
        this.commentDatatime = commentDatatime;
    }

    public String getCommentConent() {
        return commentConent;
    }

    public void setCommentConent(String commentConent) {
        this.commentConent = commentConent == null ? null : commentConent.trim();
    }
}