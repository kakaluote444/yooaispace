package com.yooai.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yooai.dao.ReportMapper;
import com.yooai.modal.Report;
import com.yooai.modal.ReportKey;

@Service
public class ReportService {
	@Autowired
	private ReportMapper reportDao;
	
	public int makeSayReport(int accuserId,int defendantId,int sayId,String reportContent){
		Report report = new Report(accuserId, defendantId, sayId);
		report.setReportContent(reportContent);
		return reportDao.insertSelective(report);
	}
}
