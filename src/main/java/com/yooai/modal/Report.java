package com.yooai.modal;

public class Report extends ReportKey {
    private String reportContent;

	public Report() {
		super();
	}
	
	public Report(Integer accuserId, Integer defendantId, Integer sayId) {
		super(accuserId, defendantId, sayId);
	}

	public Report(String reportContent) {
		super();
		this.reportContent = reportContent;
	}

	public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent == null ? null : reportContent.trim();
    }
}