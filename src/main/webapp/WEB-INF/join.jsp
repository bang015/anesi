<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<link href="../css/mainCss.css" rel="stylesheet">
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
	input, select{
		margin-bottom : 20px;
	}
</style>
</head>
<body>
<div id="app">
	<div id="container">
	<div><img src="../css/image/footer_img.png" id="logo"></div>
	<div><h1>회원가입</h1></div>
	<hr>
	<div>이메일<span class="clause1"> *</span></div>
	<div><input class="email" type="text" v-model="user.userEmail1" @keyup="fnCheck" autofocus placeholder="이메일"> @ 
	<select v-model="user.userEmail2" class="email2">
		<option value="">선택하세요</option>
		<option value="naver.com">naver.com</option>
		<option value="hanmail.net">hanmail.net</option>
		<option value="daum.net">daum.net</option>
		<option value="gmail.com">gmail.com</option>
		<option value="nate.com">nate.com</option>
		<option value="hotmail.com">hotmail.com</option>
		<option value="icloud.com">icloud.com</option>
	</select>
	</div>
	<div><span v-if="user.userEmail != ''">{{message}}</span></div>
	
	<div>비밀번호<span class="clause1"> *</span></div>
	<div><input class="put" type="password" v-model="user.pw1" placeholder="비밀번호"></div>
	
	<div>비밀번호 확인<span class="clause1"> *</span></div>
	<div><input class="put" type="password" v-model="user.pw2" placeholder="비밀번호 확인"></div>
	
	<div>이름<span class="clause1"> *</span></div>
	<div><input class="put" type="text" v-model="user.userName" placeholder="이름"></div>
	
	<div>닉네임<span class="clause1"> *</span></div>
	<div><input class="put" type="text" v-model="user.nick" placeholder="닉네임"></div>
	
	<div>휴대폰 번호<span class="clause1"> *</span></div>
	<div><input class="put" type="text" v-model="user.phone" placeholder="휴대폰 번호 '-'제외 숫자만 입력해주세요."></div>
	
	<div>생년월일</div>
	<div>
		<select v-model="user.bYear" class="select">
			<% for(int i=2009; i>=1950; i--){%>
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select> 
		<select v-model="user.bMonth" class="select">
			<% for(int i=1; i<=12; i++){%> 
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select> 
		<select v-model="user.bDay" class="select">
			<% for(int i=1; i<=31; i++){%> 
				<option value="<%= i %>"><%= i %></option>
			<%}%>
		</select>
	</div>
	<div>성별</div> 
	<div>
		여성 <input type="radio" v-model="user.gender" value="F">　　　
		　남성 <input type="radio" v-model="user.gender" value="M">
	</div>
	
	<hr>
	<div>약관동의</div>
	<div><label><input type="checkbox" @click="fnAll" v-model="clause"> 전체동의</label></div>
	<div><label><input type="checkbox" v-model="clause"> 만 14세 이상입니다<span class="clause1">(필수)</span></label></div>
	<div><label><input type="checkbox" v-model="clause"> 이용약관<span class="clause1">(필수)</span></label></div>
	<div><label><input type="checkbox" v-model="clause"> 개인정보수집 및 이용동의<span class="clause1">(필수)</span></label></div>
	<div><label><input type="checkbox" v-model="clause"> 이벤트, 쿠폰, 특가 알림 메일 및 SMS 등 수신<span class="clause2">(선택)</span></label></div>
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
			bYear : "2009",
			bMonth : "1",
			bDay : "1",
			gender : "F"
		},
		list : [],
		clause : [],
		emailFlg : false,
		nickFlg : false,
		message : ""
	},// data
	methods : {
		fnJoin : function(){
			var self = this;
			if(self.user.userEmail1 == ""){
				alert("이메일을 입력하세요.");
				return;
			}
			if(self.user.userEmail2 == ""){
				alert("이메일을 선택해주세요.");
				return;
			}
			if(self.user.pw1 == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			if(self.user.userName == ""){
				alert("이름을 입력해주세요.");
				return;
			}
			if(self.user.nick == ""){
				alert("닉네임을 입력해주세요.");
				return;
			}
			if(self.user.phone == ""){
				alert("휴대폰 번호를 입력해주세요.");
				return;
			}
			var regType1 = /^[0-9]+$/;
			if(!regType1.test(self.user.phone) ){
				alert("휴대폰 번호 숫자만 입력해주세요.");
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
        fnAll : function(){
        	var self = this;
        	/* self.clause = []; */
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>