package com.reccopedia.restAPI.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class RestTemplateService { // dao에 가까움
	
	private static final String popularUrl = "https://api.themoviedb.org/3/movie/popular";
	private static final String netfilxUrl = "https://api.themoviedb.org/3/discover/movie";
	private static final String topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated";
	
	public Map<String, Object> popularUrlAPI() {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, Object> jsonString = new HashMap<>();
		
		try {
			HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
		
		
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
        
            //String popularUrl = "https://api.themoviedb.org/3/movie/popular";
            //String topRatedUrl = "https://api.themoviedb.org/3/movie/top_rated";
            //String url = "https://api.themoviedb.org/3/movie/popular";
        
            // 얘가 하나의 uri만 부르도록 설정되어 있어서 3개의 메소드를 만든다.
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(popularUrl + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
        
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
        	result.put("body", resultMap.getBody()); //실제 데이터 정보 확인

        	//데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
        	ObjectMapper mapper = new ObjectMapper();
        	jsonString = mapper.writeValueAsString(resultMap.getBody());
		
		} catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
		
		return jsonString;
		
	}
	
	
	public String netfilxUrlAPI() {
		
		Map<String, Object> result = new HashMap<>();
		
		String jsonString = "";
		
		try {
			HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
		
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
        
            // 얘가 하나의 uri만 부르도록 설정되어 있어서 3개의 메소드를 만든다.
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(netfilxUrl + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
        
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
        	result.put("body", resultMap.getBody()); //실제 데이터 정보 확인

        	//데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
        	ObjectMapper mapper = new ObjectMapper();
        	jsonString = mapper.writeValueAsString(resultMap.getBody());
		
		} catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
		
		return jsonString;
		
	}
	
	
	public String topRatedUrlAPI() {
		
		Map<String, Object> result = new HashMap<>();
		
		String jsonString = "";
		
		try {
			HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
            factory.setConnectTimeout(5000); //타임아웃 설정 5초
            factory.setReadTimeout(5000);//타임아웃 설정 5초
            RestTemplate restTemplate = new RestTemplate(factory);
		
		
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
        
            // 얘가 하나의 uri만 부르도록 설정되어 있어서 3개의 메소드를 만든다.
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(topRatedUrl + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
        
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
        	result.put("body", resultMap.getBody()); //실제 데이터 정보 확인

        	//데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
        	ObjectMapper mapper = new ObjectMapper();
        	jsonString = mapper.writeValueAsString(resultMap.getBody());
		
		} catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
		
		return jsonString;
		
	}
	
}