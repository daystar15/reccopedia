package com.reccopedia.admin.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.admin.dao.AdminDAO;
import com.reccopedia.admin.model.Admin;

@Service
public class AdminBO {

	@Autowired
	private AdminDAO adminDAO;
	
	public boolean existLoginId(String loginId) {
		return adminDAO.existLoginId(loginId);
	}
	
	public void addAdmin(String loginId, String password, String name) {
		adminDAO.insertAdmin(loginId, password, name);
	}
	
	public Admin getAdminByLoginIdPassword(String loginId, String password) {
		return adminDAO.selectAdminByLoginIdPassword(loginId, password);
	}
	
	public Admin getAdminById(int id) {
		return adminDAO.selectAdminById(id);
	}
}
