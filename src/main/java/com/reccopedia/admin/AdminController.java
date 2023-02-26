package com.reccopedia.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reccopedia.admin.bo.AdminBO;
import com.reccopedia.admin.model.Admin;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminBO adminBO;

	// 어드민 로그인 페이지
	@GetMapping("/login")
	public String loginView() {

		return "admin/admin";
	}

	// 어드민 메인 페이지
	@GetMapping("/main")
	public String mainView(HttpSession session) {
		
		Integer id = (Integer)session.getAttribute("adminId");
		
		if (id == null) {
			return "redirect:/admin/login";
		}
		
		return "admin/main";
	}
}
