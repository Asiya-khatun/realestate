package com.asiya.realestate.service;

import org.springframework.web.multipart.MultipartFile;

public interface FUploadService {
	public boolean uploadImage(MultipartFile image, String dir);
	public static final String UPLOAD_DIR="C:\\Users\\HP\\Documents"
			+ "\\workspace-spring-tool-suite-4-4.25.0.RELEASE\\RealEstate\\src"
			+ "\\main\\resources\\static\\images";


}
