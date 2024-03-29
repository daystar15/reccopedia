package com.reccopedia.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.point.model.Point;

@Repository
public interface PointDAO {

	public void insertPoint(
			@Param("type") int type,
			@Param("point") int point, 
			@Param("apiId") int apiId,
			@Param("userId") int userId, 
			@Param("title") String title, 
			@Param("posterPath") String posterPath);
	
	public int selectPointByApiIdOrUserId(
			@Param("apiId") int id,  
			@Param("point") int point, 
			@Param("userId") int userId);
	
	public int selectPointByApiIdAndUserId(
			@Param("apiId") int apiId, 
			@Param("type") int type,
			@Param("userId") int userId);
	
	public List<Map<String, Object>> selectPointListByApiIdAndUserId(int userId);
	
	public List<Point> selectPointByApiId(
			@Param("apiId") int apiId,
			@Param("userId") Integer userId);
	
	public List<Point> selectPointCountListByApiIdAndUserId(
			@Param("apiId") int apiId,
			@Param("point") Integer point,
			@Param("userId") Integer userId);
	
	public Map<String, Object> selectPointMapByApiIdAndUserId(
			@Param("apiId") int apiId, 
			@Param("userId") int userId);
	
	public List<Map<String, Object>> selectPointListByApiIdOrUserId(int userId);
	
	public List<Map<String, Object>> selectPointTVListByApiIdOrUserId(int userId);
	
	public void deletePointByApiId(
			@Param("id") int id,
			@Param("type") int type);
	
	public void deletePointByApiIdUserId(
			@Param("apiId") int id,
			@Param("point") int point, 
			@Param("userId") int userId);
	
	public int selectPointCount();
	
	// 별점목록 별점만 가져오는 함수
	public List<Integer> selectPointIntegerListByApiIdOrUserId(int userId);
	
}
