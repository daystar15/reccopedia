package com.reccopedia.user.userBO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.reccopedia.user.userDAO.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;

	public int insertUser(String name, String email, String password) {
		return userDAO.insertUser(name, email, password);
	}
}
