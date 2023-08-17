<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1_ch" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1 on"><a class="my_a1">나의 쇼핑</a></li>
				<li class="my_li1"><a class="my_a1">나의 리뷰</a></li>
				<li class="my_li1"><a href="mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<div id="container">
			<div class="order_list_menu">
				<a class="aBox" @click="fnOrderList(1)">
					<div class="textBox">
						<div>결제완료</div>
						<div>{{deliverySit.order}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnOrderList(2)">
						<div>배송준비</div>
						<div>{{deliverySit.ready}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnOrderList(3)">
						<div>배송중</div>
						<div>{{deliverySit.shipping}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnOrderList(4)">
						<div>배송완료</div>
						<div>{{deliverySit.completed}}</div>
					</div>
				</a>
			</div>
			<div class="order_list">
				<div class="optionListBox">
					<div v-for="item in optionList">
						<div class="optionBox">{{item.name}}<i class="fa-solid fa-circle-xmark" style="color: #a782c3;"><span> </span></i></div>
						
					</div>
				</div>
				<div>
				    <div v-for="item in orderList" class="orderBox">
					    <img alt="" :src="item.imgPath+'/'+item.imgName" class="imgBox">
					    <div class="productName">
					    	<div class="manufacturer">{{item.manufacturer}}</div>
					    	<div class="name" @click="fnReviewMove(item.productNo)">{{item.productName}}</div>
					    </div>
					    <div class="optionName">
					    	<div>{{item.optionName}}</div>
					    	<div class="productPrice">{{item.productPrice}}<span class="span1"> | </span><span class="span2">{{item.cnt}}개</span></div>
					    </div>
					    <div class="buttonBox">
					    	<button @click="fnReOrder(item)" class="btn1">재구매</button>
					    	<button @click="fnReviewMove(item.productNo)" class="btn2">리뷰작성</button>
					    </div>
				    </div>
				</div>
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
		userNo : '${sessionNo}',
		orderList : [],
		deliverySit : {
			order : 0,
			ready : 0,
			shipping : 0,
			completed : 0
		},
		optionList : [],
	},// data
	methods : {
		fnGetOrderList(){
			var self = this;
			var nparmap = {userNo : self.userNo};
            $.ajax({
                url : "searchOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	for(let i = 0; i < self.orderList.length; i++){
                		switch(self.orderList[i].deliverySit){
                			case '1':  self.deliverySit.order++; break;
                			case '2':  self.deliverySit.ready++; break;
                			case '3':  self.deliverySit.shipping++; break;
                			case '4':  self.deliverySit.completed++; break;
                			default : break;
                		}
                		self.orderList[i].productPrice = self.orderList[i].productPrice * ((100-self.orderList[i].discount)/100) + self.orderList[i].optionPrice;
                		self.orderList[i].productPrice = Math.floor( self.orderList[i].productPrice / 100) * 100
                	}
                	console.log(self.orderList);
                	console.log(self.orderList[0].productPrice);
                }
            });
		},
		fnReOrder(item){
			$.pageChange("/order/main.do", {product : [{productNo : item.productNo, optionNo : item.optionNo, quantity : item.cnt}]} );
		},
		fnReviewMove(productNo){
			$.pageChange("/product/view.do", {no : productNo} );
		},
		fnOrderList(deliverySit, index){
			var self = this;
			var deliverySitName ='';
			switch(deliverySit){
				case 1:  deliverySitName = '결제완료'; break;
				case 2:  deliverySitName = '배송준비'; break;
				case 3:  deliverySitName = '배송중'; break;
				case 4:  deliverySitName = '배송완료'; break;
				default : break;
			}
			self.optionList[0] = {};
			self.optionList.splice(0,1,{name : deliverySitName});
			console.log(self.optionList);
			var nparmap = {userNo : self.userNo, deliverySit};
            $.ajax({
                url : "searchOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
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