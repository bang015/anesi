<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
				<div><h3>카테고리</h3><span class="err"> {{errMsg5}}</span></div>
				<div class="categoryAllBox">
					<div class="category1">
						<a v-for="item in categoryList1" class="categoryBox" @click="fnGetcategoryList2(item)">
						    <span v-if="category1No == item.categoryNo" class="categoryNo">{{item.categoryName}}</span>
						    <span v-else>{{item.categoryName}}</span>
							<span><i class="fa-solid fa-greater-than fa-2xs icon1" style="color: #ccc"></i></span>
						</a>
					</div>
					<div class="category2" v-if="categoryList2.length != 0">
						<a v-for="item in categoryList2" class="categoryBox" @click="fnSetCategory(item)">
							<span v-if="product.category == item.categoryNo" class="categoryNo">{{item.categoryName}}</span>
							<span v-else>{{item.categoryName}}</span>
						</a>
					</div>
				</div>
				<div>선택한 카테고리 : {{category1Name}} > {{category2Name}}</div>
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
					<input v-model="product.productPrices">
				</div>
				<div>
					<div>할인율</div>
					<input v-model="product.duscount">
				</div>
			</div>	
			<div class="box"><!-- 옵션 추가 -->
				<div><h3>옵션<span class="guide"> 상품 옵션은 최대 5개 입니다.</span></h3></div>
				<button @click="fnOptionAdd" class="btn">옵션 추가</button><span class="err">{{errMsg3}}</span>
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
				<table class="tableStyle productImg">
					<tr>
						<th class="tdthsy">대표 이미지</th>
						<th class="tdthsy">이미지 이름</th>
						<th class="tdthsy">이미지 파일</th>
						<th class="tdthsy">삭제</th>
						<th class="tdthsy">이미지</th>
					</tr>
					<tr v-if="productImgList.length == 0">
						<td colspan="4" class="tdthsy">이미지를 추가해 주세요</td>
					</tr>
					<tr v-for="(item, index) in productImgList">
						<td class="tdthsy"><input type="radio" v-model="item.thumbnail" value="Y" name="thumbnail"></td>
						<td class="tdthsy"><input v-model="item.orgName"></td>
						<td class="tdthsy"><label class="fileBox">파일선택<input type="file" @change="fnOnFileChange($event, index)" class="fileBtn"></label></td>
						<td class="tdthsy"><button @click="fnProductImgDel(index)" class="delBtn">삭제</button></td>
						<td class="imgDiv"><img v-if="imageList[index]" :src="imageList[index]" alt="Image preview" class="pvImg"></td>
					</tr>
				</table>
			</div>
				<div class="box"> <!-- 상품 상세설명 이미지 등록 -->
				<div><h3>상품 상세설명 이미지<span class="guide"> 상품 상세 이미지는 최대 5개 입니다.</span></h3><span class="guide"></span></div> 
				<button @click="fnContentImgAdd" class="btn">이미지 추가</button><span class="err">{{errMsg4}}</span>
				<table class="tableStyle">
					<tr>
						<th class="tdthsy">이미지 파일</th>
						<th class="tdthsy">삭제</th>
					</tr>
					<tr v-if="contentImgList.length == 0">
						<td colspan="4" class="tdthsy">이미지를 추가해 주세요</td>
					</tr>
					<template v-for="(item, index) in contentImgList">
						<tr>
							<td class="tdthsy"><label class="fileBox">파일선택<input type="file" @change="fnOnFileChange2($event, index)" class="fileBtn"></label></td>
							<td class="tdthsy"><button @click="fnProductImgDel2(index)" class="delBtn">삭제</button></td>
						</tr>
						<tr>
							<td class="imgDiv content"><img v-if="imageList2[index]" :src="imageList2[index]" alt="Image preview" class="pvImg" ref="image" required></td>
						</tr>
					</template>
				</table>
			</div>
			<button @click="fnProductAdd" class="addBtn">판매등록</button>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		errMsg1 : "", // 상품 정보 에러메세지
		errMsg2 : "", // 상품 이미지 에러 메세지
		errMsg3 : "", // 상품 옵션 에러 메세지
		errMsg4 : "", // 상품 상세 이미지 에러 메세지
		errMsg5 : "", // 카테고리 에러 메세지
		product : {	//상품 맵
			productName : "",
			productPrices : "",
			manufacturer : "",
			country : "",
			duscount : "",
			category : ""
		},
		optionList : [], // 옵션 리스트
		productImgList : [], // 상품 이미지 리스트
		contentImgList : [], // 상품 상세이미지 리스트
		imageList : [], // 상품 이미지리스트
		imageList2 : [], // 상품 상세 이미지 리스트
		categoryList1 : [], //카테고리 대분류
		categoryList2 : [], //카테고리 대분류
		category1Name : "",
		category2Name : "",
		category1No : "",
	},// data
	methods : {
		fnTest(){

		},
		fnOptionAdd(){ //옵션 추가 메서드
			var self = this;
			if(self.optionList.length < 5){
				self.optionList.push({optionName : "", productStock : "", optionPrice : "",});
			} else{
				self.errMsg3 = '상품 옵션은 최대 5개까지 입니다.';
			}
		},
		fnOptionDelete(index){ //옵션 삭제
			var self = this;
			self.optionList.splice(index,1);
		},
		fnProductImgDel(index){
			var self = this;
			self.productImgList.splice(index,1);
			self.imageList.splice(index,1);
			self.errMsg2 = "";
		},
		fnProductImgDel2(index){
			var self = this;
			self.contentImgList.splice(index,1);
			self.imageList2.splice(index,1);
			self.errMsg2 = "";
		},
		fnProductImgAdd(){
			var self = this;
			console.log(self.imageList);
			console.log(self.productImgList);
			if(self.productImgList.length < 5){
				self.productImgList.push({orgName : "", thumbnail : "N"});
			} else {
				self.errMsg2 = '상품 이미지는 최대 5개까지 입니다.';
			}
		},
		fnContentImgAdd(){
			var self = this;
			if(self.contentImgList.length < 5){
				self.contentImgList.push({orgName : "", thumbnail : "D"});
			} else {
				self.errMsg4 = '상품 상세 이미지는 최대 5개까지 입니다.';
			}
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
		      self.imageList.splice(index,1);
		      console.log(index);
		      self.imageList.splice(index,0,URL.createObjectURL(file));
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
                }
            });
		},
		fnGetcategoryList2(item){
			var self = this;
			var nparmap = {no : item.categoryNo};
			self.category1Name = item.categoryName;
			self.category1No = item.categoryNo;
			console.log(self.category1No);
            $.ajax({
                url : "category2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.categoryList2 = data.list;
                }
            });
		},
		fnSetCategory(item){
			var self = this;
			self.category2Name = item.categoryName;
			self.product.category = item.categoryNo;
		},
		fnOnFileChange2(event, index) {
			var self = this;
			self.errMsg2 = "";
		    const file = event.target.files[0];	
		    if (file) {
		      self.imageList2.splice(index,1)
		      self.imageList2.splice(index,0,URL.createObjectURL(file));
		    }
		},
		fnProductAdd(){
			var self = this;
			if(self.product.category == ''){
				self.errMsg5 = '카테고리를 선택해주세요';
				window.scrollTo({
			        top: 0,
			        behavior: 'smooth',
			      });
				return;
			}
			self.errMsg5 = '';
			if(self.product.productName == '' || self.product.productPrices == '' || self.product.manufacturer == '' || self.product.country == '' || self.product.duscount == ''){
				self.errMsg1 = '모든 정보를 입력해주세요';
				var box = document.querySelector(".box");
				var top = box.offsetTop;
			  	window.scrollTo({
			    	top: 0,
			        behavior: 'smooth',
			      });
				return;
			}
			self.errMsg1 = '';
			if(self.imageList.length == 0){
				self.errMsg2 = '이미지를 최소 1개 추가해주세요'
					return;
			}
			self.errMsg2 = '';
			if(self.imageList.length == 0){
				self.errMsg4 = '상세 이미지를 최소 1개 추가해주세요'
					return;
			}
  
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetcategoryList1();
	}// created
});
</script>