package com.reccopedia.comment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.reccopedia.comment.bo.CommentBO;
import com.reccopedia.comment.model.CommentView;
import com.reccopedia.point.bo.PointBO;
import com.reccopedia.user.bo.UserBO;

@Controller
public class CommentController {

	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private PointBO pointBO;

	// 댓글 페이지
	@GetMapping("/comment_view")
	public String commentView(Model model, int id, HttpSession session) {
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		// 예외처리
		if (userId != null) {
			Map<String, Object> userInfo = userBO.getUserByObj(userId);
			Map<String, Object> myComment = commentBO.getCommentByObj(id, (Integer)session.getAttribute("userId"));
			
			model.addAttribute("userInfo", userInfo);	
			model.addAttribute("myComment", myComment);	
		}
		
		List<CommentView> commentList = commentBO.generateCommentViewListByApiId(id);
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		model.addAttribute("commentList", commentList);
		model.addAttribute("viewName", "comment/comment");
		return "template/layout";
	}
	
}
