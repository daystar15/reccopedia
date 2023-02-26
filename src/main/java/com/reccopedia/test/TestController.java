package com.reccopedia.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reccopedia.test.dao.TestDAO;

import jakarta.servlet.http.HttpSession;

@Controller
public class TestController {
	
	@Autowired
	private TestDAO testDAO;

	@GetMapping("/test1")
	@ResponseBody // 데이터 통으로 넘김
	public String test1() {
		return "Hello world!!";
	}
	
	@GetMapping("/test2")
	@ResponseBody
	public Map<String, Object> test2() {
		Map<String, Object> result = new HashMap<>();
		result.put("키1", 111);
		result.put("키2", 222);
		result.put("키3", 333);
		return result;
	}
	
	@GetMapping("/test3")
	public String test3() {
		return "test/test";
	}
	
	@GetMapping("/test4")
	@ResponseBody
	public List<Map<String, Object>> test4() {
		return testDAO.selectPostListTEST();
	}
	
	// 로그인	
	@GetMapping("/user/sign_in_view")
	public String signInView() {
		return "test/login";
	}
	
	// 로그아웃
	@GetMapping("/user/sign_out")
	public String signOut(HttpSession session) {
		// 로그아웃 - 세션에 있는 것을 모두 비운다.
		session.removeAttribute("userEmail");
		session.removeAttribute("userPassword");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		
		return "redirect:/main";
	}
	
	
	// 평가하기 페이지
	@GetMapping("/review_view")
	public String reviewView(Model model) {
	model.addAttribute("viewName", "review/review");
		return "template/layout";
	}
	
	

}
