package com.reccopedia.collection;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.collection.bo.CollectionBO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
		    cookie.getName(); // 쿠키의 이름 ex) JSESSION
		    cookie.getValue(); // 쿠키의 값 ex) EH3EQWE2135ED8D7D54434GHJGS...
		}
		
		
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

	
	
	
	
}
