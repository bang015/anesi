<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1_ch" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1 on"><a class="my_a1">나의 쇼핑</a></li>
				<li class="my_li1"><a class="my_a1">나의 리뷰</a></li>
				<li class="my_li1"><a href="mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<div id="container">
			<div class="order_list_menu">
				<a class="aBox">
					<div class="textBox">
						<div>결제완료</div>
						<div>0</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox">
						<div>배송준비</div>
						<div>0</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox">
						<div>배송중</div>
						<div>0</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox">
						<div>배송완료</div>
						<div>0</div>
					</div>
				</a>
			</div>
			<div class="order_list">
				<div>
				
				</div>
				<div>
					<div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
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