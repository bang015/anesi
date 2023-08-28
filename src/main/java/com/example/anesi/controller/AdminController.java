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

import com.example.anesi.model.Inquiry;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
import com.example.anesi.model.Statistics;
import com.example.anesi.model.Used;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;
import com.example.anesi.service.AdminService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/main.do") 
	public String admin_main(Model model) throws Exception{
		
		return "/admin_main";
	}
	
	@RequestMapping("/admin/product_edit.do") 
	public String edit(Model model) throws Exception{
		
		return "/product_edit";
	}
	
	@RequestMapping("/admin/delivery.do") 
	public String delivery(Model model) throws Exception{
		
		return "/admin_delivery";
	}
	@RequestMapping("/admin/usedDelivery.do") 
	public String usedDelivery(Model model) throws Exception{
		
		return "/admin_usedDelivery";
	}
	
	@RequestMapping("/admin/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/product_add";
		
	}
	
	@RequestMapping("/admin/inquiry.do") 
	public String inquiry(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/admin_inquiry";
		
	}
	
	@RequestMapping("/admin/user.do") 
	public String user(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/admin_user";
		
	}
	
	@RequestMapping("/admin/review.do") 
	public String review(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/admin_review";
	}
	
	@RequestMapping("/admin/used.do") 
	public String used(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/admin_used";
	}
	
	@RequestMapping("/admin/statistics.do") 
	public String statistics(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/admin_statistics";
	}
	
	//admin 관리자 메인
	@RequestMapping(value = "/admin/mainList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mainList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
	 	HashMap<String, Object>  list = adminService.adminMain(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//admin 관리자 메인문의리스트
	@RequestMapping(value = "/admin/mainInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public String mainInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Inquiry>  list = adminService.adminMainInquiry(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//admin 관리자 리뷰
	@RequestMapping(value = "/admin/mainReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public String mainReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Review>  list = adminService.adminMainReview(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//상품 전체 조회
	@RequestMapping(value = "/admin/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = adminService.adminProductList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//상품 전체 조회
	@RequestMapping(value = "/admin/productInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> info = adminService.adminProductInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	//상품 업데이트
	@RequestMapping(value = "/admin/productUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminEditProduct(map);
		return new Gson().toJson(resultMap);
	}
	//옵션 업데이트
	@RequestMapping(value = "/admin/optionUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminEditOption(map);
		return new Gson().toJson(resultMap);
	}
	//옵션 추가
	@RequestMapping(value = "/admin/optionInsert.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionInsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.adminAddOption(map);
		return new Gson().toJson(resultMap);
	}
	//상품 상태 업데이트
	@RequestMapping(value = "/admin/productSituation.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productSituation(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.adminEditProductSituation(map));
		return new Gson().toJson(resultMap);
	}
	//옵션 삭제
	@RequestMapping(value = "/admin/optionDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String optionDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.adminRemoveOption(map));
		return new Gson().toJson(resultMap);
	}
	//배송 전체
	@RequestMapping(value = "/admin/orderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UserOrder> list = adminService.selectDeliveryList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//배송 상태 업데이트
	@RequestMapping(value = "/admin/editDelivery.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editDelivery(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.editDelivery(map));
		return new Gson().toJson(resultMap);
	}
	//배송 검색
	@RequestMapping(value = "/admin/searchList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UserOrder> list = adminService.searchSearchList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//문의 내용 검색
	@RequestMapping(value = "/admin/searchInquiryList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchInquiryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Inquiry> list = adminService.searchAdminInquiriesList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//문의 답변
	@RequestMapping(value = "/admin/editInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.editAdminInquiry(map);
		return new Gson().toJson(resultMap);
	}
	
	//고객 전체 조회
	@RequestMapping(value = "/admin/userList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> list = adminService.searchUserList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//고객 상세 조회
	@RequestMapping(value = "/admin/userInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User info = adminService.searchUserInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	//고객 상세 정보 업데이트
	@RequestMapping(value = "/admin/editUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.editUser(map);		
		resultMap.put("success", "고객정보수정완료");
		return new Gson().toJson(resultMap);
	}
	//고객 정보 삭제
	@RequestMapping(value = "/admin/removeUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt", adminService.removeUser(map));
		return new Gson().toJson(resultMap);
	}
	//리뷰 검색
	@RequestMapping(value = "/admin/searchReviewList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchReviewList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Review> list = adminService.searchAdminReviewList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/admin/removeReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		adminService.removeAdminReview(map);
		resultMap.put("cnt", adminService.removeAdminReview(map));
		return new Gson().toJson(resultMap);
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/admin/userResetCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userResetCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		adminService.removeAdminReview(map);
		resultMap.put("cnt", adminService.adminResetUserCnt(map));
		return new Gson().toJson(resultMap);
	}
	
	//알람인서트
	@RequestMapping(value = "addAlarm.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addAlarm(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.addAlarm(map);
		return new Gson().toJson(resultMap);
	}
	
	//알람 전체 조회
	@RequestMapping(value = "alarmList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String alarmAll(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> list = adminService.searchAlarmAll(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//알람삭제
	@RequestMapping(value = "removeAlarm.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeAlarm(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		adminService.removeAlarm(map);
		return new Gson().toJson(resultMap);
	}
	
	//알람 전체 조회
	@RequestMapping(value = "/admin/searchUsedList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUsedList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Used> list = adminService.searchUsedList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	// 토탈 판매금액 + 판매수량, 금일 판매금액 + 판매수량
	@RequestMapping(value = "/admin/searchStatisticsProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchStatisticsProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Statistics info = adminService.searchStatisticsProduct(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	// 토탈 판매금액 + 판매수량, 금일 판매금액 + 판매수량
	@RequestMapping(value = "/admin/searchWeeklySales.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchWeeklySales(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Statistics> list = adminService.searchWeeklySales(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	// 관리자메인 상품차트
	@RequestMapping(value = "/admin/productChart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productChart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Statistics> list = adminService.mainChart(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	// 관리자메인 상품차트
	@RequestMapping(value = "/admin/csatChart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String csatChart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Statistics> list = adminService.csatChart(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//중고배송 전체
	@RequestMapping(value = "/admin/usedDelivery.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public String usedDelivery(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Used> list = adminService.selectUsedDeliveryList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	//중고배송 검색
	@RequestMapping(value = "/admin/usedDeliverySearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
		public String usedDeliverySearch(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Used> list = adminService.selectUsedSearch(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//배송 상태 업데이트
	@RequestMapping(value = "/admin/editUsedDelivery.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editUsedDelivery(Model model, @RequestParam HashMap<String, Object> map) throws Exception {HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("checkList").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
		map.put("list", list);
		resultMap.put("cnt", adminService.editUsedDelivery(map));
		return new Gson().toJson(resultMap);
		}
}
