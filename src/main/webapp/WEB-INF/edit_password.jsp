<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>비밀번호변경🔒</title>
</head>
<style>
#app{
	margin-top : 160px;
}
#container{
	margin : 30px auto;
	width: 490px;
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
    position: relative;
    text-align: center;
    cursor: pointer;
    color : #A782C3;
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
	border: 1px solid #d1d1d1;
    border-radius: 5px;
    padding: 30px 40px;
    box-shadow: 0px 2px 7px -3px #ddd;
    height : 575px;
}
#title {
	font-size:22px;
	margin-bottom : 44px;
	margin-top : 20px;
	font-weight:bold;
}
.put{
    border-radius: 4px;	
    border: 1px solid #ccc;
    width: 380px;
    height: 30px;
    padding: 10px;
}
.btn{
    border: none;
    color: white;
    background-color: #A782C3;
    border-radius: 7px;
    padding: 0px 9px;
    width: 400px;
    height: 50px;
    font-size: 20px;
    margin: 10px 0px;
	transition: background 0.3s;
	cursor: pointer;
}
.btn:hover{
	background-color: #7c6191;
}
.select{
	border-radius: 4px;
    border: 1px solid #ccc;
    width: 130px;
    height: 50px;
    padding: 8px;
}
.part{
	margin : 30px 0px;
}
.red{
	color : #ff9797;
}
h2{
	font-weight : 100;
	margin : 10px 0px;
}
img:hover{
	cursor: pointer;
}
.edit_title{
	font-size:18px;
	margin : 10px 0px;
}
.clause1{
	color : #A782C3;
}
.span1{
	color : #A782C3;
	font-size: 12px;
}
.title{
	margin : 35px 0px 20px 0px;
	font-size : 15px;
}
.btn{
	margin : 30px 0px 0px 0px;
}
.btndiv{
	margin-top : 20px;
}
</style>
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
		<li class="my_li2"><a href="/mypage/push_setting.do" class="my_a2">알림 설정</a></li>
		<li class="my_li2"><a href="/mypage/edit_password.do" class="my_a2_ch" style="color : #A782C3;">비밀번호 변경</a></li>
	</ul>
<hr class="hrr">
	<div id="container">
		<div class="edit">
			<div id="title">비밀번호 변경</div>
			<div class="title">기존 비밀번호</div>
			<div><input class="put" type="password" v-model="pwd" ref="pwdInput" @click="fnPwdCheck" @keyup="fnPwdCheck"></div>
			<div><span class="red">{{pwdMs}}</span></div>
			<div class="title">새 비밀번호</div>
			<div><input class="put" type="password" v-model="pw1" ref="pw1Input" @click="fnPwd1Check" @keyup="fnPwd1Check"></div>
			<div><span class="red">{{pw1Ms}}</span></div>
			<div class="title">새 비밀번호 확인</div>
			<div><input class="put" type="password" v-model="pw2" ref="pw2Input" @click="fnPwd2Check" @keyup="fnPwd2Check"></div>
			<div><span class="red">{{pw2Ms}}</span></div>
			<div class="btndiv"><button class="btn" @click="fnPwdChange">비밀번호 변경</button></div>
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
		pwd : "",
		pw1: "",
		pw2: "",
		pwdMs : "",
		pw1Ms : "",
		pw2Ms : "",
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
                }
            });
		},
		fnPwdChange : function(){
			var self = this;
			if(self.pwd != self.info.userPwd){
				alert("기존 비밀번호가 일치하지 않습니다.");
				self.$nextTick(function() {
		            self.$refs.pwdInput.focus();
		        });
				return;
			}
			if(self.pw1 == ""){
				alert("비밀번호를 입력하세요.");
				self.$nextTick(function() {
		            self.$refs.pw1Input.focus();
		        });
				return;
			}
			if(self.pw1 != self.pw2){
				alert("새 비밀번호가 일치하지 않습니다.");
				self.$nextTick(function() {
		            self.$refs.pw2Input.focus();
		        });
				return;
			}
		 	var nparmap = {pwd : self.pw1, no : self.sessionNo};
            $.ajax({
                url : "/mypage/edit_password.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("비밀번호 수정이 완료되었습니다.");
                	location.reload();
                }
            });
		},
		// 기존 비밀번호 메세지
		fnPwdCheck : function(){
			var self = this;
			if(self.pwd == ""){
				self.pwdMs = "기존 비밀번호를 입력하세요.";
			}else{
				self.pwdMs = "";
			}
		},
		// 새 비밀번호 메세지
		fnPwd1Check : function(){
			var self = this;
			if(self.pw1 == ""){
				self.pw1Ms = "새 비밀번호를 입력하세요.";
			}else{
				self.pw1Ms = "";
			}
		},
		// 새 비밀번호 확인 메세지
		fnPwd2Check : function(){
			var self = this;
			if(self.pw1 == ""){
				self.pw2Ms = "새 비밀번호 확인을 입력하세요.";
			}else if(self.pw1!=self.pw2){
				self.pw2Ms = "비밀번호가 일치하지 않습니다.";
			}else{
				self.pw2Ms = "";
			}
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInfo();
	}// created
});
</script>