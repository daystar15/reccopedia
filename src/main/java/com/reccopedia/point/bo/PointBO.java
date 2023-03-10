package com.reccopedia.point.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.point.dao.PointDAO;
import com.reccopedia.point.model.Point;
import com.reccopedia.restAPI.dao.RestTemplateService;
import com.reccopedia.user.bo.UserBO;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private RestTemplateService resttemplateservice;

	public void pointToggle(int type, int point, int apiId,  int userId, String title, String posterPath) {
		// 위시 리스트에 있는지 확인
		if (pointDAO.selectPointByApiIdOrUserId(apiId, userId, point) > 0) {
			// 있으면 제거
			pointDAO.deletePointByApiIdUserId(apiId, userId, point);
		} else {
			// 없으면 추가
			pointDAO.insertPoint(type, point, apiId, userId, title, posterPath);
		}
	};
	
	public boolean existPoint(int apiId, Integer point, Integer userId) {
		if(userId == null) {
			return false;
		}
		if (point == null) {
			return true;
		}
		return pointDAO.selectPointByApiIdOrUserId(apiId, point, userId) > 0 ? true:false;
	}
	
	public List<Point> getPointCountByApiId(int id, int point, Integer userId) {

		List<Point> pointViewList = new ArrayList<>();
		
		Point pointList = new Point();
		
		pointList.setPoint(point);
		
		pointViewList.add(userId, pointList);
		
		return pointViewList;
	}
	
	public List<Point> getPointCountListByApiIdAndUserId(int apiId, Integer point, Integer userId) {
		return pointDAO.selectPointCountListByApiIdAndUserId(apiId, point, userId);
	}
	
	public int getPointCountByApiIdAndUserId(int id, int type, int userId) {
		return pointDAO.selectPointByApiIdAndUserId(id, type, userId);
	}
	
	public int getPointCountByUserId() {
		return pointDAO.selectPointCount();
	}
	
	
	public void deletePointByApiId(int id, int type) {
		pointDAO.deletePointByApiId(id, type);
	}
	
	// 별점목록 가져오는 함수
	public List<Map<String, Object>> getPointList(int userId) {
		return pointDAO.selectPointListByApiIdOrUserId(userId);
	}
	
	// TV별점목록 가져오는 함수
	public List<Map<String, Object>> getPointTVList(int userId) {
		return pointDAO.selectPointTVListByApiIdOrUserId(userId);
	}
	
	// api랑 userid 일치하는 별점목록함수
	public List<Map<String, Object>> getPointListByApiIdAndUserId(int userId) {
		return pointDAO.selectPointListByApiIdAndUserId(userId);
	}

	
	// 1일 랜덤 영화 API
	public List<Map<String, Object>> generateMovieTrendingMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.movieTrendingAPI();
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");
		
		return list;
	}

	
	public List<Map<String, Object>> pointMovieList(int userId) throws JsonProcessingException {
		// 별점목록
		List<Map<String, Object>> pointMovieList = getPointListByApiIdAndUserId(userId);
		
		// 랜덤 리스트
		List<Map<String, Object>> randomMovieList = generateMovieTrendingMap();
		
		// 담을 list
		List<Map<String, Object>> list = pointMovieList.stream()
				.filter((filter -> randomMovieList.stream()
						.anyMatch(target->filter.get("apiId").equals(target.get("id")))
						)).collect(Collectors.toList());
		
		
		return list;
	}
	

	public List<Map<String, Object>> generateDayTvTrendingMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.tvTrendingAPI();
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");

		return list;
		
	}
	
}
