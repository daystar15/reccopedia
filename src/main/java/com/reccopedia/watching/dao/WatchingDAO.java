package com.reccopedia.watching.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WatchingDAO {

	public void insertWatching(
			@Param("apiId") int id, 
			@Param("userId") int userId);

	public int selectWatchingByApiIdOrUserId(
			@Param("apiId") int id, 
			@Param("userId") Integer userId);
	
	public void deleteWatchingByApiId(int id);
	
	public void deleteWatchingByApiIdUserId(
			@Param("apiId") int id, 
			@Param("userId") int userId);
}
