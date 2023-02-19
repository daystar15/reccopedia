package com.reccopedia.collection.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.contents.model.ContentsView;

@Repository
public interface CollectionDAO {

	public void addCollection(
			@Param("userId") Integer userId,
			@Param("pointId") Integer pointId,
			@Param("apiId") Integer apiId, 
			@Param("subject") String subject, 
			@Param("content") String content);
	
	public List<ContentsView> selectKeyword(String keyword);

	
}
