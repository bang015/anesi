<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css">
<meta charset="EUC-KR">
<title>Footer</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 넹 -->
<body>
	<div id="app">
    <img id="f_img" src="img.png">
    
    <div id="f_part1">
       <div class="제목">전자금융거래 분쟁처리</div>
       <div class="내용">
           <div>전화 1588-XXXX</div>
           <div><a href="javascript:;">1:1 문의 바로가기</a></div>
       </div>
   </div>
   
   <div id="f_part1">
       <div class="제목">고객센터</div>
       <div class="내용">
           <div>강원도 춘천시 퇴계로 89 강원전문건설회관</div>
           <div>wjsghk 1588-XXXX</div>
           <div>결제도용신고 1588-XXXX</div>
           <div><a href="javascript:;">1:1문의 바로가기</a></div>
       </div>
   </div>
   
   <div id="f_part1">
       <div class="제목"> 네이버㈜</div>
       <div class="내용">
           <div>사업자등록번호 220-81-62517</div>
           <div>통신판매업신고번호 2006-인천-0692호</div>
           <div>대표이사 최인경</div>
           <span class="rborder">전화 1533-XXXX</span>
           <span>이메일 XXX@naver.com</span>
       </div>
   </div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>