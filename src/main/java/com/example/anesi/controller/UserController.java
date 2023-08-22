package com.example.anesi.controller;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.anesi.model.Review;
import com.example.anesi.model.Scrapbook;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;
import com.example.anesi.service.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired 
	HttpSession session;
	// 회원가입 페이지
	@RequestMapping("/join.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/join";
    }
	// 이용약관 페이지
	@RequestMapping("/usepolicy.do") 
    public String usepolicy(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/usepolicy";
    }
	// 개인정보 페이지
	@RequestMapping("/privacy.do") 
    public String privacy(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/privacy";
    }
	// 개인정보마케팅 페이지
	@RequestMapping("/privacyMarketing.do") 
    public String privacyMarketing(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/privacyMarketing";
    }
	// 마이페이지
	@RequestMapping("/mypage.do") 
    public String mypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/mypage";
    }
	// 회원정보수정
	@RequestMapping("/mypage/user_edit.do") 
    public String user_edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/user_edit";
    }
	// 알림설정
	@RequestMapping("/mypage/push_setting.do") 
    public String smsYn(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/push_setting";
    }
	// 비밀번호변경
	@RequestMapping("/mypage/edit_password.do") 
    public String edit_password(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/edit_password";
    }
	// 스크랩북
	@RequestMapping("/scrapbook.do") 
    public String scrapbook(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/scrapbook";
    }
	// 회원탈퇴
	@RequestMapping("mypage/withdrawal.do") 
    public String withdrawal(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/withdrawal";
    }
	
	// 나의 쇼핑
	@RequestMapping("mypage/myShopping.do") 
    public String myShopping(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/myShopping";
    }
	
	// 나의 게시글
	@RequestMapping("mypage/myBoard.do") 
    public String myBoard(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/my_board";
    }

	// 나의 게시글
	@RequestMapping("mypage/myReview.do") 
    public String myReview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{

		return "/myReview";
    }
	
	// 회원가입
	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.userJoin(map);
		return new Gson().toJson(resultMap);
	}
	
	// 이메일 중복체크
	@RequestMapping(value = "/joinCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.joinCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	// 닉네임 중복체크
	@RequestMapping(value = "/nickCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nickCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.nickCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	// 전화번호 중복체크
	@RequestMapping(value = "/phoneCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String phoneCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.phoneCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	//스크랩북 검색
	@RequestMapping(value = "scrapbook/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String scrapbookList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Scrapbook> list = userService.searchScrapbookList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//스크랩북 삭제
	@RequestMapping(value = "scrapbook/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String scrapbookremove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkSb").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		userService.removeScrapbook(map);
		return new Gson().toJson(resultMap);
	}
	//유저 정보
	@RequestMapping(value = "mypage/user_info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String user_info(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User info = userService.selectUserNickname(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	//유저정보수정 닉네임 중복체크
	@RequestMapping(value = "/EditNickCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String EditNickCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.EditNickCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	//유저정보수정 번호 중복체크
	@RequestMapping(value = "/EditPhoneCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String EditPhoneCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.EditPhoneCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	//유저 정보 수정
	@RequestMapping(value = "mypage/userEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.editUser(map);
		User info = userService.selectUserNickname(map);
		resultMap.put("info", info);
		session.setAttribute("sessionNick", info.getNick());
		return new Gson().toJson(resultMap);
	}
	//알림 설정
	@RequestMapping(value = "/mypage/smsYn_edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String smsEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.smsYnEdit(map);
		return new Gson().toJson(resultMap);
	}
	//비밀번호변경
	@RequestMapping(value = "/mypage/edit_password.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit_password(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.editPassword(map);
		return new Gson().toJson(resultMap);
	}
	//회원탈퇴
	@RequestMapping(value = "/mypage/withdrawal.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String withdrawal(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.withdrawal(map);
		return new Gson().toJson(resultMap);
	}
	
	//주문 내역 검색
	@RequestMapping(value = "/mypage/searchOrderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchOrderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UserOrder> list = userService.searchOrderList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//나의 리뷰 검색
	@RequestMapping(value = "/mypage/searchMyReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchMyReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Review> list = userService.searchMyReviewList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//리뷰 수정
	@RequestMapping(value = "/mypage/editReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt", userService.editReview(map));
		return new Gson().toJson(resultMap);
	}
}