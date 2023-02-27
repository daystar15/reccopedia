package com.reccopedia.watching.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.watching.model.Watching;

@Repository
public interface WatchingDAO {

	public void insertWatching(
			@Param("apiId") int id, 
			@Param("userId") int userId, 
			@Param("title") String title, 
			@Param("posterPath") String posterPath);

	public int selectWatchingByApiIdOrUserId(
			@Param("apiId") int id, 
			@Param("userId") Integer userId);
	
	public List<Map<String, Object>> selectWatchingListByApiIdOrUserId(int userId);
	
	public List<Watching> selectWatchingObjListByApiIdOrUserId(int userId);
	
	public void deleteWatchingByApiId(int id);
	
	public void deleteWatchingByApiIdUserId(
			@Param("apiId") int id, 
			@Param("userId") int userId);
}
