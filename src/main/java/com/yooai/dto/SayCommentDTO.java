package com.yooai.dto;

import java.util.Date;
import java.util.List;

import com.yooai.modal.Type;

public class SayCommentDTO {
	private int sayId;
	private UserMsgDTO userMsgDTO;
	private SayMsgDTO sayMsgDTO;
	private List<CommentMsgDTO> commentMsgDTO;
	private List<Type> typeNames;

	public SayCommentDTO() {
		super();
	}

	public int getSayId() {
		return sayId;
	}

	public void setSayId(int sayId) {
		this.sayId = sayId;
	}

	public UserMsgDTO getUserMsgDTO() {
		return userMsgDTO;
	}

	public void setUserMsgDTO(UserMsgDTO userMsgDTO) {
		this.userMsgDTO = userMsgDTO;
	}

	public SayMsgDTO getSayMsgDTO() {
		return sayMsgDTO;
	}

	public void setSayMsgDTO(SayMsgDTO sayMsgDTO) {
		this.sayMsgDTO = sayMsgDTO;
	}

	public List<CommentMsgDTO> getCommentMsgDTO() {
		return commentMsgDTO;
	}

	public void setCommentMsgDTO(List<CommentMsgDTO> commentMsgDTO) {
		this.commentMsgDTO = commentMsgDTO;
	}

	
	public List<Type> getTypeNames() {
		return typeNames;
	}

	public void setTypeNames(List<Type> typeNames) {
		this.typeNames = typeNames;
	}

	@Override
	public String toString() {
		return "SayCommentDTO [sayId=" + sayId + ", userMsgDTO=" + userMsgDTO
				+ ", sayMsgDTO=" + sayMsgDTO + ", commentMsgDTO="
				+ commentMsgDTO + ", typeNames=" + typeNames + "]";
	}

	

}
