package com.yooai.modal;

public class ReportKey {
    private Integer accuserId;

    private Integer defendantId;

    private Integer sayId;

    public ReportKey(Integer accuserId, Integer defendantId, Integer sayId) {
		super();
		this.accuserId = accuserId;
		this.defendantId = defendantId;
		this.sayId = sayId;
	}

	public ReportKey() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getAccuserId() {
        return accuserId;
    }

    public void setAccuserId(Integer accuserId) {
        this.accuserId = accuserId;
    }

    public Integer getDefendantId() {
        return defendantId;
    }

    public void setDefendantId(Integer defendantId) {
        this.defendantId = defendantId;
    }

    public Integer getSayId() {
        return sayId;
    }

    public void setSayId(Integer sayId) {
        this.sayId = sayId;
    }
}