package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.LoginMapper;
import com.example.anesi.mapper.UserMapper;
import com.example.anesi.model.Review;
import com.example.anesi.model.Scrapbook;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	//회원가입
	@Override
	public int userJoin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.userJoin(map);
		User user = userMapper.searchNick(map);
		map.put("userNo", user.getUserNo());
		map.put("profile", user.getUserName());
		userMapper.insertProfile(map);
		return 1;
	}
	//이메일 중복체크
	@Override
	public int joinCnt(HashMap<String, Object> map) {
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
	@Override
	public int removeScrapbook(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.deleteScrapbook(map);
	}
	@Override
	public User selectUserNickname(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserNickname(map);
	}
	@Override
	public int EditNickCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.EditNickCnt(map);
	}
	@Override
	public int EditPhoneCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.EditPhoneCnt(map);
	}
	@Override
	public int editUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.editUser(map);
	}
	@Override
	public int smsYnEdit(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.smsYnEdit(map);
	}
	@Override
	public int insertProfile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.insertProfile(map);
	}
	@Override
	public User searchNick(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.searchNick(map);
	}
	@Override
	public int editPassword(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.editPassword(map);
	}
	@Override
	public int withdrawal(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.withdrawal(map);
	}
	@Override
	public List<UserOrder> searchOrderList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectOrderList(map);
	}
	@Override
	public List<Review> searchMyReviewList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectMyReviewList(map);
	}

}
