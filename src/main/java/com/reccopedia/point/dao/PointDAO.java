package com.reccopedia.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.point.model.Point;

@Repository
public interface PointDAO {

	public void insertPoint(
			@Param("userId") Integer userId, 
			@Param("point") int point, 
			@Param("apiId") int id);
	
	public int selectPointByApiIdOrUserId(
			@Param("apiId") int id,  
			@Param("point") int point, 
			@Param("userId") Integer userId);
	
	public List<Point> selectPointByApiId(
			@Param("apiId") int id,
			@Param("point") int point,
			@Param("userId") int userId);
	
	public List<Map<String, Object>> selectPointListByApiIdOrUserId(int userId);
	
	public void deletePointByApiId(int id);
	
	public void deletePointByApiIdUserId(
			@Param("apiId") int id,  
			@Param("point") int point, 
			@Param("userId") int userId);
	
}
