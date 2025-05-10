//package com.asiya.realestate.config;
//
//import java.io.IOException;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
//import org.springframework.stereotype.Component;
//import org.springframework.web.filter.OncePerRequestFilter;
//
//import com.asiya.realestate.service.JWTService;
//import com.asiya.realestate.service.MyUserDetailService;
//
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@Component
//public class JwtFilter extends OncePerRequestFilter{
//	@Autowired
//	private JWTService jwtService;
//	
//	@Autowired
//	ApplicationContext applicationContext;
//
//	@Override
//	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
//			throws ServletException, IOException {
//		  String uri = request.getRequestURI();
//		    
//		    // Skip the filter for public endpoints like register and login
//		    if (uri.equals("/register") || uri.equals("/login")) {
//		        filterChain.doFilter(request, response);
//		        return;
//		    }
//		
//		
//		 
//		    
//		//request object to work with user data and response to add somthing to the data
//		String authHeader=request.getHeader("Authorization");
//		String token=null;
//		String username=null;
//		
//		if(authHeader != null && authHeader.startsWith("Bearer ")) {
//			token=authHeader.substring(7);
//			username=jwtService.extractUserName(token);
//			//in this we want to take the token only so we set the token with username
//			//then we checked if the authHeader is not null and doesnot starts with Beares
//			//and if it does then just extract that part and just take the token
//			//with the username of the user
//		}
//		if(username!=null && SecurityContextHolder.getContext().getAuthentication()==null) {
//			
//			UserDetails userDetails = applicationContext.getBean(MyUserDetailService.class).loadUserByUsername(username);
//			if(jwtService.validateToken(token,userDetails)) {
//				
//				
//				UsernamePasswordAuthenticationToken tokens=
//						new UsernamePasswordAuthenticationToken(userDetails,null,userDetails.getAuthorities());
//					tokens.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//					SecurityContextHolder.getContext().setAuthentication(tokens);
//					
//				
//			}
//		}
//		filterChain.doFilter(request, response);
//		
//	}
//	
//
//}
