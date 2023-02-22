package com.reccopedia.wish.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WishDAO {
	
	public void insertWish(
			@Param("apiId") int apiId, 
			@Param("userId") int userId);

	public int selectWishByApiIdOrUserId(
			@Param("apiId") int apiId, 
			@Param("userId") Integer userId);
	
	public void deleteWishByApiId(int apiId);
	
	public void deleteWishByApiIdUserId(
			@Param("apiId") int apiId, 
			@Param("userId") int userId);
	
}
