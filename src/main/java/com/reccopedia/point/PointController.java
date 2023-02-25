package com.reccopedia.point;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reccopedia.point.bo.PointBO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	private PointBO pointBO;

	// 컨텐츠페이지 - 별점 정보
	@PostMapping("/contents_point_view")
	public String contentsPointView(Model model,
		@RequestParam("point") int point,
		@RequestParam("apiId") int apiId,
		HttpSession session) {
	
		Integer userId = (Integer) session.getAttribute("userId");
		
		
		pointBO.pointToggle(apiId, point, userId);
		
		return "contents/contentsPointResult";
	}
		
}
