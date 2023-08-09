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
<title>Insert title here</title>
<style>
	#container {
		margin : 10px auto;
		width : 400px;
		line-height: 30px;
	}
	#logo{
		width : 200px;
		margin : 10px auto;
		margin-left : 100px;
	}
	.put{
	    border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 380px;
	    height: 30px;
	    padding: 10px;
	}
	.email{
		border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 167px;
	    height: 30px;
	    padding: 10px;
	}
	.email2{
		border-radius: 4px;
	    border: 1px solid #ccc;
	    width: 190px;
	    height: 52px;
	    padding: 8px;
	}
	#login{
		text-align: center;
	}
	hr{
		margin : 30px 0px;
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
	.clause1{
		color : #A782C3;
	}
	.clause2{
		color : #999;
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
		margin : 5px 0px;
	}
	i{
		float : right;
		margin-top: 10px;
		margin-right : 5px;
	}
</style>
</head>
<body>
<div id="app">
	<div id="container">
	<div><img src="../css/image/footer_img.png" id="logo"></div>
	<div><h1>회원가입</h1></div>
	<hr>
	<div class="part">
	<div><h2>이메일<span class="clause1"> *</span></h2></div>
	<div><input class="email" ref="emailInput" type="text" v-model="user.userEmail1" @click="fnMailCheck" @keyup="fnMailCheck" placeholder="이메일"> @ 
	<select v-model="user.userEmail2" class="email2" ref="emailInput2">
		<option value="">선택해주세요.</option>
		<option value="naver.com">naver.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="daum.net">daum.net</option>
		<option value="gmail.com">gmail.com</option>
		<option value="nate.com">nate.com</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="icloud.com">icloud.com</option>
	</select>
	</div>
	<div><span class="red">{{emailMs}}</span></div>
	</div>
	
	<div class="part">
	<div><h2>비밀번호<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="pw1Input" type="password" v-model="user.pw1" placeholder="비밀번호" @click="fnPwdCheck" @keyup="fnPwdCheck"></div>
	<div><span class="red">{{pw1Ms}}</span></div>
	</div>
	<div class="part">
	<div><h2>비밀번호 확인<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="pw2Input" type="password" v-model="user.pw2" placeholder="비밀번호 확인" @click="fnPwd2Check" @keyup="fnPwd2Check"></div>
	<div><span class="red">{{pw2Ms}}</span></div>
	</div>
	<div class="part">
	<div><h2>이름</h2></div>
	<div><input class="put" ref="nameInput" type="text" v-model="user.userName" placeholder="이름" @click="fnNameCheck" @keyup="fnNameCheck"></div>
	<div><span class="red">{{nameMs}}</span></div>
	</div>
	<div class="part">
	<div><h2>닉네임<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="nickInput" type="text" v-model="user.nick" placeholder="닉네임" @click="fnNickCheck" @keyup="fnNickCheck"></div>
	<div><span class="red">{{nickMs}}</span></div>
	</div>
	<div class="part">
	<div><h2>휴대폰 번호<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="phoneInput" type="text" v-model="user.phone" placeholder="휴대폰 번호 '-'제외 숫자만 입력해주세요." @click="fnPhoneCheck" @keyup="fnPhoneCheck"></div>
	<div><span class="red">{{phoneMs}}</span></div>
	</div>
	<div class="part">
	<div><h2>생년월일</h2></div>
	<div>
		<select v-model="user.bYear" class="select">
			<option>연</option>
			<% for(int i=2009; i>=1950; i--){%>
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select> 
		<select v-model="user.bMonth" class="select">
			<option>월</option>
			<% for(int i=1; i<=12; i++){%> 
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select> 
		<select v-model="user.bDay" class="select">
			<option>일</option>
			<% for(int i=1; i<=31; i++){%> 
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select>
	</div>
	</div>
	<div class="part">
	<div><h2>성별</h2></div> 
	<div>
		선택 안 함 <input type="radio" v-model="user.gender" value="N">　　　
		여성 <input type="radio" v-model="user.gender" value="F">　　　
		남성 <input type="radio" v-model="user.gender" value="M">
	</div>
	</div>
	<hr>
	<div><h2>약관동의</h2></div>
	<div><label><input type="checkbox" @click="fnAll" v-model="clause"> 전체동의</label></div>
	<div><label><input type="checkbox" v-model="clause" value="m14"> 만 14세 이상입니다<span class="clause1">(필수)</span></label></div>
	<div><label><input type="checkbox" v-model="clause" value="cla"> 이용약관<span class="clause1">(필수)</span></label><a href=""><i class="fa-solid fa-chevron-right" style="color: #000000;"></i></a></div>
	<div><label><input type="checkbox" v-model="clause" value="cla2"> 개인정보수집 및 이용동의<span class="clause1">(필수)</span></label><a href=""><i class="fa-solid fa-chevron-right" style="color: #000000;"></i></a></div>
	<div><label><input type="checkbox" v-model="clause" value="sms"> 이벤트, 쿠폰, 특가 알림 메일 및 SMS 등 수신<span class="clause2">(선택)</span></label><a href=""><i class="fa-solid fa-chevron-right" style="color: #000000;"></i></a></div>
	<hr>
	<div><button @click="fnJoin" class="btn">회원가입</button></div>

	<div id="login">이미 아이디가 있으신가요? <a href="login.do">로그인</a></div>
	
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		user : {
			userEmail1 : "",
			userEmail2 : "",
			pw1 : "",
			pw2 : "",
			userName : "",
			phone : "",
			nick : "",
			bYear : "연",
			bMonth : "월",
			bDay : "일",
			gender : "N"
		},
		list : [],
		clause : [],
		emailFlg : false,
		nickFlg : false,
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
		phoneMs : ""
	},// data
	methods : {
		
		fnJoin : function(){
			var self = this;
			if(self.user.userEmail1 == ""){
				alert("이메일을 입력하세요.");
				self.$nextTick(function() {
		            self.$refs.emailInput.focus();
		        });
				return;
			}
			if(self.user.userEmail2 == ""){
				alert("이메일을 선택해주세요.");
				self.$nextTick(function() {
		            self.$refs.emailInput2.focus();
		        });
				return;
			}
			if(self.user.pw1 == ""){
				alert("비밀번호를 입력하세요.");
				self.$nextTick(function() {
		            self.$refs.pw1Input.focus();
		        });
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("비밀번호가 일치하지 않습니다.");
				self.$nextTick(function() {
		            self.$refs.pw2Input.focus();
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
			var regType2 = /^[가-힣ㄱ-ㅎa-zA-Z0-9\s]*$/;
			if(!regType2.test(self.user.nick)){
				alert("닉네임에 특수문자를 제외하여 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.nickInput.focus();
		        });
				return;
			}
			if(!self.clause.includes('m14') || !self.clause.includes('cla') || !self.clause.includes('cla2')){
				alert("필수 약관에 동의해주세요.");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("회원가입이 완료되었습니다.");
                }
            });
		},
		fnCheck : function(){
			var self = this;
			var nparmap = {userId : self.user.userEmail};
            $.ajax({
                url : "check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "중복된 이메일입니다.";
                	} else {
                		self.message = "사용 가능한 이메일입니다.";
                		self.emailFlg = true;
                	}
                }
            });
		},
		fnNickCheck : function(){
			var self = this;
			var nparmap = {userId : self.user.nick};
            $.ajax({
                url : "nickCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "중복된 닉네임입니다.";
                	} else {
                		self.message = "사용 가능한 닉네임입니다.";
                		self.emailFlg = true;
                	}
                }
            });
		},
		fnMailCheck : function(){
			var self = this;
			if(self.user.userEmail1 == ""){
				self.emailMs = "이메일을 입력하세요.";
			}else{
				self.emailMs = "";
			}
		},
		fnPwdCheck : function(){
			var self = this;
			if(self.user.pw1 == ""){
				self.pw1Ms = "비밀번호를 입력하세요.";
			}else{
				self.pw1Ms = "";
			}
		},
		fnPwd2Check : function(){
			var self = this;
			if(self.user.pw1 == ""){
				self.pw2Ms = "비밀번호 확인을 입력하세요.";
			}else{
				self.pw2Ms = "";
			}
		},
		fnNameCheck : function(){
			var self = this;
			var regType3 = /^[가-힣a-zA-Z\s]*$/;
			if(!regType3.test(self.user.userName)){
				self.nameMs = "이름은 영문, 한글만 가능합니다.";
			}else{
				self.nameMs = "";
			}
		},
		fnNickCheck : function(){
			var self = this;
			var regType2 = /^[a-zA-Z0-9\s]*$/;
			if(self.user.nick == ""){
				self.nickMs = "닉네임을 입력하세요.";
			}else if(!regType2.test(self.user.nick)){
				self.nickMs = "닉네임은 특수문자 제외하고 사용가능합니다."
			}else{
				self.nickMs = "";
			}
		},
		fnPhoneCheck : function(){
			var self = this;
			var regType1 = /^[0-9]+$/;
			if(self.user.phone == ""){
				self.phoneMs = "휴대폰 번호를 입력하세요.";
			}else if(!regType1.test(self.user.phone)){
				self.phoneMs = "숫자만 입력해주세요.";
			}else if(self.user.phone.length < 10){
				self.phoneMs = "휴대폰 번호를 정확히 입력해주세요.(10자리 이상)";
			}else{
				self.phoneMs = "";
			}
		},
        fnAll : function(){
        	var self = this;
        	if(self.clause.length > 0){
        		self.clause = [];
        	}else{
        		self.clause = ['m14', 'cla', 'cla2', 'sms'];
        	}
        	
        	
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>