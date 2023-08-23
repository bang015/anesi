<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>중고 매입 문의하기</title>
</head>
<style>
#app{
	margin-top : 170px;
}
#container{
	margin : 10px auto;
	width: 800px;
	padding : 10px 0px;
}
.edit{
	border: 1px solid #d1d1d1;
    border-radius: 5px;
    padding: 30px 50px;
    box-shadow: 0px 2px 11px -3px #dddbdb;
	position: relative;
}
.left{
	float: left;
    line-height: 54px;
    margin: 0px 73px 0px 0px;
    font-size: 16px;
}
.right{
	line-height: 54px;
    font-size: 15px;
}
.bottom{
    font-size: 22px;
    margin: 29px 0 17px 0;
}
.put{
	border-radius: 4px;
    border: 1px solid #e5e5e5;
    width: 380px;
    height: 24px;
    padding: 10px;
}
.select{
	border-radius: 4px;
	border: 1px solid #e5e5e5;
	width: 402px;
	height: 46px;
	padding: 8px;
}
.btnDIV{
	text-align:center;
}
.btn1{
	border: none;
    color: white;
    background-color: #A782C3;
    border-radius: 7px;
    padding: 14px 45px;
    margin: 30px 0px;
    transition: background 0.3s;
    cursor: pointer;
    font-size: 16px;
}
h1{
	margin: 22px 0 50px 0;
}
.text1{
	font-size: 13px;
    color: #979797;
}
.filebox{
	margin : 10px 0px;
}
.filebox input[type="file"] {
  position: absolute;
  width: 0;
  height: 0;
  padding: 0;
  overflow: hidden;
  border: 0;
}
.filebox label {
  display: inline-block;
  padding: 10px 20px;
  color: #6f6f6f;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #cdcdcd;
  border-radius: 5px;
}
.filebox .upload-name {
	display: inline-block;
	height: 35px;
	padding: 0 10px;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-radius: 5px;
	width: 240px;
}
.title{
	margin: 31px 0px 17px 0;
    font-size: 20px;
}
.text2{
	color: #696969;
    margin: 0 0px 20px 0;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div class="edit">
			<div><h1>중고 매입 문의하기</h1></div>
			<div class="left">
				<div>이름</div>
				<div>전화번호</div>
				<div>물품명</div>
				<div>구매가격</div>
				<div>희망판매가격</div>
				<div>제조국</div>
				<div>사용기간</div>
				<div>상태</div>
			</div>
			<div class="right">
			 	<div><input type="text" class="put" v-model="info.userName"></div>
			 	<div><input type="text" class="put" v-model="info.phone"></div>
			 	<div><input type="text" class="put"></div>
			 	<input type="text" class="put" id="numberInput" @input="formatNumber" v-model="usedPrice">
			 	<input type="text" class="put" id="numberInput" @input="formatNumber" v-model="usedSellPrice">
			 	<div><input type="text" class="put" placeholder="알 수 없는 경우 '미상' 기재"></div>
			 	<div>
			 		<select class="select">
			 			<option>1년 미만</option>
			 			<option>1년</option>
			 			<option>2년</option>
			 			<option>3년</option>
			 			<option>4년</option>
			 			<option>5년</option>
			 			<option>5년 이상</option>
			 		</select>
			 	</div>
			 	<div>
				 	<select class="select">
				 		<option>상</option>
				 		<option>중</option>
				 		<option>하</option>
				 	</select>
			 	</div>
			</div>
			<div class="bottom">상세내용 <span class="text1">상세한 제품 설명 기재 부탁드립니다.</span></div>
			<div>
				<vue-editor></vue-editor>
			</div>
			
			<div>
			<div class="title">사진 첨부</div>
			<div class="text2">앞, 뒤, 양옆 등 사진을 첨부해주세요. (최소 4장)</div>
			<div v-for="index in 5" :key="index" class="filebox">
			    <label :for="'file' + index">파일첨부</label>
			    <input type="file" :id="'file' + index" :name="'file' + index" @change="fnOnFileChange($event, index)">
			    <input class="upload-name" :value="fileNames[index - 1]">
			</div>
			</div>
			<div class="btnDIV">
				<button class="btn1">문의 제출</button>
			</div>
		</div>
	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;

var app = new Vue({
	el : '#app',
	data : {
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		info : {},
		fileNames: ['', '', '', '', ''],
		usedPrice: '',
		usedSellPrice: ''
	},// data
	components: {VueEditor},
	methods : {
		fnGetInfo : function(){
			var self = this;
			var param = {no : self.sessionNo};
			$.ajax({
				url : "/mypage/user_info.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.info = data.info;
                	console.log(self.info);
                }
            }); 
		},
		fnOnFileChange: function(event, index) {
			var self = this;
            const curFileName = event.target.files[0].name;
            self.fileNames.splice(index - 1, 1, curFileName);
        },
        formatNumber() {
            var self = this;
            const inputNumber = self.usedPrice.replace(/\D/g, '');
            const formatted = Number(inputNumber).toLocaleString();
            self.usedPrice = formatted;
            
            const inputSellPrice = self.usedSellPrice.replace(/\D/g, '');
            const formattedSellPrice = Number(inputSellPrice).toLocaleString();
            self.usedSellPrice = formattedSellPrice;
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInfo();
	}// created
});
</script>