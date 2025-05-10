package com.asiya.realestate.service;

import java.io.File;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class FUploadServiceImpl implements FUploadService {

	
	@Override
	public boolean uploadImage(MultipartFile image,String dir) {
	    File uploadDir = new File(UPLOAD_DIR + "//" + dir);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir();
	    }
	    String imageName = image.getOriginalFilename(); // Get the original file name
	    String uploadPath = UPLOAD_DIR + "//" + "image" + "//" + imageName;
	    File uploadFile = new File(uploadPath);
	    try {
	        image.transferTo(uploadFile); // Save the file to disk
	        return true; 
	    } catch (Exception e) {
            System.out.println("Error:"+e.getMessage());
	    }
	    return false; // Return null if the upload fails
	}



}
