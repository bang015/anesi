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
<link rel="stylesheet" href="../css/scrapbook.css">
<meta charset="UTF-8">
<title>회원탈퇴😭</title>
</head>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 30px auto;
	width: 700px;
	position: relative;
}
.edit{
	border : 1px solid #d1d1d1;
    border-radius : 5px;
    padding : 20px 30px;
    height : 345px;
    width : 700px;
    margin : 10px auto;
    position: relative;
    margin : 20px 0px;
}
h1{
	margin : 40px 0px 30px 0px;
}
p, ul{
	line-height: 19px;
}
.custom-checkbox{
	left: 11px;
    top: 0px;
}
.imgWrapper{
	position: absolute;
}
.text1{
	position: absolute;
	left : 6%;
	font-size : 16px;
}
.red{
	color : #ff9797;
	font-weight:bold;
}
.check{
	cursor: pointer;
}
.btn{
	width : 200px;
	height : 50px;
	font-size : 15px;
}
.btn2{
    border: none;
    color: white;
    background-color: #a9a9a9;
    border-radius: 7px;
    padding: 0px 9px;
    margin: 10px 0px;
	transition: background 0.3s;
	cursor: pointer;
	width: 200px;
	height: 50px;
	font-size : 15px;
	margin-right : 5px;
}
.btn2:hover{
	background-color: #7c6191;
}
.button1{
	margin: 75px 0px 10px 0px;
}
.imgWrapper {
   height: 20px;
}
.text1-right{
    position: absolute;
    right: -8%;
    bottom: 17%;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div><h1>회원탈퇴 신청</h1></div>
		<div><h3>회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해주세요.</h3></div>
			<div class="edit">
				<div class="css-15t02j8 e187gapo7">
					<h3>회원탈퇴 시 처리내용</h3>
						<ul>
							<li>아네시 포인트·쿠폰은 소멸되며 환불되지 않습니다.</li>
							<li>아네시 구매 정보가 삭제됩니다.</li>
							<li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.</li>
						</ul>
						<h3>회원탈퇴 시 게시물 관리</h3>
						<p>회원탈퇴 후 아네시 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</p>
						<h3>회원탈퇴 후 재가입 규정</h3>
						<p>탈퇴 회원이 재가입하더라도 기존의 아네시 포인트는 이미 소멸되었기 때문에 양도되지 않습니다.</p>
				</div>
			</div>
		<div class="check" @click="fnFlg">
			<div class="imgWrapper">
				<div class="custom-checkbox" :class="{ 'checked': flg }" >
					<div class="checkbox-icon" :class=" flg ? 'checked' : ''">
			        	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
			    	</div>
				</div>
			</div>
			<span class="text1">위 내용을 모두 확인하였습니다.<span class="red"> 필수</span></span>
		</div>
		<span class="text1-right">고객센터 1670-0876</span>
		<div class="button1">
			<button class="btn2" @click="fnWithdrawal">탈퇴하기</button>
			<button class="btn" @click="fnCancel">취소하기</button>
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
		info : {},
		checkAm : [],
		flg : false
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
		toggleCheckbox(item){},
		fnFlg : function(){
			var self = this;
			if(self.flg==false){
				self.flg = true;
			}else{
				self.flg = false;
			}
		},
		fnWithdrawal : function(){
			var self = this;
			if(!self.flg){
				alert("필수 동의 항목을 확인해주세요.");
				return;
			}
			var nparmap = {no : self.sessionNo};
			$.ajax({
                url : "/mypage/withdrawal.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("회원 탈퇴가 완료되었습니다. \n이용해주셔서 감사합니다. 😊");
                	location.href="/login.do"
                }
            });
		},
		fnCancel : function(){
			location.href="user_edit.do";
		}
	}, // methods
	created : function() {
		var self = this;
    	self.fnGetInfo();
	}// created
});
</script>