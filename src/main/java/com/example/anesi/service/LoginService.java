package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;



public interface LoginService {
	// 로그인
	HashMap<String, Object> searchUser(HashMap<String, Object> map);
	//아이디 찾기
	int searchUserEmail(HashMap<String, Object> map);
}
