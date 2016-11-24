package com.yooai.modal;

public class Picture {
    private Integer pictureId;

    private Integer sayId;

    private String pictureUrl;
    
    

    public Picture(Integer sayId, String pictureUrl) {
		super();
		this.sayId = sayId;
		this.pictureUrl = pictureUrl;
	}

	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getPictureId() {
        return pictureId;
    }

    public void setPictureId(Integer pictureId) {
        this.pictureId = pictureId;
    }

    public Integer getSayId() {
        return sayId;
    }

    public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl == null ? null : pictureUrl.trim();
    }
}