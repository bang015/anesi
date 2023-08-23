<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="UTF-8">
<title>중고장터🛠</title>
</head>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 10px auto;
	width: 1278px;
	padding : 10px 0px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div>
			<div>중고 판매</div>
			<div>중고 판매 리스트</div>
		</div>
		<hr>
		<div>
			<div>중고 매입</div>
			<div>
				<div>매입 사례</div>
			</div>
			<div><button @click="fnPurchase">매입 문의 게시판</button></div>
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
		fnPurchase:function(){
			location.href="/used/purchase.do";
		}
	}, // methods
	created : function() {
		
	}// created
});
</script>