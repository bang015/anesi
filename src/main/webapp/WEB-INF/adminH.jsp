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
		  <a href="/admin/main.do"><h1>관리자센터</h1></a>
		  	<nav>
				<a href="../login.do" v-if="sessionNo == ''">로그인</a>
				<a href="../logout.do" v-if="sessionNo != ''"><i class="fa-solid fa-door-open"></i> 로그아웃</a>
				<a href="#" onClick="top.location='javascript:location.reload()'"><i class="fa-solid fa-rotate-right" ></i>새로고침</a>
				<a href="../main.do"><i class="fa-solid fa-house"></i> 아네시 홈페이지</a>
			</nav>
		</header>
	</div>	
	
		
   	<div class="flex-container1">
		<div class="side_menu">
				<div onclick="location.href='add.do'" class="add">상품등록</div>
				<div onclick="location.href='product_edit.do'" class="product_edit">상품조회/수정</div>
				<div onclick="location.href='used.do'" class="used">중고관리</div>
				<div onclick="location.href='statistics.do'" class="statistics">판매통계</div>
				<div onclick="location.href='delivery.do'" class="delivery2">배송관리</div>
				<div onclick="location.href='usedDelivery.do'" class="delivery3">중고배송관리</div>
				<div onclick="location.href='review.do'" class="review2">리뷰관리</div>
				<div onclick="location.href='inquiry.do'" class="inquiry2">문의관리</div>
				<div onclick="location.href='user.do'" class="user">고객관리</div>
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
		if(self.sessionStatus != 'A'){
			location.href="/main.do";
		}
	}// created
});
</script>