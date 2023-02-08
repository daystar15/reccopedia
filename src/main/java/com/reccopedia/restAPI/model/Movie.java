package com.reccopedia.restAPI.model;

public class Movie {

	private static final String popularUrl = "https://api.themoviedb.org/3/movie/popular";
	
	private static final String netfilxUrl = "https://api.themoviedb.org/3/discover/movie?api_key=af1b14dca35a2db111be58155d08e240&with_watch_providers=8&watch_region=KR&language=ko";

	private static final String upcomingUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=af1b14dca35a2db111be58155d08e240&watch_region=KR&language=ko";

	public static String getPopularurl() {
		return popularUrl;
	}

	public static String getNetfilxurl() {
		return netfilxUrl;
	}

	public static String getUpcomingurl() {
		return upcomingUrl;
	}

	
}
