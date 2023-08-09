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
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<link href="../css/nullCart.css" rel="stylesheet">
<link href="../css/mainCss.css" rel="stylesheet">
<body>
	
	
	<div id="app">
	
	<span> <img class="nullCart"
				src="../css/image/nullCart.png" /> </span>
	
	  <button class="nullCartBtn"> <span> <i class="fa-solid fa-grip-lines"></i>상품담으러가기</button>
		
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