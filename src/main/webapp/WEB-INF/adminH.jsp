<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>관리자센터 헤더</title>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="adminH">
		<header class="admin_header">
		  <h1>관리자센터</h1>
		  	<nav>
		  		<a href="/admin/main.do">홈으로</a>
				<a href="../login.do" v-if="sessionNo == ''">로그인</a>
				<a href="../logout.do" v-if="sessionNo != ''">로그아웃</a>
				<a>도움말</a>
				<a href="../main.do">아네시 홈페이지</a>
			</nav>
		</header>
	</div>	
	
		
   	<div class="flex-container1">
		<div class="side_menu">
				<div onclick="location.href='add.do'" class="add">상품등록</div>
				<div onclick="location.href='product_edit.do'" class="product_edit">상품조회/수정</div>
				<div>판매통계(X)</div>
				<div onclick="location.href='review.do'" class="review2">리뷰관리</div>
				<div onclick="location.href='inquiry.do'" class="inquiry2">문의관리</div>
				<div onclick="location.href='delivery.do'" class="delivery2">배송관리</div>
				<div onclick="location.href='user.do'" class="user">고객관리</div>
				<div>혜택관리(X)</div>
				<div>알림관리(X)</div>
		</div>
</body>
</html>
<script>
var adminH = new Vue({
	el : '#adminH',
	data : {
		sessionNo : '${sessionNo}',
		sessionStatus : '${sessionStatus}'
	},// data
	created : function() {
		var self = this;
		console.log(self.sessionStatus);
		if(self.sessionStatus != 'A'){
			location.href="/main.do";
		}
	}// created
});
</script>