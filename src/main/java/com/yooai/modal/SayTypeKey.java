package com.yooai.modal;

public class SayTypeKey {
    private Integer sayId;

    private Integer typeId;

    public Integer getSayId() {
        return sayId;
    }
    
    

    public SayTypeKey(Integer sayId, Integer typeId) {
		super();
		this.sayId = sayId;
		this.typeId = typeId;
	}



	public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
}