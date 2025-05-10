package com.asiya.realestate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;




@SpringBootApplication
public class RealEstateApplication {
	

	public static void main(String[] args) {
		SpringApplication.run(RealEstateApplication.class, args);
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		PasswordEncoder encoder= new BCryptPasswordEncoder();
//		System.out.println(encoder.encode("admin123@"));
		return encoder;
	}
	
	
	
	
}
