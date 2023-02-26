package com.reccopedia.admin.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.admin.model.Admin;

@Repository
public interface AdminDAO {

	public boolean existLoginId(String loginId);
	
	public void insertAdmin(
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name);
	
	public Admin selectAdminByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password") String password);
	
	public Admin selectAdminById(
			@Param("id") int id);
}
