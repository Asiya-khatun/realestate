package com.asiya.realestate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
@Service
public class MailServiceImpl implements MailService{

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Override
	public void sendMail(String To, String Subject, String message) {
		SimpleMailMessage mailMessage=new SimpleMailMessage();
		mailMessage.setTo(To);
		mailMessage.setSubject(Subject);
		mailMessage.setText(message);
		javaMailSender.send(mailMessage);
//		// TODO Auto-generated method stub
//		SimpleMailMessage mail=new MailMessage();
	}

}
