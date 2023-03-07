package com.reccopedia.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.admin.bo.AdminBO;
import com.reccopedia.admin.model.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminRestController {
	
	@Autowired
	private AdminBO adminBO;

	@PostMapping("/sign_in")
	public Map<String, Object> singIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			Model model,
			HttpServletRequest request) { // 세션을 사용하기 위해
		
		
		// db select
		Admin admin = adminBO.getAdminByLoginIdPassword(loginId, password);
		
		model.addAttribute("admin", admin);
		
		Map<String, Object> result = new HashMap<>();
		
		if (admin != null) {
			// 행이 있으면 로그인
			result.put("code", 1);
			result.put("result", "성공");
			
			// 세션이라는 공간에 유저 정보를 담는다.(로그인 상태 유지)
			HttpSession session = request.getSession();
			session.setAttribute("adminId", admin.getId());
			session.setAttribute("adminName", admin.getName());

		} else {
			// 행이 없으면 로그인 실패
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자입니다.");
		}
		
		// return map
		return result; // response
	}
}
