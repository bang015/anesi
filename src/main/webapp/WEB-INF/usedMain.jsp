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
	margin-top : 130px;
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
	margin: 50px 0;
}
.part{
	margin : 60px 0;
}
.text1DIV{
	margin: 0 0 40px 0;
}
.text1{
	font-size : 17px;
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
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div class="part">
			<div class="title"><h1>중고 판매</h1></div>
			<div class="usedProduct" v-for="item in list2">
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
		<hr>
		<div class="part">
			<div class="title"><h1>중고 매입</h1>
			<div class="text1DIV"><span class="text1">🏡 상담부터 수거까지, 편안하고 편리한 아네시의 중고 장터 🚛</span></div>
			</div>
			<div> 
			</div>
			<div class="back1">
				<div class="flow-container1">
					<div class="flow-text">
						<div v-for="(item, index) in list">
							<div class="flow-wrap"><img class="purchaseImg" v-if="item.pImgPath !='' || item.pImgPath !=undefined" :src="item.pImgPath+'/'+item.pImgName" style="border-radius:5px;"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="text2"><a class="gogo" href="purchaseEx.do">매입 사례 보러 가기 🏃‍♂️💨💨💨</a></div>
			</div>
			<div class="part">
			<div>
				<div class="title"><h2>중고 매입 문의 게시판</h2></div>
			<table>
				<tr>
					<th>No.</th>
					<th style="width: 400px;">물품</th>
					<th>답변여부</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<tr v-for="(item, index) in inquireList" class="tr2">
					<td>{{item.usedPNo}}</td>
					<td><a @click="fnUsedView(item.usedPNo)">{{item.usedPName}}</a></td>
					<td v-if="item.purchase=='W'">대기</td>
					<td v-else-if="item.purchase=='Y'" style="color:#A782C3;">완료</td>
					<td v-else-if="item.purchase=='N'" style="color:#A782C3;">완료</td>
					<td>{{item.userName}}</td>
					<td>{{formatDate(item.usedPCdatetime)}}</td>
				</tr>
			</table>
		</div>
			</div>
			<div class="btnDIV"><button class="btn1" @click="fnPurchase">매입 문의 게시판 바로가기</button></div>
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
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
				url : "/used/purchaseYList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
		},
		fnGetList2 : function(){
			var self = this;
			var startNum = ((self.selectPage-1) * 8);
			var lastNum = 8;
			var param = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/used/purchaseList2.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list2 = data.list2;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 8);
					console.log(self.list2);
                }
            }); 
		},
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 8);
			var lastNum = 8;
			var param = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/used/purchaseList2.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list2 = data.list2;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 8);
                }
            }); 
		},
		fnGetInquireList : function(){
			var self = this;
			var param = {startNum : 0, lastNum : 5};
			$.ajax({
				url : "/used/purchaseList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.inquireList = data.list;
                }
            }); 
		},
		formatDate: function (dateString) {
            var date = new Date(dateString);
            var options = { year: 'numeric', month: 'numeric', day: 'numeric' };
            var formattedDate = date.toLocaleDateString(undefined, options);

            // 마지막 점 제거
            formattedDate = formattedDate.replace(/\.$/, '');

            return formattedDate;
        },
        fnUsedView : function(usedPNo){
        	var self = this;
    		var param = {usedPNo : usedPNo};
    		$.ajax({
    			url : "/used/inquireView1.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
	                if(self.sessionStatus=='A'){
						$.pageChange("/used/inquireView.do", {usedPNo : usedPNo});
	                }else if(self.sessionNo!=data.list.userNo){
	              		alert("본인 또는 관리자만 조회 가능합니다.");
	    	        	return;
	              	}else if(self.sessionStatus=='U' && self.sessionNo==data.list.userNo){
	              		$.pageChange("/used/inquireView.do", {usedPNo : usedPNo});
	              	}		           
               	}
         	}); 
		},
		fnUsedProductView(item){
			$.pageChange("/used/view.do",{usedPNo : item});
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnGetInquireList();
		self.fnGetList2();
	}// created
});
</script>