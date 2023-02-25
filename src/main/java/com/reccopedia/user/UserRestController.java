package com.reccopedia.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 중복확인
	@RequestMapping("/is_duplicated_email")
	public Map<String, Object> isDuplicatedEmail(
			@RequestParam("email") String email) {
		
		Map<String, Object> result = new HashMap<>();
		
		int existEmailRowCount = userBO.existEmail(email);
		if (existEmailRowCount > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

	// 회원가입
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password) {
		
		Map<String, Object> result = new HashMap<>();
		int insertUserRow = userBO.insertUser(name, email, password);
		
		if (insertUserRow == 1) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원가입에 실패했습니다.");
		}
		
		return result;
	}
	
	// 로그인
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpSession session) {
		
		// username은 user / 비번 cbb42cef-6deb-47ef-9fcb-c278a4d242e8
		// 비밀번호 암호화
		// String 암호화된Password = 
		
		User user = userBO.getUserByLoginEmailPassword(email, password);
		Map<String, Object> result = new HashMap<>();
				
		if (user != null) {
			result.put("code", 1);
			// 로그인 상태 유지
			session.setAttribute("userEmail", user.getEmail());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userPassword", user.getPassword());
			session.setAttribute("userId", user.getId());
		} else {
			result.put("code", "로그인 실패");
		}
		
		return result;
	}
	
	@PutMapping("/user_update")
	public Map<String, Object> userUpdate(Model model,
			@RequestParam(value="name", required=false) String name,
			@RequestParam(value="email", required=false) String email, 
			@RequestParam(value="info", required=false) String info,
			@RequestParam(value="backgroundFile", required=false) MultipartFile backgroundfile,
			@RequestParam(value="profileFile", required=false) MultipartFile profilefile,
			HttpSession session) {
		
		
		int userId  = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		userBO.updateUser(userId, email, name, info, backgroundfile, profilefile);
		
		
		result.put("code", 1);
		result.put("result", "성공");
			
		return result;
	}
	
	
	
	
}
