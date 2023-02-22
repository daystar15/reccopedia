package com.reccopedia.watching.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WatchingDAO {

	public void insertWatching(
			@Param("apiId") int apiId, 
			@Param("userId") int userId);

	public int selectWatchingByApiIdOrUserId(
			@Param("apiId") int apiId, 
			@Param("userId") Integer userId);
	
	public void deleteWatchingByApiId(int apiId);
	
	public void deleteWatchingByApiIdUserId(
			@Param("apiId") int apiId, 
			@Param("userId") int userId);
}
