package com.reccopedia.contents.bo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

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
	
	
	public List<Map<String, Object>> generateNowMap() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callNowAPI();
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");
		
		 
		return list;
		
	}
	
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
	
	public Map<String, Object> generateContent(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callContentAPI(id);

		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});

		return result;
		
	}
	
	
	
	public List<Map<String, Object>> generateContentCrew(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callCrewAPI(id);
		
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("cast");
		
		 
		return list;
		
	}
	
	
	
	public String generateGenre(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callContentAPI(id);
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("genres");
		
		List<String> genreList = new ArrayList<>();
		

		for (Map<String, Object> map : list) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				if(entry.getKey().equals("name")) {
					genreList.add((String) entry.getValue());
					
				}
			}

		}
		
		// 괄호 삭제
		String str = String.join(" , ", genreList);
		 
		return str;
		
	}
	
	public List<String> generateVideo(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callVideoAPI(id);
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("results");
		
		List<String> yutube = new ArrayList<>();
		
		for (Map<String, Object> map : list) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				if(entry.getKey().equals("key")) {
					yutube.add((String) entry.getValue());
					
				}
			}

		}
		
		return yutube;
		
	}
	
	public List<String> generateImages(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callImagesAPI(id);
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("posters");
		
		List<String> imageList = new ArrayList<>();
		
		for (Map<String, Object> map : list) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				if(entry.getKey().equals("file_path")) {
					imageList.add((String) entry.getValue());
					
				}
			}

		}
		
		return imageList;
		
	}
	
	public String generateYear(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callContentAPI(id);
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		String year = (String) result.get("release_date");
		
		String[] arr = year.split("-");
		
		year = arr[0];
		
		return year;
		
	}
	
	public String generateCountry(int id) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String json = resttemplateservice.callContentAPI(id);
		
		// 맵으로 만들기
		Map<String, Object> result = new HashMap<String, Object>();
		result = mapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		
		List<Map<String, Object>> list = new ArrayList<>();
		list = (List<Map<String, Object>>) result.get("production_countries");
		
		List<String> countryList = new ArrayList<>();
		

		for (Map<String, Object> map : list) {
			for (Map.Entry<String, Object> entry : map.entrySet()) {
				if(entry.getKey().equals("name")) {
					countryList.add((String) entry.getValue());
					
				}
			}

		}
		
		// 괄호 삭제
		String str = String.join(" , ", countryList);
		 
		return str;
		
	}


	
}
