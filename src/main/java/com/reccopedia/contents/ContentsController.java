package com.reccopedia.contents;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.reccopedia.contents.bo.ContentsBO;

@Controller
public class ContentsController {

	@Autowired
	private ContentsBO contentsBO;
	
	// 메인 페이지
	@GetMapping("/main")
	public String main(Model model) throws JsonProcessingException {
		
		Map<String, Object> result = contentsBO.generateMainMap();
		
		model.addAttribute("title", result.get("overview"));
		model.addAttribute("viewName", "contents/main");
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 기본정보
	@GetMapping("/contents/overview_view")
	public String overviewView(Model model) {
		model.addAttribute("viewName", "contents/overview");
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 컨텐츠 개별 페이지
	@GetMapping("/contents/contents_view")
	public String contentsView(Model model) {
		model.addAttribute("viewName", "contents/contentsPage");
		return "template/layout";
	}
}
