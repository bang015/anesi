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
<link href="../css/admin_delivery.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle">배송 관리</div>
			<div class="containerCheckList">
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-truck-ramp-box fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>배송대기</div>
						<div><span class="numText"></span>건</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-truck fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>배송중</div>
						<div><span class="numText"></span>건</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-circle-check fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>배송완료</div>
						<div><span class="numText"></span>건</div> 
					</div>
				</div>
			</div>
			<div>
				
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		orderList : [],
		wait : 0,
		shipping : 0,
		complete : 0,
	},// data
	methods : {
		fnGetOrderList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/orderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	for(){
                		
                	}
                	console.log(data.list);
                	
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetOrderList();
	}// created
});
</script>