package com.reccopedia.collection.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.collection.dao.CollectionDAO;
import com.reccopedia.collection.model.Collection;
import com.reccopedia.collection.model.CollectionContent;
import com.reccopedia.restAPI.dao.RestTemplateService;

@Service
public class CollectionBO {

	@Autowired
	private CollectionDAO collectionDAO;
	
	@Autowired
	private RestTemplateService resttemplateservice;
	
	
	public void addCollection(Integer userId, String subject, String content, String movieList) {
		collectionDAO.addCollection(userId, subject, content, movieList);
	};
	
	public void addCollectionContent(int apiId, Integer pointId, int userId, String title, String posterPath) {
		collectionDAO.addCollectionContent(apiId, pointId, userId, title, posterPath);
	};
	
	public List<Map<String, Object>> findKeyword(String title) throws JsonProcessingException {
		
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callFindAPI(title);
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");

		
		return list;
	}
	
	public List<Collection> getCollectionList(int userId) {
		return collectionDAO.selectCollectionListByUserId(userId);
	}
	
	// 내가 추가한 컬렉션리스트들 가져옴
	public List<CollectionContent> getCollectionContentList(int userId) {
		return collectionDAO.selectCollectionContentList(userId);
	}
	
	public Collection getCollectionByIdAndUserId(int id, int userId) {
		return collectionDAO.selectCollectionByIdAndUserId(id, userId);
	}

	public Map<String, Object> getCollectionMapByUserId(int userId) {
		return collectionDAO.selectCollectionMapByUserId(userId);
	}
	
	public void deleteCollectionContentByIdUserId(int id) {
		collectionDAO.deleteCollectionContentByIdUserId(id);
	}

}
