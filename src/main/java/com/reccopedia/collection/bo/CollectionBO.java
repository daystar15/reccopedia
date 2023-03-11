package com.reccopedia.collection.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
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
	
	public void addCashCollection(Integer userId) {
		collectionDAO.addCashCollection(userId);
	};
	
	public void addCollection(Integer userId, String subject, String content) {
		collectionDAO.addCollection(userId, subject, content);
	};
	
	public void updateCollection(int id,Integer userId, String subject, String content) {
		collectionDAO.updateCollection(id, userId, subject, content);
	};
	
	public void updateCollectionContent(int id, int apiId, Integer pointId, int userId, int collectionId, String title, String posterPath) {
		collectionDAO.updateCollectionContent(id, apiId, pointId, userId, collectionId, title, posterPath);
	}
	
	public void addCollectionContent(int apiId, int type, Integer pointId, int userId, int collectionId, String title, String posterPath) {
		collectionDAO.addCollectionContent(apiId, type, pointId, userId, collectionId, title, posterPath);
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
	
	public void deleteCollectionContentByIdUserId(int id) {
		collectionDAO.deleteCollectionContentByIdUserId(id);
	}
	
	public void deleteCollectionByUserIdApiId(int id) {
		collectionDAO.deleteCollectionByUserIdApiId(id);
	}
	
	public List<CollectionContent> getCollectionContentByCollectionId(int id) {
		return collectionDAO.selectCollectionContentByCollectionId(id);
	}
	
	public List<CollectionContent> getCollectionContent() {
		return collectionDAO.selectCollectionContent();
	}
	
	public Map<String, Object> getCollectionSubjectContent(int id) {
		return collectionDAO.selectCollectionSubjectContent(id);
	}
	
	// 마지막 번호
	public int getCollectionId() {
		return collectionDAO.selectCollectionId();
	}
	
	// 마지막 번호
	public int getCurrentCollectionId(int id) {
		return collectionDAO.selectCurrentCollectionId(id);
	}

}
