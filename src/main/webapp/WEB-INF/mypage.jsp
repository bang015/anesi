<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>마이페이지😏</title>
<style>
.my_menu1 {
	list-style : none;
	display : flex;
	justify-content: center;
	padding: 0px 0px 0px 0px;
}
.my_li1, .my_li2 {
	margin: 0px 45px 0px 45px;
    font-size: 17px;
}
.my_li2 {
	font-size: 15px;
}
.my_a {
	text-decoration: none;
	position: relative; /* 상대 위치 설정 */
}
.my_a:before { /* 가상 요소를 이용하여 언더라인 만들기 */
	text-decoration: none;
	content: "";
	position: absolute;
	bottom: -18px; 
	left: 0;
	width: 100%;
	height: 4px;
	background-color: #A782C3;
	visibility: hidden; 
	opacity: 0; 
	transition: opacity 0.3s, visibility 0.3s;
	
}
.my_a:hover:before { 
	visibility: visible;
	text-decoration: none;
	opacity: 1;
}
.hrr {
	margin : 4px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
fieldset {
	border : 1px solid gray;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div>
	<ul class="my_menu1">
		<li class="my_li1"><a class="my_a">프로필</a></li>
		<li class="my_li1"><a class="my_a">나의 쇼핑</a></li>
		<li class="my_li1"><a class="my_a">나의 리뷰</a></li>
		<li class="my_li1"><a class="my_a">설정</a></li>
	</ul>
</div>
<hr class="hrr">
	<ul class="my_menu1">
		<li class="my_li2"><a class="my_a">모두 보기</a></li>
		<li class="my_li2"><a class="my_a">나의 문의</a></li>
		<li class="my_li2"><a class="my_a">나의 게시글</a></li>
		<li class="my_li2"><a class="my_a">스크랩북</a></li>
	</ul>
<hr class="hrr">
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>

</script>
