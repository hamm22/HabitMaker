package com.ham.habit.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ham.habit.common.FileManager;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	// 클라이언트에게 이미지를 보여줌
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry regitry) {
		regitry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManager.FILE_UPLOAD_PATH +"/");
	}
}
