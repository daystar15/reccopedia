package com.reccopedia.wish.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface WishDAO {
	
	public void insertWish(
			@Param("apiId") int id, 
			@Param("type") int type,
			@Param("userId") int userId,
			@Param("title") String title, 
			@Param("posterPath") String posterPath);

	public int selectWishByApiIdOrUserId(
			@Param("apiId") int id,
			@Param("userId") Integer userId);
	
	public List<Map<String, Object>> selectWishListByApiIdOrUserId(int userId);
	
	public List<Map<String, Object>> selectWishTVListByApiIdOrUserId(int userId);
	
	public void deleteWishByApiId(
			@Param("apiId") int id,
			@Param("type") int type);
	
	public void deleteWishByApiIdUserId(
			@Param("apiId") int id, 
			@Param("userId") int userId);
	
}
