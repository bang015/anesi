<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta charset="UTF-8">
<title>Footer</title>
<style>



#f_img{
	width : 100px;
	height : 100px;
  	float : left;
}

#container_footer{
	font-size : 12px;
	height: 100px;
	padding : 30px 20px;
}

#anesi_info{
	margin : 0px 0px 5px;
	font-size : 14px;
	
}

#f_part1 {
	
    float : left;
    width :40%;
    padding-left : 20px;
}

#f_part2 {

  margin-top : 20px; 
}
#f_part3 {

   float : left;
    width :15%;
}
#f_part4 {
    float : left;
    width :20%;
}
#f_part5 {
    float : left;
    width :10%;

}
#f_part6 {
    width: 1300px;
    text-align: center;
    padding: 10px ;
}
.content_bold{
	font-weight : bold;
}

/*파트1의 content */
.pt1_content{
	font-weight : bold;
}
.pt_title{
	font-weight : bold;
	font-size : 13px;
	margin-bottom : 5px;
}
.pt2_content{
	margin-right:10px;

}


</style>
</head>
<!-- 주석 꼭 남겨주세요 넹 -->
<body>

<hr>
	<div id="container_footer">
	<!-- 로고 클릭시 main화면으로 전환 또는, 제일 상단으로-->
	<!-- 이미지를 포함 모든 링크는 href="javascript:;"-->
	
	<a href="javascript:;">
    <img id="f_img" src="../css/image/anesilogo.png" >
    </a>
    <div id="f_part1">
       <div class="pt_title"><p id="anesi_info">anesi 기본정보</p></div>
       <div class="내용">
           <div>
          	<span class="content_bold" >상호명</span>
         	<span>아네시(anesi)</span>
         	
          	<span class="content_bold" >대표자명</span>
         	<span>정선일</span>
           </div>
           <div>
          	<span class="content_bold" >사업장 주소</span>
         	<span>인천시 부평구 경원대로 1366,(부평동, 스테이션타워 7F)</span>
           </div>
         	
           <div>
          	<span class="content_bold" >대표 전화</span>
         	<span>1588-8282</span>
         	
          	<span class="content_bold" >사업자 등록번호</span>
         	<span>152-85-74445</span>
         	
          	<span class="content_bold" >통신판매업 신고번호</span>
         	<span>15-45-7822</span>
           </div>
           
           <div>
           	<span class="content_bold">개인정보보호책임자</span>
         	<span>최인경</span>
           </div>
           
       </div>
       
       
       <div id="f_part2">
     	<span class="pt2_content"><a href="javascript:;">회사소개</a></span>
     	<span class="pt2_content"><a href="javascript:;">이용약관</a></span>
     	<span class="pt2_content"><a href="javascript:;">개인정보처리방침</a></span>
     	<span class="pt2_content"><a href="javascript:;">이용안내</a></span>
   		</div>
   </div>
   
   
   
	   <div id="f_part3">
	       <div class="pt_title"> 고객센터주문정보</div>
	       <div class="내용">
	           <div>상담/주문전화 1588-2222
	           </div>
	           
	           <div>상담주문이메일
	           <span>test@test.com</span>
	           </div>
	           <div>CS운영시간
		           <div>Daily 10:00-18:00</div>
		           <div>Lunch 12:00-13:00</div>
		           <div>Sat&Sun&Holiday Day Off</div>
	           </div>
	       </div>
	   </div>
   
	   <div id="f_part4">
	       <div class="pt_title"> 결제정보</div>
	       <div class="내용">
	          
	           <div>무통장 계좌정보
	           <span>신한은행 110-409-609660</span>
	           </div>
	           <div>예금주 정선일</div>
	       </div>
	   </div>
	   
	   <div id="f_part5">
	       <div class="pt_title"> SNS</div>
	       <div class="내용">
	          
	           <div><a href="https://www.instagram.com/">instagram</a></div>
	           <div><a href="https://www.youtube.com/youtube">youtube</div>
	           <div><a href="https://ko-kr.facebook.com/">facebook</div>
	           <div><a href="https://www.kakaocorp.com/">kakao</div>
	           <div><a href="https://twitter.com/">twitter</div>
	           <div><a href="http://blog.naver.com/">blog</div>
	       </div>
	   </div>
	   
	  
	   
	   
	   
   </div>
    <div id="f_part6">
	    <span><a href="https://www.copyright.or.kr/">Copyright <i class="fa-regular fa-copyright"></i> 아네시. All Rights Reserved. Hosting by Anesi Corp.</a></span>
	      
	   </div>
</body>
</html>
