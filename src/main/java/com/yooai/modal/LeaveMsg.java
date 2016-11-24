package com.yooai.modal;

import java.util.Date;

public class LeaveMsg {
    private Integer lmsgId;

    private Integer hostId;

    private Integer touristId;

    private Date lmsgDatatime;

    private String lmsgContent;

    public Integer getLmsgId() {
        return lmsgId;
    }

    public void setLmsgId(Integer lmsgId) {
        this.lmsgId = lmsgId;
    }

    public Integer getHostId() {
        return hostId;
    }

    public void setHostId(Integer hostId) {
        this.hostId = hostId;
    }

    public Integer getTouristId() {
        return touristId;
    }

    public void setTouristId(Integer touristId) {
        this.touristId = touristId;
    }

    public Date getLmsgDatatime() {
        return lmsgDatatime;
    }

    public void setLmsgDatatime(Date lmsgDatatime) {
        this.lmsgDatatime = lmsgDatatime;
    }

    public String getLmsgContent() {
        return lmsgContent;
    }

    public void setLmsgContent(String lmsgContent) {
        this.lmsgContent = lmsgContent == null ? null : lmsgContent.trim();
    }
}