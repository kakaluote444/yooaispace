package com.yooai.dto;

public class CommentMsgDTO {
	private int commenterId;
	private int commenteredId;
	private String commenterName;
	private String commenteredName;
	private String commentContent;
	public CommentMsgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getCommentId() {
		return commenterId;
	}

	public void setCommenterId(int commenterId) {
		this.commenterId = commenterId;
	}



	public int getCommenteredId() {
		return commenteredId;
	}

	public void setCommenteredId(int commenteredId) {
		this.commenteredId = commenteredId;
	}

	public String getCommenterName() {
		return commenterName;
	}
	public void setCommenterName(String commenterName) {
		this.commenterName = commenterName;
	}
	public String getCommenteredName() {
		return commenteredName;
	}
	public void setCommenteredName(String commenteredName) {
		this.commenteredName = commenteredName;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	@Override
	public String toString() {
		return "CommentMsgDTO [commentId=" + commenterId + ", commenteredId="
				+ commenteredId + ", commenterName=" + commenterName
				+ ", commenteredName=" + commenteredName + ", commentContent="
				+ commentContent + "]";
	}
	
}
