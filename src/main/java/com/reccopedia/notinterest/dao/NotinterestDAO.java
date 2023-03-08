package com.reccopedia.notinterest.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface NotinterestDAO {

	public void insertNotinterest(
			@Param("apiId") int id, 
			@Param("type") int type,
			@Param("userId") int userId);

	public int selectNotinterestByApiIdOrUserId(
			@Param("apiId") int id, 
			@Param("type") int type,
			@Param("userId") Integer userId);
	
	public List<Map<String, Object>> selectNotinterestListByApiIdOrUserId(int userId);
	
	public void deleteNotinterestByApiId(
			@Param("apiId") int id,
			@Param("type") int type);
	
	public void deleteNotinterestByApiIdUserId(
			@Param("apiId") int id, 
			@Param("type") int type,
			@Param("userId") int userId);
}
