<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
		<header class="admin_header">
		  <h1><a href="/admin/main.do">관리자센터</a></h1>
		  	<nav>
		  		<a href="/admin/main.do">홈으로</a>
				<a href="../login.do">로그인</a>
				<a href="../logout.do">로그아웃</a>
				<a>도움말</a>
				<a href="../main.do">아네시 홈페이지</a>
			</nav>
		</header>
		
	
		
   	<div class="flex-container1">
		<div class="side_menu">
				<div onclick="location.href='add.do'">상품등록</div>
				<div onclick="location.href='product_edit.do'">상품조회/수정</div>
				<div>판매통계</div>
				<div>리뷰관리</div>
				<div>문의관리</div>
				<div onclick="location.href='delivery.do'">배송관리</div>
				<div>고객관리</div>
				<div>혜택관리</div>
				<div>알림관리</div>
		</div>
</body>
</html>