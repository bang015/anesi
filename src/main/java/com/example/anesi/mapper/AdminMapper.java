package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Product;

@Mapper
public interface AdminMapper {
	//상품 리스트
	List<Product> adminProductList(HashMap<String, Object> map);
	//상품&옵션
	List<Product> adminProductInfo(HashMap<String, Object> map);
	//상품 업데이트
	int adminUpdateProduct(HashMap<String, Object> map);
	//옵션 업데이트
	int adminOptionUpdate(HashMap<String, Object> map);
	//옵션 추가
	int adminInsertOption(HashMap<String, Object> map);
	//상품 상태 업데이트
	int adminProductSituation(HashMap<String, Object> map);
	//옵션 삭제
	int adminDeleteOption(HashMap<String, Object> map);
}
