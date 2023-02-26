package com.reccopedia.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.reccopedia.comment.bo.CommentBO;
import com.reccopedia.comment.model.CommentView;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {

	@Autowired
	private CommentBO commentBO;

	// 댓글 페이지
	@GetMapping("/comment_view")
	public String commentView(Model model, int id, HttpSession session) {
		//Integer userId = (Integer) session.getAttribute("userId");
			
		List<CommentView> commentList = commentBO.generateCommentViewListByApiId(id);
		model.addAttribute("commentList", commentList);
		model.addAttribute("viewName", "comment/comment");
		return "template/layout";
	}
	
}
