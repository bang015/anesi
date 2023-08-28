<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
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
	margin-top : 185px;
}
#container{
	margin : 10px auto;
	width: 1278px;
	padding : 10px 0px;
}
.purchaseImg{
	width: 300px;
    height: 300px;
    object-fit: cover;
}
.btn1{
	border: none;
    color: white;
    background-color: #A782C3;
    border-radius: 7px;
    padding: 0px 9px;
    margin: 10px 0px 40px 0px;
    transition: background 0.3s;
    cursor: pointer;
    width: 281px;
    height: 67px;
    font-size: 17px;
}
.btnDIV{
	text-align : center;
}
.flow-container1 {
    margin-top: 24px;
    clear: both;
}
table,td{
	border-bottom: 1px solid #cdcdcd;
	border-collapse: collapse;
}
table{
	width: 100%;
	text-align:center;
    margin: 30px auto;
}
th,td{
	padding : 12px;
	font-size: 16px;
}
td{
	text-align:center;
	font-size:15px;
}
th{
	border-bottom: 2px solid #c9b4d9;
}
.tr2:hover{
	background : #fbfbfb;
}
li{
	list-style : none;
}
.title{
    text-align: center;
    margin: -38px 0 -8px 0;
}
.part{
	margin : 60px 0;
}
.text1DIV{
	margin: 0 0 40px 0;
}
.text1{
	font-size : 15px;
}
.text2{
	text-align: right;
    margin: 10px;
}
.back1{
	background: #fcf6ff;
    height: 360px;
    padding: 70px 0;
}
.gogo{
	color : #757575 !important; 
	font-size : 18px;
}
.gogo:hover{
	color : #A782C3 !important; 
}
.pa{
clear: both;
}
.pagination {
        display: inline-flex;
        margin-top: 40px;
        margin-left: 490px;
        clear: both;
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
	.product-img img{
		width: 250px;
		height: 250px;
		border-radius: 8px;
	}
	.usedProduct{
		width: 250px;
	    margin: 34px;
	    float: left;
	}
	.product-name{
		font-size: 18px;
		font-weight: bold;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.product-grade{
		font-weight: bold;
		margin-bottom: 5px;
	}
	.product-grade span{
		font-size: 14px;
		font-weight: 500;
	}
	.product-price{
		font-size: 17px;
	}
	.defined{
		text-align: center;
		margin-top: 80px;
		font-size: 20px;
		font-weight: bold;
	}
	.selectBar{
		height: 30px;
		margin-left: 35px;
		border-radius: 5px;
		border: 1px solid #c5c5c5;
		padding-left: 5px;
	}
	.select1{
		position: relative;
	}
	.select-img{
		widows: 17px;
		height: 17px;
		position: absolute;
		left: 188px;
		top: 8px;
	}
.text1DIV{
	margin: 0 0 40px 0;
	text-align: center;
}
.used_menu{
	display : flex;
	justify-content: center;
	border-bottom: 1px solid gainsboro;
}
.used_menu_li {
	font-size: 17px;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid white;
    transition: background-color 0.3s;
    width: 145px;
    text-align: center;
    padding: 15px 0px 0 0;
}
.used_menu_li:hover {
    background-color: #f7f7f7; 
}
.used_menu_li_ch{
    font-size: 17px;
    width: 145px;
	text-align: center;
    padding: 15px 0px 15px 0;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid #A782C3;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
<div>
	<div class="used_menu">
		<div class="used_menu_li_ch" style="border-left: 1px solid #ededed;"><a href="../usedSell.do" style="color:#A782C3;">중고 판매</a></div>
		<div class="used_menu_li"><a href="/used/purchase.do" >중고 매입</a></div>
		<div class="used_menu_li"><a href="/used/purchaseEx.do">중고 매입 사례</a></div>
	</div>
</div>
	<div id="container">
		<div class="part">
			<div class="title"><h1>중고 판매</h1></div>
			<div class="text1DIV"><span class="text1">🤗 원하는 상품을 저렴한 가격으로 구매하기 🎁</span></div>
			<div class="select1">
				<input class="selectBar" v-model="select" @keyup.enter="fnGetList2" placeholder="검색어를 입력해주세요.">
				<img src="../css/image/community/m-glass.png" class="select-img">
			</div>
			<div class="usedProduct" v-for="item in list2" v-if="list2.length > 0">
				<div class="product-img">
					<a href="javascript:;" @click="fnUsedProductView(item.usedPNo)"><img :src="item.pImgPath+'/'+item.pImgName"></a>
				</div>
				<div class="product-name">
					{{item.usedPName}}
				</div>
				<div class="product-grade">
					{{item.grade}} <span>등급</span>
				</div>
				<div class="product-price">
					{{item.usedPSellPrice | formatPrice}} <span>원</span>
				</div>
			</div>
			<div class="defined" v-if="list2.length <= 0">
				등록된 물품이 없습니다.
			</div>
			<div class="pa">
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
		list : [],
		inquireList : [],
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		sessionStatus : "${sessionStatus}",
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		list2 : [],
		select : "",
	},// data
	filters: {
	    formatPrice(price) {
	      return price.toLocaleString('ko-KR');
	    },
	  },
	methods : {
		fnPurchase:function(){
			location.href="/used/purchase.do";
		},
		fnGetList2 : function(){
			var self = this;
			var startNum = ((self.selectPage-1) * 12);
			var lastNum = 12;
			var param = {startNum : startNum, lastNum : lastNum, select : self.select};
			$.ajax({
				url : "/used/purchaseList2.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list2 = data.list2;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 12);
					console.log(self.list2);
                }
            }); 
		},
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 12);
			var lastNum = 12;
			var param = {startNum : startNum, lastNum : lastNum, select : self.select};
			$.ajax({
				url : "/used/purchaseList2.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list2 = data.list2;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 12);
                }
            }); 
		},
		fnUsedProductView(item){
			$.pageChange("/used/view.do",{usedPNo : item});
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList2();
	}// created
});
</script>