package com.yooai.modal;

public class CollectionKey {
    private Integer collectorId;

    private Integer sayId;

    
    
    public CollectionKey() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CollectionKey(Integer collectorId, Integer sayId) {
		super();
		this.collectorId = collectorId;
		this.sayId = sayId;
	}

	public Integer getCollectorId() {
        return collectorId;
    }

    public void setCollectorId(Integer collectorId) {
        this.collectorId = collectorId;
    }

    public Integer getSayId() {
        return sayId;
    }

    public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }
}