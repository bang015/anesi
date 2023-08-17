package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Scrapbook;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;


@Mapper
public interface UserMapper {
	//회원가입
	int userJoin(HashMap<String, Object> map);
	//이메일 중복체크
	int joinCnt(HashMap<String, Object> map);
	//닉네임 중복체크
	int nickCnt(HashMap<String, Object> map);
	//전화번호 중복체크
	int phoneCnt(HashMap<String, Object> map);
	//스크랩북 리스트
	List<Scrapbook> selectScrapbookList(HashMap<String, Object> map);
	//스크랩북 삭제
	int deleteScrapbook(HashMap<String, Object> map);
	//유저 정보
	User selectUserNickname(HashMap<String, Object> map);
	//유저정보수정 닉네임 중복체크
	int EditNickCnt(HashMap<String, Object> map);
	//유저정보수정 번호 중복체크
	int EditPhoneCnt(HashMap<String, Object> map);
	//유저정보수정
	int editUser(HashMap<String, Object> map);
	//알림설정수정
	int smsYnEdit(HashMap<String, Object> map);
	//닉네임검색
	User searchNick(HashMap<String, Object> map);
	//기본프로필입력
	int insertProfile(HashMap<String, Object> map);
	//비밀번호변경
	int editPassword(HashMap<String, Object> map);
	//회원탈퇴
	int withdrawal(HashMap<String, Object> map);
	// 주문내역 조회
	List<UserOrder> selectOrderList(HashMap<String, Object> map);
	
}
