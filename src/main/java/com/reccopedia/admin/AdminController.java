package com.reccopedia.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reccopedia.admin.bo.AdminBO;
import com.reccopedia.comment.bo.CommentBO;
import com.reccopedia.comment.model.Comment;
import com.reccopedia.report.bo.ReportBO;
import com.reccopedia.report.model.Report;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminBO adminBO;
	
	@Autowired
	private ReportBO reportBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;

	// 어드민 로그인 페이지
	@GetMapping("/login")
	public String loginView() {
		return "admin/admin";
	}
	
	// 어드민 유저보드
	@GetMapping("/user_view")
	public String userView(Model model, HttpSession session) {
		
		Integer id = (Integer)session.getAttribute("adminId");
		
		if (id == null) {
			return "redirect:/admin/login";
		}
		
		List<User> userList = userBO.getuserListById(id);

		model.addAttribute("userList", userList);
		model.addAttribute("viewName", "admin/userBoard");
		return "admin/main";
		
	}
	
	// 어드민 신고보드
	@GetMapping("/report_view")
	public String reportView(Model model, HttpSession session) {
		Integer id = (Integer)session.getAttribute("adminId");
		
		if (id == null) {
			return "redirect:/admin/login";
		}
		List<User> userList = userBO.getuserListById(id);
		List<Report> reportList = reportBO.getreportCommentListById(id);
		List<Comment> commentList = commentBO.getCommentListById(id);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("userList", userList);
		model.addAttribute("reportList", reportList);
		model.addAttribute("viewName", "admin/reportBoard");
		return "admin/main";
	}
	
	// 어드민 메뉴
	public String menu(HttpSession session) {
		
		Integer id = (Integer)session.getAttribute("adminId");
		
		if (id == null) {
			return "redirect:/admin/login";
		}
		
		return "admin/menu";
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
		List<Comment> commentList = commentBO.getCommentListById(id);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("userList", userList);
		model.addAttribute("reportList", reportList);
		model.addAttribute("viewName", "admin/mainBoard");
		
		return "admin/main";
	}
}
