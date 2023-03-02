package com.reccopedia.spoiler.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SpoilerDAO {

	public void insertSpoiler(
			@Param("apiId") int apiId, 
			@Param("userId") int userId,
			@Param("spoiler") String spoiler);

	public int selectSpoilerByApiIdOrUserIdOrSpoiler(
			@Param("apiId") int id, 
			@Param("userId") Integer userId,
			@Param("spoiler") String spoiler);
	
	public void deleteSpoilerByApiIdUserIdSpoiler(
			@Param("apiId") int id, 
			@Param("userId") Integer userId,
			@Param("spoiler") String spoiler);
}
