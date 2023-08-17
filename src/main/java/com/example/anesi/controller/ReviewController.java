package com.example.anesi.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.anesi.model.Order;
import com.example.anesi.model.Product;
import com.example.anesi.service.ReviewService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	// 상품 별점 검색
		  @RequestMapping(value = "/csatSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String avg(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       Product csat = reviewService.searchCsatAvg(map);

		       resultMap.put("csat", csat);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String review(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		       int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		       map.put("startNum", startNum);
		       map.put("lastNum", lastNum);
		       resultMap=reviewService.searchReview(map);
		       return new Gson().toJson(resultMap);
		   }
		// 리뷰
		  @RequestMapping(value = "/reviewCntSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewCnt(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       resultMap = reviewService.searchReviewCnt(map);
		       return new Gson().toJson(resultMap);
		   }
		// 상품 구매 확인(리뷰)
		  @RequestMapping(value = "/reviewUserSearch.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		   @ResponseBody
		   public String reviewUser(Model model,  @RequestParam HashMap<String, Object> map) throws Exception {
		       HashMap<String, Object> resultMap = new HashMap<String, Object>();
		       List<Order> user = reviewService.searchReviewUser(map);
		       resultMap.put("user", user);			   
		       return new Gson().toJson(resultMap);
		   }
		  // 리뷰 등록
		  @RequestMapping(value = "/reviewAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				resultMap = reviewService.addReview(map);
				return new Gson().toJson(resultMap);
			}
		// 리뷰 이미지 등록
		  @RequestMapping("/reviewFileUpload.dox")
			public String result(@RequestParam("file1") MultipartFile multi,@RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response, Model model) {
			    String url = null;
			    String path = "c:\\img";
			    
			    try {
			        // 업로드된 파일의 정보 추출
			        String uploadpath = path;
			        String originFilename = multi.getOriginalFilename();
			        String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			        long size = multi.getSize();
			        String saveFileName = genSaveFileName(extName);
			        
			        // 디버깅 정보 출력
			        System.out.println("uploadpath : " + uploadpath);
			        System.out.println("originFilename : " + originFilename);
			        System.out.println("extensionName : " + extName);
			        System.out.println("size : " + size);
			        System.out.println("saveFileName : " + saveFileName);
			        
			        // 현재 작업 디렉토리 정보 출력
			        String path2 = System.getProperty("user.dir");
			        System.out.println("Working Directory = " + path2 + "\\src\\webapp\\css\\image\\review");
			        
			        if (!multi.isEmpty()) {
			            // 파일 저장 경로 설정 및 업로드된 파일 저장
			            File file = new File(path2 + "\\src\\main\\webapp\\css\\image\\review", saveFileName);
			            multi.transferTo(file);
			            
			             //업로드된 파일 정보를 HashMap에 저장
			            HashMap<String, Object> map = new HashMap<String, Object>();
			            map.put("rNo", idx);
			            map.put("imgOrgName", originFilename);
			            map.put("imgName", saveFileName);
			            map.put("imgPath", "../css/image/review");			         
			            map.put("imgSize", size);
			            
			            // 데이터베이스에 업로드된 파일 정보 삽입
			            reviewService.addReviewImg(map);
			            
			            // 모델에 파일 정보 추가
			            model.addAttribute("filename", multi.getOriginalFilename());
			            model.addAttribute("uploadPath", file.getAbsolutePath());
			            
			            // "list.do"로 리다이렉트
						/* return "redirect:main.do"; */
			        }
			    } catch (Exception e) {
			        System.out.println(e);
			    }
			    
			    // 오류 발생 시 "list.do"로 리다이렉트
			    return "redirect:main.do";
			}
		// 현재 시간을 기준으로 고유한 파일명 생성
			private String genSaveFileName(String extName) {
			    String fileName = "";
			    
			    Calendar calendar = Calendar.getInstance();
			    fileName += calendar.get(Calendar.YEAR);
			    fileName += calendar.get(Calendar.MONTH);
			    fileName += calendar.get(Calendar.DATE);
			    fileName += calendar.get(Calendar.HOUR);
			    fileName += calendar.get(Calendar.MINUTE);
			    fileName += calendar.get(Calendar.SECOND);
			    fileName += calendar.get(Calendar.MILLISECOND);
			    
			    String charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			    int randomStringLength = 2;
			    
			    Random random = new Random();
			    StringBuilder randomString = new StringBuilder();
			    for (int i = 0; i < randomStringLength; i++) {
			        int randomIndex = random.nextInt(charset.length());
			        randomString.append(charset.charAt(randomIndex));
			    }
			    fileName += randomString.toString();
			    
			    fileName += extName;
			    

			    
			    return fileName;
			}
}
