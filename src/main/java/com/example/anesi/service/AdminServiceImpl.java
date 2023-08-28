package com.example.anesi.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.AdminMapper;
import com.example.anesi.model.Inquiry;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
import com.example.anesi.model.Statistics;
import com.example.anesi.model.Used;
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	//관리자 메인 전체다 불러오는거
	
	@Override
	public List<Product> adminProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminProductList(map);
	}

	@Override
	public List<Product> adminProductInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminProductInfo(map);
	}

	@Override
	public int adminEditProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminUpdateProduct(map);
	}

	@Override
	public int adminEditOption(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminOptionUpdate(map);
	}

	@Override
	public int adminAddOption(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminInsertOption(map);
	}

	@Override
	public int adminEditProductSituation(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminProductSituation(map);
	}

	@Override
	public int adminRemoveOption(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminDeleteOption(map);
	}

	@Override
	public List<UserOrder> selectDeliveryList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<UserOrder> list = adminMapper.selectDeliveryList(map);
		return  list;
	}

	@Override
	public int editDelivery(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		adminMapper.updateNonDelivery(map);
		return adminMapper.updateDelivery(map);
	}

	@Override
	public List<UserOrder> searchSearchList(HashMap<String, Object> map) {
		return adminMapper.selectSearchList(map);
	}

	@Override
	public List<Inquiry> searchAdminInquiriesList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectAdminInquiryList(map);
	}

	@Override
	public HashMap<String, Object> editAdminInquiry(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("inquiry",adminMapper.updateAdminInquiry(map));
		map.put("alarmType", 6);
		resultMap.put("alarm",adminMapper.insertAlarm(map));
		return resultMap;
	}
	
	@Override
	public List<User> searchUserList(HashMap<String, Object> map) {
		return adminMapper.selectUserList(map);
	}

	@Override
	public User searchUserInfo(HashMap<String, Object> map) {
		return adminMapper.selectUserInfo(map);
	}

	@Override
	public List<Review> searchAdminReviewList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectAdminReviewList(map);
	}

	@Override
	public int removeAdminReview(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.deleteAdminReview(map);
	}

	@Override
	public int editUser(HashMap<String, Object> map) {
		return adminMapper.updateUser(map);
	}

	@Override
	public int removeUser(HashMap<String, Object> map) {
		return adminMapper.deleteUser(map);
	}

	@Override
	public int adminResetUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.adminResetUserCnt(map);
	}

	@Override
	public int addAlarm(HashMap<String, Object> map) {
		return adminMapper.insertAlarm(map);
	}

	@Override
	public List<User> searchAlarmAll(HashMap<String, Object> map) {
		return adminMapper.selectAlarmAll(map);
	}

	@Override
	public int removeAlarm(HashMap<String, Object> map) {
		return adminMapper.deleteAlarm(map);
	}

	@Override
	public List<Used> searchUsedList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectUsedList(map);
	}

	@Override
	public Statistics searchStatisticsProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectStatisticsProduct(map);
	}

	@Override
	public List<Statistics> searchWeeklySales(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectWeeklySales(map);
	}

	@Override
	public HashMap<String, Object> adminMain(HashMap<String, Object> map) {
		HashMap<String, Object>	resultMap = new HashMap<String, Object>();
		resultMap.put("order", adminMapper.mainOrderList(map));
		resultMap.put("used", adminMapper.mainUsedList(map));
		resultMap.put("product1", adminMapper.mainProductDel(map));
		resultMap.put("product2", adminMapper.mainProductDis(map));
		resultMap.put("inquiryCnt", adminMapper.mainInquiryCnt(map));
		return resultMap;
	}

	@Override
	public List<Inquiry> adminMainInquiry(HashMap<String, Object> map) {
		return adminMapper.mainInquiryList(map);
	}
	@Override
	public List<Review> adminMainReview(HashMap<String, Object> map) {
		return adminMapper.mainReviewList(map);
	}

	@Override
	public List<Statistics> mainChart(HashMap<String, Object> map) {
		return adminMapper.mainChart(map);
	}

	@Override
	public List<Statistics> csatChart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.mainChartCsat(map);
	}

	
	//중고 주문리스트 조회
	@Override
	public List<Used> selectUsedDeliveryList(HashMap<String, Object> map) {
		return adminMapper.selectUsedDeliveryList(map);
	}
	//중고주문리스트 검색
	@Override
	public List<Used> selectUsedSearch(HashMap<String, Object> map) {
		return adminMapper.selectUsedSearch(map);
	}

	@Override
	public int editUsedDelivery(HashMap<String, Object> map) {
		return adminMapper.updateUsedDelivery(map);
	}

}