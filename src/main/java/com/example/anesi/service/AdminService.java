package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Product;
import com.example.anesi.model.UserOrder;

public interface AdminService {
	
	List<Product> adminProductList(HashMap<String, Object> map);
	List<Product> adminProductInfo(HashMap<String, Object> map);
	int adminEditProduct(HashMap<String, Object> map);
	int adminEditOption(HashMap<String, Object> map);
	int adminAddOption(HashMap<String, Object> map);
	int adminEditProductSituation(HashMap<String, Object> map);
	int adminRemoveOption(HashMap<String, Object> map);
	List<UserOrder> selectDeliveryList(HashMap<String, Object> map);
}
