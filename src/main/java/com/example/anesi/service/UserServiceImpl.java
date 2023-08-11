package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.LoginMapper;
import com.example.anesi.mapper.UserMapper;
import com.example.anesi.model.Scrapbook;



@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	//회원가입
	@Override
	public int userJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.userJoin(map);
	}
	//이메일 중복체크
	@Override
	public int joinCnt(HashMap<String, Object> map) {
		System.out.println(map);
		return userMapper.joinCnt(map);
	}
	//닉네임 중복체크
	@Override
	public int nickCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.nickCnt(map);
	}
	//전화번호 중복체크
	@Override
	public int phoneCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.phoneCnt(map);
	}
	@Override
	public List<Scrapbook> searchScrapbookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectScrapbookList(map);
	}

}
