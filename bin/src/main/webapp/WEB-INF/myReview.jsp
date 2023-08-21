<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
	<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1_ch" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myShopping.do'">나의 쇼핑</a></li>
				<li class="my_li1 on"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">나의 리뷰</a></li>
				<li class="my_li1"><a href="../mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
			<div id="container">
			
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>	
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