package com.reccopedia.comment.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentDAO commentDAO;
	
	public void createComment(int userId, Integer pointId, int id, String content, boolean check) {
		commentDAO.createComment(userId, null, id, content, check);
	}
	
	public boolean existMyComment(int id, Integer userId) {
		if(userId == null) {
			return false;
		}
		return commentDAO.selectCommentByApiIdOrUserId(id, userId) > 0 ? true:false;
	}
	
	public List<Comment> getCommentListByApiId(int id) {
		return commentDAO.selectCommentListByApiId(id);
	}
	
	public List<Comment> getCommentListById(int id) {
		return commentDAO.selectCommentListById(id);
	}
	
	public Comment getCommentListByApiIdAndUserId(int id, Integer userId) {
		return commentDAO.selectCommentListByApiIdAndUserId(id, userId);
	}
	
	
	public Map<String, Object> getCommentByObj(int id, Integer userId) {
		
		ObjectMapper objectMapper = new ObjectMapper();
		Comment comment = new Comment();
		comment = getCommentListByApiIdAndUserId(id, userId);
		Map<String, Object> map = objectMapper.convertValue(comment, Map.class);
		
		return map;
	}
	
	public List<Map<String, Object>> getCommentList(Integer userId) {
		return commentDAO.selectCommentListByUserId(userId);
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
	
	
	public void updateComment(int userId, int id, String content) {
		Comment comment = getCommentListByApiIdAndUserId(id, userId);
		
		if (comment == null) {
			logger.warn("[update post] 수정할 메모가 존재하지 않습니다. postId:{}, userId:{}", id, userId); // 와일드카드 문법, 단서가 될 만한 파라미터들을 넣어둔다.
			return;
		}
		
		commentDAO.updateComment(userId, id, content);
	};
	
	
}
