package com.example.anesi.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.LoginMapper;
import com.example.anesi.model.User;



@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginMapper loginMapper;
	
	@Override //로그인
	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user=loginMapper.selectUser(map);
		if(user != null) {
			if(user.getCnt() >= 5) {
				resultMap.put("success", false);
				resultMap.put("message", "5번 이상 실패했습니다. 관리자한테 문의해주세요.");
			}else {
				
				loginMapper.reSetCnt(map);
				resultMap.put("success", true);
				resultMap.put("message", "환영합니다");
				resultMap.put("user", user);
			}
		}else {
			resultMap.put("success", false);
			User tempUser=loginMapper.userCheckId(map);
			if(tempUser != null) {
				int cnt= tempUser.getCnt()+1;
				String message = cnt+"번 실패했습니다. 패스워드를 확인해주세요. ";
				loginMapper.updateCnt(map);
				if(cnt >= 5) {
					message = "5번 이상 실패했습니다. 관리자한테 문의해주세요.";
				}
				resultMap.put("message" ,message);
			}else {
				resultMap.put("message", "존재하지 않는 이메일입니다. 이메일을 확인해주세요.");
			}
		}
		return resultMap;
	}
	//아이디 찾기
		@Override
		public int searchUserEmail(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
			return loginMapper.selectUserEmail(map);
		}
		@Override
		public HashMap<String, Object> searchUserPwd(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			User user=loginMapper.selectUserPwd(map);
			if(user != null) {
				resultMap.put("selectPwd", user);
				resultMap.put("message",user.getUserName()+"님의 패스워드는 " + user.getUserPwd()+" 입니다.");
			}else {
				resultMap.put("message", "이름 또는 휴대폰 번호를 확인해주세요.");
			}
			return resultMap;
		}

}
