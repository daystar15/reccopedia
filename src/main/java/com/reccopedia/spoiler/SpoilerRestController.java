package com.reccopedia.spoiler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.spoiler.bo.SpoilerBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/spoiler")
public class SpoilerRestController {
	
	@Autowired
	private SpoilerBO spoilerBO;

	@PostMapping("/create")
	public Map<String, Object> spoilerCreate (
			@RequestParam("spoiler") String spoiler,
			@RequestParam("apiId") int apiId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부
		Integer userId = (Integer) session.getAttribute("userId");
		
		if(userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		
		spoilerBO.spoilerToggle(apiId, userId, spoiler);
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
		
	}
}
