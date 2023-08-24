<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">
<meta charset="UTF-8">
<title>login</title>
<style>
	
</style>
</head>
<!-- 로그인 페이지 -->
<body>
<div id="app">
	<div id="container">
		<div class="content">
			<div class="logo1">
				<a href="main.do"><img alt="logo" src="../css/image/footer_img.png" ></a>
			</div>
			<div class="login-wrap">
				<div class="login-title">
					<span class="title1">로그인</span>
				</div>
				<div class="login-box"> <!-- 로그인 입력 박스 -->
					<input class="login-input" v-model="userEmail" placeholder="이메일" @keyup.enter="fnLogin">
					<input class="login-input" type="password" v-model="pwd" placeholder="패스워드" @keyup.enter="fnLogin">
				</div>
				<div class="login-btn">
					<button class="loginBtn btn" @click="fnLogin">로그인</button>
				</div>
			</div>
			<div class="a-wrap"> <!-- 기타등등 -->
				<a href="/selectEmail.do" class="a a1">아이디찾기</a>
				<a href="/join.do" class="a a2">회원가입</a>
			</div>
			<div class="non-user-wrap"> <!-- 비회원 주문 조회 -->
				<div class="non-user-title">
					<a href="javascript:;" id="hidden-btn">비회원 주문 조회하기</a>
				</div>
				<div id="hidden" v-if="true" class="non-user-hidden">
					<div class="non-user-box">
						<input placeholder="주문번호" v-model="paymentNo">
						<input placeholder="이메일" v-model="orderEmail">
					</div>
					<div class="non-user-btn">
						<button class="btn" @click="fnNonUser">주문조회</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script>
$(document).ready(function(){
    $("#hidden-btn").click(function(){
        $("#hidden").slideToggle(400)
    })
})
var app = new Vue({
	el : '#app',
	data : {
		userEmail : "",
		pwd : "",
		hidden : false,
		orderEmail : "",
		paymentNo : "",
		nonUserOrderCheck : 0,
	},// data
	methods : {
		fnLogin : function(){
            var self = this;
            var nparmap = {userEmail : self.userEmail, pwd : self.pwd};
            if(self.userEmail == ""){
            	alert("이메일을 입력하세요.");
            	return;
            }
            if(self.pwd == ""){
            	alert("비밀번호를 입력하세요.");
            	return;
            }
            $.ajax({
                url : "login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		if(data.success){                		
                       	location.href="/product/storemain.do";	                	
                   	} else {	
                   		alert(data.message);
                   	}
                }                
            }); 
        },
		fnNonUser : function(){
            var self = this;
            if(self.paymentNo == ""){
            	alert("주문번호를 입력하세요.")
            }
            if(self.orderEmail == ""){
            	alert("이메일을 입력하세요.")
            }
            var nparmap = {paymentNo : self.paymentNo, orderEmail : self.orderEmail};
            $.ajax({
                url : "nonUserOrderCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		if(data.nonUserOrderCheck == 0){
               			alert("주문 내역이 없습니다, 주문 번호 혹은 이메일을 확인해주세요.")
               		}else{
               			self.selectNonUserOrder();
               		}
                }                
            }); 
        },
        selectNonUserOrder(){
        	var self = this;
        	$.pageChange("/nOrder.do" , {paymentNo : self.paymentNo, orderEmail : self.orderEmail});
        },
        fnClick : function(){
        	if(self.hidden==false){
        		self.hidden=true;
        	}else{
        		self.hidden=false;
        	}
        	console.log(self.hidden);
        }
	}, // methods
	created : function() {
	}// created
});
</script>