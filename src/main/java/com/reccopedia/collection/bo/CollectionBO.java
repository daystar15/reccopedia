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
import com.reccopedia.restAPI.dao.RestTemplateService;

@Service
public class CollectionBO {

	@Autowired
	private CollectionDAO collectionDAO;
	
	@Autowired
	private RestTemplateService resttemplateservice;
	
	public void addCollection(Integer userId, String subject, String content) {
		collectionDAO.addCollection(userId, null, null, subject, content);
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

}
