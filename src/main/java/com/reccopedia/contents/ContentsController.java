package com.reccopedia.contents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.reccopedia.comment.bo.CommentBO;
import com.reccopedia.comment.model.CommentView;
import com.reccopedia.contents.bo.ContentsBO;
import com.reccopedia.notinterest.bo.NotinterestBO;
import com.reccopedia.point.bo.PointBO;
import com.reccopedia.point.model.Point;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;
import com.reccopedia.watching.bo.WatchingBO;
import com.reccopedia.wish.bo.WishBO;

import jakarta.servlet.http.HttpSession;

@Controller
public class ContentsController {

	@Autowired
	private ContentsBO contentsBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private WishBO wishBO;
	
	@Autowired
	private WatchingBO watchingBO;
	
	@Autowired
	private PointBO pointBO;
	
	@Autowired
	private NotinterestBO notinterestBO;
	
	@Autowired
	private UserBO userBO;
	
	
	// 메인 페이지(영화)
	@GetMapping("/main")
	public String main(Model model, HttpSession session) throws JsonProcessingException {
		
		
		String userId = (String) session.getAttribute("userEmail");
		List<Map<String, Object>> popularResult = contentsBO.generatePopularMap();
		List<Map<String, Object>> nowResult = contentsBO.generateNowMap();
		List<Map<String, Object>> netflixResult = contentsBO.generateNetflixMap();
		List<Map<String, Object>> movieTrendingWeek = contentsBO.generateMovieTrendingWeekMap();
		List<Map<String, Object>> personTrending = contentsBO.generatePersonTrendingMap();
		List<Map<String, Object>> disney = contentsBO.generateDisneyMap();
		
		
		model.addAttribute("disney", disney);
		model.addAttribute("movieTrendingWeek", movieTrendingWeek);
		model.addAttribute("personTrending", personTrending);
		model.addAttribute("popularResult", popularResult);
		model.addAttribute("nowResult", nowResult);
		model.addAttribute("netflixResult", netflixResult);
		model.addAttribute("viewName", "contents/main");
		return "template/layout";
	}
	
	// 메인 페이지(tv)
	@GetMapping("/main/tv")
	public String tvMain(Model model, HttpSession session) throws JsonProcessingException {
		
		
		String userId = (String) session.getAttribute("userEmail");
		
		List<Map<String, Object>> popularResult = contentsBO.generateTvPopularMap();
		List<Map<String, Object>> nowResult = contentsBO.generateNowMap();
		List<Map<String, Object>> netflixResult = contentsBO.generateTvNetfilixMap();
		List<Map<String, Object>> topratedResult = contentsBO.generateTvTopratedMap();
		List<Map<String, Object>> tvTrending = contentsBO.generateTvTrendingMap();
		List<Map<String, Object>> tvTrendingWeek = contentsBO.generateTvTrendingWeekMap();
		
		
		model.addAttribute("tvTrending", tvTrending);
		model.addAttribute("tvTrendingWeek", tvTrendingWeek);
		model.addAttribute("popularResult", popularResult);
		model.addAttribute("nowResult", nowResult);
		model.addAttribute("netflixResult", netflixResult);
		model.addAttribute("topratedResult", topratedResult);
		model.addAttribute("viewName", "contents/tvmain");
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 기본정보
	@GetMapping("/contents/overview_view")
	public String overviewView(Model model, int id) throws JsonProcessingException {
		
		Map<String, Object> contentInfo = contentsBO.generateContent(id);
		List<Map<String, Object>> contentResult = contentsBO.generateContentCrew(id);
		String GenreResult = contentsBO.generateGenre(id);
		String countryResult = contentsBO.generateCountry(id);
		
		
		model.addAttribute("countryResult", countryResult);
		model.addAttribute("genre", GenreResult);
		model.addAttribute("viewName", "contents/overview");
		model.addAttribute("crews", contentResult);
		model.addAttribute("contents", contentInfo);
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 배우 기본정보
	@GetMapping("/contents/person_view")
	public String personView(Model model, int id) throws JsonProcessingException {
		
		Map<String, Object> contentInfo = contentsBO.generateContent(id);
		List<Map<String, Object>> contentResult = contentsBO.generateContentCrew(id);
		String GenreResult = contentsBO.generateGenre(id);
		String countryResult = contentsBO.generateCountry(id);
		List<Map<String, Object>> personTrending = contentsBO.generatePersonTrendingMap();
		List<Map<String, Object>> personList = contentsBO.generatePersonKnownForMap();
		
		model.addAttribute("personTrending", personTrending);
		model.addAttribute("personList", personList);
		model.addAttribute("countryResult", countryResult);
		model.addAttribute("genre", GenreResult);
		model.addAttribute("crews", contentResult);
		model.addAttribute("contents", contentInfo);
		model.addAttribute("viewName", "contents/person");
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 검색 결과
	@GetMapping("/contents/search_view")
	public String personView(Model model, 
			@RequestParam("title") String title) throws JsonProcessingException {
	
		Map<String, Object> result = new HashMap<>();
		
		List<Map<String, Object>> contentResult = contentsBO.generateMultiMap(title);
		
		model.addAttribute("contentResult", contentResult);
		model.addAttribute("viewName", "contents/searchResult");
		return "template/layout";
	}
	
	// 컨텐츠페이지 - 컨텐츠 개별 페이지
	@GetMapping("/contents/contents_view")
	public String contentsView(Model model, int id, Integer point,
			HttpSession session) throws JsonProcessingException {
		
		User userinfo = userBO.getUserByIntegerId((Integer)session.getAttribute("userId"));
		List<Point> pointList = pointBO.getPointCountListByApiIdAndUserId(id, (Integer)session.getAttribute("userId"));
		boolean fillMyComment = commentBO.existMyComment(id, (Integer)session.getAttribute("userId"));
		boolean fillWatching = watchingBO.existwatching(id, (Integer)session.getAttribute("userId"));
		boolean fillNotinterest = notinterestBO.existNotinterest(id, (Integer)session.getAttribute("userId"));
		boolean fillWish = wishBO.existWish(id, (Integer)session.getAttribute("userId"));
		List<CommentView> commentList = commentBO.generateCommentViewListByApiId(id);
		Map<String, Object> myComment = commentBO.getCommentByObj(id, (Integer)session.getAttribute("userId"));
		
		List<Map<String, Object>> similars = contentsBO.generateSimilars(id);
		Map<String, Object> contentInfo = contentsBO.generateContent(id);
		List<Map<String, Object>> contentResult = contentsBO.generateContentCrew(id);
		String GenreResult = contentsBO.generateGenre(id);
		String countryResult = contentsBO.generateCountry(id);
		List<String> yutube = contentsBO.generateVideo(id);
		List<String> images = contentsBO.generateImages(id);
		String year = contentsBO.generateYear(id);
		
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("pointList", pointList);
		model.addAttribute("fillMyComment", fillMyComment);
		model.addAttribute("fillNotinterest", fillNotinterest);
		model.addAttribute("fillWatching", fillWatching);
		model.addAttribute("fillWish", fillWish);
		model.addAttribute("commentList", commentList);
		model.addAttribute("myComment", myComment);
		model.addAttribute("similars", similars);
		model.addAttribute("countryResult", countryResult);
		model.addAttribute("year", year);
		model.addAttribute("yutube", yutube);
		model.addAttribute("images", images);
		model.addAttribute("genre", GenreResult);
		model.addAttribute("crews", contentResult);
		model.addAttribute("contents", contentInfo);
		model.addAttribute("viewName", "contents/contentsPage");
		return "template/layout";
	}
	
	
	// 컨텐츠페이지 - tv컨텐츠 개별 페이지
	@GetMapping("/contents/tv_contents_view")
	public String contentsTvView(Model model, int id, Integer point,
			HttpSession session) throws JsonProcessingException {
		
		User userinfo = userBO.getUserByIntegerId((Integer)session.getAttribute("userId"));
		List<Point> pointList = pointBO.getPointCountListByApiIdAndUserId(id, (Integer)session.getAttribute("userId"));
		boolean fillWatching = watchingBO.existwatching(id, (Integer)session.getAttribute("userId"));
		boolean fillNotinterest = notinterestBO.existNotinterest(id, (Integer)session.getAttribute("userId"));
		boolean fillWish = wishBO.existWish(id, (Integer)session.getAttribute("userId"));
		List<CommentView> commentList = commentBO.generateCommentViewListByApiId(id);
		Map<String, Object> myComment = commentBO.getCommentByObj(id, (Integer)session.getAttribute("userId"));
		
		
		Map<String, Object> contentInfo = contentsBO.generateTvContents(id);
		List<Map<String, Object>> contentResult = contentsBO.generateContentCrew(id);
		String GenreResult = contentsBO.generateGenre(id);
		String countryResult = contentsBO.generateCountry(id);
		List<String> yutube = contentsBO.generateVideo(id);
		List<String> images = contentsBO.generateImages(id);
		String year = contentsBO.generateYear(id);
		
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("pointList", pointList);
		model.addAttribute("fillNotinterest", fillNotinterest);
		model.addAttribute("fillWatching", fillWatching);
		model.addAttribute("fillWish", fillWish);
		model.addAttribute("commentList", commentList);
		model.addAttribute("myComment", myComment);

		model.addAttribute("contents", contentInfo);
		model.addAttribute("viewName", "contents/tvcontentsPage");
		return "template/layout";
	}
	
	
	
}
