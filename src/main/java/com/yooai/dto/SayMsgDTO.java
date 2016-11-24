package com.yooai.dto;

import java.util.Date;

public class SayMsgDTO {
	private String sayContent;
	private Date saySendTime;
	private int sayViews;
	private int sayLovers;
	private int sayDelete;
	private int sayOpen;
	public SayMsgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSayContent() {
		return sayContent;
	}
	public void setSayContent(String sayContent) {
		this.sayContent = sayContent;
	}
	public Date getSaySendTime() {
		return saySendTime;
	}
	public void setSaySendTime(Date saySendTime) {
		this.saySendTime = saySendTime;
	}
	public int getSayViews() {
		return sayViews;
	}
	public void setSayViews(int sayViews) {
		this.sayViews = sayViews;
	}
	public int getSayLovers() {
		return sayLovers;
	}
	public void setSayLovers(int sayLovers) {
		this.sayLovers = sayLovers;
	}
	public int getSayDelete() {
		return sayDelete;
	}
	public void setSayDelete(int sayDelete) {
		this.sayDelete = sayDelete;
	}
	public int getSayOpen() {
		return sayOpen;
	}
	public void setSayOpen(int sayOpen) {
		this.sayOpen = sayOpen;
	}
	@Override
	public String toString() {
		return "SayMsgDTO [sayContent=" + sayContent + ", saySendTime="
				+ saySendTime + ", sayViews=" + sayViews + ", sayLovers="
				+ sayLovers + ", sayDelete=" + sayDelete + ", sayOpen="
				+ sayOpen + "]";
	}
	
}
