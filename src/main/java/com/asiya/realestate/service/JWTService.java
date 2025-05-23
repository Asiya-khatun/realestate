//package com.asiya.realestate.service;
//
//import io.jsonwebtoken.Claims;
//import io.jsonwebtoken.Jwts;
//import io.jsonwebtoken.io.Decoders;
//import io.jsonwebtoken.security.Keys;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Service;
//
//import javax.crypto.KeyGenerator;
//import javax.crypto.SecretKey;
//import java.util.Base64;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.function.Function;
//
//@Service
//public class JWTService {
//    private String secretkey = "";
//
//    public JWTService() throws Exception {
//
//            KeyGenerator keyGen = KeyGenerator.getInstance("HmacSHA256");
//            SecretKey sk = keyGen.generateKey();
//            secretkey = Base64.getEncoder().encodeToString(sk.getEncoded());
//       
//    }
//
//    public String generateToken(String username)  {
//        Map<String, Object> claims = new HashMap<>();
//        return Jwts.builder()
//        		.claims()
//        		.add(claims)
//        		.subject(username)
//        		.issuedAt(new Date(System.currentTimeMillis()))
//        		.expiration(new Date(System.currentTimeMillis() + (60 * 60 + 60) * 1000))
//        		.and()
//        		.signWith(key())
//        		.compact();
//        		
//        		
//
//    }
//
//    private SecretKey key() {
//        byte[] keyBytes = Decoders.BASE64.decode(secretkey);
//        return Keys.hmacShaKeyFor(keyBytes);
//    }
//
//    public String extractUserName(String token) {
//        // extract the username from jwt token
//    	return extractClaim(token, Claims::getSubject);
////        return extractClaim(token, Claims::getSubject);
//    }
//
//    private <T> T extractClaim(String token, Function<Claims, T> claimResolver) {
//        final Claims claims = extractAllClaims(token);
//        return claimResolver.apply(claims);
//    }
//
//    private Claims extractAllClaims(String token) {
//        return Jwts.parser()
//                .verifyWith(key())
//                .build()
//                .parseSignedClaims(token)
//                .getPayload();
//    }
//
//    public boolean validateToken(String token, UserDetails userDetails) {
//        final String userName = extractUserName(token);
//        return (userName.equals(userDetails.getUsername()) && !isTokenExpired(token));
//    }
//
//    private boolean isTokenExpired(String token) {
//        return extractExpiration(token).before(new Date());
//    }
//
//    private Date extractExpiration(String token) {
//        return extractClaim(token, Claims::getExpiration);
//    }
//}