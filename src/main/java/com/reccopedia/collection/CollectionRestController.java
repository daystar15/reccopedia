package com.reccopedia.collection;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
			@RequestParam("movieList") String movieList,
			HttpSession session) {
		
		
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
		}
		
		collectionBO.addCollection(userId, subject, content, movieList); 
		result.put("code", 1);
		
		return result;
	}

	
	
}
