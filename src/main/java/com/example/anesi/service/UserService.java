package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;



public interface UserService {

	int userJoin(HashMap<String, Object> map);
	
	int joinCnt(HashMap<String, Object> map);
	
	int nickCnt(HashMap<String, Object> map);
	
	int phoneCnt(HashMap<String, Object> map);
	
}
