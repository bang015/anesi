<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.content{
		width: 400px;
		margin: 0 auto;
		margin-top : 100px;
		
		
	}
	.title{
		color: #424242;
		height: 30px;
		font-size: 15px;	
	}
	.email-input{
		height: 50px;
		position: relative;
	}
	.email-input input{
		width: 90%;
		height: 35px;
		font-size: 15px;
	}
	.email-input button{
		position: absolute;
		top : 2.5px;
		right: 10%;
		width: 50px;
		height: 35px;
		border : 0;
		border-radius: 5px;
		background: #A782C3;
		color: #fff;
		font-weight: bold;
	}
	.user-input{
		height: 100px;
	}
	.user-input input{
		width: 90%;
		height: 35px;
		font-size: 15px;
		margin-top: 5px;
	}
	.select-btn{
		position: relative;
		height: 50px;
		margin-top: 20px;
	}
	.select-btn button{
		width: 92%;
		height: 40px;
		background:#A782C3;
		border: 0;
		border-radius: 5px;
		color: #fff;
		font-size: 15px;
		font-weight: bold;
	}
	.text-box{
		width : 92%;
		height : 100px;
		background: rgb(247, 248, 250);
		text-align: center;
		margin-top: 20px;
	}
	.text1{
		height:30px;
		line-height : 60px; 
		color: #424242;
	}
	.text2{
		color: #A782C3;
	}
	.select-email{
		text-decoration: none;
		margin-bottom: 3px;
	}
</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<!-- 아이디/패스워드 찾기 -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="title">
					<span>
						가입한 정보을 입력해주세요.
					</span>
				</div>
				<div class="email-input">
					<input v-midel="email" placeholder="이메일">
					<button class="btn" @click="emailCheck">확인</button>
				</div>
				<div class="select-email">
					<a>가입한 이메일 찾기</a>
				</div>
				<div class="user-input">
					<input placeholder="이름">
					<input placeholder="전화번호">
				</div>
				<div class="select-btn">
					<button class="btn">패스워드 찾기</button>
				</div>
				<div class="text-box">
					<span class="text1">회원가입 시 입력한 정보가 기억나지 않는다면?</span>
					<div class="text2">고객센터 문의하기(1010-4563)</div>
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

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>