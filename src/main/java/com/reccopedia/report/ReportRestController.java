package com.reccopedia.report;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.report.bo.ReportBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/report")
public class ReportRestController {
	
	@Autowired
	private ReportBO reportBO;

	// 댓글 신고
	@PostMapping("/create")
	public Map<String, Object> reportComment(
			@RequestParam("apiId") int apiId,
			@RequestParam("commentId") int commentId,
			@RequestParam("content") String content,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 해주세요.");
			return result;
		}
		
		reportBO.reportComment(apiId, userId, commentId, content);
		result.put("code", 1);
		result.put("result", "success");
		
		return result;
		
		
	}
}
