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
			<div class="productTitleAdd"><h1>상품 등록</h1></div> 
			<div class="box"><!-- 카테고리 영역 -->
				<div>카테고리</div>
				<div>
					<div></div>
					<div v-if=""></div>
				</div>
			</div>
			<div class="box"><!-- 상품 내용 -->
				<div><h3>상품 정보</h3> <span class="err"> {{errMsg1}}</span></div>
				<div>
					<div>상품 이름</div>
					<input v-model="product.productName">
				</div>
				<div>
					<div>제조사</div>
					<input v-model="product.manufacturer">
				</div>
				<div>
					<div>제조국</div>
					<input v-model="product.country">
				</div>
				<div>
					<div>상품 가격</div>
					<input v-model="product.productPrice">
				</div>
			</div>
			<div class="box"><!-- 옵션 추가 -->
				<div><h3>옵션</h3></div>
				<button @click="fnOptionAdd" class="btn">옵션 추가</button>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">옵션명</th>
						<th class="tdthsy">가격</th>
						<th class="tdthsy">재고량</th>
						<th class="tdthsy">삭제</th>
					</tr>
					<tr v-if="optionList.length == 0">
						<td colspan="4" class="tdthsy">옵션을 추가해 주세요</td>
					</tr>
					<tr v-for="(item, index) in optionList">
						
						<td class="tdthsy"><input v-model="optionList[index].optionName"></td>
						<td class="tdthsy"><input v-model="optionList[index].productStock"></td>
						<td class="tdthsy"><input v-model="optionList[index].optionPrice"></td>
						<td class="tdthsy"><button @click="fnOptionDelete(index)" class="delBtn">삭제</button></td>
				</table>
			</div>
			<div class="box"> <!-- 상품 이미지 등록 -->
				<div><h3>상품 이미지<span class="guide"> 상품 이미지는 최대 5개 입니다.</span></h3></div>
				<button @click="fnProductImgAdd" class="btn">이미지 추가</button><span class="err">{{errMsg2}}</span>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">대표 이미지</th>
						<th class="tdthsy">이미지 이름</th>
						<th class="tdthsy">이미지 파일</th>
						<th class="tdthsy">삭제</th>
					</tr>
					<tr v-if="productImgList.length == 0">
						<td colspan="4" class="tdthsy">이미지를 추가해 주세요</td>
					</tr>
					<tr v-for="(item, index) in productImgList">
						<td class="tdthsy"><input type="radio" v-model="item.thumbnail" value="Y" name="thumbnail"></td>
						<td class="tdthsy"><input v-model="item.orgName"></td>
						<td class="tdthsy"><label class="fileBox">파일선택<input type="file" @change="fnOnFileChange" class="fileBtn"></label></td>
						<td class="tdthsy"><button @click="fnProductImgDel(index)" class="delBtn">삭제</button></td>
					</tr>
				</table>
				<div class="imgDiv">
					<span v-for="item in imageList"><img v-if="item" :src="item" alt="Image preview" class="pvImg"></span>
				</div>
			</div>
				<div class="box"> <!-- 상품 상세설명 이미지 등록 -->
				<div><h3>상품 상세설명 이미지</h3><span class="guide"></span></div> 
				<button @click="fnContentImgAdd" class="btn">이미지 추가</button>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">이미지 파일</th>
						<th class="tdthsy">삭제</th>
					</tr>
					<tr v-if="contentImgList.length == 0">
						<td colspan="4" class="tdthsy">이미지를 추가해 주세요</td>
					</tr>
					<tr v-for="(item, index) in contentImgList">
						<td class="tdthsy"><input type="file"></td>
						<td class="tdthsy"><button @click="fnContentImgDel(index, event)" class="delBtn">삭제</button></td>
					</tr>
				</table>
			</div>
			<button @click="" class="addBtn">판매등록</button>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		errMsg1 : "", // 에러메시지1
		errMsg2 : "", // 에러메시지1
		product : {	//상품 맵
			productName : "",
			productPrices : "",
			manufacturer : "",
			country : ""
		},
		optionList : [], // 옵션 리스트
		productImgList : [], // 상품 이미지 리스트
		contentImgList : [], // 상품 상세이미지 리스트
		imageList : [], // 상품 이미지리스트
		categoryList1 : [],
		categoryList2 : []
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
			self.imageList.splice(index,1);
			self.errMsg2 = "";
		},
		fnProductImgAdd(){
			var self = this;
			if(self.productImgList.length < 5){
				self.productImgList.push({orgName : "", thumbnail : "N"});
			} else {
				self.errMsg2 = '상품 이미지는 최대 5개까지 입니다.';
			}
		},
		fnContentImgAdd(){
			var self = this;
			self.contentImgList.push({orgName : "", thumbnail : "D"});
		},
		fnContentImgDel(index){
			var self = this;
			self.contentImgList.splice(index,1);
		},
		fnOnFileChange(event, index) {
			var self = this;
			self.errMsg2 = "";
		    const file = event.target.files[0];	
		    if (file) {
		      self.imageList.splice(index,1)
		      self.imageList.push(URL.createObjectURL(file));
		    }
		},
		fnGetcategoryList1(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "category.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.categoryList1 = data.list;
                	console.log(self.categoryList1)
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetcategoryList1();
	}// created
});
</script>