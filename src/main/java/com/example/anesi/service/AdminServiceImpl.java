package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.anesi.mapper.AdminMapper;
import com.example.anesi.model.Product;
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
		return adminMapper.selectDeliveryList(map);
	}
	
	
	
}
