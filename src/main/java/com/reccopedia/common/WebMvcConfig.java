package com.reccopedia.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.reccopedia.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry
		.addResourceHandler("/images/**") // 웹 이미지 주소 
		//.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH); // 실제 파일 위치 윈도우는 슬래시 3개, 맥은 2개
		.addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH); // 실제 파일 위치 윈도우는 슬래시 3개, 리눅스는 2개
	}
}
