package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Product;

public interface AdminService {
	
	List<Product> adminProductList(HashMap<String, Object> map);
	List<Product> adminProductInfo(HashMap<String, Object> map);
	int adminEditProduct(HashMap<String, Object> map);
	int adminEditOption(HashMap<String, Object> map);
	int adminAddOption(HashMap<String, Object> map);
}
