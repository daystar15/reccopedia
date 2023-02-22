package com.reccopedia.watching;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.watching.bo.WatchingBO;

import jakarta.servlet.http.HttpSession;

@RestController
public class WatchingRestController {

	@Autowired
	private WatchingBO watchingBO;
	
	@PostMapping("/watching/{apiId}")
	public Map<String, Object> watching(
			@PathVariable int apiId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부
		Integer userId = (Integer) session.getAttribute("userId");
		
		if(userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		
		watchingBO.watchingToggle(apiId, userId);
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
		
	}
	
}
