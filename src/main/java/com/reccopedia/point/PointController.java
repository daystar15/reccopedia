package com.reccopedia.point;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.reccopedia.point.bo.PointBO;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointBO pointBO;
	
	@Autowired
	private UserBO userBO;
	

	// 평가하기 페이지
	@GetMapping("/review_view")
	public String reviewView(Model model, HttpSession session) throws JsonProcessingException {
		
		
		User userinfo = userBO.getUserByIntegerId((Integer)session.getAttribute("userId"));
		List<Map<String, Object>> movieTrending = pointBO.generateMovieTrendingMap();
		
		
			//List<Point> pointList = pointBO.getPointCountByApiId(id, point, (Integer) session.getAttribute("userId"));
			//model.addAttribute("pointList", pointList);
		
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("movieTrending", movieTrending);
		model.addAttribute("viewName", "review/review");
		
		return "template/layout";
	}
	
	// 평가하기 페이지
	/*
	 * @PostMapping("/point/{id}") public String reviewView(
	 * 
	 * @PathVariable int id, String title, String posterPath, int point, HttpSession
	 * session, Model model) throws JsonProcessingException {
	 * 
	 * Map<String, Object> result = new HashMap<>();
	 * 
	 * // 로그인 여부 Integer userId = (Integer) session.getAttribute("userId");
	 * 
	 * if(userId == null) { result.put("code", 500); result.put("errorMessage",
	 * "로그인을 해주세요"); }
	 * 
	 * pointBO.pointToggle(id, userId, point, title, posterPath);
	 * 
	 * 
	 * User userinfo =
	 * userBO.getUserByIntegerId((Integer)session.getAttribute("userId"));
	 * List<Map<String, Object>> movieTrending = pointBO.generateMovieTrendingMap();
	 * List<Point> pointList = pointBO.getPointCountListByApiIdAndUserId(id,
	 * (Integer)session.getAttribute("userId"));
	 * 
	 * model.addAttribute("pointList", pointList); model.addAttribute("userinfo",
	 * userinfo); model.addAttribute("movieTrending", movieTrending);
	 * model.addAttribute("viewName", "review/review");
	 * 
	 * return "template/layout"; }
	 */

	
	// 컨텐츠페이지 - 별점 정보
	@PostMapping("/contents_point_view")
	public String contentsPointView(Model model,
		@RequestParam("point") int point,
		@RequestParam("apiId") int apiId,
		@RequestParam("title") String title,
		@RequestParam("posterPath") String posterPath,
		HttpSession session) {
	
		Integer userId = (Integer) session.getAttribute("userId");
		
		pointBO.pointToggle(apiId, point, userId, title, posterPath);
		//List<Point> pointList = pointBO.getPointCountListByApiIdAndUserId(apiId, (Integer)session.getAttribute("userId"));
		
		//model.addAttribute("pointList", pointList);
		return "contents/contentsPointResult";
	}
		
}
