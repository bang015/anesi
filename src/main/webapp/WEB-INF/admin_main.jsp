<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/adminH.css" rel="stylesheet">
<meta charset="UTF-8">
<title>관리자센터</title>
<style>


.flex-container1 {
 	display:grid;
    grid-template-rows: 1fr 1fr 2fr ;
    grid-template-columns: 1fr 4fr 4fr;
}

/*배너*/
.delivery,
.change,
.review,
.product,
.inquiry {
  width: 93%;
  height: 200px;
  border-radius: 8px;
  border: 1px solid #424242;
  padding: 7px;
  box-sizing: border-box;
  margin: 10px 20px;
}

.product,
.inquiry {
  height: 400px;
}

.delivery span{
  font-size : 20px;
}

.change span{
  font-size : 20px;
}
.delivery li{
  font-size : 16px;
  margin-bottom : 10px;
}
.review li{
  font-size : 20px;
  margin-bottom : 10px;
}

.review span,
.product span,
.inquiryTitle {
  font-size : 20px;
}
.review span span,
.product span span,
.inquiry span span{
  font-size : 14px;
  margin-left : 10px;
}
.iconA {
	float : left;
	width : 7%;
	box-sizing :border-box;
	padding : 20px;
	font-size : 35px;
	color : #5E503F;
}

.deliveryA,
.deliveryB,
.deliveryC,
.deliveryD,
.revC,
.productA,
.productB{
 float : left;
 box-sizing :border-box;
 list-style: none;
}

.deliveryA,
.deliveryC{
 width : 25%;
}

.revC{
 width : 50%;

}
.deliveryB{
 width : 15%;
 border-right: 2px solid ;
 
}
.deliveryD{
 width : 15%;
 
}

.review{
  grid-row-start: 2;
  grid-row-end: 3; 
  grid-column-start: 2;
  grid-column-end: 5;
  width: 97%;
  
}
.product{
  grid-row-start: 3;
  grid-row-end: 5; 
  grid-column-start: 2;
  grid-column-end: 3;	
  width: 93%;
}

.productA{
  width: 23%;
 margin-left : 10px;
}

.productB{
  width: 20%;
}

.productA li,
.productB li{
  font-size: 18px;
  margin-bottom : 6px;

}
.inquiry{
  grid-row-start: 3;
  grid-row-end: 5; 
  grid-column-start: 3;
  grid-column-end: 5;	
  width: 93%;
}

.revC img {
	width : 100%;
	height : 40px;
}
.revC li{
  font-size : 20px;
  list-style: none;
  text-align : center;
  margin-bottom : 5%;
  margin-top: 1%;
}
.revC button,
.inquiry button{
  	margin: 0px 170px;
    width: 40%;
    height: 40px;
    font-family: 'Pretendard-Regular';
    background: #5E503F;
    color: white;
    border-radius: 4px;
   
}

.inquiryA{
  margin-top: 0px;
  display : grid;
  grid-template-rows: 1fr ;
  grid-template-columns: 1fr 1fr 1fr;
}
.inquiryB {
    width: 77%;
    height : 28px;
    list-style: none;
    font-size: 17px;
    text-align: center;
    padding: 14px;
    border-left: 1px solid #e0d4c6;
}

.inquiryB:hover {
  background : #5E503F;
  color :#fff;
}

.inquiryB:nth-child(1){
	grid-column-start: 1;
	grid-column-end: 2;
	grid-row-start: 1;
	grid-row-end: 2;	
}
.inquiryB:nth-child(2){
	grid-column-start: 2;
	grid-column-end: 3;
	grid-row-start: 1;
	grid-row-end: 2;	
}
.inquiryB:nth-child(3){
	grid-column-start: 3;
	grid-column-end: 4;
	grid-row-start: 1;
	grid-row-end: 2;	
}

.inquiryD{
	border-radius : 50%;
	color : tomato;
}
.inquiryC{
	font-size:20px;
	height:20px;
	margin-top:1px;
	padding :10px;
	margin-left : 10px;
}
.iTime{
	font-size : 15px;
	color : gray;
}
.inquiry button{
   bottom : 10px;
}

</style>
</head>
<body>
	<div id="admin_first">
	
	 <jsp:include page="adminH.jsp"></jsp:include>
	
			
		<div class="delivery">
			<span>결제/배송/판매액</span>
			<hr>
			<i class="iconA fa-solid fa-truck"></i>
				<ul class="deliveryA">
					<li>결제완료</li>
					<li>배송중</li>
					<li>배송준비</li>
					<li>배송완료</li>
				</ul>
				<ul class="deliveryB">
					<li>{{}}건</li>
					<li>{{deliveryList.length}}건</li>
					<li>1건</li>
					<li>0건</li>
				</ul>
			<i class="iconA fa-solid fa-won-sign"></i>
				<ul class="deliveryC">
					
					<li>오늘판매금액</li>
					<li>누적판매금액</li>
					<li>오늘주문건수</li>
					<li>누적주문건수</li>
				</ul>
				<ul class="deliveryD">
					<li>1건</li>
					<li>0건</li>
					<li>0건</li>
					<li>0건</li>
				</ul>
		
		</div>
		
		<div class="delivery">
			<span>중고상품현황</span>
			<hr>
    		<i class="iconA fa-solid fa-couch"></i>
				<ul class="deliveryA">
					<li>전체</li>
					<li>등록신청</li>
					<li>판매중</li>
					<li>매입거부</li>
				</ul>
				<ul class="deliveryB">
					<li>3건</li>
					<li>1건</li>
					<li>0건</li>
					<li>0건</li>
				</ul>
			
			<i class="iconA fa-solid fa-won-sign"></i>				
			<ul class="deliveryC">
					<li>구매확정</li>
					<li>오늘정산</li>
					<li>정산금</li>
				</ul>
				<ul class="deliveryD">
					<li>3건</li>
					<li>1건</li>
					<li>0건</li>
				</ul>
		</div>
			<div class="review">
				<span>리뷰<span>최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-comments"></i>
				<ul class="deliveryA">
					<li>전체리뷰</li>
					<li>새로 작성된 리뷰</li>
					<li>평점높은리뷰</li>
					<li>평점낮은리뷰</li>
				</ul>
				<ul class="deliveryB"  >
					<li>{{reviewList.length}}건</li>
					<li>0건</li>
					<li>{{reviewlow}}건</li>
					<li>{{reviewlow}}건</li>
				</ul>
			
				<span class="revC">
					<li>리뷰 평점 비율</li>
					<img src="\css\image\Admin\review_chart.png">
					<button>전체 리뷰 보기 ></button>
				</span>
			</div>
			
			<div class="product">
				<span>상품현황<span>최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-chart-line"></i>				
				<ul class="productA">
					<li>판매중</li>
					<li>판매중지</li>
				</ul>
				<ul class="productB">
					<li>70건</li>
					<li>1건</li>
				</ul>
				<ul class="productA">
					<li>품절</li>
					<li>할인중</li>
				</ul>
				<ul class="productB">
					<li>0건</li>
					<li>0건</li>
				</ul>
				<br><br><br><br><br><br><br>
				<div>상품현황차트</div>
				<div>카테고리별(6) 판매 차트</div>
			</div>
			
			<div class="inquiry">
				<span class="inquiryTitle">미답변문의<span>최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-file-circle-exclamation"></i>
				<ul class="inquiryA">
					<a class="inquiryB">상품/배송<span class="inquiryD">{{inquiryCnt1}}</span></a>
					<a class="inquiryB">환불/반품/교환<span class="inquiryD">{{inquiryCnt2}}</span></a>
					<a class="inquiryB">기타<span class="inquiryD">{{inquiryCnt3}}</span></a>
				</ul>
				
				<div class="inquiryC" v-for="inquiry in inquiryList">
					<span >Q.{{inquiry.content}}</span>
					<span class="iTime">{{inquiry.cDateTime}}</span>
				</div>
				<button>문의 관리 ></button>
			</div>
			
    	</div><!-- 컨테이너 end-->
	</div>
</body>
</html>

<script>
var app = new Vue({
	el : '#admin_first',
	data : {
		list :[],
		deliveryList:[],
		reviewList:[],
		productList:[],
		inquiryList:[],
		inquiryCnt:[],
		reviewlow : 0,
		inquiry:"",
		inquiryCnt1:0,
		inquiryCnt2:0,
		inquiryCnt3:0
	},// data
	methods : {
		fnGetList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/mainList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.inquiryList = data.list.inquiry;
                	self.inquiryCnt = data.list.inquiryCnt;
                	self.inquiryCnt.forEach(item => {
                		if(item.inquiryCategory == '상품' || item.inquiryCategory == '배송' ){
                			self.inquiryCnt1 += item.inqCnt;
                		}else if(item.inquiryCategory == '환불' || item.inquiryCategory == '반품' || item.inquiryCategory == '교환'){
                			self.inquiryCnt2 += item.inqCnt;
                		}else{
                			self.inquiryCnt3 += item.inqCnt;
                		}
                		
                		
                	})
                	
                } 
			})
		},
	
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});
</script>