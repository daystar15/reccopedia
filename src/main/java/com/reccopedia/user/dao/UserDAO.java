package com.reccopedia.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.user.model.User;

@Repository
public interface UserDAO {
	
	public int existEmail(String email);

	public int insertUser(
			@Param("name") String name, 
			@Param("email") String email, 
			@Param("password") String password,
			@Param("info") String info,
			@Param("backgroundImagePath") String backgroundImagePath,
			@Param("profileImagePath") String profileImagePath);
	
	public User getUserByLoginEmailPassword(
			@Param("email") String email, 
			@Param("password") String password);
	
	public User selectUserByEmail(String email);
	
	public User selectUserById(int id);
	
}
