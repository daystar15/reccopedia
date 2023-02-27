package com.reccopedia.report.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.report.model.Report;

@Repository
public interface ReportDAO {

	public void reportComment( 
			@Param("apiId") int apiId,  
			@Param("userId") int userId,
			@Param("commentId") int commentId,
			@Param("content") String content);
	
	public List<Report> selectreportCommentListById(int id);

}
