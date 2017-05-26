package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import com.example.demo.security.SecurityConfig;

@SpringBootApplication
@EnableAutoConfiguration
@Import({ SecurityConfig.class })
public class GAnWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(GAnWebApplication.class, args);
	}
	
	
}
