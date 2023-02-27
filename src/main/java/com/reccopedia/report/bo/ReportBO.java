package com.reccopedia.report.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.report.dao.ReportDAO;
import com.reccopedia.report.model.Report;

@Service
public class ReportBO {

	@Autowired
	private ReportDAO reportDAO;

	public void reportComment(int apiId, int userId, int commentId, String content) {
		reportDAO.reportComment(apiId, userId, commentId, content);
	}
	
	public List<Report> getreportCommentListById(int id){
		return reportDAO.selectreportCommentListById(id);
	}
}
