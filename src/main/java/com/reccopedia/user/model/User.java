package com.reccopedia.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class User {

	private int id;
	private String name;
	private String info;
	private String email;
	private String password;
	private String backgroundImagePath;
	private String profileImagePath;
	private Date createdAt;
	private Date updatedAt;
	
}
