package com.reccopedia.point.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.point.dao.PointDAO;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;

	public void insertPoint(Integer userId, int point, int apiId) {
		pointDAO.insertPoint(userId, point, apiId);
	}

}
