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
    grid-template-columns: 1fr 2fr 2fr 2fr 2fr;
}

/*배너*/
.delivery,
.usedA,
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


.usedA{
  grid-row-start: 1;
  grid-row-end: 2; 
  grid-column-start: 5;
  grid-column-end: 6;
  padding: 7px;
  box-sizing: border-box;
  margin: 10px -41px;
  width: 106%;

}
.usedB,
.usedC{
	float : left;
 	box-sizing :border-box;
 	list-style: none;
 	font-size : 16px;
}

.usedC{
	padding-left : 80px;
}
.product,
.inquiry {
  height: 400px;
}

.change span{
  font-size : 20px;
}
.delivery li,
.usedB li,
.usedC li{
  font-size : 16px;
  margin-bottom : 10px;
}
.review li{
  font-size : 18px;
  margin-bottom : 10px;
}
.delivery span,
.review span,
.product span,
.inquiryTitle,
.usedA span {
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
 width : 20%;
 
}

.delivery{
  grid-row-start: 1;
  grid-row-end: 2; 
  grid-column-start: 2;
  grid-column-end: 5;
  width: 89%;
  
}
.review{
  grid-row-start: 2;
  grid-row-end: 3; 
  grid-column-start: 2;
  grid-column-end: 6;
  width: 97%;
  
}
.product{
  grid-row-start: 3;
  grid-row-end: 5; 
  grid-column-start: 2;
  grid-column-end: 4;	
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
  grid-column-start: 4;
  grid-column-end: 6;	
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
.inquiryC_cont{
	min-height:237px;

}

.inquiryC{
	font-size:20px;
	height:18px;
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

.cursor_pointer{
	cursor :pointer
}

</style>
</head>
<body>
	<div id="admin_first">
	
	 <jsp:include page="adminH.jsp"></jsp:include>
	
			
		<div class="delivery">
			<span>결제/배송/판매액</span>
			<hr>
			<i class="iconA fa-solid fa-truck cursor_pointer" @click="fnMoveDelivery"></i>
				<ul class="deliveryA">
					<li>결제완료</li>
					<li>배송중</li>
					<li>배송준비</li>
					<li>배송완료</li>
				</ul>
				<ul class="deliveryB">
					<li>{{orderList[0].totalCount}}건</li>
					<li>{{orderList[1].totalCount}}건</li>
					<li>{{orderList[2].totalCount}}건</li>
					<li>{{orderList[3].totalCount}}건</li>
				</ul>
			<i class="iconA fa-solid fa-won-sign"></i>
				<ul class="deliveryC">
					
					<li>오늘판매금액</li>
					<li>누적판매금액</li>
					<li>오늘주문건수</li>
					<li>누적주문건수</li>
				</ul>
				<ul class="deliveryD">
					<li>{{numberWithCommas(StatisticsInfo.overallToday)}}원</li>
					<li>{{numberWithCommas(StatisticsInfo.overallTotal)}}원</li>
					<li>{{StatisticsInfo.todayOrders}}건</li>
					<li>{{StatisticsInfo.totalOrders}}건</li>
				</ul>
		
		</div>
		
		<div class="usedA">
			<span>중고상품현황</span>
			<hr>
    		<i class="iconA fa-solid fa-couch cursor_pointer" @click="fnMoveUsed()"></i>
				<ul class="usedB">
					<li>전체</li>
					<li>등록신청</li>
					<li>판매중</li>
					<li>매입거부</li>
				</ul>
				<ul class="usedC">
					<li>{{usedList[1].adminCnt + usedList[2].adminCnt + usedList[0].adminCnt}}건</li>
					<li>{{usedList[1].adminCnt}}건</li>
					<li>{{usedList[2].adminCnt}}건</li>
					<li>{{usedList[0].adminCnt}}건</li>
				</ul>
			
		</div>
			<div class="review">
				<span>리뷰<span class="iTime">최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-comments"></i>
				<ul class="deliveryA">
					<li>전체리뷰</li>
					<li>새로 작성된 리뷰</li>
					<li>평점높은리뷰</li>
					<li>평점낮은리뷰</li>
				</ul>
				<ul class="deliveryB" >
					<li>{{reviewList.length}}건</li>
					<li>{{reviewCnt1}}건</li>
					<li>{{reviewCnt2}}건</li>
					<li>{{reviewCnt3}}건</li>
				</ul>
			
				<span class="revC">
					<li>리뷰 평점 비율</li>
					<img src="\css\image\Admin\review_chart.png">
					<button @click="fnMoveReview" class="cursor_pointer">전체 리뷰 보기 ></button>
				</span>
			</div>
			
			<div class="product">
				<span>상품현황<span class="iTime">최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-chart-line"></i>				
				<ul class="productA">
					<li>판매중</li>
					<li>판매중지</li>
				</ul>
				<ul class="productB">
					<li>{{productList[0].de}}건</li>
					<li>{{productList[1].de}}건</li>
				</ul>
				<ul class="productA">
					<li>품절</li>
					<li>할인중</li>
				</ul>
				<ul class="productB">
					<li>{{productList[2].de}}건</li>
					<li>{{productList2[0].dis}}건</li>
				</ul>
				<br><br><br><br><br><br><br>
				<div>상품현황차트</div>
				<div>카테고리별(6) 판매 차트</div>
			</div>
			
			<div class="inquiry">
				<span class="inquiryTitle">미답변문의<span class="iTime">최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-file-circle-exclamation cursor_pointer" @click="fnInquiry()"></i>
				<ul class="inquiryA">
					<a class="inquiryB"  @click="fnInquiry(1)">상품/배송<span class="inquiryD">{{inquiryCnt1}}</span></a>
					<a class="inquiryB"  @click="fnInquiry(2)">환불/반품/교환<span class="inquiryD">{{inquiryCnt2}}</span></a>
					<a class="inquiryB" @click="fnInquiry(3)">기타<span class="inquiryD">{{inquiryCnt3}}</span></a>
				</ul>
				<div class="inquiryC_cont">
					<div class="inquiryC" v-for="inquiry in inquiryList">
						<span> <i class="fa-solid fa-circle-question" style="color:#5E503F;"></i>{{inquiry.content}}</span>
						<span class="iTime">{{inquiry.cDateTime}}</span>
					</div>
				</div>
				<button @click="fnMoveInquiry()" class="cursor_pointer">문의 관리></button>
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
		orderList:[],
		reviewList:[],
		productList:[],
		productList2:[],
		inquiryList:[],
		usedList:[],
		inquiryCnt:[],
		reviewlow : 0,
		inquiry:"",
		review:"",
		inquiryCnt1:0,
		inquiryCnt2:0,
		inquiryCnt3:0,
		searchOption :"",
		reviewCnt1 : 0,
		reviewCnt2 : 0,
		reviewCnt3 : 0,
		StatisticsInfo : {},

	
		
		
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
                	//문의수
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
                	//결제,배송
                	self.orderList = data.list.order;
                	//중고물품개수 인덱스 0 : N(매입거부) , 1 : W(등록신청), 2 : Y(판매중)
                	self.usedList = data.list.used;
                	//판매물품개수 인덱스 0 : N(판매중) , 1 : S(판매중지), 2 : Y(판매종료)
                	self.productList = data.list.product1;
                	self.productList2 = data.list.product2;
                } 
			})
		},
		//문의리스트
		fnInquiry : function(searchOption){
			var self = this;
			var nparmap = {searchOption : searchOption};
			$.ajax({
                url : "/admin/mainInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.inquiryList = data.list;
                } 
			})
		},
		
		//리뷰리스트
		fnReview : function(searchOption){
			var self = this;
			var nparmap = {searchOption : searchOption};
			$.ajax({
                url : "/admin/mainReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	
                	const currentDate = new Date(); // 현재 시간
                	currentDate.setDate(currentDate.getDate() - 7); // 7일 전 시간
                	self.reviewList.forEach(item => {
	               	    const itemCreateDate = new Date(item.createDate);
	
	               	    if (itemCreateDate > currentDate) {
	               	        self.reviewCnt1++;
	               	    }
	               	 	if (item.csat > 3){
	               	    	self.reviewCnt2++;
	               	    }else {
	               	    	self.reviewCnt3++;
	               	    }
	               	});
                } 
			})
		},
		//판매량
		fnGetStatisticsProduct(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchStatisticsProduct.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.StatisticsInfo = data.info;
                } 
			})
		},
		numberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
		fnMoveReview(){
			location.href="review.do";
		},
		fnMoveDelivery(){
			location.href="delivery.do";
		},
		fnMoveUsed(){
			location.href="used.do";
		},
		fnMoveInquiry(){
			location.href="inquiry.do";
		},
	
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnInquiry();
		self.fnReview();
		self.fnGetStatisticsProduct();

	

	}// created
});
</script>