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
import com.reccopedia.collection.model.Collection;
import com.reccopedia.collection.model.CollectionContent;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	
	@Autowired
	private CollectionBO collectionBO;


	// 컬렉션 생성 페이지
	@GetMapping("/collection_create_view")
	public String collectionCreateView(Model model, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요!");
		} else if (userId != null) {
			result.put("code", 1);
		}
		
		model.addAttribute("viewName", "collection/collectionCreate");
		return "template/layout";
	}
	
	// 컬렉션 컨텐츠 담는 조각 페이지
	@GetMapping("/collection_select_view")
	public String collectionSelectView(Model model, 
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		List<CollectionContent> collectionContent = collectionBO.getCollectionContentList(userId);
		 
		model.addAttribute("collectionContent", collectionContent);
		return "collection/collectionSelect";
	}
	
	// 컬렉션 수정 페이지
	@GetMapping("/update_view")
	public String collectionUpdateView(Model model, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null) {
			return "redirect:/main";
		}
		
		//Collection collection = collectionBO.getCollectionByIdAndUserId(id, userId);
		Map<String, Object> collectionMap = collectionBO.getCollectionMapByUserId(userId);
	
		//model.addAttribute("collection", collection);
		model.addAttribute("collectionMap", collectionMap);
		model.addAttribute("viewName", "collection/collectionUpdate");
		return "template/layout";
	}
		
		
	// 컬렉션 목록 페이지
	@GetMapping("/collection_list_view")
	public String collectionListView(Model model, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("viewName", "collection/collectionList");
		return "template/layout";
	}
	
	
	// 컬렉션 페이지
	@GetMapping("/collection_view")
	public String collectionView(Model model, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> collectionMap = collectionBO.getCollectionMapByUserId(userId);
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("collectionMap", collectionMap);
		model.addAttribute("viewName", "collection/collectionPage");
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
	
	
		
}
