package com.reccopedia.contents;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.restAPI.bo.MainBO;

@RestController
public class ContentsRestController {

	@Autowired
	private MainBO restapiBO;
	
	// 제목, 년도, 나라, 평균별점, 예매율, ~만명
	//@GetMapping("/main")
	public Map<String, Object> main() {
		
		Map<String, Object> result = new HashMap<>();
		
		
		
		
		return result;
	}
	
}
