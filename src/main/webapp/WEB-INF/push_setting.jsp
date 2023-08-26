<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link rel="stylesheet" href="../css/checkbox.css">
<meta charset="UTF-8">
<title>알림설정🔔</title>
</head>
<style>
#app{
	margin-top : 160px;
}
#container{
	margin : 30px auto;
	width: 700px;
}
.my_menu1 {
	list-style : none;
	display : flex;
	justify-content: center;
	padding: 5px 0px 0px 0px;
}
.my_li1 {
	margin: 0px 30px 0px 30px;
    font-size: 17px;
}
.my_li2 {
	margin: 0px 45px 0px 45px;
    font-size: 17px;
}
.my_li2 {
	font-size: 14px;
}
.my_a1_ch {
	color : #A782C3;
}
.my_a2 {
	text-decoration: none;
	position: relative;
	text-align: center; 
	cursor: pointer;
}
.my_a2:before { 
	text-decoration: none;
	content: "";
	position: absolute;
	bottom: -15px; 
	left: 53%; 
	transform: translateX(-50%);
	width: 130%;
	height: 4px;
	background-color: #A782C3;
	visibility: hidden; 
	opacity: 0; 
	transition: opacity 0.3s, visibility 0.3s;
}
.my_a2:hover:before { 
	visibility: visible;
	text-decoration: none;
	opacity: 1;
}
.my_a2_ch {
	color : #A782C3;
    position: relative;
    text-align: center;
    cursor: pointer;
}
.my_a2_ch:before {
    text-decoration: none;
	content: "";
	position: absolute;
	bottom: -15px; 
	left: 53%; 
	transform: translateX(-50%);
	width: 130%;
	height: 4px;
	background-color: #A782C3;
	visibility: visible; 
	opacity: 1; 
}
.hrr {
	margin : 4px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.edit{
	border : 1px solid #d1d1d1;
    border-radius : 5px;
    padding : 30px 40px;
    height : 50px;
    width : 700px;
    margin : 10px auto;
    position: relative;
}
.title {
	font-size : 24px;
	margin : 45px 0px 20px 0px;
	font-weight : bold;
}
.part{
	margin : 30px 0px;
}
.text1{
	margin-bottom : 30px;
}
.text2{
	text-decoration : underline;
}
.text2:hover{
	text-decoration-color : #A782C3;
}
.text3{
	font-size: 16px;
	position: absolute;
  	top: 40%;
}
.switch1{
	position: absolute;
	top : 40%;
	right: 10%;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div class="top_menu">
		<ul class="my_menu1">
			<li class="my_li1"><a href="/mypage.do" class="my_a1">프로필</a></li>
			<li class="my_li1"><a class="my_a1" href="http://localhost:8080/mypage/myShopping.do">나의 쇼핑</a></li>
			<li class="my_li1"><a class="my_a1" href="myReview.do">나의 리뷰</a></li>
			<li class="my_li1"><a class="my_a1_ch">설정 </a></li>
		</ul>
	</div>
	<hr class="hrr">
		<ul class="my_menu1">
			<li class="my_li2"><a href="/mypage/user_edit.do" class="my_a2">회원정보수정</a></li>
			<li class="my_li2"><a href="/mypage/push_setting.do" class="my_a2_ch" style="color : #A782C3;">알림 설정</a></li>
			<li class="my_li2"><a href="/mypage/edit_password.do" class="my_a2">비밀번호 변경</a></li>
		</ul>	
	<hr class="hrr">
	<div id="container">
		<div class="title">이벤트 및 혜택 알림</div>
		<div class="text1"><span>특가, 쿠폰 등 이벤트 정보를 빠르게 알려드릴게요.😊</span></div>
		<div class="edit">
		<span class="text3">이메일, 문자 메시지 알림 수신</span>
			<span class="switch1">
			<label class="el-switch">
  			<input type="checkbox" v-model="info.smsYn" value="Y" @click="fnSmsYn">
 	 		<span class="el-switch-style"></span>
 	 		</label>
 	 		</span>
		</div>
		<div>알림 수신 동의와 함께 <span class="text2"><a href="/privacy.do">개인정보 마케팅 활용</a></span>에 동의하시게 됩니다.</div>
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
		info : {}
	},// data
	methods : {
		fnGetInfo : function(){
			var self = this;
			var nparmap = {no : self.sessionNo};
			$.ajax({
                url : "user_info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                	if(self.info.smsYn == 'N'){
                		self.info.smsYn = ''
                	}
                }
            });
		},
		fnSmsYn : function(){
			var self = this;
			if(self.info.smsYn){
				self.info.smsYn = '';
			} else{
				self.info.smsYn = 'Y';
			}
			var nparmap = {no : self.sessionNo, smsYn : self.info.smsYn == '' ? 'N' : 'Y'};
			$.ajax({
                url : "/mypage/smsYn_edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
        				
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
    	self.fnGetInfo();
	}// created
});
</script>