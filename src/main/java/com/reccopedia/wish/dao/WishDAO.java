package com.reccopedia.wish.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WishDAO {
	
	public void insertWish(
			@Param("apiId") int id, 
			@Param("userId") int userId);

	public int selectWishByApiIdOrUserId(
			@Param("apiId") int id, 
			@Param("userId") Integer userId);
	
	public List<Map<String, Object>> selectWishListByApiIdOrUserId(int userId);
	
	public void deleteWishByApiId(int id);
	
	public void deleteWishByApiIdUserId(
			@Param("apiId") int id, 
			@Param("userId") int userId);
	
}
