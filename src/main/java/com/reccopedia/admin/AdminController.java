package com.reccopedia.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reccopedia.admin.bo.AdminBO;
import com.reccopedia.report.bo.ReportBO;
import com.reccopedia.report.model.Report;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminBO adminBO;
	
	@Autowired
	private ReportBO reportBO;
	
	@Autowired
	private UserBO userBO;

	// 어드민 로그인 페이지
	@GetMapping("/login")
	public String loginView() {

		return "admin/admin";
	}

	// 어드민 메인 페이지
	@GetMapping("/main")
	public String mainView(HttpSession session, Model model) {
		
		Integer id = (Integer)session.getAttribute("adminId");
		
		if (id == null) {
			return "redirect:/admin/login";
		}
		
		List<User> userList = userBO.getuserListById(id);
		List<Report> reportList = reportBO.getreportCommentListById(id);
		
		model.addAttribute("userList", userList);
		model.addAttribute("reportList", reportList);
		
		return "admin/main";
	}
}
