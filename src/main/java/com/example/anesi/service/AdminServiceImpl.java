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
import com.example.anesi.model.User;
import com.example.anesi.model.UserOrder;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
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
		return adminMapper.updateDelivery(map);
	}

	@Override
	public List<UserOrder> searchSearchList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectSearchList(map);
	}

	@Override
	public List<Inquiry> searchAdminInquiriesList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.selectAdminInquiryList(map);
	}

	@Override
	public int editAdminInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return adminMapper.updateAdminInquiry(map);
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

}