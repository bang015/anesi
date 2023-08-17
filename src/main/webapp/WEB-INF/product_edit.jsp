<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../../css/mainCss.css" rel="stylesheet">
<link href="../../css/product_edit.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="app">
		<div id="container">
			<div class="containerTitle">상품 조회/수정</div>
			<div class="containerCheckList">
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-border-all fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>전체</div>
						<div><span class="numText">{{productList.length}}</span>건</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>판매중</div>
						<div><span class="numText">{{productList.length - soldOut}}</span>건</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-cart-arrow-down fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>품절</div>
						<div><span class="numText">{{soldOut}}</span>건</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-pause fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>판매중지</div>
						<div><span class="numText">{{productList.length}}</span>건</div> 
					</div>
				</div>
				<div class="checkList">
					<div class="iconBack"><i class="fa-solid fa-ban fa-2xl" style="color: #ffffff;"></i></div>
					<div class="checkListText">
						<div>판매종료</div>
						<div><span class="numText">{{productList.length}}</span>건</div> 
					</div>
				</div>
			</div>
			<div class="containerProductList">
				<div class="productListTitle">
					<span>상품목록 (총 {{productList.length}}개)</span>
				</div>
				<div class="tableBox">
					<div class="table-container">
						<table>
							<tr>
								<th><input type="checkbox"></th>
								<th>상품번호</th>
								<th>상품명</th>
								<th>판매상태</th>
								<th>전시상태</th>
								<th>재고수량</th>
								<th>정가</th>
								<th>할인율</th>
								<th>할인상태</th>
								<th>할인가</th>
								<th>카테고리</th>
								<th>제조사</th>
								<th>제조국</th>
								<th>등록일</th>
								<th>수정일</th>
							</tr>
							<tr v-for="item in productList">
								<td><input type="checkbox"></td>
								<td>{{item.productNo}}</td>
								<td>{{item.productName}}</td>
								<td>{{item.deleteYn == 'N' ? '판매중' : '판매종료'}}</td>
								<td>전시중</td>
								<td>{{item.stock}}</td>
								<td>{{item.productPrice}}</td>
								<td>{{item.discount}}%</td>
								<td>{{item.discountYn == 'Y' ? '할인중' : '정가'}}</td>
								<td v-if="item.discountYn == 'Y'">{{(item.productPrice * ((100-item.discount)/100))}}</td>
								<td v-else></td>
								<td>{{item.categoryName}}</td>
								<td>{{item.manufacturer}}</td>
								<td>{{item.country}}</td>
								<td>{{item.cdatetime}}</td>
								<td>{{item.udatetime}}</td>
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
		productList : [],
		soldOut : 0,
	},// data
	methods : {
		fnGetProduct(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/admin/productList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
					self.productList = data.list;
					for(let i = 0; i < self.productList.length; i++){
						if(self.productList[i].stock == 0){
							self.soldOut++
						}
					}
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetProduct();
	}// created
});
</script>