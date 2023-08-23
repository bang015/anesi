<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>중고 매입 문의</title>
</head>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 10px auto;
	width: 800px;
	padding : 10px 0px;
}
.used_menu{
	display : flex;
	justify-content: center;
	border-bottom: 1px solid gainsboro;
}
.used_menu_li {
    font-size: 17px;
    padding: 15px 35px;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid white;
    transition: background-color 0.3s;
}
.used_menu_li:hover {
    background-color: #f7f7f7; 
}
.used_menu_li_ch{
    font-size: 17px;
    padding: 15px 35px;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid #A782C3;
}
.edit{
    padding: 30px 50px;
	position: relative;
}
table,td{
	border-bottom: 1px solid #dddddd;
	border-collapse: collapse;
}
table{
	width: 100%;
}
th,td{
	padding: 17px 13px;
	font-size: 16px;
}
td{
	font-size:15px;
}
.title{
	width: 150px;
	border-right: 1px solid #dddddd;
}
.tr2:hover{
	background : #fbfbfb;
}

.bottom{
    font-size: 20px;
    margin: 14px 0 15px 11px;
}
.put{
	border-radius: 4px;
    border: 1px solid #e5e5e5;
    width: 380px;
    height: 24px;
    padding: 10px;
}
.select{
	border-radius: 4px;
	border: 1px solid #e5e5e5;
	width: 402px;
	height: 46px;
	padding: 8px;
}
.btnDIV{
	text-align:center;
}
.btn1{
	border: none;
    color: white;
    background-color: #A782C3;
    border-radius: 7px;
    padding: 14px 45px;
    margin: 30px 0px;
    transition: background 0.3s;
    cursor: pointer;
    font-size: 16px;
}
h1{
	margin: 20px 0px 20px 12px;
}
.text1{
	font-size: 13px;
    color: #979797;
}
.text2{
	color: #5f5f5f;
    margin: 0 0px 20px 0;
}
.content{
	padding: 30px 13px;
    font-size: 15px;
}
.hr1{
	border:none;
	border-bottom:1px solid #A782C3;
}
.hr2{
	border:none;
	border-bottom:2px solid #A782C3;
}
.btnDIV{
	text-align:center;
}
.btn1{
	border: none;
    color: white;
    background-color: #A782C3;
    border-radius: 7px;
    padding: 14px 45px;
    margin: 30px 0px;
    transition: background 0.3s;
    cursor: pointer;
    font-size: 16px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
<div class="used_menu">
		<div class="used_menu_li" style="border-left: 1px solid #ededed;"><a href="">중고 판매</a></div>
		<div class="used_menu_li_ch"><a href="purchase.do" style="color:#A782C3;">중고 매입</a></div>
		<div class="used_menu_li"><a href="">중고 매입사례</a></div>
</div>
	<div id="container">
		<div class="edit">
			<div>
			<div><h1>중고 매입 문의</h1></div>
				<table>
					<tr style="border-top:2px solid #A782C3;">
						<td class="title">문의 번호</td>
						<td>No.{{info.usedPNo}}</td>
					</tr>
					<tr>
						<td class="title">이름</td>
						<td>{{info.userName}}</td>
					</tr>
					<tr>
						<td class="title">전화번호</td>
						<td>{{info.userPhone}}</td>
					</tr>
					<tr>
						<td class="title">제품명</td>
						<td>{{info.usedPName}}</td>
					</tr>
					<tr>
						<td class="title">구매가격</td>
						<td>{{info.usedPPrice.toLocaleString()}}원</td>
					</tr>
					<tr>
						<td class="title">희망판매가격</td>
						<td>{{info.usedPSellPrice.toLocaleString()}}원</td>
					</tr>
					<tr>
						<td class="title">제조국</td>
						<td>{{info.manufacturer}}</td>
					</tr>
					<tr>
						<td class="title">사용기간</td>
						<td v-if="info.usedtime==0">1년 미만</td>
						<td v-if="info.usedtime>=1">{{info.usedtime}}년</td>
						<td v-if="info.usedtime>=6">5년 이상</td>
					</tr>
					<tr style="border-bottom:2px solid #A782C3;">
						<td class="title">제품상태</td>
						<td v-if="info.grade=='A'">상</td>
						<td v-if="info.grade=='B'">중</td>
						<td v-if="info.grade=='C'">하</td>
					</tr>
				</table>
				<div class="bottom">상세내용</div>
				<hr class="hr1">
				<div v-html="info.content" class="content"></div>
				<hr class="hr2">
				<div class="bottom">첨부사진</div>
				<hr class="hr1">
				<div class="content">
					<img src="../css/image/profile.png">
					<img src="../css/image/profile.png">
				</div>
				<hr class="hr2">
			</div>
			<div class="btnDIV">
				<button class="btn1" v-if="sessionStatus=='A'">답변하기</button>
				<button class="btn1" @click="fnGoList()">목록으로</button>
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
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		sessionStatus : "${sessionStatus}",
		usedPNo : "${map.usedPNo}",
		info : {}
	},// data
	methods : {
		fnGetInfo : function(){
			var self = this;
			var param = {usedPNo : self.usedPNo};
			$.ajax({
				url : "/used/inquireView.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.info = data.info;
                	console.log(self.info);
                }
            }); 
		},
		fnGoList(){
			location.href="purchase.do"
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInfo();
	}// created
});
</script>