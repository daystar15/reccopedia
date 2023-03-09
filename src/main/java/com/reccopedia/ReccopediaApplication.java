package com.reccopedia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class ReccopediaApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(ReccopediaApplication.class, args);
	}

}
