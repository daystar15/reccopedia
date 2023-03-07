package com.reccopedia.collection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.reccopedia.collection.bo.CollectionBO;
import com.reccopedia.collection.model.Collection;
import com.reccopedia.collection.model.CollectionContent;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	
	@Autowired
	private CollectionBO collectionBO;


	// 컬렉션 생성 페이지
	@GetMapping("/collection_create_view")
	public String collectionCreateView(Model model, HttpSession session, @RequestParam("id") int id) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요!");
		} else if (userId != null) {
			result.put("code", 1);
		}
		

		List<CollectionContent> collectionContetByCollectionId = collectionBO.getCollectionContentByCollectionId(id);
		List<CollectionContent> collectionContent = collectionBO.getCollectionContentList(userId);
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		int num = collectionBO.getCollectionId();
		
		model.addAttribute("num", num);
		model.addAttribute("collectionContetByCollectionId", collectionContetByCollectionId);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("collectionContent", collectionContent);
		model.addAttribute("viewName", "collection/collectionCreate");
		return "template/layout";
	}
	
	
	
	// 컬렉션 수정 페이지
	@GetMapping("/update_view")
	public String collectionUpdateView(Model model, HttpSession session, @RequestParam("id") int id) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요!");
		} else if (userId != null) {
			result.put("code", 1);
		}
		
		int num = collectionBO.getCollectionId();
		List<CollectionContent> collectionContetByCollectionId = collectionBO.getCollectionContentByCollectionId(id);
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		List<CollectionContent> collectionContentList = collectionBO.getCollectionContentList(userId);
		List<CollectionContent> collectionContent = collectionBO.getCollectionContentList(userId);
		
		
		model.addAttribute("num", num);		
		model.addAttribute("collectionContetByCollectionId", collectionContetByCollectionId);		
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("collectionContent", collectionContent);
		model.addAttribute("collectionContentList", collectionContentList);
		model.addAttribute("viewName", "collection/collectionUpdate");
		return "template/layout";
	}
		
		
	// 컬렉션 목록 페이지
	@GetMapping("/collection_list_view")
	public String collectionListView(Model model, HttpSession session) throws JsonMappingException, JsonProcessingException {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		int num = collectionBO.getCollectionId();
		List<CollectionContent> collectionContentList = collectionBO.getCollectionContentList(userId);
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		List<CollectionContent> collectionContent = collectionBO.getCollectionContent();
		
		model.addAttribute("num", num);
		model.addAttribute("collectionContent", collectionContent);
		model.addAttribute("collectionContentList", collectionContentList);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("viewName", "collection/collectionList");
		return "template/layout";
	}
	
	
	// 컬렉션 페이지
	@GetMapping("/collection_view")
	public String collectionView(Model model, HttpSession session, @RequestParam("id") int id) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		List<CollectionContent> collectionContentList = collectionBO.getCollectionContentList(userId);
		List<CollectionContent> collectionContetByCollectionId = collectionBO.getCollectionContentByCollectionId(id);
		Map<String, Object> collectionSubjectContent = collectionBO.getCollectionSubjectContent(id);
		int num = collectionBO.getCurrentCollectionId(id);
		
		model.addAttribute("num", num);
		model.addAttribute("collectionSubjectContent", collectionSubjectContent);
		model.addAttribute("collectionContetByCollectionId", collectionContetByCollectionId);
		model.addAttribute("collectionContentList", collectionContentList);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("viewName", "collection/collectionPage");
		return "template/layout";
	}
		
	
	// 컬렉션 찾기 페이지
	@GetMapping("/collection_find_view")
	public String collectionFindView(Model model)  {
		model.addAttribute("viewName", "collection/collectionFind");
		return "template/layout";
	}
	
	
	// 컬렉션(수정) 찾기 페이지
	@GetMapping("/collection_update_find_view")
	public String collectionUpdateFindView(Model model)  {
		model.addAttribute("viewName", "collection/collectionFindUpdate");
		return "template/layout";
	}
	
		
	// 컬렉션 검색 결과 페이지
	@GetMapping("/collection_find_result_view")
	public String findResult(
			@RequestParam("title") String title, HttpSession session,
			Model model) throws JsonProcessingException {
		
		Integer userId = (Integer) session.getAttribute("userId");

		Map<String, Object> result = new HashMap<>();

		List<Map<String, Object>> keywordList = collectionBO.findKeyword(title);

		if (keywordList.size() >= 1) {
			result.put("code", 1);
		} else {
			result.put("errorMessage","검색어를 다시 입력해주세요");
		}
		
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		int num = collectionBO.getCollectionId();
		
		model.addAttribute("num", num);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("keywordList", keywordList);
		
		return "collection/collectionFindResult";
	}
	
	
	// 컬렉션(수정) 검색 결과 페이지
	@GetMapping("/collection_update_result_view")
	public String updateResult(
			@RequestParam("title") String title, HttpSession session,
			Model model) throws JsonProcessingException {
		
		Integer userId = (Integer) session.getAttribute("userId");

		Map<String, Object> result = new HashMap<>();

		List<Map<String, Object>> keywordList = collectionBO.findKeyword(title);

		if (keywordList.size() >= 1) {
			result.put("code", 1);
		} else {
			result.put("errorMessage","검색어를 다시 입력해주세요");
		}
		
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		int num = collectionBO.getCollectionId();
		
		model.addAttribute("num", num);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("keywordList", keywordList);
		
		return "collection/collectionFindUpdateResult";
	}
	
	
		
}
