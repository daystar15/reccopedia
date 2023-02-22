package com.reccopedia.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.comment.model.Comment;

@Repository
public interface CommentDAO {

	public void createComment(
			@Param("userId") int userId, 
			@Param("pointId") Integer pointId, 
			@Param("apiId") int apiId, 
			@Param("content") String content);
	
	public List<Comment> selectCommentListByApiId(int apiId);
	
	public void deleteCommentByUserIdApiId(int apiId);
	
}
