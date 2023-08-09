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
						<input v-model="product.productName">
					</label>
				</div>
				<div>
					<label>
						<span>제조사</span>
						<input v-model="product.manufacturer">
					</label>
				</div>
				<div>
					<label>
						<span>상품 가격</span>
						<input v-model="product.productPrice">
					</label>
				</div>
			</div>
			<div><!-- 옵션 추가 -->
				<div>옵션</div>
				<table>
					<tr>
						<th class="tdthsy">옵션명</th>
						<th class="tdthsy">가격</th>
						<th class="tdthsy">재고량</th>
						<th class="tdthsy">삭제</th>
					</tr>
					<tr v-if="optionList.length == 0">
						<td colspan="4" class="tdthsy">옵션을 넣어주세요</td>
					</tr>
					<tr v-for="(item, index) in optionList">
						
						<td class="tdthsy"><input v-model="optionList[index].optionName"></td>
						<td class="tdthsy"><input v-model="optionList[index].productStock"></td>
						<td class="tdthsy"><input v-model="optionList[index].optionPrice"></td>
						<td class="tdthsy"><button @click="fnOptionDelete(index)">삭제</button></td>
					</tr>
					
					</tr>
				</table>
				<button @click="fnOptionAdd">옵션 추가</button>
			</div>
			<div> <!-- 상품 이미지 등록 -->
				<div>상품 이미지 등록</div>
				<table>
					<tr>
						<th class="tdthsy">대표이미지</th>
						<th class="tdthsy">이미지이름</th>
						<th class="tdthsy">첩부파일 넣을곳</th>
						<th class="tdthsy">삭제</th>
					</tr>
					<tr v-for="(item, index) in productImgList">
						<td class="tdthsy"><input type="radio" v-model="item.thumbnail" value="Y" name="thumbnail"></td>
						<td class="tdthsy"><input v-model="item.orgName"></td>
						<td class="tdthsy"><input type="file"></td>
						<td class="tdthsy"><button @click="fnProductImgDel(index)">삭제</button></td>
					</tr>
				</table>
				<button @click="fnProductImgAdd">이미지 추가</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		product : {	//상품 맵
			productName : "",
			productPrices : "",
			manufacturer : ""
		},
		optionList : [], // 옵션 리스트
		productImgList : [] // 상품 이미지 리스트
	},// data
	methods : {
		fnOptionAdd(){ //옵션 추가 메서드
			var self = this;
			self.optionList.push({optionName : "", productStock : "", optionPrice : "",});
		},
		fnOptionDelete(index){
			var self = this;
			self.optionList.splice(index,1);
		},
		fnProductImgDel(index){
			var self = this;
			self.productImgList.splice(index,1);
		},
		fnProductImgAdd(){
			var self = this;
			self.productImgList.push({orgName : "", thumbnail : "N"});
		}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>