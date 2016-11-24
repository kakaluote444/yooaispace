package com.yooai.modal;

import java.util.Date;

public class Say {
    private Integer sayId;

    private Integer userId;

    private String sayContent;

	private Integer sayViews;

    private Date saySendtime;

    private Integer sayLovers;

    private Integer sayOpen;

    private Integer sayDelete;

    private Integer readStatus;
    
    private int top;
    
    public Say() {
		super();
		this.saySendtime = new Date();
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public Integer getSayId() {
        return sayId;
    }

    public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSayViews() {
        return sayViews;
    }

    public void setSayViews(Integer sayViews) {
        this.sayViews = sayViews;
    }

    public Date getSaySendtime() {
        return saySendtime;
    }

    public void setSaySendtime(Date saySendtime) {
        this.saySendtime = saySendtime;
    }

    public Integer getSayLovers() {
        return sayLovers;
    }

    public void setSayLovers(Integer sayLovers) {
        this.sayLovers = sayLovers;
    }

    public Integer getSayOpen() {
        return sayOpen;
    }

    public void setSayOpen(Integer sayOpen) {
        this.sayOpen = sayOpen;
    }

    public Integer getSayDelete() {
        return sayDelete;
    }

    public void setSayDelete(Integer sayDelete) {
        this.sayDelete = sayDelete;
    }

    public Integer getReadStatus() {
        return readStatus;
    }

    public void setReadStatus(Integer readStatus) {
        this.readStatus = readStatus;
    }

    public String getSayContent() {
        return sayContent;
    }

    public void setSayContent(String sayContent) {
        this.sayContent = sayContent == null ? null : sayContent.trim();
    }

	@Override
	public String toString() {
		return "Say [sayId=" + sayId + ", userId=" + userId + ", sayContent="
				+ sayContent + ", sayViews=" + sayViews + ", saySendtime="
				+ saySendtime + ", sayLovers=" + sayLovers + ", sayOpen="
				+ sayOpen + ", sayDelete=" + sayDelete + ", readStatus="
				+ readStatus + ", top=" + top + "]";
	}
    
}