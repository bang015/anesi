<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/product_add.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="app">
		<div id="container">
			<div>상품 등록</div>
			<div><!-- 카테고리 영역 -->
				<div>카테고리</div>
				<div>
					<div></div>
					<div v-if=""></div>
				</div>
			</div>
			<div><!-- 상품 내용 -->
				<div>상품 정보</div>
				<div>
					<label>
						<span>상품 이름</span>
						<input v-model="productName">
					</label>
				</div>
				<div>
					<label>
						<span>제조사</span>
						<input v-model="productPrice">
					</label>
				</div>
				<div>
					<label>
						<span>상품 가격</span>
						<input v-model="productPrice">
					</label>
				</div>
			</div>
			<div><!-- 옵션 추가 -->
				<div>옵션</div>
				<table>
					<tr>
						<th>옵션명</th>
						<th>가격</th>
						<th>재고량</th>
					</tr>
					<tr v-for="">
						<td><input v-mode="option.optionName"></td>
						<td><input v-mode="option.optionName"></td>
						<td><input v-mode="option.optionName"></td>
					</tr>
					<tr v-if="">
					
					</tr>
				</table>
				<button @click="fnOptionAdd">옵션 추가</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		productName : ""
		option : {
			optionName : "", //옵션 이름
			productStock : "", // 재고량
			optionPrice : "",  // 옵션 가격
		}
		selectOption
	},// data
	methods : {
		fnOptionAdd(){ //옵션 추가 메서드
			var self = this;
			var param = {};
			$.ajax({
                url : "option/add.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 

                }
            }); 
		}
		fnProduct(){
			var self = this;
			var param = {};
			$.ajax({
                url : "product/add.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
					
                }
            }); 
		}
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>