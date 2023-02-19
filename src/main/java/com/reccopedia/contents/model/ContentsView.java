package com.reccopedia.contents.model;

import java.util.Date;

public class ContentsView {
	
	private int id;
	private String type;
	private String title;
	private String overview;
	private String genre;
	private int runtime;
	private boolean adult;
	private String director;
	private String actor;
	private String status;
	private String contentGallery;
	private String contentVideo;
	
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	public boolean isAdult() {
		return adult;
	}
	public void setAdult(boolean adult) {
		this.adult = adult;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContentGallery() {
		return contentGallery;
	}
	public void setContentGallery(String contentGallery) {
		this.contentGallery = contentGallery;
	}
	public String getContentVideo() {
		return contentVideo;
	}
	public void setContentVideo(String contentVideo) {
		this.contentVideo = contentVideo;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getPosterImage() {
		return posterImage;
	}
	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}
	public String getProduction_countries() {
		return production_countries;
	}
	public void setProduction_countries(String production_countries) {
		this.production_countries = production_countries;
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
	private int year;
	private String posterImage;
	private String production_countries;
	private Date createdAt;
	private Date updatedAt;
	
	
}
