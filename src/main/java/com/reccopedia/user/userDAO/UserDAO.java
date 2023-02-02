package com.reccopedia.user.userDAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("name") String name, 
			@Param("email") String email, 
			@Param("password") String password);
}
