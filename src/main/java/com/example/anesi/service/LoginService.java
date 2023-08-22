package com.example.anesi.service;

import java.util.HashMap;

import com.example.anesi.model.User;



public interface LoginService {
	// 로그인
	HashMap<String, Object> searchUser(HashMap<String, Object> map);
	// 이메일 확인
	int searchUserEmail(HashMap<String, Object> map);
	// 이메일 찾기
	User searchUserEmail1(HashMap<String, Object> map);
	// 비번찾기
	HashMap<String, Object> searchUserPwd(HashMap<String, Object> map);
}
