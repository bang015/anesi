package com.example.anesi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.anesi.service.NaverMailService;

@RestController
public class MailController {

    private final NaverMailService naverMailService;

    @Autowired
    public MailController(NaverMailService naverMailService) {
        this.naverMailService = naverMailService;
    }

    @PostMapping("/register")
    public ResponseEntity<String> sendVerificationCode(@RequestParam String email, @RequestParam String username) {
        naverMailService.sendVerificationCode(email, username);
        return ResponseEntity.ok("Verification code sent to your email.");
    }
}
