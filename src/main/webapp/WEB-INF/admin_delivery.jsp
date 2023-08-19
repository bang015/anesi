<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<link href="../css/admin_delivery.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle" @click="fnReload">배송 관리</div>
			<div class="containerCheckList">
				<div class="checkList" @click="fnChangeList('1')">
					<div class="iconBack"><i class="fa-solid fa-credit-card fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>결제완료</div>
						<div><span class="numText">{{paymentList.length}}</span>건</div> 
					</div>
				</div>
				<div class="checkList" @click="fnChangeList('2')">
					<div class="iconBack"><i class="fa-solid fa-truck-ramp-box fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>배송대기</div>
						<div><span class="numText">{{waitList.length}}</span>건</div> 
					</div>
				</div>
				<div class="checkList" @click="fnChangeList('3')">
					<div class="iconBack"><i class="fa-solid fa-truck fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>배송중</div>
						<div><span class="numText">{{shippingList.length}}</span>건</div> 
					</div>
				</div>
				<div class="checkList" @click="fnChangeList('4')">
					<div class="iconBack"><i class="fa-solid fa-circle-check fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>배송완료</div>
						<div><span class="numText">{{completeList.length}}</span>건</div> 
					</div>
				</div>
			</div>
			<div class="deliveryListBox">
				<div class="buttonBox">
					<button class="btn1 btn2" v-if="listNo == 1" @click="fnUpdateDelivery('2')">선택물품<br>결제확인</button>	
					<button class="btn1 btn2" v-if="listNo == 2" @click="fnUpdateDelivery('3')">선택물품 배송</button>
					<button class="btn1 btn2" v-if="listNo == 3" @click="fnUpdateDelivery('4')">선택물품<br>배송완료</button>
				</div>
				<div class="tableBox">
						<div class="table-container">
							<table>
								<tr>
									<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
									<th>주문번호</th>
									<th>상품명(옵션명)</th>
									<th>구매수량</th>
									<th>수취인</th>
									<th>배송지(우편번호)</th>
									<th>쉬취인 연락처</th>
									<th>결제일</th>
									<th>진행상태(최종처리일)</th>
								</tr>
								<tr v-for="item in orderList2" v-if="item.deliverySit == listNo || listNo == 0">
									<td><input type="checkbox" v-model="checkList" :value="item.orderNo" @change="updateAllCheck"></td>
									<td>{{item.paymentNo}}</td>
									<td>{{item.productName}}({{item.optionName}})</td>
									<td>{{item.cnt}}</td>
									<td>{{item.receiptName}}</td>
									<td>{{item.addr}} {{item.addr2}}({{item.zipcode}})</td>
									<td>{{item.receiptPhone}}</td>
									<td>{{item.createDate}}</td>
									<td>{{item.deliveryName}}</td>
								</tr>
							</table>
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
		orderList : [],
		orderList2 : [],
		paymentList : [],
		waitList : [],
		shippingList : [],
		completeList : 0,
		checkList : [],
		allChecked : false,
		listNo : 0,
		
	},// data
	methods : {
		fnGetOrderList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/orderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	self.paymentList = self.orderList.filter(item => item.deliverySit == 1);
                	self.waitList = self.orderList.filter(item => item.deliverySit == 2);
                	self.shippingList = self.orderList.filter(item => item.deliverySit == 3);
                	self.completeList = self.orderList.filter(item => item.deliverySit == 4);
                	self.orderList2 = self.orderList.map(item => {
                		if(item.deliverySit == 1){
                			 return { ...item, deliveryName: '결제완료' };
                		} else if(item.deliverySit == 2){
                			 return { ...item, deliveryName: '배송준비' };
                		} else if(item.deliverySit == 3){
                			 return { ...item, deliveryName: '배송중' };
                		} else if(item.deliverySit == 4){
                			 return { ...item, deliveryName: '배송완료' };
                		}
                	})
                	console.log(self.orderList2);
                	
                }
            });
		},
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.orderList2.length) {
				self.checkList = [];
		    } else {
			    self.checkList = self.orderList2.map(item => item.orderNo);
		    }
		},
		// 체크박스 체크
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.orderList2.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		fnChangeList(num){
			var self = this;
			self.listNo = Number(num);
		},
		fnReload(){
			location.reload();
		},
		fnUpdateDelivery(sit){
			var self = this;
			var checkList = JSON.stringify(self.checkList);
			var nparmap = {	checkList, sit};
			$.ajax({
                url : "/admin/editDelivery.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	
                }
			});
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetOrderList();
	}// created
});
</script>