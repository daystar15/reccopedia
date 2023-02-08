package com.reccopedia.restAPI.bo;

import org.springframework.beans.factory.annotation.Autowired;

import com.reccopedia.restAPI.dao.RestAPIDAO;

public class RestAPIBO {

	@Autowired
	private RestAPIDAO restapiDAO;
}
