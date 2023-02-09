package com.reccopedia.restAPI.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.contents.model.Contents;
import com.reccopedia.restAPI.dao.RestTemplateService;
import com.reccopedia.restAPI.model.MainView;

@Service
public class MainBO {

	// 뷰화면에 뿌리고 싶은 화면을 구성(카드뷰같은 객체를 가공하기)
	 @Autowired 
	 private RestTemplateService resttemplateservice;
	 
	 
	 public List<MainView> getPopularUrl(int id) {
		 List<MainView> popularList = new ArrayList();
		 
		 // 컨텐츠 목록 가져오기
		 List<Map<String, Object>> contentsList = resttemplateservice.popularUrlAPI();
	 
		 for (Contents content : contentsList) {
			 MainView main = new MainView();
			 
			 main.setContents(content.getTitle());
		 }
	 }
	
}
