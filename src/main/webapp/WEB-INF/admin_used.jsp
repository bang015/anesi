<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<link href="../css/product_edit.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>중고 관리</title>
<style>
.used{
	background: white;
	color: #5E503F;
	border-radius: 10px 0px 0px 10px;
}
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle cursorPointer" @click="fnReload">중고상품 관리</div>
			<div class="containerCheckList">
				<div class="checkList cursorPointer">
					<div class="iconBack"><i class="fa-solid fa-border-all fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>전체</div>
						<div><span class="numText">{{usedList.length}}</span>건</div> 
					</div>
				</div>
				<div class="checkList cursorPointer" @click="">
					<div class="iconBack"><i class="fa-solid fa-circle-up fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>등록신청</div>
						<div><span class="numText"></span>건</div> 
					</div>
				</div>
				<div class="checkList cursorPointer" @click="">
					<div class="iconBack"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>판매중</div>
						<div><span class="numText"></span>건</div> 
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
		usedList : [],
		usedCnt : 0,
		usedW : 0,
		usedY : 0,
	},// data
	methods : {
		fnGetUsedList(){
			var nparmap = {};
			$.ajax({
                url : "/admin/searchUsedList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.usedList = data.list;
                	console.log(self.usedList);
                	self.usedCnt = self.usedList.length;
                	self.usedList.map()
                	
                } 
			})
		},
		fnReload(){
			location.reload();
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetUsedList();
	}// created
});
</script>