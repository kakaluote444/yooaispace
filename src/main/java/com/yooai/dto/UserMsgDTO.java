package com.yooai.dto;

public class UserMsgDTO {
	private int userId;
	private String userName;
	private String headIcon;
	public UserMsgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public UserMsgDTO(String userName, String headIcon) {
		super();
		this.userName = userName;
		this.headIcon = headIcon;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getHeadIcon() {
		return headIcon;
	}
	public void setHeadIcon(String headIcon) {
		this.headIcon = headIcon;
	}
	@Override
	public String toString() {
		return "UserMsgDTO [userName=" + userName + ", headIcon=" + headIcon
				+ "]";
	}
	
}
