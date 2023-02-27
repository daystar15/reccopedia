package com.reccopedia.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.reccopedia.comment.bo.CommentBO;
import com.reccopedia.point.bo.PointBO;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.watching.bo.WatchingBO;
import com.reccopedia.watching.model.Watching;
import com.reccopedia.wish.bo.WishBO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private WishBO wishBO;

	@Autowired
	private PointBO pointBO;

	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private WatchingBO watchingBO;
	
	// 유저페이지
	@GetMapping("/user_view")
	public String userView(Model model, 
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, Object> result = new HashMap<>();
		if (userName == null) {
			result.put("code", 500); // 비로그인 상태
			result.put("result", "error");
			result.put("errorMessage", "로그인을 해주세요.");
		}
		
		Map<String, Object> userInfo = userBO.getUserByObj(userId);
		List<Map<String, Object>> wishList = wishBO.getWishList(userId);
		List<Map<String, Object>> pointList = pointBO.getPointList(userId);
		List<Map<String, Object>> commentList = commentBO.getCommentList(userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pointList", pointList);
		model.addAttribute("commentList", commentList);
		
		model.addAttribute("viewName", "user/userPage");
		return "template/layout";
	}
	
	// 유저 수정페이지
	@GetMapping("/user_update_view")
	public String userUpdateView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, Object> userInfo = userBO.getUserByObj(userId);
		List<Map<String, Object>> wishList = wishBO.getWishList(userId);
		List<Map<String, Object>> pointList = pointBO.getPointList(userId);
		List<Map<String, Object>> commentList = commentBO.getCommentList(userId);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pointList", pointList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("viewName", "user/userPageUpdate");
		
		return "template/layout";
	}
	

	// 유저페이지 - 평가페이지
	@GetMapping("/evaluate_view")
	public String evaluateView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		
		List<Map<String, Object>> pointList = pointBO.getPointList(userId);
		List<Map<String, Object>> watchingtList = watchingBO.getWatchingList(userId);
		List<Map<String, Object>> wishList = wishBO.getWishList(userId);

		
		model.addAttribute("wishList", wishList);
		model.addAttribute("watchingtList", watchingtList);
		model.addAttribute("pointList", pointList);
		model.addAttribute("viewName", "user/keepEvaluate");
		return "template/layout";
	}
	
	// 유저페이지 - 보는중
	@GetMapping("/watching_view")
	public String watchingView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		
		List<Map<String, Object>> watchingtList = watchingBO.getWatchingList(userId);
		
		model.addAttribute("watchingtList", watchingtList);
		model.addAttribute("viewName", "user/keepWatching");
		return "template/layout";
	}
	
	// 유저페이지 - 보고싶어요
	@GetMapping("/wish_view")
	public String wishView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		
		List<Map<String, Object>> wishList = wishBO.getWishList(userId);

		model.addAttribute("wishList", wishList);
		model.addAttribute("viewName", "user/keepWish");
		return "template/layout";
	}

}
