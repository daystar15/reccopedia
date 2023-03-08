package com.reccopedia.collection.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reccopedia.collection.model.Collection;
import com.reccopedia.collection.model.CollectionContent;
import com.reccopedia.contents.model.ContentsView;

@Repository
public interface CollectionDAO {

	public void addCollection(
			@Param("userId") Integer userId,
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("arr2") String arr2);
			
	public void updateCollection(
			@Param("id") int id,
			@Param("userId") Integer userId,
			@Param("subject") String subject, 
			@Param("content") String content, 
			@Param("arr2") String arr2);
			
	public void addCollectionContent(
			@Param("apiId") int apiId,
			@Param("type") int type,
			@Param("pointId") Integer pointId,
			@Param("userId") int userId,
			@Param("collectionId") int collectionId,
			@Param("title") String title, 
			@Param("posterPath") String posterPath);
	
	public void updateCollectionContent(
			@Param("id") int id,
			@Param("apiId") int apiId,
			@Param("pointId") Integer pointId,
			@Param("userId") int userId,
			@Param("collectionId") int collectionId,
			@Param("title") String title, 
			@Param("posterPath") String posterPath);

	public List<ContentsView> selectKeyword(String keyword);
	
	public Collection selectCollectionByIdAndUserId(
			@Param("id") int id, 
			@Param("userId") int userId);
	
	
	public Collection selectCollectionContentByIdAndUserId(int id);
	
	public List<Collection> selectCollectionListByUserId(int userId);
	
	public List<CollectionContent> selectCollectionContentList(int userId);
	
	public void deleteCollectionContentByIdUserId(int id);
	
	public List<CollectionContent> selectCollectionContentByCollectionId(int id);

	public List<CollectionContent> selectCollectionContent();
	
	public Map<String, Object> selectCollectionSubjectContent(int id);
	
	public int selectCollectionId();
	
	public int selectCurrentCollectionId(int id);

	public void deleteCollectionByUserIdApiId(int id);
	
}
