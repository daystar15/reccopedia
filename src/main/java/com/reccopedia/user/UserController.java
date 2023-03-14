package com.reccopedia.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reccopedia.collection.bo.CollectionBO;
import com.reccopedia.collection.model.Collection;
import com.reccopedia.comment.bo.CommentBO;
import com.reccopedia.point.bo.PointBO;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.watching.bo.WatchingBO;
import com.reccopedia.wish.bo.WishBO;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private CollectionBO collectionBO;
	
	// 로그인	
	@GetMapping("/sign_in_view")
	public String signInView() {
		return "test/login";
	}
	
	// 로그아웃
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		// 로그아웃 - 세션에 있는 것을 모두 비운다.
		session.removeAttribute("userEmail");
		session.removeAttribute("userPassword");
		session.removeAttribute("userName");
		session.removeAttribute("userId");
		session.removeAttribute("userProfile");
		
		return "redirect:/main";
	}
	
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
		List<Map<String, Object>> wishTVList = wishBO.getWishTVList(userId);
		List<Map<String, Object>> pointList = pointBO.getPointList(userId);
		int point = pointBO.plusPoint(userId);
		List<Map<String, Object>> pointTVList = pointBO.getPointTVList(userId);
		List<Map<String, Object>> commentList = commentBO.getCommentList(userId);
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		model.addAttribute("point", point);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pointTVList", pointTVList);
		model.addAttribute("wishTVList", wishTVList);
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
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		Map<String, Object> userInfo = userBO.getUserByObj(userId);
		List<Map<String, Object>> wishList = wishBO.getWishList(userId);
		List<Map<String, Object>> wishTVList = wishBO.getWishTVList(userId);
		List<Map<String, Object>> pointList = pointBO.getPointList(userId);
		List<Map<String, Object>> pointTVList = pointBO.getPointTVList(userId);
		List<Map<String, Object>> commentList = commentBO.getCommentList(userId);
		List<Collection> collectionList = collectionBO.getCollectionList(userId);
		
		model.addAttribute("num", num);
		model.addAttribute("num", num);
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pointTVList", pointTVList);
		model.addAttribute("wishTVList", wishTVList);
		model.addAttribute("pointList", pointList);
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
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		model.addAttribute("wishList", wishList);
		model.addAttribute("watchingtList", watchingtList);
		model.addAttribute("pointList", pointList);
		model.addAttribute("viewName", "user/keepEvaluate");
		return "template/layout";
	}
	
	// 유저페이지 - 평가페이지 -tv
	@GetMapping("/tv_evaluate_view")
	public String tvEvaluateView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		
		List<Map<String, Object>> wishTVList = wishBO.getWishTVList(userId);
		List<Map<String, Object>> pointTVList = pointBO.getPointTVList(userId);
		List<Map<String, Object>> watchingTVList = watchingBO.getWatchingTVList(userId);
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		model.addAttribute("watchingTVList", watchingTVList);
		model.addAttribute("wishTVList", wishTVList);
		model.addAttribute("pointTVList", pointTVList);
		
		model.addAttribute("viewName", "user/tvKeepEvaluate");
		return "template/layout";
	}
	
	// 유저페이지 - 보는중
	@GetMapping("/watching_view")
	public String watchingView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		
		List<Map<String, Object>> watchingtList = watchingBO.getWatchingList(userId);
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		model.addAttribute("watchingtList", watchingtList);
		model.addAttribute("viewName", "user/keepWatching");
		return "template/layout";
	}
	
	// 유저페이지 - 보는중 - tv
	@GetMapping("/tv_watching_view")
	public String tvWatchingView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		List<Map<String, Object>> watchingTVList = watchingBO.getWatchingTVList(userId);
		
		model.addAttribute("watchingTVList", watchingTVList);
		model.addAttribute("viewName", "user/tvKeepWatching");
		return "template/layout";
	}
	
	// 유저페이지 - 보고싶어요
	@GetMapping("/wish_view")
	public String wishView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		List<Map<String, Object>> wishList = wishBO.getWishList(userId);

		model.addAttribute("wishList", wishList);
		model.addAttribute("viewName", "user/keepWish");
		return "template/layout";
	}
	
	// 유저페이지 - 보고싶어요 - tv
	@GetMapping("/tv_wish_view")
	public String tvWishView(Model model,
			HttpSession session) {
		
		Integer userId  = (Integer)session.getAttribute("userId");
		// 푸터 별점개수
		int num = pointBO.getPointCountByUserId();
		
		model.addAttribute("num", num);
		List<Map<String, Object>> wishTVList = wishBO.getWishTVList(userId);

		model.addAttribute("wishList", wishTVList);
		model.addAttribute("viewName", "user/tvKeepWish");
		return "template/layout";
	}

}
