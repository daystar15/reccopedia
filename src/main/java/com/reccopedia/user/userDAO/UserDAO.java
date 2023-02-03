package com.reccopedia.user.userDAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.user.model.User;

@Repository
public interface UserDAO {

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
	
}
