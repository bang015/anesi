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
	request.setAttribute("map", map);
	return "/used_inquire";
	}
	
	//중고 매입 사례
	@RequestMapping("/used/purchaseEx.do") 
	public String purchaseEx(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
	return "/used_purchaseEx";
	}
	
	//중고 매입 문의 뷰
	@RequestMapping("/used/inquireView.do") 
	public String inquireView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	request.setAttribute("map", map);
	return "/used_inquireView";
	}
	
	//중고 판매 뷰
	@RequestMapping("/used/view.do") 
	public String usedView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	request.setAttribute("map", map);
	return "/used_productView";
	}
	
	//중고 매입 사례 뷰
	@RequestMapping("/used/purchaseExView.do") 
	public String purchaseExView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	request.setAttribute("map", map);
	return "/used_purchaseEx_view";
	}
	
	//중고 매입 사례 등록
	@RequestMapping("/used/purchaseExAdd.do") 
	public String purchaseExAdd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
	request.setAttribute("map", map);
	return "/used_purchaseEx_add";
	}
	
	//문의 리스트
	@RequestMapping(value = "/used/purchaseList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String purchaseList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = usedService.purchaseList(map);
		return new Gson().toJson(resultMap);
	}
	
	//문의 리스트
	@RequestMapping(value = "/used/myPurchaseList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myPurchaseList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.myPurchaseList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//문의 뷰 사진포함
	@RequestMapping(value = "/used/inquireView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquireView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.usedInquireView(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//문의 뷰
	@RequestMapping(value = "/used/inquireView1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquireView1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		UsedPurchase list = usedService.usedInquireView1(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	// 중고 매입 사례 등록 인포
	@RequestMapping(value = "/used/usedSellAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String usedSellAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		UsedPurchase list = usedService.usedSellAdd(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	// 중고 매입 사례 등록
	@RequestMapping(value = "/used/addPurchaseEx.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addPurchaseEx(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		usedService.addPurchaseEx(map);
		return new Gson().toJson(resultMap);
	}
	
	//문의 뷰 사진
	@RequestMapping(value = "/used/inquireViewImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquireViewImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.usedInquireViewImg(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//문의 답변 뷰
	@RequestMapping(value = "/used/answerView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String answerView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		UsedPurchase aInfo = usedService.answerSelect(map);
		resultMap.put("aInfo", aInfo);
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
	
	// 문의 답변 등록
	@RequestMapping(value = "/used/answer.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String usedAnswer(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object>	resultMap = new HashMap<String, Object>(); 
		usedService.answerInsert(map);
		usedService.answerUpdate(map);
		return new Gson().toJson(resultMap); 
	}
	
	// 문의 삭제
	@RequestMapping(value = "/used/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String usedQDelete(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object>	resultMap = new HashMap<String, Object>(); 
		usedService.usedInquireImgDelete(map);
		usedService.usedInquireAnsDelete(map);
		usedService.usedInquireDelete(map);
		return new Gson().toJson(resultMap); 
	}
	
	// 문의 답변 수정
	@RequestMapping(value = "/used/answerEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String usedAnswerEdit(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object>	resultMap = new HashMap<String, Object>();
		usedService.answerUpdate(map);
		usedService.answerEdit(map);
		return new Gson().toJson(resultMap); 
	}
	
	// 문의 답변 삭제
	@RequestMapping(value = "/used/answerDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String usedAnswerDelete(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object>	resultMap = new HashMap<String, Object>();
		usedService.usedInquireAnsDelete(map);
		usedService.answerUpdate(map);
		return new Gson().toJson(resultMap); 
	}
	
	// 문의 수정
	@RequestMapping(value = "/used/purchaseUpdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String purchaseUpdate(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object>	resultMap = new HashMap<String, Object>();
		usedService.updatePurchaseInquire(map);
		return new Gson().toJson(resultMap); 
	}
	
	// 매입 리스트
	@RequestMapping(value = "/used/purchaseYList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String purchaseYList(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.purchaseYList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap); 
	}
	
	// 판매 미등록 리스트
	@RequestMapping(value = "/used/usedSellYList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String usedSellYList(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.usedSellYList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap); 
	}
	
	// 판매 미등록 리스트
	@RequestMapping(value = "/used/usedSellNList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String usedSellNList(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.usedSellNList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap); 
	}
	
	//판매 물품 리스트
	@RequestMapping(value = "/used/purchaseList2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String purchaseList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = usedService.purchaseYList2(map);
		return new Gson().toJson(resultMap);
	}
	
	// 판매 물품 상세 정보
	@RequestMapping(value = "/usedProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody 
	public String purchaseView(Model model, @RequestParam	HashMap<String, Object> map) throws Exception { 
		HashMap<String, Object>	resultMap = new HashMap<String, Object>();
		List<UsedPurchase> list = usedService.purchaseView(map);
		resultMap.put("list", list);
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