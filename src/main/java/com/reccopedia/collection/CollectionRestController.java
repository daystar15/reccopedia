package com.reccopedia.collection;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.collection.bo.CollectionBO;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/collection")
public class CollectionRestController {
	
	@Autowired
	private CollectionBO collectionBO;
	
	// 캐시
	@PostMapping("/cash_create")
	public Map<String, Object> cashCreate(
			HttpSession session) {
		

		Integer userId = (Integer) session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		collectionBO.addCashCollection(userId); 
		result.put("code", 1);
		
		return result;
	}
	
	
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
	
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("id") int id,
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
		
		collectionBO.updateCollection(id, userId, subject, content); 
		
		result.put("code", 1);
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> collectionDelete(
			@RequestParam("id") int id,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		collectionBO.deleteCollectionByUserIdApiId(id); 
		
		result.put("code", 1);
		
		return result;
	}
	
	// 컬렉션 컨텐츠 담기
	@PostMapping("/collection_content_create")
	public Map<String, Object> collectionSelectView(Model model, 
			@RequestParam("apiId") int apiId, 
			@RequestParam("type") int type, 
			@RequestParam("collectionId") int collectionId, 
			@RequestParam("title") String title, 
			@RequestParam("posterPath") String posterPath,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		collectionBO.addCollectionContent(apiId, type, null, userId, collectionId, title, posterPath);
		result.put("code", 1);
		
		return result;
	}
	
	// 컬렉션 컨텐츠 담기
	@PutMapping("/collection_content_update")
	public Map<String, Object> collectionUpdateView(Model model, 
			@RequestParam("id") int id,  
			@RequestParam("apiId") int apiId, 
			@RequestParam("collectionId") int collectionId, 
			@RequestParam("title") String title, 
			@RequestParam("posterPath") String posterPath,
			HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		collectionBO.updateCollectionContent(id, apiId, null, userId, collectionId, title, posterPath);
		result.put("code", 1);
		
		return result;
	}

	@DeleteMapping("/collection_content_delete")
	public Map<String, Object> delete(
			@RequestParam("id") int id,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 다시 해주세요.");
			return result;
		}
		
		collectionBO.deleteCollectionContentByIdUserId(id);
		result.put("code", 1);
		
		return result;
		
	}
	
}
