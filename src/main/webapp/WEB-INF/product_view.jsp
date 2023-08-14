<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>상품 상세 페이지</title>
<style>
	html { 
  		scroll-behavior: smooth;
	}
	.content{
		position: relative;
    	min-height: 1px;
		width: 1200px;
		margin: 0 auto;
		margin-top : 170px;
	}
	.content-box{
		height: 700px;
	}
	.main-left{
		width: 60%;
		display: inline-block;
		position: relative;
	}
	.main-box{
		position : absolute;
		top : 50px;
		width: 400px;
		display: inline-block;
		margin-left: 30px;
	}
	.category-wrap{
		margin-top: 20px;
		font-size: 15px;
		color: #424242;
	}
	.main-img-table{
	}
	.main-ul{
		list-style-type: none;
		padding-left: 0px;
	}
	.main-li{
		margin-bottom: 5px;
		margin-top: 0px;
		
	}
	.main-li img{
		width: 100px;
		height: 100px;
		border-radius: 10px;
	}
	.main-img{
		position : absolute;
		left : 110px;
		top : 51px;
		width: 600px;
		height: 600px;
		
	}
	.main-img img{
		width: 600px;
		height: 600px;
		border-radius: 10px;	
	}
	.main-title{
		font-size: 40px;
		margin-top: 0;
		
	}
	.main-csat{
		font-size : 20px;
		margin-top: 20px;
	}
	.main-discount{
		margin-top: 20px;
		font-size: 20px;
	}
	.main-price{
		height : 50px;
		border-bottom: 1px solid #ededed;
		font-size: 30px;
	}
	.main-option{
		margin-top: 30px;
	}
	.option-box{
		width: 100%;
		height: 40px;
		font-size: 18px;
	}
	.main-btn-wrap{
		margin-top: 298px;
	}
	.main-btn-wrap button{
		width: 198px;
		height: 50px;
		border-radius: 5px;
		font-size: 17px;
	}
	.btn1{
		border: 1.5px solid #A782C3;
		color: #A782C3;
		background-color: #fff;
		font-weight: bold;
	}
	.btn2{
		border: 0;
		color: #fff;
		background-color: #A782C3;
	}
	.nav-box{
		overflow: auto;
		position: sticky;
		top: 185px;
	}
	.nav-wrap{
    	border-bottom: 1px solid #ededed;
		border-top: 1px solid #ededed;
		width : 100%;
		height: 52px;
		background-color: #fafafa;
		
	}
	.nav-wrap div{
		font-size : 16px;
		font-weight : bold;
		line-height : 50px;
		text-align : center;
		width: 395.5px;
		height : 50px;
		display: inline-block;
		
	}
	.nav-wrap div:hover{
		border-bottom: 2px solid #A782C3;
		color: #A782C3;
	}
	.nav-wrap a{
		font-family: 'Pretendard-Regular';
		font-size: 17px;
		padding: 17px 165px 17px 168px;
	}
	.content-img{
		margin-left: 40px;
		width: 700px;
		display: inline-block;
	}
	.content-img img{
		width: 700px;
	}
	.content-title{
		font-size: 20px;
		font-weight: bold;
		margin-left: 40px;
		margin-top: 20px;
		width: 700px;
		display: inline-block;
	}
	.content-text-box{
		background-color: #FDF4F5;
		text-align: center;
		width: 700px;
		height : 200px;
		font-size: 20px;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	.text1{
		color: #F54644;
		line-height: 80px;
		font-weight: bold;
		font-size: 30px;
	}
	.content-review{
		margin-left: 40px;
		width: 700px;
		display: inline-block;
	}
	.review-span{
		color : rgba(0,0,0,.4);
		font-weight: bold;
		font-size: 17px;
	}
	.review-title{
		font-size: 18px;
		font-weight: bold;
		display: inline-block;
		width: 700px;
	}
	.review-text2{
		color:#A782C3; 
	}
	.review-btn{
		float: right;
		background-color: #fff;
		border : 0;
		color : #A782C3;
		font-size: 15px;
		font-weight: bold;
		font-family: 'Pretendard-Regular';
	}
	.csat-box{
		background-color: #f7f8fa;
		width: 700px;
		height : 100px;
		border-radius: 8px;
		margin-top: 30px;
	}
	.csat1{
		display : inline-block;
		width: 300px;
		height: 60px;
		border: 1px solid;
		margin-top: 10px; 
	}
	.csat2{
		display: inline-block;
	}
	.recently-viewed{
		border: 1px solid;
		width: 400px;
		height: 525px;
		position: sticky;
		top: 240px;
	}
	.content-box2{
		display: flex;
	}
	.content-view{
		width: 800px;
	}
</style>
</head>
<!-- 상품 상세 페이지 -->
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="content-box">
					<div class="main-left">
						<div class="category-wrap">
							이거 > 저거 > 요거
						</div>
						<div class="main-view">
							<div class="main-img-table">
								<ul class="main-ul">
									<li class="main-li" v-for="item in img">
										<a href="javascript:;">
											<img alt="콘텐츠 이미지" :src="item.imgPath+'/'+item.imgName">
										</a>	
									</li>
									<li class="main-li" v-for="item in imgList">
										<a href="javascript:;">
											<img alt="콘텐츠 이미지" :src="item.imgPath+'/'+item.imgName">
										</a>
									</li>
								</ul>
							</div>
							<div class="main-img" v-for="item in img">
								<img alt="썸네일" :src="item.imgPath+'/'+item.imgName">
							</div>
						</div>
					</div>
						<div class="main-box">
							<div class="manufacturer">
								{{product.manufacturer}}
							</div>
							<div class="main-title" >
								{{product.productName}}
							</div>
							<div class="main-csat">
								<span v-for="index in csat.csatAvg"><i class="fa-solid fa-star" style="color: #A782C3;"></i></span><span v-for="index in num"><i class="fa-solid fa-star" style="color: #9097a2;"></i></span>
								{{csat.csatAvg}}({{csat.csatCnt}})
							</div>
							<div class="main-discount">
								{{product.discount}}%
							</div>
							<div class="main-price">
								{{product.productPrice}}원
							</div>
							<div class="main-option">
								<select class="option-box">
									<option v-for="item in option">{{item.optionName}}+({{item.optionPrice}}원)</option>
								</select>
							</div>
							<div class="main-btn-wrap">
								<button class="btn1">장바구니</button>
								<button class="btn2">바로구매</button>
							</div>
						</div>
					</div>
					<div class="nav-box">
						<div class="nav-wrap">
							<div class="product-a"><a href="#product">상품정보</a></div>
							<div class="review-a"><a href="#review">리뷰  <span class="review-span"> {{csat.csatCnt}}</span></a></div>
							<div class="inquiry-a"><a>문의</a></div>
						</div>
					</div>
					<div class="content-box2">
						<div class="content-view">
							<div class="content-title" id="product">
								상품 정보
								<div class="content-text-box">
									<div class="text1">판매자 직거래 주의 안내</div>
									<div>판매자를 사칭하여 현금 입금 유도하는 소비자 피해 사례가 늘고 있습니다.</div>
									<div>판매자와 문자/카톡으로 소통하실 때, 고객분들의 주의를 부탁드리며,</div>
									<div>의심되는 경우 아네시 고객센터로 신고해 주시기 바랍니다.</div>
								</div>
							</div>
							<div class="content-img" v-for="item in imgList2">
								<img alt="콘텐츠이미지" :src="item.imgPath+'/'+item.imgName">
							</div>
							<div class="content-review">
								<div class="review-title" id="review">
									<span class="review-text1">리뷰 </span><span class="review-text2"> {{csat.csatCnt}}</span>
									<button class="review-btn">리뷰쓰기</button>
								</div>
								<div class="csat-box">
									<div class="csat1">
										<span v-for="index in csat.csatAvg"><i class="fa-solid fa-star fa-2x" style="color: #A782C3;"></i></span><span  v-for="index in num"><i class="fa-solid fa-star fa-2x" style="color: #9097a2;"></i></span>
										<span>{{csat.csatAvg}}</span>
									</div>
									<div class="csat2">
										그래프 
									</div>
								</div>
								<div class="review-wrap">
									<div class="review-box" v-for="item in reviewList">
										<div class="review-user">
											<div class="user-nick">{{item.nick}}</div>
										</div>
										<span></span>
										<div class="review-img">
										
										</div>
										<div class="review-content">
										
										</div>
										<div class="review-help">
											<button>도움이 돼요</button> <span></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="recently-viewed">
								최근본상품
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
		productNo : '${map.no}',
		product : {},
		csat : {},
		option : [],
		imgList : [],
		img : [],
		imgList2 : [],
		reviewList : [],
		num : 0
	},// data
	methods : {
		
		fnGetList : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/productSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.product = data.product;
	                }                
	            }); 
		},
		fnAvg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/csatSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.csat = data.csat;
	               		self.num = 5 - self.csat.csatAvg;
	                }                
	            }); 
		},
		fnOption : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/optionSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.option = data.option;
	                }                
	            }); 
		},
		fnImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.imgList = data.imgList;
	                }                
	            }); 
		},
		fnThumbnailImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgThumbnailSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.img = data.img;
	                }                
	            }); 
		},
		fnContentImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgSearch2.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.imgList2 = data.imgList2;
	                }                
	            }); 
		},
		fnReview : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/reviewSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.reviewList = data.reviewList;
	                }                
	            })
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnAvg();
		self.fnOption();
		self.fnImg();
		self.fnThumbnailImg();
		self.fnContentImg();
		self.fnReview();
	}// created
});
</script>