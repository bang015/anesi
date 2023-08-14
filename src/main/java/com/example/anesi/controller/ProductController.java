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

import com.example.anesi.model.Category;
import com.example.anesi.model.Product;
import com.example.anesi.model.Review;
import com.example.anesi.model.Scrapbook;
import com.example.anesi.service.ProductService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/add.do") 
	public String login(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/product_add";
		
	}
	@RequestMapping("/product/cart.do") 
	public String cart(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/cart";
		
	}
	//상품 상세 페이지
	@RequestMapping("/product/view.do") 
	public String view(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/product_view";
		
	}
	
	@RequestMapping(value = "/product/category.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String storeMain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Category> list = productService.searchCategoryList();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/category2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String category2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Category> list = productService.searchCategoryList2(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	  @RequestMapping(value = "/product/cartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String cartList(Model model) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Product> list = ProductService.selectCartProductList();
	       resultMap.put("list", list);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 상세 정보
	  @RequestMapping(value = "/productSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String product(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       Product product = productService.searchProductList(map);

	       resultMap.put("product", product);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 별점 검색
	  @RequestMapping(value = "/csatSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String avg(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       Product csat = productService.searchCsatAvg(map);

	       resultMap.put("csat", csat);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 옵션 검색
	  @RequestMapping(value = "/optionSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String option(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Product> option = productService.searchOption(map);

	       resultMap.put("option", option);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 썸네일 이미지
	  @RequestMapping(value = "/imgThumbnailSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String img1(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Scrapbook> img = productService.searchThumbnailImg(map);

	       resultMap.put("img", img);
	       return new Gson().toJson(resultMap);
	   }
	  // 상품 콘텐츠 이미지
	  @RequestMapping(value = "/imgSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String img(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Scrapbook> imgList = productService.searchProductImg(map);

	       resultMap.put("imgList", imgList);
	       return new Gson().toJson(resultMap);
	   }
	  //상품 검색창 검색
	  @RequestMapping(value = "/searchBarProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String searchBar(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
	       HashMap<String, Object> resultMap = new HashMap<String, Object>();
	       List<Product> list = productService.searchProduct(map);
	       resultMap.put("list", list);
	       return new Gson().toJson(resultMap);
	   }
	// 상품 콘텐츠 이미지
		  @RequestMapping(value = "/imgSearch2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String img2(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       List<Scrapbook> imgList2 = productService.searchcontentImg2(map);

		       resultMap.put("imgList2", imgList2);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String review(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       List<Review> reviewList = productService.searchReview(map);

		       resultMap.put("reviewList", reviewList);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewCntSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewCnt(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       resultMap = productService.searchReviewCnt(map);
		       return new Gson().toJson(resultMap);
		   }
		  
		  @RequestMapping(value = "/product/viewCartList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String userCartList(Model model, @RequestParam("userNo") int userNo) throws Exception {
			    HashMap<String, Object> map = new HashMap<String, Object>();
			    HashMap<String, Object> resultMap = new HashMap<String, Object>();
			    
			    map.put("userNo", userNo); // userNo를 int 형으로 받아서 HashMap에 담아 전달합니다.
			    List<Product> list = productService.selectCartList(map);

			    resultMap.put("list", list);
			    return new Gson().toJson(resultMap);

}
