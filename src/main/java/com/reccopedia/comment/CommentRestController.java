package com.reccopedia.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reccopedia.comment.bo.CommentBO;

import javax.servlet.http.HttpSession;

@RequestMapping("/comment")
@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, Object> createComment(
			@RequestParam("id") int id,
			@RequestParam("type") int type,
			@RequestParam("content") String content,
			@RequestParam("spoiler") boolean spoiler,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) {
			result.put("code", 500);
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 해주세요.");
			return result;
		}
		
		commentBO.createComment(userId, null, id, type, content, spoiler);
		result.put("code", 1);
		result.put("result", "success");
		
		return result;
		
		
	}
	
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("id") int id,
			@RequestParam("type") int type,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 다시 해주세요.");
			return result;
		}
		
		commentBO.deleteCommentByUserIdApiId(id, type);
		result.put("code", 1);
		
		return result;
		
	}
	
	
	@PutMapping("/update")
	public Map<String, Object> update(
			@RequestParam("type") int type,
			@RequestParam("commentId") int id,
			@RequestParam("comment") String content,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		// update db
		commentBO.updateComment(userId, id, type, content);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	
	
}
