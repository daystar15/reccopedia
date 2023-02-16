package com.reccopedia.contents;

import java.util.List;
import java.util.List;
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
		
		List<Map<String, Object>> popularResult = contentsBO.generatePopularMap();
		List<Map<String, Object>> netflixResult = contentsBO.generateNetflixMap();
		List<Map<String, Object>> topratedResult = contentsBO.generateTopRatedMap();

		
		model.addAttribute("popularResult", popularResult);
		model.addAttribute("netflixResult", netflixResult);
		model.addAttribute("topratedResult", topratedResult);

		model.addAttribute("viewName", "contents/main");
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 기본정보
	@GetMapping("/contents/overview_view")
	public String overviewView(Model model, int id) throws JsonProcessingException {
		Map<String, Object> contentInfo = contentsBO.generateContent(id);
		List<Map<String, Object>> contentResult = contentsBO.generateContentCrew(id);
		String GenreResult = contentsBO.generateGenre(id);
		
		model.addAttribute("genre", GenreResult);
		model.addAttribute("viewName", "contents/overview");
		model.addAttribute("crews", contentResult);
		model.addAttribute("contents", contentInfo);
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 컨텐츠 개별 페이지
	@GetMapping("/contents/contents_view")
	public String contentsView(Model model, int id) throws JsonProcessingException {
		Map<String, Object> contentInfo = contentsBO.generateContent(id);
		List<Map<String, Object>> contentResult = contentsBO.generateContentCrew(id);
		String GenreResult = contentsBO.generateGenre(id);
		
		model.addAttribute("genre", GenreResult);
		model.addAttribute("crews", contentResult);
		model.addAttribute("contents", contentInfo);
		model.addAttribute("viewName", "contents/contentsPage");
		return "template/layout";
	}
}
