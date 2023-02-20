package com.reccopedia.collection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.reccopedia.collection.bo.CollectionBO;
import com.reccopedia.contents.bo.ContentsBO;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	
	@Autowired
	private CollectionBO collectionBO;

	@Autowired
	private ContentsBO contentsBO;

	// 컬렉션 생성 페이지
	@GetMapping("/collection_create_view")
	public String collectionCreateView(Model model) {
	model.addAttribute("viewName", "collection/collectionCreate");
		return "template/layout";
	}
	
	// 컬렉션 수정 페이지
	@GetMapping("/update_view")
	public String collectionUpdateView(Model model) {
		model.addAttribute("viewName", "collection/collectionUpdate");
		return "template/layout";
	}
		
		
	// 컬렉션 목록 페이지
	@GetMapping("/collection_list_view")
	public String collectionListView(Model model) {
		model.addAttribute("viewName", "collection/collectionList");
		return "template/layout";
	}
		
	
	// 컬렉션 찾기 페이지
	@GetMapping("/collection_find_view")
	public String collectionFindView(Model model)  {
		model.addAttribute("viewName", "collection/collectionFind");
		return "template/layout";
	}
		
	// 컬렉션 검색 결과 페이지
	@GetMapping("/collection_find_result_view")
	public String findResult(
			@RequestParam("title") String title,
			Model model) throws JsonProcessingException {

		Map<String, Object> result = new HashMap<>();

		List<Map<String, Object>> keywordList = collectionBO.findKeyword(title);

		if (keywordList.size() >= 1) {
			result.put("code", 1);
		} else {
			result.put("errorMessage","검색어를 다시 입력해주세요");
		}
		model.addAttribute("keywordList", keywordList);

		return "collection/collectionFindResult";
	}
	
	
	// 컬렉션 추가 리스트 페이지
	@GetMapping("/collection_add_list_view")
	public String addList(
			@RequestParam("id") int id,
			Model model) throws JsonProcessingException {

		Map<String, Object> result = new HashMap<>();

		Map<String, Object> addList = contentsBO.generateContent(id);

		
		model.addAttribute("addList", addList);

		return "collection/collectionAddList";
	}
		
}
