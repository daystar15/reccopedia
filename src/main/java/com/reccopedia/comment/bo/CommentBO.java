package com.reccopedia.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.comment.dao.CommentDAO;
import com.reccopedia.comment.model.Comment;
import com.reccopedia.user.bo.UserBO;

@Service
public class CommentBO {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	public void createComment(int userId, Integer pointId, int apiId, String content) {
		commentDAO.createComment(userId, null, apiId, content);
	}
	
	public Comment getCommentByUserIdApiId(int userId, int apiId) {
		return commentDAO.getCommentByUserIdApiId(userId, apiId);
	}
	
	public void deleteCommentByUserIdApiId(int userId, int apiId) {
		commentDAO.deleteCommentByUserIdApiId(userId, apiId);
	}
	
	
	
	
}
