package com.example.anesi.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.anesi.service.ImageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ImgUpLoadController {
	
	@Autowired
	ImageService imageService;
	
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
