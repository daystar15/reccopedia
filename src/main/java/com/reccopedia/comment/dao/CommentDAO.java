package com.reccopedia.comment.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.comment.model.Comment;

@Repository
public interface CommentDAO {

	public void createComment(
			@Param("userId") int userId, 
			@Param("pointId") Integer pointId, 
			@Param("id") int id, 
			@Param("content") String content);
	
	public List<Comment> selectCommentListByApiId(int id);
	
	public Comment selectCommentListByApiIdAndUserId(
			@Param("id") int id, 
			@Param("userId") int userId);
	
	public void deleteCommentByUserIdApiId(int id);
	
}
