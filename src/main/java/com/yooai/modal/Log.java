package com.yooai.modal;

import java.util.Date;

public class Log {
    private Integer logId;

    private Integer userId;

    private String logTitle;

    private Date logDatetime;

    private String logContent;

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLogTitle() {
        return logTitle;
    }

    public void setLogTitle(String logTitle) {
        this.logTitle = logTitle == null ? null : logTitle.trim();
    }

    public Date getLogDatetime() {
        return logDatetime;
    }

    public void setLogDatetime(Date logDatetime) {
        this.logDatetime = logDatetime;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent == null ? null : logContent.trim();
    }

	@Override
	public String toString() {
		return "Log [logId=" + logId + ", userId=" + userId + ", logTitle="
				+ logTitle + ", logDatetime=" + logDatetime + ", logContent="
				+ logContent + "]";
	}
    
}