<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/order.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<h1 class="orTitle">주문/결제</h1>
			<div class="amount">
				<div class="payment">
					<div class="amountBox">
						<h2 class="moneyText">결제 금액</h2>
						<div>
							<div class="orNameText">총 상품 금액<span class="allMoneyText">0000원</span></div>
							<div class="orNameText">배송비<span class="allMoneyText">3000원</span></div>
							<div class="orNameText">쿠폰 사용<span class="allMoneyText">0000원</span></div>
						</div>
						<div class="FinalPaymentAmount">최종 결제 금액<span class="allMoneyText"><span>0000</span> 원</span></div>
					</div>
					<div class="orTerms">
						<div>
							<input type="checkbox">
							<span>아래 내용에 모두 동의합니다.(필수)</span>
						</div>
						<div>
							<div>
								<input type="checkbox">
								<span>개인정보 수집 이용 및 제 3자 제공 동의 (필수)</span>
							</div>
							<div>
								<input type="checkbox">
								<span>결제대행 서비스의 이용약관 동의 (필수)</span>
							</div>							
						</div>
					</div>
				</div>
				<button class="orBtuStyle">00,000원 결제하기</button>
			</div>
			<div class="test"></div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>	
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