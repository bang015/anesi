package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;



public interface UserService {

	int userJoin(HashMap<String, Object> map);
	
	int userCnt(HashMap<String, Object> map);
	
}
