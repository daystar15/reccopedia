package com.reccopedia.user.userBO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.user.model.User;
import com.reccopedia.user.userDAO.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;

	public int insertUser(String name, String email, String password) {
		return userDAO.insertUser(name, email, password, null, null, null);
	}
	
	public User getUserByLoginEmailPassword(String email, String password) {
		return userDAO.getUserByLoginEmailPassword(email, password);
	}
}
