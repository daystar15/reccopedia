package com.reccopedia.spoiler.model;

import java.util.Date;

public class Spoiler {

	private int id;
	private int apiId;
	private int userId;
	private String spoiler;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getApiId() {
		return apiId;
	}
	public void setApiId(int apiId) {
		this.apiId = apiId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSpoiler() {
		return spoiler;
	}
	public void setSpoiler(String spoiler) {
		this.spoiler = spoiler;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
