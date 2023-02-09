package com.reccopedia.contents.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reccopedia.contents.model.Contents;
import com.reccopedia.restAPI.dao.RestTemplateService;

@Service
public class ContentsBO {

	@Autowired
	private RestTemplateService resttemplateservice;
	
	
}
