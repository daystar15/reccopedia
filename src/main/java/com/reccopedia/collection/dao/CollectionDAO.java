package com.reccopedia.collection.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.collection.model.Collection;
import com.reccopedia.contents.model.ContentsView;

@Repository
public interface CollectionDAO {

	public void addCollection(
			@Param("userId") Integer userId,
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("movieList") String movieList);
	
	public List<ContentsView> selectKeyword(String keyword);
	
	public Collection selectCollectionByIdAndUserId(
			@Param("id") int id, 
			@Param("userId") int userId);

	public List<Collection> selectCollectionListByUserId(int userId);
	
	public Map<String, Object> selectCollectionMapByUserId(int userId);
	
}
