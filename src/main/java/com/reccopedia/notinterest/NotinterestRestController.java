package com.reccopedia.notinterest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.notinterest.bo.NotinterestBO;

import javax.servlet.http.HttpSession;

@RestController
public class NotinterestRestController {


	@Autowired
	private NotinterestBO notinterestBO;

	@PostMapping("/notinterest/{id}")
	public Map<String, Object> notinterest(
			@PathVariable int id, int type,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부
		Integer userId = (Integer) session.getAttribute("userId");
		
		if(userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		
		notinterestBO.notinterestToggle(id, type, userId);
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
		
	}
}
