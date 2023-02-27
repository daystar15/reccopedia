package com.reccopedia.user.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.common.FileManagerService;
import com.reccopedia.contents.bo.ContentsBO;
import com.reccopedia.restAPI.dao.RestTemplateService;
import com.reccopedia.user.dao.UserDAO;
import com.reccopedia.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private FileManagerService fileManager;
	
	@Autowired
	private RestTemplateService resttemplateservice;
	
	
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
	
	public User getUserByIntegerId(Integer id) {
		return userDAO.selectUserByIntegerId(id);
	}
	
	public Map<String, Object> getUserByObj(int id) {
		User user = getUserById(id);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.convertValue(user, Map.class);
		
		return map;
	}
	
	public void updateUser(int userId, String email, String name, String info, MultipartFile backgroundfile, MultipartFile profilefile) {
		User user = getUserById(userId);
		if (user == null) {
			// logger
			return;
		}
		
		String backgroundfileimagePath = null;
		
		if (backgroundfile != null) {
			backgroundfileimagePath = fileManager.saveBackgroundFile(email, backgroundfile);
			if (backgroundfileimagePath != null && user.getBackgroundImagePath() != null) {
				// 이미지 제거
				fileManager.deleteBackgroundFile(user.getBackgroundImagePath());  // 무엇을 삭제하려고 하는지 알아야한다. imagePath를 삭제하면 안된다.
			}
		}
		
		String profilefileimagePath = null;
		if (profilefile != null) {
			profilefileimagePath = fileManager.saveProfileFile(email, profilefile);
			if (profilefileimagePath != null && user.getProfileImagePath() != null) {
				// 이미지 제거
				fileManager.deleteProfileFile(user.getProfileImagePath());  // 무엇을 삭제하려고 하는지 알아야한다. imagePath를 삭제하면 안된다.
			}
		}
		
		userDAO.updateUser(userId, email, name, info, backgroundfileimagePath, profilefileimagePath);
	};
	
	
	
}
