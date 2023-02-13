package com.reccopedia.contents.bo;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.reccopedia.restAPI.dao.RestTemplateService;

@Service
public class ContentsBO {

	@Autowired
	private RestTemplateService resttemplateservice;
	
	public Map<String, Object> generateMainMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callAPI();
		
		Map<String, Object> result = new HashMap<>();
		
		 try {

	            // convert JSON string to Map
	            Map<String, String> map = mapper.readValue(json, Map.class);

				// it works
	            //Map<String, String> map = mapper.readValue(json, new TypeReference<Map<String, String>>() {});

	            result.putAll(map);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		 
		 return result;
		
	}
	
}
