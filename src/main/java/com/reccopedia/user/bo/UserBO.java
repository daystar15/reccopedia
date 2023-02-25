package com.reccopedia.user.bo;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.common.FileManagerService;
import com.reccopedia.user.dao.UserDAO;
import com.reccopedia.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManagerService fileManager;
	
	
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
	
	public Map<String, Object> getUserByObj(int id) {
		User user = getUserById(id);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.convertValue(user, Map.class);
		
		return map;
	}
	
	public int updateUser(int userId, String email, String name, String info, MultipartFile backgroundfile, MultipartFile profilefile) {
		User user = getUserById(userId);
		
		String backgroundImagePath = null;
		String profileImagePath = null;
		
		if (backgroundfile != null) {
			backgroundImagePath = fileManager.saveBackgroundFile(email, backgroundfile);
		}
		
		if (profilefile != null) {
			profileImagePath = fileManager.saveProfileFile(email, profilefile);
		}
		
		return userDAO.updateUser(userId, email, name, info, backgroundImagePath, profileImagePath);
	};
}
