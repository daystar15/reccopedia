package com.reccopedia.point;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.point.bo.PointBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/point")
public class PointRestController {
	
	@Autowired
	private PointBO pointBO;

	@PostMapping("/insert")
	public Map<String, Object> point(
			@RequestParam("point") int point,
			@RequestParam("apiId") int apiId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		
		pointBO.insertPoint(userId, point, apiId);
		result.put("code", 1);
		result.put("result", "success");
		
		return result;
	}
	
}
