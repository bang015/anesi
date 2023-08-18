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
<title>Insert title here</title>
<style>

.admin_header {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 10px 20px;
  background-color: #e0d4c6;
  width : 100%;
  height: 100px;  
}

.admin_header a {
  margin-left: 10px;
}
.admin_header a:hover {
 color : #424242;
 font-weight:bold;
}

.flex-container1 {
 	display:grid;
    grid-template-rows: 1fr 1fr 2fr ;
    grid-template-columns: 1fr 4fr 4fr;
}


/*사이드메뉴 */
.side_menu{
  grid-row-start: 1;
  grid-row-end: 4; 
  grid-column-start: 1;
  grid-column-end: 2;
  background-color: #cec9c3;
  
}
.side_menu div{
 font-size : 15px;
 margin-left: 20px ;
 padding : 15px;
}
.side_menu div:hover{
 font-weight:bold;
}
/*배너*/
.delivery,
.change,
.review,
.customer,
.inquiry {
  width: 93%;
  height: 200px;
  border-radius: 8px;
  border: 1px solid #424242;
  padding: 7px;
  box-sizing: border-box;
  margin: 10px 20px;
}

.customer,
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
.customer span,
.inquiry span{
  font-size : 20px;
}
.review span span,
.customer span span,
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
	color : #5E503F
}

.deliveryA,
.deliveryB,
.deliveryC,
.deliveryD,
.revC{
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
.customer{
  grid-row-start: 3;
  grid-row-end: 5; 
  grid-column-start: 2;
  grid-column-end: 3;	
  width: 93%;
  
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
    width: 76%;
    list-style: none;
    font-size: 17px;
    text-align: center;
    padding: 18px;
    border-left: 1px solid #e0d4c6;
}

.inquiryB:hover {
  border-top : 3px solid #5E503F;
  color : #5E503F;
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

.inquiry{
  

}




/* *{
border:1px solid black;
} */
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="admin_first">
	
	 <jsp:include page="adminH.jsp"></jsp:include>
	
			
		<div class="delivery">
			<span>주문/배송</span>
			<hr>
			
			<i class="iconA fa-solid fa-gift"></i>
				<ul class="deliveryA">
					<li>결제대기</li>
					<li>신규주문</li>
					<li>오늘출발</li>
					<li>예약구매</li>
				</ul>
				<ul class="deliveryB">
					<li>3건</li>
					<li>1건</li>
					<li>0건</li>
					<li>0건</li>
				</ul>
		
			<i class="iconA fa-solid fa-truck"></i>
				<ul class="deliveryC">
					<li>배송중</li>
					<li>배송준비</li>
					<li>배송완료</li>
				</ul>
				<ul class="deliveryD">
					<li>3건</li>
					<li>1건</li>
					<li>0건</li>
				</ul>
			
		
		</div>
		
		<div class="delivery">
			<span>취소요청/반품/교환</span>
			<hr>
		
    		<i class="iconA fa-solid fa-arrow-rotate-left"></i>
				<ul class="deliveryA">
					<li>취소요청</li>
					<li>반품요청</li>
					<li>교환요청</li>
					<li></li>
				</ul>
				<ul class="deliveryB">
					<li>3건</li>
					<li>1건</li>
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
					<li>새로 작성된 리뷰</li>
					<li>평점낮은리뷰</li>
					<li>리뷰이벤트</li>
				</ul>
				<ul class="deliveryB">
					<li>70건</li>
					<li>1건</li>
					<li>0건</li>
				</ul>
			
				<span class="revC">
					<li>리뷰 평점 비율</li>
					<img src="\css\image\Admin\review_chart.png">
					<button>전체 리뷰 보기 ></button>
				</span>
		
			</div>
			
			<div class="customer">
				<span>상품현황<span>최근 1주일기준</span></span>
				<hr>
				
				<i class="iconA fa-solid fa-user"></i>				
				<ul class="deliveryA">
					<li>새로 작성된 리뷰</li>
					<li>평점낮은리뷰</li>
					<li>리뷰이벤트</li>
				</ul>
				<ul class="deliveryB">
					<li>70건</li>
					<li>1건</li>
					<li>0건</li>
				</ul>
			</div>
			
			<div class="inquiry">
				<span>미답변문의<span>최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-file-circle-exclamation"></i>
				<ul class="inquiryA">
					<a class="inquiryB">상품/배송</a>
					<a class="inquiryB">환불/반품/교환</a>
					<a class="inquiryB">기타</a>
				</ul>
				
				<div class="inquiryC">
					<span>Q. 하단의 길이가 몇센티인가요?</span>
					2023.02.05
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

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>