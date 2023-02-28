package com.reccopedia.user.bo;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.common.FileManagerService;
import com.reccopedia.restAPI.dao.RestTemplateService;
import com.reccopedia.user.dao.UserDAO;
import com.reccopedia.user.model.User;

@Service
public class UserBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
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
	
	public void updateUser(int userId, String userEmail, String name, String info, MultipartFile backgroundfile, MultipartFile profilefile) {
		User user = getUserById(userId);
		if (user == null) {
			logger.warn("[update post] 수정할 메모가 존재하지 않습니다. userId:{}", userId); // 와일드카드 문법, 단서가 될 만한 파라미터들을 넣어둔다.
			return;
		}
		
		String backgroundImagePath = null;
		if (backgroundfile != null) {
			// 업로드
			backgroundImagePath = fileManager.saveBackgroundFile(userEmail, backgroundfile);
			
			if (backgroundImagePath != null && user.getBackgroundImagePath() != null) {
				// 이미지 제거
				fileManager.deleteBackgroundFile(user.getBackgroundImagePath());  // 무엇을 삭제하려고 하는지 알아야한다. imagePath를 삭제하면 안된다.
			}
		}
		
		String profileImagePath = null;
		if (profilefile != null) {
			// 업로드
			profileImagePath = fileManager.saveProfileFile(userEmail, profilefile);
			if (profileImagePath != null && user.getProfileImagePath() != null) {
				// 이미지 제거
				fileManager.deleteProfileFile(user.getProfileImagePath());  // 무엇을 삭제하려고 하는지 알아야한다. imagePath를 삭제하면 안된다.
			}
		}
		
		userDAO.updateUser(userId, userEmail, name, info, backgroundImagePath, profileImagePath);
	};
	
	public List<User> getuserListById(int id){
		return userDAO.selectuserListById(id);
	}
	
}
