package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Cart;
import com.example.anesi.model.Category;
import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
import com.example.anesi.model.Scrapbook;



@Mapper
public interface ProductMapper {
	// Store서비스에 상품기본정보 가져오는 매퍼
	List<Product> selectProduct(HashMap<String, Object> map);
	

	// 카테고리 검색
	List<Category> selectCategoryList();
	List<Product> selectCartProductList(HashMap<String, Object> map);
	
	// 카테고리 소분류 검색
	List<Category> selectCategoryList2(HashMap<String, Object> map);
	
	// 상품 상세 정보 검색
	Product selectProductList(HashMap<String, Object> map);
	// 상품 옵션 검색
	List<Product> selectOption(HashMap<String, Object> map);
	// 상품 썸네일 이미지
	List<Scrapbook> selectThumbnailImg(HashMap<String, Object> map);
	// 상품 컨텐츠 이미지
	List<Scrapbook>selectcontentImg(HashMap<String, Object> map);
	//상품 검색창 검색
	List<Product> selectProductListByKeyword(HashMap<String, Object> map);
	// 상품 상세 이미지
	List<Scrapbook> selectcontentImg2(HashMap<String, Object> map);
	//회원 상품 장바구니에 추가
	int insertCartUser (HashMap<String, Object> map);
	
	//회원 상품 장바구니 수량증가
	int updateCartCnt (HashMap<String, Object> map);
	
	//회원 상품 스크랩북 추가
	int insertScrapbook (HashMap<String, Object> map);
	//회원 상품 스크랩북 삭제
	int deleteScrapbook (HashMap<String, Object> map);
	//상품 장바구니
	List<Product>selectCartList(HashMap<String, Object> map);
 
	//회원 상품 스크랩북 리스트 체크
	List<Scrapbook> selectScrapbookList (HashMap<String, Object> map);
	 
	//회원 상품 카트 리스트 체크
	List<Cart> userCartList (HashMap<String, Object> map);
	
	//상품 등록
	int insertPorduct(HashMap<String, Object> map);
	
	//상품 등록후 검색
	Product insertSelectPorduct(HashMap<String, Object> map);
	
	//옵션 등록
	int insertOption(HashMap<String, Object> map);
	//회원 장바구니 삭제
	int deleteCartlist (HashMap<String, Object> map);
	//회원 장바구니 모두삭제
	int deleteAllCartItems (HashMap<String, Object> map);
	
	//비회원 장바구니 추가
	int nonUserCartInsert(HashMap<String, Object> map);
	//상품 검색창 검색
		List<Product> searchProduct (HashMap<String, Object> map);
		List<Product> searchBarProductList (HashMap<String, Object> map);
		//최근본 상품 출력
		List<Product> selectLatest (HashMap<String, Object> map);
}