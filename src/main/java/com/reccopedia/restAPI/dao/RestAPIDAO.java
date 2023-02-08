package com.reccopedia.restAPI.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class RestAPIDAO { // dao에 가까움
	
	private static final String url = "https://api.themoviedb.org/3/movie/popular";
	private static final String netfilxUrl = "https://api.themoviedb.org/3/discover/movie?api_key=af1b14dca35a2db111be58155d08e240&with_watch_providers=8&watch_region=KR&language=ko";
	private static final String topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=af1b14dca35a2db111be58155d08e240&watch_region=KR&language=ko";
	
	@GetMapping("/contents") // 임시로 확인하기 위한 것
	public String callAPI() throws JsonProcessingException {
		
		Map<String, Object> result = new HashMap<>();
		
		String jsonString = "";
		
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders header = new HttpHeaders();
        HttpEntity<?> entity = new HttpEntity<>(header);
        
        //String popularUrl = "https://api.themoviedb.org/3/movie/popular";
    	//String topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated";
        //String url = "https://api.themoviedb.org/3/movie/popular";
        
        // 얘가 하나의 uri만 부르도록 설정되어 있어서 3개의 메소드를 만든다.
        UriComponents uri = UriComponentsBuilder.fromHttpUrl(url + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
        
        //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
        ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
        result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
        result.put("header", resultMap.getHeaders()); //헤더 정보 확인
        result.put("body", resultMap.getBody()); //실제 데이터 정보 확인

        //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
        ObjectMapper mapper = new ObjectMapper();
        jsonString = mapper.writeValueAsString(resultMap.getBody());
		
		return jsonString;
	}
	
}