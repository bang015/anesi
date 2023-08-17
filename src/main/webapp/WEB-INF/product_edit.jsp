<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../../css/mainCss.css" rel="stylesheet">
<link href="../../css/product_edit.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="app">
		<div id="container">
			<div class="containerTitle">상품 조회/수정</div>
			<div class="containerCheckList">
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-border-all fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>전체</div>
						<div><span class="numText">{{}}</span>건</div> 
					</div>
				</div>
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
		fnGetProduct(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/admin/productList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
					console.log(data.list);
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetProduct();
	}// created
});
</script>