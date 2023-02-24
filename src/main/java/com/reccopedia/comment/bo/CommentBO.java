package com.reccopedia.comment.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.comment.dao.CommentDAO;
import com.reccopedia.comment.model.Comment;
import com.reccopedia.comment.model.CommentView;
import com.reccopedia.user.bo.UserBO;
import com.reccopedia.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	public void createComment(int userId, Integer pointId, int id, String content) {
		commentDAO.createComment(userId, null, id, content);
	}
	
	public List<Comment> getCommentListByApiId(int id) {
		return commentDAO.selectCommentListByApiId(id);
	}
	
	public Comment getCommentListByApiIdAndUserId(int id, int userId) {
		return commentDAO.selectCommentListByApiIdAndUserId(id, userId);
	}
	
	
	public Map<String, Object> getCommentByObj(int id, int userId) {
		
		ObjectMapper objectMapper = new ObjectMapper();
		Comment comment = new Comment();
		
		Map<String, Object> map = objectMapper.convertValue(comment, Map.class);
		
		return map;
	}
	
	
	public void deleteCommentByUserIdApiId(int id) {
		commentDAO.deleteCommentByUserIdApiId(id);
	}
	
	public List<CommentView> generateCommentViewListByApiId(int id) {
		
		List<CommentView> commentViewList = new ArrayList<>();
		
		List<Comment> commentList = getCommentListByApiId(id);
		
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			commentView.setComment(comment);
			
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user);
			
			commentViewList.add(commentView);
		}
		
		
		return commentViewList;
	}
	
	
}
