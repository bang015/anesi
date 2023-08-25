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
<title>나의 쇼핑</title>
<style>
.pagination {
        display: inline-flex;
        margin-top: 40px;
        margin-left: 270px;
    }
    ul {
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	    padding: 4px 12px ;
	}
	.pagination li.active {
	    background-color : #A782C3;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	    
	}
	.pagination a{
		padding: 4px 12px ;
	}
	.order_list1{
		min-height: 100px;
		padding: 20px;
		display: flex;
		border-radius: 4px;
		box-shadow: 0 1px 3px 0 #dbdbdb;
		width: 80%;
		margin: 0px auto 0 auto;
	    flex-direction: column;
	}
	.usedtitle{
		font-size: 25px;
		font-weight: bold;
		color: #424242;
		text-align : initial;
		margin-top: 20px;
		margin-bottom: 10px;
		margin-left: 120px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1 on"><a class="my_a1" onclick="location.href='../mypage/myShopping.do'">나의 쇼핑</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">나의 리뷰</a></li>
				<li class="my_li1"><a href="../mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<div id="container">
			<div class="order_list_menu">
				<a class="aBox" @click="fnClickOption(1)">
					<div class="textBox">
						<div>결제완료</div>
						<div>{{deliverySit.order}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnClickOption(2)">
						<div>배송준비</div>
						<div>{{deliverySit.ready}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnClickOption(3)">
						<div>배송중</div>
						<div>{{deliverySit.shipping}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnClickOption(4)">
						<div>배송완료</div>
						<div>{{deliverySit.completed}}</div>
					</div>
				</a>
			</div>
			<div class="order_list">
				<div class="optionListBox">
					<div>
					    <div class="selectBox2" @mouseover="showOptions" @mouseleave="hideOptions" :class="{ active: optionsVisible }">
					      <button class="label">{{ selectedOption }}</button>
					      <ul class="optionList">
					        <li v-for="(option, index) in options" :key="index" class="optionItem" @click="handleSelect(option.value)">{{ option.text }}</li>
					      </ul>
					    </div>					
					</div>
					<div v-for="(item, index) in optionList">
						<div class="optionBox" @click="fnOptionDel(index)" v-if="item.name != undefined">{{item.name}} <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i></div>
					</div>
				</div>
				<div>
				    <div v-for="item in orderList" class="box5">
				    	<div class="deliverySitName">{{item.deliverySitName}}</div>
					   <div class="orderBox">
					   	 <img alt="" :src="item.imgPath+'/'+item.imgName" class="imgBox">
					    <div class="productName">
					    	<div class="manufacturer">{{item.manufacturer}}</div>
					    	<div class="name" @click="fnReviewMove(item.productNo)">{{item.productName}}</div>
					    </div>
					    <div class="optionName">
					    	<div>{{item.optionName}}</div>
					    	<div class="productPrice">{{numberWithCommas(item.productPrice)}}<span class="span1"> | </span><span class="span2">{{item.cnt}}개</span></div>
					    </div>
					    <div class="buttonBox">
					    	<button @click="fnReOrder(item)" class="btn1" v-if="item.deliverySit == 4">재구매</button>
					    	<button @click="fnReviewMove(item.productNo)" class="btn2" v-if="item.deliverySit == 4">리뷰작성</button>
					    </div>
					   </div>
				    </div>
				</div>
				<template v-if="pageCount > 1">
					<paginate
						:page-count="pageCount"
						:page-range="5"
						:margin-pages="2"
						:click-handler="fnSearch"
						:prev-text="'<'"
						:next-text="'>'"
						:container-class="'pagination'"
						:page-class="'page-item'">
					</paginate>
				</template>
				
			</div>
			<!-- 중고 상품 -->
			<div class="usedtitle">
				<span>중고 상품</span>
			</div>
			<div class="order_list1">
				<div class="optionListBox">
					<div>
					    <div class="selectBox2" @mouseover="showOptions" @mouseleave="hideOptions" :class="{ active: optionsVisible }">
					      <button class="label">{{ selectedOption }}</button>
					      <ul class="optionList">
					        <li v-for="(option, index) in options" :key="index" class="optionItem" @click="handleSelect(option.value)">{{ option.text }}</li>
					      </ul>
					    </div>					
					</div>
					<div v-for="(item, index) in optionList">
						<div class="optionBox" @click="fnOptionDel(index)" v-if="item.name != undefined">{{item.name}} <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i></div>
					</div>
				</div>
				<div>
				    <div v-for="item in orderList2" class="box5">
				    	<div class="deliverySitName">{{item.deliverySitName}}</div>
					   <div class="orderBox">
					   	 <img alt="" :src="item.pImgPath+'/'+item.pImgName" class="imgBox">
					    <div class="productName">
					    	<div class="manufacturer">아네시 중고장터</div>
					    	<div class="name">{{item.usedPName}}</div>
					    </div>
					    <div class="optionName">
					    	<div class="productPrice">{{item.orderPrice| formatPrice}}<span class="span1"> | </span><span class="span2">1개</span></div>
					    </div>
					   </div>
				    </div>
				</div>
				<template v-if="pageCount2 > 1">
					<paginate
						:page-count="pageCount2"
						:page-range="5"
						:margin-pages="2"
						:click-handler="fnSearch2"
						:prev-text="'<'"
						:next-text="'>'"
						:container-class="'pagination'"
						:page-class="'page-item'">
					</paginate>
				</template>
				
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
	el : '#app',
	data : {
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		selectPage2: 1,
		pageCount2: 1,
		cnt2 : 0,
		userNo : '${sessionNo}',
		orderList : [],
		orderList2 : [],
		deliverySit : {
			order : 0,
			ready : 0,
			shipping : 0,
			completed : 0
		},
		Delivery : [],
		usedDelivery : [],
		optionList : [{},{}],
		selectedOption: '기간',
        options: [
          { text: '1개월 전', value: '1' },
          { text: '3개월 전', value: '3' },
          { text: '6개월 전', value: '6' },
          { text: '1년 전', value: '12' },
          { text: '2년 전', value: '24' },
          { text: '3년 전', value: '36' },
        ],
        optionsVisible: false
	},// data
	filters: {
	    formatPrice(price) {
	      return price.toLocaleString('ko-KR');
	    },
	  },
	methods : {
		fnGetOrderList(){
			var self = this;
			var startNum = ((self.selectPage-1) * 3);
			var lastNum = 3;
			var nparmap = {userNo : self.userNo,startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "searchOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 3);
                	for(let i = 0; i < self.orderList.length; i++){
                		switch (self.orderList[i].deliverySit) {
                	    case '1':
                	        self.orderList[i].deliverySitName = '결제완료';
                	        break;
                	    case '2':
                	        self.orderList[i].deliverySitName = '배송준비';
                	        break;
                	    case '3':
                	        self.orderList[i].deliverySitName = '배송중';
                	        break;
                	    case '4':
                	        self.orderList[i].deliverySitName = '배송완료';
                	        break;
                	    default:
                	        break;
                		}
                		self.orderList[i].productPrice = self.orderList[i].productPrice * ((100-self.orderList[i].discount)/100) + self.orderList[i].optionPrice;
                		self.orderList[i].productPrice = Math.floor( self.orderList[i].productPrice / 100) * 100
                	}
                	console.log(self.orderList);
                }
            });
		},
		 fnSearch : function(pageNum){	
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 3);
				var lastNum = 3;
				if(self.optionList[0].deliverySit  == undefined){
					var nparmap = {userNo : self.userNo,startNum : startNum, lastNum : lastNum};
				}else{
					var month = isNaN(Number(self.optionList[1].value)) ? 1 : Number(self.optionList[1].value);
					var nparmap = {userNo : self.userNo, deliverySit : self.optionList[0].deliverySit, month,startNum : startNum, lastNum : lastNum};
				}
				
				$.ajax({
					url : "searchOrderList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
	                	self.orderList = data.list;
	                	self.cnt = data.cnt;
						self.pageCount = Math.ceil(self.cnt / 3);
	                	for(let i = 0; i < self.orderList.length; i++){
	                		switch (self.orderList[i].deliverySit) {
	                	    case '1':
	                	        self.orderList[i].deliverySitName = '결제완료';
	                	        break;
	                	    case '2':
	                	        self.orderList[i].deliverySitName = '배송준비';
	                	        break;
	                	    case '3':
	                	        self.orderList[i].deliverySitName = '배송중';
	                	        break;
	                	    case '4':
	                	        self.orderList[i].deliverySitName = '배송완료';
	                	        break;
	                	    default:
	                	        break;
	                		}
	                		self.orderList[i].productPrice = self.orderList[i].productPrice * ((100-self.orderList[i].discount)/100) + self.orderList[i].optionPrice;
	                		self.orderList[i].productPrice = Math.floor( self.orderList[i].productPrice / 100) * 100
	                	}
	                	console.log(self.orderList);
	                }
				});
			},
		fnGetUsedOrderList(){
			var self = this;
			var startNum = ((self.selectPage2-1) * 3);
			var lastNum = 3;
			var nparmap = {userNo : self.userNo,startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "searchUsedOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList2 = data.list2;
                	self.cnt2 = data.cnt2;
					self.pageCount2 = Math.ceil(self.cnt2 / 3);
                	for(let i = 0; i < self.orderList2.length; i++){
                		switch (self.orderList2[i].deliverySit) {
                	    case '1':
                	        self.orderList2[i].deliverySitName = '결제완료';
                	        break;
                	    case '2':
                	        self.orderList2[i].deliverySitName = '배송준비';
                	        break;
                	    case '3':
                	        self.orderList2[i].deliverySitName = '배송중';
                	        break;
                	    case '4':
                	        self.orderList2[i].deliverySitName = '배송완료';
                	        break;
                	    default:
                	        break;
                		}
                	}
                	console.log(self.orderList2);
                }
            });
		},
		 fnSearch2 : function(pageNum){	
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 3);
				var lastNum = 3;
				if(self.optionList[0].deliverySit  == undefined){
					var nparmap = {userNo : self.userNo,startNum : startNum, lastNum : lastNum};
				}else{
					var month = isNaN(Number(self.optionList[1].value)) ? 1 : Number(self.optionList[1].value);
					var nparmap = {userNo : self.userNo, deliverySit : self.optionList[0].deliverySit, month,startNum : startNum, lastNum : lastNum};
				}
				
				$.ajax({
					url : "searchUsedOrderList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
	                	self.orderList2 = data.list2;
	                	self.cnt2 = data.cnt2;
						self.pageCount2 = Math.ceil(self.cnt2 / 3);
	                	for(let i = 0; i < self.orderList2.length; i++){
	                		switch (self.orderList2[i].deliverySit) {
	                	    case '1':
	                	        self.orderList2[i].deliverySitName = '결제완료';
	                	        break;
	                	    case '2':
	                	        self.orderList2[i].deliverySitName = '배송준비';
	                	        break;
	                	    case '3':
	                	        self.orderList2[i].deliverySitName = '배송중';
	                	        break;
	                	    case '4':
	                	        self.orderList2[i].deliverySitName = '배송완료';
	                	        break;
	                	    default:
	                	        break;
	                		}
	                	}
	                }
				});
			},
			fnDelivery(){
				var self = this;
				var nparmap = {userNo : self.userNo};
				$.ajax({
					url : "searchOrderDelivery.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
	                	self.Delivery = data.Delivery;
	                	console.log(self.Delivery);
	                	for(let i = 0; i < self.Delivery.length; i++){
	                		switch (self.Delivery[i].deliverySit) {
	                	    case '1':
	                	        self.deliverySit.order++;
	                	        self.Delivery[i].deliverySitName = '결제완료';
	                	        break;
	                	    case '2':
	                	        self.deliverySit.ready++;
	                	        self.Delivery[i].deliverySitName = '배송준비';
	                	        break;
	                	    case '3':
	                	        self.deliverySit.shipping++;
	                	        self.Delivery[i].deliverySitName = '배송중';
	                	        break;
	                	    case '4':
	                	        self.deliverySit.completed++;
	                	        self.Delivery[i].deliverySitName = '배송완료';
	                	        break;
	                	    default:
	                	        break;
	                	}
	                	}
	                }
				});
			},
			fnUsedDelivery(){
				var self = this;
				var nparmap = {userNo : self.userNo};
				$.ajax({
					url : "searchUsedOrderDelivery.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
	                	self.usedDelivery = data.usedDelivery;
	                	console.log(self.Delivery);
	                	for(let i = 0; i < self.usedDelivery.length; i++){
	                		switch (self.usedDelivery[i].deliverySit) {
	                	    case '1':
	                	        self.deliverySit.order++;
	                	        break;
	                	    case '2':
	                	        self.deliverySit.ready++;
	                	        break;
	                	    case '3':
	                	        self.deliverySit.shipping++;
	                	        break;
	                	    case '4':
	                	        self.deliverySit.completed++;
	                	        break;
	                	    default:
	                	        break;
	                	}
	                	}
	                }
				});
			},
		fnReOrder(item){
			$.pageChange("/order/main.do", {product : [{productNo : item.productNo, optionNo : item.optionNo, quantity : item.cnt}]} );
		},
		fnReviewMove(productNo){
			$.pageChange("/product/view.do", {no : productNo} );
		},
		fnOrderList(){
			var self = this;
			var startNum = ((self.selectPage-1) * 3);
			var lastNum = 3;
			var month = isNaN(Number(self.optionList[1].value)) ? 1 : Number(self.optionList[1].value);
			var nparmap = {userNo : self.userNo, deliverySit : self.optionList[0].deliverySit, month,startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "searchOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 3);
                	for(let i = 0; i < self.orderList.length; i++){
                		switch (self.orderList[i].deliverySit) {
                	    case '1':
                	        self.orderList[i].deliverySitName = '결제완료';
                	        break;
                	    case '2':
                	        self.orderList[i].deliverySitName = '배송준비';
                	        break;
                	    case '3':
                	        self.orderList[i].deliverySitName = '배송중';
                	        break;
                	    case '4':
                	        self.orderList[i].deliverySitName = '배송완료';
                	        break;
                	    default:
                	        break;
                		}
                	}
                }
            });
		},
		fnUsedOrderList(){
			var self = this;
			var startNum = ((self.selectPage2-1) * 3);
			var lastNum = 3;
			var month = isNaN(Number(self.optionList[1].value)) ? 1 : Number(self.optionList[1].value);
			var nparmap = {userNo : self.userNo, deliverySit : self.optionList[0].deliverySit, month,startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "searchUsedOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList2 = data.list2;
                	self.cnt2 = data.cnt2;
					self.pageCount2 = Math.ceil(self.cnt2 / 3);
                	for(let i = 0; i < self.orderList2.length; i++){
                		switch (self.orderList2[i].deliverySit) {
                	    case '1':
                	        self.orderList2[i].deliverySitName = '결제완료';
                	        break;
                	    case '2':
                	        self.orderList2[i].deliverySitName = '배송준비';
                	        break;
                	    case '3':
                	        self.orderList2[i].deliverySitName = '배송중';
                	        break;
                	    case '4':
                	        self.orderList2[i].deliverySitName = '배송완료';
                	        break;
                	    default:
                	        break;
                		}
                	}
                }
            });
		},
		fnOptionDel(index){
			var self = this;
			if(index == 0){
				self.optionList[0]= ({name : undefined, deliverySit : undefined});
			} else {
				self.optionList[1]= ({name : undefined, value : undefined});
			}
			self.fnOrderList();
			self.fnUsedOrderList();
		},
        handleSelect(value) {
	          this.selectedOption = value ? this.options.find(option => option.value === value).text : '기간';
	          this.optionsVisible = false;
	          var month = '';
	          switch(value){
				case '1':  month = '1개월 전'; break;
				case '3':  month = '3개월 전'; break;
				case '6':  month = '6개월 전'; break;
				case '12':  month = '1년 전'; break;
				case '24':  month = '2년 전'; break;
				case '36':  month = '3년 전'; break;
				default : break;
			}
	          if(this.optionList.length == 2){
	        	  this.optionList[1] = ({name : month, value});
	          }
	          this.fnOrderList();
	          this.fnUsedOrderList();
        },
        showOptions() {
            this.optionsVisible = true;
        },
        hideOptions() {
           this.optionsVisible = false;
        },
        fnClickOption(deliverySit){
        	var deliverySitName ='';
			switch(deliverySit){
				case 1:  deliverySitName = '결제완료'; break;
				case 2:  deliverySitName = '배송준비'; break;
				case 3:  deliverySitName = '배송중'; break;
				case 4:  deliverySitName = '배송완료'; break;
				default : break;
			}
			this.optionList[0] = ({name : deliverySitName, deliverySit : deliverySit});
			this.fnOrderList();
			this.fnUsedOrderList();
        },
        numberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
	}, // methods
	created : function() {
		var self = this;
		if(self.userNo == ''){
			location.href="../login.do";
		}
		self.fnGetOrderList();
		self.fnDelivery();
		self.fnGetUsedOrderList();
		self.fnUsedDelivery();
	}// created
});
</script>