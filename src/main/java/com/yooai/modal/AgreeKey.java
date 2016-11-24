package com.yooai.modal;

public class AgreeKey {
    private Integer sayId;

    private Integer friendId;

    
    public AgreeKey(Integer sayId, Integer friendId) {
		super();
		this.sayId = sayId;
		this.friendId = friendId;
	}

	public AgreeKey() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getUserId() {
        return sayId;
    }

    public void setUserId(Integer userId) {
        this.sayId = userId;
    }

    public Integer getSayId() {
        return sayId;
    }

    public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }
}