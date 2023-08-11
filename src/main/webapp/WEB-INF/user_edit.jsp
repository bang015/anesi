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
<title>회원정보수정🧐</title>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 30px auto;
	width: 1000px;
}
.my_menu1 {
	list-style : none;
	display : flex;
	justify-content: center;
	padding: 0px 0px 0px 0px;
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
    box-shadow: 0px 2px 11px -3px #dddbdb;
    height:1100px;
}
#title {
	font-size:22px;
	margin-bottom : 40px;
}
.edit_left{
	line-height: 50px;
    font-size: 16px;
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
	margin : 20px 0px;
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
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
<div class="top_menu">
	<ul class="my_menu1">
		<li class="my_li1"><a href="/mypage.do" class="my_a1">프로필</a></li>
		<li class="my_li1"><a class="my_a1">나의 쇼핑</a></li>
		<li class="my_li1"><a class="my_a1">나의 리뷰</a></li>
		<li class="my_li1"><a class="my_a1_ch">설정 </a></li>
	</ul>
</div>
<hr class="hrr">
	<ul class="my_menu1">
		<li class="my_li2"><a class="my_a2_ch">회원정보수정</a></li>
		<li class="my_li2"><a class="my_a2">알림 설정</a></li>
		<li class="my_li2"><a class="my_a2">비밀번호 변경</a></li>
	</ul>
<hr class="hrr">
<div id="container">
	<div class="edit">
		<div id="title"><h3>회원정보수정</h3></div>
		<hr>
			<div class="part">
				<div class="edit_title">이메일<span class="clause1"> *</span></div>
					<div>
						<div><input readonly class="put" ref="emailInput" type="text" v-model="user.userEmail1" placeholder="이메일"></div>
						<div>이메일을 변경하려면 운영자에게 이메일을 보내주세요.</div>
					</div>
			</div>
			<div class="part">
				<div class="edit_title">이름<span class="clause1"> *</span></div>
				<div><input readonly class="put" ref="nameInput" type="text" v-model="user.userName" placeholder="이름" @click="fnNameCheck" @keyup="fnNameCheck"></div>
				<div>이름을 변경하려면 운영자에게 이메일을 보내주세요.</div>
			</div>
			<div class="part">
				<div class="edit_title">닉네임<span class="clause1"> *</span></div>
				<div><input class="put" ref="nickInput" type="text" v-model="user.nick" placeholder="닉네임 특수문자 제외 사용 가능" @click="fnNickOverlap" @keyup="fnNickOverlap"></div>
			</div>
			<div class="part">
				<div class="edit_title">휴대폰 번호<span class="clause1"> *</span></div>
				<div><input class="put" ref="phoneInput" type="text" v-model="user.phone" placeholder="휴대폰 번호 '-'제외 숫자만 입력해주세요." @click="fnPhoneOverlap" @keyup="fnPhoneOverlap"></div>
			<div><span class="red">{{phoneMs}}</span></div>
			</div>
			<div class="part">
			<div class="edit_title">생년월일</div>
				<div>
					<select v-model="user.bYear" class="select">
						<option>연</option>
						<% for(int i=2009; i>=1950; i--){%>
							<option value="<%= i %>"><%= i %></option>
						<%}%>
					</select> 
					<select v-model="user.bMonth" class="select">
						<option>월</option>
						<% for(int i=1; i<=12; i++){
							if(i<10){%>
								<option value="0<%= i %>"><%= i %></option>
							<%}else{%> 
							<option value="<%= i %>"><%= i %></option>
							<%}%> 
						<%}%>
					</select> 
					<select v-model="user.bDay" class="select">
						<option>일</option>
						<% for(int i=1; i<=31; i++){
							if(i<10){%>
								<option value="0<%= i %>"><%= i %></option>
							<%}else{%> 
							<option value="<%= i %>"><%= i %></option>
							<%}%> 
						<%}%>
					</select>
				</div>
			</div>
			<div class="part">
				<div class="edit_title">성별</div> 
					<div>
						선택 안 함 <input type="radio" v-model="user.gender" value="N" name="gender">　　　
						여성 <input type="radio" v-model="user.gender" value="F" name="gender">　　　
						남성 <input type="radio" v-model="user.gender" value="M" name="gender">
					</div>
			<div class="part">
				<div class="edit_title">프로필 이미지</div>
				<div style="width:200px; height:200px; border:1px solid #eee; margin : 10px 0px">프로필사진</div>
			</div>				
	</div>
	<button class="btn" @click="fnEdit">회원정보수정</button>
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
		user : {
			email : "",
			userName : "",
			phone : "",
			nick : "",
			bYear : "연",
			bMonth : "월",
			bDay : "일",
			gender : "N",
			smsYn : "N"
		},
		list : [],
		clause : [],
		emailFlg : false,
		nickFlg : false,
		phoneFlg : false,
		message : "",
		emailMs : "",
		m14 : "",
		sms : "",
		cla : "",
		cla2 : "",
		pw1Ms : "",
		pw2Ms : "",
		nameMs : "",
		nickMs : "",
		phoneMs : "",
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		info : {}
	},// data
	methods : {
		fnGetInfo : function(){
			var self = this;
			var nparmap = {no : self.sessionNo};
			console.log(self.sessionNick);
			console.log(self.sessionNo);
			$.ajax({
                url : "mypage/user_info.dox.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                	console.log(data);
                	console.log(self.sessionNo);
                }
            });
		},
		// 회원가입 버튼
		fnEdit : function(){
			var self = this;
			if(self.user.userName == ""){
				alert("이름을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.nameInput.focus();
		        });
				return;
			}
			var regType3 = /^[가-힣a-zA-Z\s]*$/;
			if(!regType3.test(self.user.userName)){
				alert("이름은 영문, 한글만 가능합니다.");
				self.$nextTick(function() {
		            self.$refs.nameInput.focus();
		        });
				return;
			}
			if(self.user.nick == ""){
				alert("닉네임을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.nickInput.focus();
		        });
				return;
			}
			if(!self.nickFlg){
				alert("중복된 닉네임입니다.");
				self.$nextTick(function() {
		            self.$refs.nickInput.focus();
		        });
				return;
			}
			var regType2 = /^[가-힣ㄱ-ㅎa-zA-Z0-9\s]*$/;
			if(!regType2.test(self.user.nick)){
				alert("닉네임에 특수문자를 제외하여 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.nickInput.focus();
		        });
				return;
			}
			if(self.user.phone == "" || self.user.phone.length < 11){
				alert("휴대폰 번호를 정확히 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.phoneInput.focus();
		        });
				return;
			}
			var regType1 = /^[0-9]+$/;
			if(!regType1.test(self.user.phone)){
				alert("휴대폰 번호 숫자만 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.phoneInput.focus();
		        });
				return;
			}
		 	var nparmap = self.user;
		 	self.user.birth = self.user.bYear + self.user.bMonth + self.user.bDay;
		 	if(self.user.bYear=="연" || self.user.bMonth=="월" || self.user.bDay=="일"){
		 		self.user.birth = "";
		 	}
		 	console.log(self.clause);
            $.ajax({
                url : "user_edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("회원정보수정이 완료되었습니다.");
                }
            });
		},
		// 닉네임 중복체크 및 메세지
		fnNickOverlap : function(){
			var self = this;
			var nparmap = {nick : self.user.nick};
            $.ajax({
                url : "nickCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	var regType2 = /^[가-힣ㄱ-ㅎa-zA-Z0-9\s]*$/;
        			if(self.user.nick == ""){
        				self.nickMs = "닉네임을 입력하세요.";
        				self.nickFlg = false;
        			}else if(!regType2.test(self.user.nick)){
        				self.nickMs = "닉네임은 특수문자 제외하고 사용가능합니다."
        				self.nickFlg = false;
        			}else if(data.cnt > 0){
                		self.nickMs = "중복된 닉네임입니다.";
                		self.nickFlg = false;
                	} else {
                		self.nickMs = "사용 가능한 닉네임입니다.";
                		self.nickFlg = true;
                	}
                }
            });
		},
		// 휴대폰 중복체크 및 메세지
		fnPhoneOverlap : function(){
			var self = this;
			var nparmap = {phone : self.user.phone};
            $.ajax({
                url : "phoneCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
        			var regType1 = /^[0-9]+$/;
        			if(self.user.phone == ""){
        				self.phoneMs = "휴대폰 번호를 입력하세요.";
        				self.phoneFlg = false;
        			}else if(!regType1.test(self.user.phone)){
        				self.phoneMs = "숫자만 입력해주세요.";
        				self.phoneFlg = false;
        			}else if(self.user.phone.length < 10 || self.user.phone.length>12){
        				self.phoneMs = "휴대폰 번호를 정확히 입력해주세요.(10~12자리)";
        				self.phoneFlg = false;
        			}else if(data.cnt > 0){
                		self.phoneMs = "이미 가입된 번호입니다.";
                		self.phoneFlg = false;
                	} else {
                		self.phoneMs = "사용 가능한 번호입니다.";
                		self.phoneFlg = true;
                	}
                }
            });
		},
		// 비밀번호 메세지
		fnPwdCheck : function(){
			var self = this;
			if(self.user.pw1 == ""){
				self.pw1Ms = "비밀번호를 입력하세요.";
			}else{
				self.pw1Ms = "";
			}
		},
		// 비밀번호 확인 메세지
		fnPwd2Check : function(){
			var self = this;
			if(self.user.pw1 == ""){
				self.pw2Ms = "비밀번호 확인을 입력하세요.";
			}else{
				self.pw2Ms = "";
			}
		},
		// 이름 메세지
		fnNameCheck : function(){
			var self = this;
			var regType3 = /^[가-힣a-zA-Z\s]*$/;
			if(self.user.userName == ""){
				self.nameMs = "이름을 입력하세요.";
			}else if(!regType3.test(self.user.userName)){
				self.nameMs = "이름은 영문, 한글만 가능합니다.";
			}else{
				self.nameMs = "";
			}
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInfo();
	}// created
});
</script>