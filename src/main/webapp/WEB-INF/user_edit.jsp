<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>회원정보수정🧐</title>
<style>
#app{
	margin-top : 160px;
}
#container{
	margin : 30px auto;
	width: 1000px;
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
	color : #A782C3;
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
	color : #A782C3;
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
    height:1200px;
	position: relative;
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
.withdrawal{
    position: absolute;
    top: 8%;
    right: 5%;
}
.inputFile{
	position: absolute;
    left: -9999px;
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
		<li class="my_li1"><a class="my_a1">나의 리뷰</a></li>
		<li class="my_li1"><a class="my_a1_ch">설정 </a></li>
	</ul>
</div>
<hr class="hrr">
	<ul class="my_menu1">
		<li class="my_li2"><a href="/mypage/user_edit.do" class="my_a2_ch" style="color : #A782C3;">회원정보수정</a></li>
		<li class="my_li2"><a href="/mypage/push_setting.do" class="my_a2">알림 설정</a></li>
		<li class="my_li2"><a href="/mypage/edit_password.do" class="my_a2">비밀번호 변경</a></li>
	</ul>
<hr class="hrr">
<div id="container">
	<div class="edit">
		<div id="title"><h3>회원정보수정</h3></div>
		<div class="withdrawal"><label><a href="withdrawal.do" style="color : #ff9797; text-decoration:underline;">탈퇴하기</a></label></div>
		<hr>
			<div class="part">
				<div class="edit_title">이메일<span class="clause1"> *</span></div>
					<div>
						<div><input readonly class="put" ref="emailInput" type="text" v-model="info.userEmail" ></div>
						<div><span class="span1"> 이메일을 변경하려면 운영자에게 이메일을 보내주세요.</span></div>
					</div>
			</div>
			<div class="part">
				<div class="edit_title">이름<span class="clause1"> *</span></div>
				<div><input readonly class="put" ref="nameInput" type="text" v-model="info.userName"></div>
				<div><span class="span1"> 이름을 변경하려면 운영자에게 이메일을 보내주세요.</span></div>
			</div>
			<div class="part">
				<div class="edit_title">닉네임<span class="clause1"> *</span></div>
				<div><input class="put" ref="nickInput" type="text" v-model="info.nick" placeholder="닉네임 특수문자 제외 사용 가능" @click="fnNickOverlap" @keyup="fnNickOverlap"></div>
				<div><span class="red">{{nickMs}}</span></div>
			</div>
			<div class="part">
				<div class="edit_title">휴대폰 번호<span class="clause1"> *</span></div>
				<div><input class="put" ref="phoneInput" type="text" v-model="info.phone" placeholder="휴대폰 번호 '-'제외 숫자만 입력해주세요." @click="fnPhoneOverlap" @keyup="fnPhoneOverlap"></div>
			<div><span class="red">{{phoneMs}}</span></div>
			</div>
			<div class="part">
			<div class="edit_title">생년월일</div>
				<div>
					<select v-model="bYear" class="select">
						<option>연</option>
						<% for(int i=2009; i>=1950; i--){%>
							<option value="<%= i %>"><%= i %></option>
						<%}%>
					</select> 
					<select v-model="bMonth" class="select">
						<option>월</option>
						<% for(int i=1; i<=12; i++){
							if(i<10){%>
								<option value="0<%= i %>"><%= i %></option>
							<%}else{%> 
							<option value="<%= i %>"><%= i %></option>
							<%}%> 
						<%}%>
					</select> 
					<select v-model="bDay" class="select">
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
						선택 안 함 <input type="radio" v-model="info.gender" value="N" name="gender">　　　
						여성 <input type="radio" v-model="info.gender" value="F" name="gender">　　　
						남성 <input type="radio" v-model="info.gender" value="M" name="gender">
					</div>
			<div class="part">
				<div class="edit_title">프로필 이미지</div>
				<label v-if="profileImg.uImgPath != undefined">
					<img :src="profileImg.uImgPath+'/'+profileImg.uImgName" style="width:200px; height:200px; border:1px solid #eee; margin : 10px 0px">
					<input type="file" id="file1" name="file1" class="inputFile" @change="fnProfileChange">
				</label>
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
		nickFlg : true,
		phoneFlg : true,
		message : "",
		emailMs : "",
		m14 : "",
		sms : "",
		pw1Ms : "",
		pw2Ms : "",
		nameMs : "",
		nickMs : "",
		phoneMs : "",
		bYear : "",
		bMonth : "",
		bDay : "",
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		info : {},
		profileImg : {}
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
                	self.bYear = self.info.birthday.substring(0, 4);
                	self.bMonth = self.info.birthday.substring(4, 6);
                	self.bDay = self.info.birthday.substring(6, 8);
                }
            });
		},
		// 수정버튼
		fnEdit : function(){
			var self = this;
			var regType3 = /^[가-힣a-zA-Z\s]*$/;
			if(!self.nickFlg){
				alert("중복된 닉네임입니다.");
				self.$nextTick(function() {
		            self.$refs.nickInput.focus();
		        });
				return;
			}
			var regType2 = /^[가-힣ㄱ-ㅎa-zA-Z0-9\s]*$/;
			if(!regType2.test(self.info.nick)){
				alert("닉네임에 특수문자를 제외하여 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.nickInput.focus();
		        });
				return;
			}
			if(self.info.phone == "" || self.info.phone.length < 11 || self.info.phone.length > 12){
				alert("휴대폰 번호를 정확히 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.phoneInput.focus();
		        });
				return;
			}
			var regType1 = /^[0-9]+$/;
			if(!regType1.test(self.info.phone)){
				alert("휴대폰 번호 숫자만 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.phoneInput.focus();
		        });
				return;
			}
		 	self.info.birthday = self.bYear + self.bMonth + self.bDay;
		 	if(self.bYear=="연" || self.bMonth=="월" || self.bDay=="일"){
		 		self.info.birthday = "";
		 	}
		 	console.log("1");
		 	var nparmap = {nick : self.info.nick, phone : self.info.phone, birthday : self.info.birthday, gender : self.info.gender, no:self.sessionNo}
            $.ajax({
                url : "userEdit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("회원정보수정이 완료되었습니다.");
                	self.fnGetInfo();
                	location.reload();
                }
            });
		},
		// 닉네임 중복체크 및 메세지
		fnNickOverlap : function(){
			var self = this;
			var nparmap = {nick : self.info.nick, no : self.sessionNo};
            $.ajax({
                url : "/EditNickCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	var regType2 = /^[가-힣ㄱ-ㅎa-zA-Z0-9\s]*$/;
        			if(self.info.nick == ""){
        				self.nickMs = "닉네임을 입력하세요.";
        				self.nickFlg = false;
        			}else if(!regType2.test(self.info.nick)){
        				self.nickMs = "닉네임은 특수문자 제외하고 사용가능합니다."
        				self.nickFlg = false;
        			}else if(data.cnt > 0){
        				console.log(self.info.nick);
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
			var nparmap = {phone : self.info.phone};
            $.ajax({
                url : "/EditPhoneCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
        			var regType1 = /^[0-9]+$/;
        			if(self.info.phone == ""){
        				self.phoneMs = "휴대폰 번호를 입력하세요.";
        				self.phoneFlg = false;
        			}else if(!regType1.test(self.info.phone)){
        				self.phoneMs = "숫자만 입력해주세요.";
        				self.phoneFlg = false;
        			}else if(self.info.phone.length < 10 || self.info.phone.length>12){
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
		fnProfileChange : function(){
			var self = this;
			var form = new FormData();
   	        form.append( "file1",  $("#file1")[0].files[0] );
   	     	form.append( "sessionNo",  self.sessionNo); // pk
	         $.ajax({
	             url : "/fileUpload2.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   self.fnGetProfile();
	           }
	           
	       });
		},
		fnGetProfile(){
			var self = this;
			var nparmap = {userNo : self.sessionNo};
			$.ajax({
                url : "../profileImg.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.profileImg = data.img;
                }
			})
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetProfile();
		self.fnGetInfo();
	}// created
});
</script>