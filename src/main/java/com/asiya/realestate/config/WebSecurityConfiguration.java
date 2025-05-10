package com.asiya.realestate.config;


import java.beans.Customizer;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class WebSecurityConfiguration {
	
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
	    http.authorizeHttpRequests(authorize -> authorize
	            .requestMatchers("/admin/**").hasRole("ADMIN")
	            .requestMatchers("/user/**").hasRole("USER")
	            .requestMatchers("/**").permitAll()  // Allow public access to some pages like login, register
	            .anyRequest().authenticated())  // All other requests must be authenticated
	        .formLogin(login -> login
	            .loginPage("/login")
	            .loginProcessingUrl("/login")
	            .usernameParameter("username")
	            .passwordParameter("password")
	            .defaultSuccessUrl("/dashboard", true)
	            .failureUrl("/login?error=true")
	            .permitAll())
	        .logout(logout -> logout
	            .logoutUrl("/logout")
	            .logoutSuccessUrl("/login?logout=true")
	            .permitAll()
	            .invalidateHttpSession(true));
	    http.csrf(customizer -> customizer.disable()); 
	    // Disable CSRF protection (use with caution)
	    http.oauth2Login(oauth->{
	    	oauth.loginPage("/login");
	    });
	    return http.build();
	    
	  
	 
	}
	

	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder  amb)throws Exception{
		amb.jdbcAuthentication()
		.passwordEncoder(passwordEncoder)
		.dataSource(dataSource)
		.usersByUsernameQuery("SELECT username, password, enable FROM user_table WHERE username = ?")

		.authoritiesByUsernameQuery("SELECT u.username, r.role " 
			    + "FROM user_table AS u " 
			    + "JOIN role_table AS r ON u.user_id = r.user_id " 
			    + "WHERE u.username = ?");

	}
	
	

}
