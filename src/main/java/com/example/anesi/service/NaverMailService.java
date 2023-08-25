package com.example.anesi.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class NaverMailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String sender;

    public NaverMailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendVerificationCode(String email, String username) {
        String verificationCode = generateVerificationCode();

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setFrom(sender);
        message.setSubject(username + " : Your Verification Code is here!");
        message.setText("Hello " + username + "! Here is your verification code: " 
            + verificationCode 
            + ". Please use this to complete your registration process.");

        mailSender.send(message);
    }

    private String generateVerificationCode() {
        StringBuilder builder = new StringBuilder();

		for (int i = 0; i < 6; i++) {
			int digit = (int)(Math.random() * 10); // Generate a random digit(0-9)
			builder.append(digit);
		}

		return builder.toString();
   }
}