package com.reccopedia.point.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.point.dao.PointDAO;
import com.reccopedia.point.model.Point;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;

	public void pointToggle(int apiId, int userId, int point) {
		// 위시 리스트에 있는지 확인
		if (pointDAO.selectPointByApiIdOrUserId(apiId, userId, point) > 0) {
			// 있으면 제거
			pointDAO.deletePointByApiIdUserId(apiId, userId, point);
		} else {
			// 없으면 추가
			pointDAO.insertPoint(point, userId, apiId);
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
	
	public List<Point> getPointCountListByApiIdAndUserId(int apiId, Integer userId) {
		return pointDAO.selectPointCountListByApiIdAndUserId(apiId, userId);
	}
	
	public int getPointCountByApiIdAndUserId(int id, int userId) {
		return pointDAO.selectPointByApiIdAndUserId(id, userId);
	}
	
	
	public void deletePointByApiId(int id) {
		pointDAO.deletePointByApiId(id);
	}
	
	public List<Map<String, Object>> getPointList(int userId) {
		return pointDAO.selectPointListByApiIdOrUserId(userId);
	}



}
