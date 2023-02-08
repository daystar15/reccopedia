package com.reccopedia.contents;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentsController {

	// 메인 페이지
	@GetMapping("/main")
	public String main(Model model) {
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
