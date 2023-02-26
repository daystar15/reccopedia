package com.reccopedia.restAPI.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
public class RestTemplateService {
	
	
    private static final String nowUrl = "https://api.themoviedb.org/3/movie/now_playing";
    private static final String netfilxUrl = "https://api.themoviedb.org/3/discover/";
    private static final String contentUrl = "https://api.themoviedb.org/3/";
    private static final String searchUrl = "https://api.themoviedb.org/3/search/movie?";
    private static final String trendingUrl = "https://api.themoviedb.org/3/trending/";
    private static final String topratedTvUrl = "https://api.themoviedb.org/3/tv/top_rated";
    
    public String callNowAPI() throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(nowUrl + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    public String callTvContentAPI(int id) throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(contentUrl + "tv" + id + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
    
    public String callPopuLarAPI() throws JsonProcessingException {
 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(contentUrl + "movie/popular" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
    
    public String callNetflixAPI() throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(netfilxUrl + "movie" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&with_watch_providers=8&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
    
    public String callNetflixTvAPI() throws JsonProcessingException {
   	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(netfilxUrl + "tv" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&with_watch_providers=8&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
    
    public String callDisneyAPI() throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(netfilxUrl + "movie" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&with_watch_providers=337&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
        
    public String callContentAPI(int id) throws JsonProcessingException {
   	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(contentUrl + id + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }    
        
    
    public String callCrewAPI(int id) throws JsonProcessingException {
   	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl( contentUrl + id + "/credits" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }    
    
    
    public String callVideoAPI(int id) throws JsonProcessingException {
      	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(contentUrl + id + "/videos" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }   
    
    
    public String callImagesAPI(int id) throws JsonProcessingException {
     	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(contentUrl + id + "/images" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    public String callSimilarsAPI(int id) throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl( contentUrl + id + "/recommendations" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    
    public String callFindAPI(String title) throws JsonProcessingException {
   	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(trendingUrl + "api_key=af1b14dca35a2db111be58155d08e240" + "&page=1&query=" + title + "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    
    public String movieTrendingAPI() throws JsonProcessingException {
      	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(trendingUrl + "movie/day?api_key=af1b14dca35a2db111be58155d08e240" +  "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    public String personTrendingAPI() throws JsonProcessingException {
     	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(trendingUrl + "person/day?api_key=af1b14dca35a2db111be58155d08e240" +  "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    
    public String movieTrendingWeekAPI() throws JsonProcessingException {
     	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(trendingUrl + "movie/week?api_key=af1b14dca35a2db111be58155d08e240" +  "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    
    public String tvTrendingAPI() throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(trendingUrl + "tv/day?api_key=af1b14dca35a2db111be58155d08e240" +  "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    
    public String tvTrendingWeekAPI() throws JsonProcessingException {
   	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(trendingUrl + "tv/week?api_key=af1b14dca35a2db111be58155d08e240" +  "&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
        }
 
        return jsonInString;
 
    }
    
    
    public String callTopratedTvAPI() throws JsonProcessingException {
    	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(contentUrl + "tv/popular" + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
    
    public String callTvPopuLarAPI() throws JsonProcessingException {
   	 
        HashMap<String, Object> result = new HashMap<String, Object>(); // 예외처리
        
        String jsonInString = "";
        
        try {
        	
            RestTemplate restTemplate = new RestTemplate();
 
            HttpHeaders header = new HttpHeaders();
            HttpEntity<?> entity = new HttpEntity<>(header);
 
            UriComponents uri = UriComponentsBuilder.fromHttpUrl(topratedTvUrl + "?" + "api_key=af1b14dca35a2db111be58155d08e240" + "&watch_region=KR&language=ko").build();
 
            //이 한줄의 코드로 API를 호출해 MAP타입으로 전달 받는다.
            ResponseEntity<Map> resultMap = restTemplate.exchange(uri.toString(), HttpMethod.GET, entity, Map.class);
            result.put("statusCode", resultMap.getStatusCodeValue()); //http status code를 확인
            result.put("header", resultMap.getHeaders()); //헤더 정보 확인
            result.put("body", resultMap.getBody()); //실제 데이터 정보 확인
 
            //데이터를 제대로 전달 받았는지 확인 string형태로 파싱해줌
            ObjectMapper mapper = new ObjectMapper();
            jsonInString = mapper.writeValueAsString(resultMap.getBody());
            
            
        } catch (HttpClientErrorException | HttpServerErrorException e) {
            result.put("statusCode", e.getRawStatusCode());
            result.put("body"  , e.getStatusText());
            System.out.println("dfdfdfdf");
            System.out.println(e.toString());
 
        } catch (Exception e) {
            result.put("statusCode", "999");
            result.put("body"  , "excpetion오류");
            System.out.println(e.toString());
        }
 
        return jsonInString;
 
    }
    
           
}
