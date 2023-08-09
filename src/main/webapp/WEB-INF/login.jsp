<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content{
		width: 400px;
		margin: 0 auto;
		border: 1px solid;
		position: relative;
	}
	.logo{
		position: relative;
		width : 100%;
		height : 110px;
		
	}
	.logo img{
		position:absolute;
		top : 10px;
		left : 50%;;
		width: 100px;
		height: 100px;
		transform: translate(-50%, 0);
	}
	.login-wrap{
		width: 100%;
		height: 150px;
	}
	.login-title{
		font-size : 23px;
		margin-top : 20px;
		margin-bottom : 20px;
		text-align: center;
		border-bottom: 1px solid #e8e8e8;
	}
	.login-input{
		display: inline-block;
		width: 80%;
		height: 30px;
		margin-left: 30px;
	} 
	
</style>
</head>
<body>
<div id="app">
	<div id="container">
		<div class="content">
			<div class="logo">
				<img alt="logo" src="../css/image/footer_img.png">
			</div>
			<div class="login-wrap">
				<div class="login-title">
					<span class="title1">로그인</span>
				</div>
				<div class="login-box">
					<input class="login-input border" v-model="userEmail" placeholder="이메일">
					<input class="login-input" type="password" v-model="pwd" placeholder="패스워드">
				</div>
				<div class="login-btn">
					<button @click="fnLogin">로그인</button>
				</div>
			</div>
			<div class="btn-wrap">
				<button>아이디 찾기</button>
				<button>회원가입</button>
			</div>
			<div class="non-user-wrap">
				<div class="non-user-title">
					<span>비회원 주문 조회하기</span>
				</div>
				<div class="non-user-box">
					<input placeholder="주문번호">
					<input placeholder="이메일">
				</div>
				<div class="non-user-btn">
					<button>주문조회</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		userEmail : "",
		pwd : ""
	},// data
	methods : {
		fnLogin : function(){
            var self = this;
            var nparmap = {userEmail : self.userEmail, pwd : self.pwd};
            
            $.ajax({
                url : "login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		if(data.success){                		
               				alert(data.message);
                       			                	
                   	} else {	
                   		alert(data.message);
                   	}
                }                
            }); 
        }
	}, // methods
	created : function() {
		
	}// created
});
</script>