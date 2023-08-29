<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">
<link href="../css/productView.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.main-img-table{
	margin-top: 51px;
}
.main-btn-wrap button {
    width: 405px;
    height: 50px;
    border-radius: 5px;
    font-size: 17px;
}
.usedText1{
	margin-top: 10px;
	font-size: 17px;
	
}
.a-wrap{
	margin-bottom: 20px;
}
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="content-box">
					<div class="main-left">
						<div class="main-view">
							<div class="main-img-table">
								<ul class="main-ul">
									<li class="main-li" v-for="item in list">
										<a href="javascript:;">
											<img alt="콘텐츠 이미지" :src="item.pImgPath+'/'+item.pImgName" @mouseover="clickImg(item.pImgPath, item.pImgName)">
										</a>
									</li>
								</ul>
							</div>
							<div class="main-img">
								<img alt="썸네일" :src="mainImg">
							</div>
						</div>
					</div>
						<div class="main-box">
							<div class="main-title" >
								<span class="product-title">{{usedName}}</span>
							</div>
							<div class="main-price2">
									{{price | formatPrice}}원
							</div>
							<div class="usedText1">
								상태 : {{usedGrade}}
							</div>
							<div class="usedText1" v-if="usedtime > 0">
								사용기간 : {{usedtime}} 월
							</div>
							<div class="usedText1" v-if="usedtime == 0">
								사용기간 : 미사용
							</div>
							<div class="usedText1">
								배송비 : 배송비 별도
							</div>
							<div class="total-price">
							    <div class="total-title">주문금액</div>
							    <div class="total-price1">
							    	<span class="total-price2">{{price | formatPrice}}원</span>
							    </div>
							</div>
							<div class="main-btn-wrap">
								<button class="btn2" @click="fnPay">바로구매</button>
							</div>
						</div>
					</div>
					<div class="content-box2">
						<div class="content-view">
							<div class="content-title">
								상품 정보
								<div class="content-text-box">
									<div class="text1">판매자 직거래 주의 안내</div>
									<div>판매자를 사칭하여 현금 입금 유도하는 소비자 피해 사례가 늘고 있습니다.</div>
									<div>판매자와 문자/카톡으로 소통하실 때, 고객분들의 주의를 부탁드리며,</div>
									<div>의심되는 경우 아네시 고객센터로 신고해 주시기 바랍니다.</div>
								</div>
								<div>
									<pre v-html="content"></pre>
								</div>
							</div>
						</div>
						</div>
						<div class="modal noneDisplay" v-if="showScrapModal3" :class="{'showDisplay' : showScrapModal3}">
							<div class="container">
							<div class="review-back">
								<button class="back-btn" @click="closeScrapModal3()"><i  class="fa-solid fa-x fa-2x" style="color: #bdbdbd;"></i></button>
							</div>
								<div class="content1">
									<div class="logo2">
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
									<div class="non-user-wrap1"> <!-- 비회원 주문 조회 -->
										<button class="loginBtn1 btn" @click="closeScrapModal3()">쇼핑 계속하기</button>
									</div>
								</div>
							</div>		
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
<script>
var app = new Vue({
	el : '#app',
	data : {
		usedPNo : '${map.usedPNo}',
		userNo : '${sessionNo}',
		list : [],
		mainImg : "",
		price : 0,
		usedName : "",
		usedGrade : "",
		showScrapModal3 : false,
		content : "",
		usedtime : "",
		pwd : "",
		userEmail : "",
	},// data
	filters: {
	    formatPrice(price) {
	      return price.toLocaleString('ko-KR');
	    },
	  },
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {usedPNo : self.usedPNo};
            $.ajax({
                url : "/usedProduct.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		self.list = data.list
               		self.mainImg = self.list[0].pImgPath + "/" + self.list[0].pImgName;
               		self.price = self.list[0].uSellPrice;
               		self.usedName = self.list[0].usedPName;
               		self.usedGrade = self.list[0].grade;
               		self.content = self.list[0].sellContent;
               		self.usedtime = self.list[0].usedtime;
               		console.log(self.list);
                }                
            }); 
        },
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
                url : "../login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		if(data.success){                		
               			location.reload();	                	
                   	} else {	
                   		alert(data.message);
                   	}
                }                
            }); 
        },
        clickImg(path , name){
        	var self = this;
        	self.mainImg = path + "/" + name;
        },
        fnPay(){
        	var self = this;
        	if(self.userNo==null || self.userNo==""){
				self.showScrapModal3 = true;
				return;
			}
        	if(self.userNo !=null || self.userNo !=""){
				 $.pageChange("../order/used.do" , {usedPNo : self.usedPNo});
			 }
        },
        closeScrapModal3: function() {
			var self = this;
			self.showScrapModal3 = false;
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>