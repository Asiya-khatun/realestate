//package com.asiya.realestate.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.Customizer;
//import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
//
//
//
//@Configuration
//public class SecurityConfig {
//	
//@Autowired
//private UserDetailsService userDetailsService;
//
//@Autowired
//private JwtFilter jwtFilter;
//
//@Bean
//public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//    return http.csrf(customizer -> customizer.disable())
//            // Stateless session
//            .authorizeHttpRequests(auth -> auth
//                    .requestMatchers("/", "/register","/login")
//                    .permitAll()  // Allow access to register endpoint
//                      // Allow access to home page
//                    .anyRequest().authenticated())
//            // Require authentication for other endpoints
//            .httpBasic(Customizer.withDefaults())  // Disable HTTP Basic Authentication (unless you're using it for APIs)
//            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
//            .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class)  // Add your JWT filter
//            .build();
//}
//
//	@Bean
//	public AuthenticationProvider authenticationProvider() {
//		DaoAuthenticationProvider provider=new DaoAuthenticationProvider();
//		provider.setUserDetailsService(userDetailsService);
//		provider.setPasswordEncoder(new BCryptPasswordEncoder(12));
//		
//		return provider;
//		
//	}
//	
//	@Bean
//	public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception{
//		 return config.getAuthenticationManager();
//	}
//	
//
//}
