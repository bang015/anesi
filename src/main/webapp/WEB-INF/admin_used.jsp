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
<link href="../css/product_edit.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>관리자센터 :: 중고관리</title>
<style>
.used{
	background: white;
	color: #5E503F;
	border-radius: 10px 0px 0px 10px;
}
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle cursorPointer" @click="fnReload">중고상품 관리</div>
			<div class="containerCheckList">
				<div class="checkList cursorPointer" @click="fnChangFlg('')">
					<div class="iconBack"><i class="fa-solid fa-border-all fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>전체</div>
						<div><span class="numText">{{usedW+usedY+usedN}}</span>건</div> 
					</div>
				</div>
				<div class="checkList cursorPointer" @click="fnChangFlg('W')">
					<div class="iconBack"><i class="fa-solid fa-circle-up fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>등록신청</div>
						<div><span class="numText">{{usedW}}</span>건</div> 
					</div>
				</div>
				<div class="checkList cursorPointer" @click="fnChangFlg('Y')">
					<div class="iconBack"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>판매중</div>
						<div><span class="numText">{{usedY}}</span>건</div> 
					</div>
				</div>
				<div class="checkList cursorPointer" @click="fnChangFlg('N')">
						<div class="iconBack"><i class="fa-solid fa-ban fa-2xl" style="color: #ffffff;"></i></div>
						<div class="checkListText">
							<div>매입거부</div>
							<div><span class="numText">{{usedN}}</span>건</div> 
						</div>
					</div>
			</div>
			<div class="containerInquiry">
				<div class="tableBox">
					<div class="table-container">	
						<table>
							<tr>
								<th>접수일</th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>등록 유저</th>
								<th>매입 여부</th>
							</tr>
							<tr v-for="(item,index) in usedList" v-if="usedflg == item.purchase || usedflg == ''">
								<td>{{item.usedPCdatetime.substring(0, 11)}}</td>
								<td>{{item.usedPNo}}</td>
								<td @click="fnMove(item.usedPNo)" class="cursorPointer">{{item.usedPName}}</td>
								<td>{{item.userName}}</td>
								<td>{{item.purchaseName}}</td>
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
		usedList : [],
		usedCnt : 0,
		usedW : 0,
		usedY : 0,
		usedN : 0,
		usedflg : '',
	},// data
	methods : {
		fnGetUsedList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchUsedList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.usedList = data.list;
                	self.usedCnt = self.usedList.length;
                	self.usedList.map(item =>{
                		if(item.purchase == 'W'){
                			self.usedW++;
                			item.purchaseName = '신청';
                		} else if(item.purchase == 'Y'){
                			self.usedY++;
                			item.purchaseName = '수락';
                		} else{
                			self.usedN++;
                			item.purchaseName = '거부';
                		}
                	})
                } 
			})
		},
		fnReload(){
			location.reload();
		},
		fnMove(usedPNo){
			$.pageChange("/used/inquireView.do", {usedPNo : usedPNo});
		},
		fnChangFlg(type){
			var self = this;
			self.usedflg = type;
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetUsedList();
	}// created
});
</script>