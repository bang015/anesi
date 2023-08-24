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
<title>ANESI 회원가입😎</title>
<style>
	#container {
		margin : 10px auto;
		width : 400px;
		line-height: 30px;
	}
	#logo{
		width : 200px;
		margin: 20px 0px 0px 100px;
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
		margin-bottom : 80px;
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
		margin : 10px 0px;
	}
	i{
		float : right;
		margin-top: 10px;
		margin-right : 5px;
	}
	img:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
<div id="app">
	<div id="container">
	<!-- 로고 -->
	<div><img src="../css/image/footer_img.png" id="logo" @click="fnMain"></div>
	<div><h1>회원가입</h1></div>
	<hr>
	<!-- 이메일 입력 -->
	<div class="part">
	<div><h2>이메일<span class="clause1"> *</span></h2></div>
	<div><input class="email" ref="emailInput" type="text" v-model="user.userEmail1" @click="fnCheck" @keyup="fnCheck" placeholder="이메일"> @ 
	<select v-model="user.userEmail2" class="email2" ref="emailInput2" @click="fnCheck">
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
	<!-- 비밀번호 입력 -->
	<div class="part">
	<div><h2>비밀번호<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="pw1Input" type="password" v-model="user.pw1" placeholder="비밀번호" @click="fnPwdCheck" @keyup="fnPwdCheck"></div>
	<div><span class="red">{{pw1Ms}}</span></div>
	</div>
	<!-- 비밀번호 확인 입력 -->
	<div class="part">
	<div><h2>비밀번호 확인<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="pw2Input" type="password" v-model="user.pw2" placeholder="비밀번호 확인" @click="fnPwd2Check" @keyup="fnPwd2Check"></div>
	<div><span class="red">{{pw2Ms}}</span></div>
	</div>
	<!-- 이름 입력 -->
	<div class="part">
	<div><h2>이름<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="nameInput" type="text" v-model="user.userName" placeholder="이름" @click="fnNameCheck" @keyup="fnNameCheck"></div>
	<div><span class="red">{{nameMs}}</span></div>
	</div>
	<!-- 닉네임 입력 -->
	<div class="part">
	<div><h2>닉네임<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="nickInput" type="text" v-model="user.nick" placeholder="닉네임 특수문자 제외 사용 가능" @click="fnNickOverlap" @keyup="fnNickOverlap"></div>
	<div><span class="red">{{nickMs}}</span></div>
	</div>
	<!-- 휴대폰 번호 -->
	<div class="part">
	<div><h2>휴대폰 번호<span class="clause1"> *</span></h2></div>
	<div><input class="put" ref="phoneInput" type="text" v-model="user.phone" placeholder="휴대폰 번호 '-'제외 숫자만 입력해주세요." @click="fnPhoneOverlap" @keyup="fnPhoneOverlap"></div>
	<div><span class="red">{{phoneMs}}</span></div>
	</div>
	<!-- 생년월일 -->
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
	<!-- 성별 -->
	<div class="part">
	<div><h2>성별</h2></div> 
	<div>
		선택 안 함 <input type="radio" v-model="user.gender" value="N">　　　
		여성 <input type="radio" v-model="user.gender" value="F">　　　
		남성 <input type="radio" v-model="user.gender" value="M">
	</div>
	<!-- 약관동의 -->
	</div>
	<hr>
	<div><h2>약관동의</h2></div>
	<div><label><input type="checkbox" @click="fnAll" v-model="clause"> 전체동의</label></div>
	<div><label><input type="checkbox" v-model="clause" value="m14"> 만 14세 이상입니다<span class="clause1">(필수)</span></label></div>
	<div><label><input type="checkbox" v-model="clause" value="cla"> 이용약관<span class="clause1">(필수)</span></label><a href="usepolicy.do" target="blank"><i class="fa-solid fa-chevron-right" style="color: #000000;"></i></a></div>
	<div><label><input type="checkbox" v-model="clause" value="cla2"> 개인정보수집 및 이용동의<span class="clause1">(필수)</span></label><a href="privacy.do" target="blank"><i class="fa-solid fa-chevron-right" style="color: #000000;"></i></a></div>
	<div><label><input type="checkbox" v-model="clause" value="sms"> 마케팅 활용 동의와 이벤트, 특가 등 메일 및 SMS 수신<span class="clause2">(선택)</span></label><a href="privacyMarketing.do" target="blank"><i class="fa-solid fa-chevron-right" style="color: #000000;"></i></a></div>
	<hr>
	<!-- 하단 -->
	<div><button @click="fnJoin()" class="btn">회원가입</button></div>
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
			email : "",
			pw1 : "",
			pw2 : "",
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
		
	},// data
	methods : {
		// 회원가입 버튼
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
			if(!self.emailFlg){
				alert("이미 가입된 이메일입니다.");
				self.$nextTick(function() {
		            self.$refs.emailInput.focus();
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
			if(!self.clause.includes('m14') || !self.clause.includes('cla') || !self.clause.includes('cla2')){
				alert("필수 약관에 동의해주세요.");
				return;
			}
		 	if(self.clause.includes('sms')){
		 		self.user.smsYn = 'Y';
		 	}
		 	var nparmap = self.user;
		 	self.user.email = self.user.userEmail1 +'@'+ self.user.userEmail2;
		 	self.user.birth = self.user.bYear + self.user.bMonth + self.user.bDay;
		 	if(self.user.bYear=="연" || self.user.bMonth=="월" || self.user.bDay=="일"){
		 		self.user.birth = "";
		 	}
            $.ajax({
                url : "join.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
					console.log(data);
                	alert("회원가입이 완료되었습니다.");
                	/* location.href="main.do"; */
                }
            });
		},
		// 이메일 중복체크 및 메세지
		fnCheck : function(){
			var self = this;
			self.user.email = self.user.userEmail1 +'@'+ self.user.userEmail2;
			var nparmap = {email : self.user.email};
            $.ajax({
                url : "joinCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
        			if(self.user.userEmail1 == ""){
        				self.emailMs = "이메일을 입력하세요.";
        				self.emailFlg = false;
        			}else if(data.cnt > 0){
                		self.emailMs = "이미 가입된 이메일입니다.";
                		self.emailFlg = false;
                	}else if(self.user.userEmail2==""){
                		self.emailMs = "메일 주소를 선택해주세요.";
                	}else{
                		self.emailMs = "사용 가능한 이메일입니다.";
                		self.emailFlg = true;
                	}
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
		},
		// 전체 선택
        fnAll : function(){
        	var self = this;
        	if(self.clause.length > 0){
        		self.clause = [];
        	}else{
        		self.clause = ['m14', 'cla', 'cla2', 'sms'];
        	}
        },
        // 로고 클릭시 메인 이동
        fnMain : function(){
        	location.href="main.do";
        },
        
        fnInsertAlarm : function(alarmType){
			var self = this;
			var nparmap = {userNo:self.userNo, alarmType};
        	console.log(alarmType);

			 $.ajax({
	                url : "../addAlarm.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	alert("알람인서트 완");
	                }
            }); 
			
		}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>