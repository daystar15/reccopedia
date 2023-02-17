package com.reccopedia.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.user.dao.UserDAO;
import com.reccopedia.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int existEmail(String email) {
		return userDAO.existEmail(email);
	}

	public int insertUser(String name, String email, String password) {
		return userDAO.insertUser(name, email, password, null, null, null);
	}
	
	public User getUserByLoginEmailPassword(String email, String password) {
		return userDAO.getUserByLoginEmailPassword(email, password);
	}
	
	public User getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
	}
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}
}
