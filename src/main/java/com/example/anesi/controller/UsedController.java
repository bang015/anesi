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

import com.example.anesi.model.UsedPurchase;
import com.example.anesi.service.UsedService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsedController {
	@Autowired
	UsedService usedService;
	
	@Autowired 
	HttpSession session;
	
	//중고 메인
	@RequestMapping("/used/main.do") 
    public String used(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/usedMain";
    }
	
	//중고 매입 게시판
	@RequestMapping("/used/purchase.do") 
	public String purchase(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
	return "/used_purchase";
	}
	
	//중고 매입 문의
	@RequestMapping("/used/inquire.do") 
	public String inquire(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
	return "/used_inquire";
	}
	
	//중고 매입 문의 뷰
	@RequestMapping("/used/inquireView.do") 
	public String inquireView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	request.setAttribute("map", map);
	return "/used_inquireView";
	}
	
	//문의 리스트
	@RequestMapping(value = "/used/purchaseList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String purchaseList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.purchaseList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//문의 뷰
	@RequestMapping(value = "/used/inquireView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquireView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.usedInquireView(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//문의 등록
	@RequestMapping(value = "/used/inquire.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquire(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String no = usedService.insertUsedInquire(map).get("usedPNo").toString();
		resultMap.put("usedPNo", no);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/usedPurchaseImgUpload.dox")
    public String thumbfileUpload(@RequestParam("file1") MultipartFile multi, @RequestParam("usedPNo") int usedPNo, HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String path="c:\\img";
        try {
 
            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            String path2 = System.getProperty("user.dir");
            System.out.println("Working Directory = " + path2 + "\\src\\main\\webapp\\css\\image\\used");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\css\\image\\used", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("usedPNo", usedPNo);
	            map.put("pImgOrgName", originFilename);
	            map.put("pImgName", saveFileName);
	            map.put("pImgPath", "../css/image/used");
	            map.put("pImgSize", size);
                
                // insert 쿼리 실행
	            usedService.insertUsedInquireImg(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "";
    }
	
    // 현재 시간을 기준으로 파일 이름 생성
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