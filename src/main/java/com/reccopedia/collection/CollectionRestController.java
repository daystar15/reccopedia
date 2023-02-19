package com.reccopedia.collection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.reccopedia.collection.bo.CollectionBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/collection")
public class CollectionRestController {
	
	@Autowired
	private CollectionBO collectionBO;
	
	

	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		collectionBO.addCollection(userId, subject, content); 
		result.put("code", 1);
		
		return result;
	}
	
	@GetMapping("/find")
	public Map<String, Object> create(
			@RequestParam("title") String title,
			Model model) throws JsonProcessingException {

		Map<String, Object> result = new HashMap<>();

		List<Map<String, Object>> keywordList = collectionBO.findKeyword(title);
		
		
		model.addAttribute("keywordList", keywordList);

		if (keywordList.size() >= 1) {
			result.put("code", 1);
		} else {
			result.put("errorMessage","검색어를 다시 입력해주세요");
		}
		
		return result;
	}
	
	
}
