package com.reccopedia.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public void createComment(int userId, Integer pointId, int apiId, String content) {
		commentDAO.createComment(userId, null, apiId, content);
	}
	
	public List<Comment> getCommentListByApiId(int apiId) {
		return commentDAO.selectCommentListByApiId(apiId);
	}
	
	public void deleteCommentByUserIdApiId(int apiId) {
		commentDAO.deleteCommentByUserIdApiId(apiId);
	}
	
	public List<CommentView> generateCommentViewListByApiId(int apiId) {
		
		List<CommentView> commentViewList = new ArrayList<>();
		
		List<Comment> commentList = getCommentListByApiId(apiId);
		
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
