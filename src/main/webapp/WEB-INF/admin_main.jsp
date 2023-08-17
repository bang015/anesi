<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

.admin_header {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 10px 20px;
  background-color: #e0d4c6;
}

.admin_header span {
  margin-left: 10px;
}
.side_menu{
  display : inline-block;
  width : 200px;
  height: 856px;
  background-color: #cec9c3;
  
}
.side_menu div{
 font-size : 15px;
 margin : 10px 45px ;
}
.side_menu div:hover{
 font-weight:bold;
}

.delivery{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.delivery span{
  font-size : 20px;
}
.change{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.change span{
  font-size : 20px;
}
.review{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.review span{
  font-size : 20px;
}
.review span span{
  font-size : 14px;
}
.customer{
  width : 400px;
  height: 200px;
  border-radius : 8px;
  border : 1px solid #424242;
  padding : 7px;
}
.customer span{
  font-size : 20px;
}
.customer span span{
  font-size : 14px;
}

.flex-container1,
.flex-container2{
   display: flex;
   
}

</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="app">
		<header class="admin_header">
		  <h1>관리자센터</h1>
			<span>로그인</span>
			<span>로그아웃</span>
			<span>도움말</span>
			<span>아네시 홈페이지</span>
		</header>
	
		
    <div class="flex-container1">
		<div class="side_menu">
			<div>상품관리</div>
			<div>판매통계</div>
			<div>리뷰관리</div>
			<div>문의관리</div>
			<div>배송관리</div>
			<div>고객관리</div>
			<div>혜택관리</div>
			<div>알림관리</div>
		</div>
		
		
		<div class="delivery">
			<span>주문/배송</span>
			<hr>
		</div>
		<div class="change">
			<span>취소요청/반품/교환</span>
			<hr>
		</div>
		
		<div class="review">
			<span>리뷰<span>최근 1주일기준</span></span>
			<hr>
		</div>
		<div class="customer">
			<span>고객현황<span>최근 1주일기준</span></span>
			<hr>
		</div>
		
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