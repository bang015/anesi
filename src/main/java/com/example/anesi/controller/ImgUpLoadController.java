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

import com.example.anesi.model.Image;
import com.example.anesi.model.UserOrder;
import com.example.anesi.service.ImageService;
import com.example.anesi.service.UserService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ImgUpLoadController {
	
	@Autowired
	ImageService imageService;
	
	@Autowired
	UserService userService;
	
	//프로필 사진
	@RequestMapping(value = "/profileImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String profileImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Image img = imageService.searchProfileImg(map);
		resultMap.put("img", img);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/fileUpload2.dox")
	public String result2(@RequestParam("file1") MultipartFile multi, @RequestParam("sessionNo") int userNo, HttpServletRequest request, HttpServletResponse response, Model model) {
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
	        System.out.println("Working Directory = " + path2 + "\\src\\webapp\\css\\image\\profile");
	        
	        if (!multi.isEmpty()) {
	            // 파일 저장 경로 설정 및 업로드된 파일 저장
	            File file = new File(path2 + "\\src\\main\\webapp\\css\\image\\profile", saveFileName);
	            multi.transferTo(file);
	            
	             //업로드된 파일 정보를 HashMap에 저장
	            HashMap<String, Object> map = new HashMap<String, Object>();
	            map.put("userNo", userNo);
	            map.put("imgOrgName", originFilename);
	            map.put("imgName", saveFileName);
	            map.put("imgPath", "../css/image/profile");
	            map.put("imgSize", size);
	            
	            // 데이터베이스에 업로드된 파일 정보 삽입
	            imageService.editProfileImg(map);
	            
	            // 모델에 파일 정보 추가
	            model.addAttribute("filename", multi.getOriginalFilename());
	            model.addAttribute("uploadPath", file.getAbsolutePath());
	            
	            // "list.do"로 리다이렉트
	            return "redirect:main.do";
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    // 오류 발생 시 "list.do"로 리다이렉트
	    return "redirect:main.do";
	}
	//리뷰 이미지 수정
	@RequestMapping("/fileEdit.dox")
	public String result2(@RequestParam("file1") MultipartFile multi, @RequestParam("rImgName") String rImgName, @RequestParam("rNo") int rNo, HttpServletRequest request, HttpServletResponse response, Model model) {
		//삭제
        String path2 = System.getProperty("user.dir");
        
	    String filePath = "\\src\\webapp\\css\\image\\review\\"+rImgName;
	    System.out.println(filePath);
	    File file = new File(path2 + "\\src\\main\\webapp\\css\\image\\review", rImgName);
	    if (file.exists()) { // 파일이 존재하는지 확인
            if (file.delete()) { // 파일 삭제 시도
                System.out.println("파일이 삭제되었습니다.");
            } else {
                System.out.println("파일 삭제 실패");
            }
        } else {
            System.out.println("파일이 존재하지 않습니다.");
        }
	    
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
	        System.out.println("Working Directory = " + path2 + "\\src\\webapp\\css\\image\\review");
	        
	        if (!multi.isEmpty()) {
	            // 파일 저장 경로 설정 및 업로드된 파일 저장
	            File file1 = new File(path2 + "\\src\\main\\webapp\\css\\image\\review", saveFileName);
	            multi.transferTo(file1);
	            
	             //업로드된 파일 정보를 HashMap에 저장
	            HashMap<String, Object> map = new HashMap<String, Object>();
	            map.put("rNo", rNo);
	            map.put("imgOrgName", originFilename);
	            map.put("imgName", saveFileName);
	            map.put("imgPath", "../css/image/review");
	            map.put("imgSize", size);
	            
	            // 데이터베이스에 업로드된 파일 정보 삽입
	            userService.editReviewImage(map);
	            
	            // 모델에 파일 정보 추가
	            model.addAttribute("filename", multi.getOriginalFilename());
	            model.addAttribute("uploadPath", file1.getAbsolutePath());
	            
	            // "list.do"로 리다이렉트
	            return "redirect:main.do";
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    
	    // 오류 발생 시 "list.do"로 리다이렉트
	    return "redirect:main.do";
	}
	
	@RequestMapping("/fileUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("productNo") int productNo, @RequestParam("thumbnailYn") String thumbnailYn, HttpServletRequest request, HttpServletResponse response, Model model) {
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
	        System.out.println("Working Directory = " + path2 + "\\src\\webapp\\css\\image\\product");
	        
	        if (!multi.isEmpty()) {
	            // 파일 저장 경로 설정 및 업로드된 파일 저장
	            File file = new File(path2 + "\\src\\main\\webapp\\css\\image\\product", saveFileName);
	            multi.transferTo(file);
	            
	             //업로드된 파일 정보를 HashMap에 저장
	            HashMap<String, Object> map = new HashMap<String, Object>();
	            map.put("productNo", productNo);
	            map.put("imgOrgName", originFilename);
	            map.put("imgName", saveFileName);
	            map.put("imgPath", "../css/image/product");
	            map.put("thumbnailYn", thumbnailYn);
	            map.put("imgSize", size);
	            
	            // 데이터베이스에 업로드된 파일 정보 삽입
	            imageService.addPorductImage(map);
	            
	            // 모델에 파일 정보 추가
	            model.addAttribute("filename", multi.getOriginalFilename());
	            model.addAttribute("uploadPath", file.getAbsolutePath());
	            
	            // "list.do"로 리다이렉트
	            return "redirect:main.do";
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
