package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Product;

@Mapper
public interface AdminMapper {

	List<Product> adminProductList(HashMap<String, Object> map);
}
