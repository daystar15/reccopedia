package com.reccopedia.contents.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.restAPI.dao.RestTemplateService;

@Service
public class ContentsBO {

	@Autowired
	private RestTemplateService resttemplateservice;
	
	
	public List<Map<String, Object>> generatePopularMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callPopuLarAPI();
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");
		
		 
		return list;
		
	}
	
	public List<Map<String, Object>> generateNetflixMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callNetflixAPI();
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");
		
		 
		return list;
		
	}
	
	public List<Map<String, Object>> generateTopRatedMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callTopRatedAPI();
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");
		
		 
		return list;
		
	}
	

	
}
