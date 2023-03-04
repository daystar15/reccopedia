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
			@Param("content") String content,
			@Param("spoiler") boolean spoiler);
	
	public int selectCommentByApiIdOrUserId(
			@Param("apiId") int id, 
			@Param("userId") Integer userId);
	
	public List<Comment> selectCommentListByApiId(int id);
	
	public List<Comment> selectCommentListById(int id);
	
	public List<Map<String, Object>> selectCommentListByUserId(Integer userId);
	
	public Comment selectCommentListByApiIdAndUserId(
			@Param("id") int id, 
			@Param("userId") Integer userId);
	
	public void deleteCommentByUserIdApiId(int id);
	
	public void updateComment(
			@Param("userId") int userId,
			@Param("id") int id, 
			@Param("content") String content);
	
}
