package com.example.anesi.service;

import java.util.HashMap;
import java.util.List;

import com.example.anesi.model.Product;

public interface AdminService {
	
	List<Product> adminProductList(HashMap<String, Object> map);
}
