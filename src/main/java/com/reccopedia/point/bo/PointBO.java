package com.reccopedia.point.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.point.dao.PointDAO;
import com.reccopedia.point.model.Point;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;

	public void pointToggle(int id, int userId, int point) {
		// 위시 리스트에 있는지 확인
		if (pointDAO.selectPointByApiIdOrUserId(id, userId, point) > 0) {
			// 있으면 제거
			pointDAO.deletePointByApiIdUserId(id, userId, point);
		} else {
			// 없으면 추가
			pointDAO.insertPoint(id, userId, point);
		}
	};
	
	public boolean existPoint(int id, Integer point, Integer userId) {
		if(userId == null) {
			return false;
		}
		if (point == null) {
			return true;
		}
		return pointDAO.selectPointByApiIdOrUserId(id, point, userId) > 0 ? true:false;
	}
	
	public List<Point> getPointCountByApiId(int id, int point, int userId) {

		List<Point> pointViewList = new ArrayList<>();
		
		Point pointList = new Point();
		
		pointList.setPoint(point);
		
		pointViewList.add(userId, pointList);
		
		return pointViewList;
	}
	
	
	public void deletePointByApiId(int id) {
		pointDAO.deletePointByApiId(id);
	}
	

}
