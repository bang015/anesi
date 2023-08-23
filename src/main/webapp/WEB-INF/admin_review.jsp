<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/product_edit.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>리뷰 관리</title>
<style>


.review2{
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
			<div class="containerTitle cursorPointer" @click="fnReload">리뷰 관리</div>
			<div class="containerInquiry">
				<div class="btnBox">
					<button class="btn1 btn2 btn3" @click="fnRemoveReview">선택삭제</button>
				</div>
				<div class="tableBox">
					<div class="table-container">	
						<table>
							<tr>
								<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
								<th>리뷰번호</th>
								<th>상품명(옵션명)</th>
								<th>내용</th>
								<th><div>리뷰 이미지</div>(클릭)</th>
								<th>작성자</th>
								<th>만족도</th>
								<th>도움</th>
								<th>작성일</th>
							</tr>
							<tr v-for="(item,index) in reviewList">
								<td><input type="checkbox" v-model="checkList" :value="item.rNo" @change="updateAllCheck"></td>
								<td>{{item.rNo}}</td>
								<td @click="fnMoveProduct(item.productNo)" class="cursorPointer"><div>{{item.productName}}</div>{{item.optionName}}</td>
								<td>{{item.content}}</td>
								<td v-if="item.rImgPath != undefined" class="cursorPointer"><img alt="" :src="item.rImgPath+'/'+item.rImgName" class="imgSize" @click="openScrapModal(item.rImgPath+'/'+item.rImgName)"></td>
								<td v-else>-</td>
								<td>{{item.nick}}</td>
								<td>{{item.csat}}</td>
								<td>{{item.help}}</td>
								<td>{{item.createDate}}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal cursorPointer" v-if="showScrapModal" @click="closeModal">
        	<img alt="" :src="imgPath" >
        </div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		reviewList : [],
		showScrapModal : false,
		imgPath : '',
		checkList : [],
		allChecked : false,
		
	},// data
	methods : {
		fnGetReviewList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchReviewList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	console.log(self.reviewList);
                } 
			})
		},
		fnReload(){
			location.reload();
		},
		// 모달열기
		openScrapModal: function(imgPath) {
			var self = this;
			self.imgPath = imgPath;
			self.showScrapModal = true;
		},
		// 모달 닫기
		closeModal: function() {
			var self = this;
			self.showScrapModal = false;
		},
		// 올체크
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.reviewList.length) {
				self.checkList = [];
		    } else {
			    self.checkList = self.reviewList.map(item => item.rNo);
		    }
		},
		// 체크박스 체크
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.reviewList.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		fnRemoveReview(){
			var self = this;
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			var checkList = JSON.stringify(self.checkList);
			var nparmap = {	checkList};
			$.ajax({
                url : "/admin/removeReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.fnReload();
                }
            });
		},
		fnMoveProduct(productNo){
			 $.pageChange("/product/view.do",{no : productNo});
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetReviewList();
	}// created
});
</script>