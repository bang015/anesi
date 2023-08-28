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
<title>중고 매입 사례 등록</title>
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
    font-size: 21px;
    margin: 40px 0 17px 0;
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
	color: #494949;
    background-color: #f9f9f9;
    border-radius: 7px;
    padding: 0px 9px;
    margin: 48px 3px;
    transition: background 0.3s;
    cursor: pointer;
    width: 143px;
    height: 47px;
    border: 1px solid #c9c9c9;
    font-size: 15px;
}
.btn1:hover{
	color: #ffffff;
    background-color: #A782C3;
    border: 1px solid #ffffff;
}
h1{
	margin: 22px 0 36px 0;
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
    font-size: 21px;
}
.text2{
	color: #5f5f5f;
    margin: 0 0px 20px 0;
}
.hr2{
	border:none;
	border-bottom:2px solid #A782C3;
	margin-bottom: 41px;
}
.imgPrv{
	width: 80%;
	margin : 20px 0;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div class="edit">
			<div><h1>중고 매입 사례 등록</h1></div>
			<hr class="hr2">
			<div class="left">
				<div>제품명</div>
				<div>제조국</div>
				<div>사용기간</div>
				<div>제품상태</div>
				<div>매입가격</div>
				<div>최종판매가격</div>
			</div>
			<div class="right">
			 	<div><input type="text" class="put" v-model="list.usedPName" ref="usedNameInput"></div>
			 	<div><input type="text" class="put" v-model="list.manufacturer" placeholder="알 수 없는 경우 '미상' 기재" ref="manufacturerInput"></div>
			 	<div>
			 		<select class="select" v-model="list.usedtime" ref="usedtimeInput">
			 			<option value="0">1년 미만</option>
			 			<option value="1">1년</option>
			 			<option value="2">2년</option>
			 			<option value="3">3년</option>
			 			<option value="4">4년</option>
			 			<option value="5">5년</option>
			 			<option value="6">5년 이상</option>
			 		</select>
			 	</div>
			 	<div>
				 	<select class="select" v-model="list.grade" ref="gradeInput"> 
				 		<option value="A">상</option>
				 		<option value="B">중</option>
				 		<option value="C">하</option>
				 	</select>
			 	</div>
			 	<input type="text" class="put" @input="formatNumber" v-model="list.usedPSellPrice" ref="usedSellPriceInput">
			 	<input type="text" class="put" id="numberInput" @input="formatNumber" v-model="list.uSellPrice" ref="uSellPriceInput">
			</div>
			<div class="bottom">상세설명</div>
			<div>
				<vue-editor v-model="list.sellContent"></vue-editor>
			</div>
			<div class="btnDIV">
				<button class="btn1" @click="fnAdd()">등록</button>
				<button class="btn1" @click="fnGoList()">취소</button>
			</div>
		</div>
	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;

var app = new Vue({
	el : '#app',
	data : {
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		usedPNo : "${map.usedPNo}",
		list : {
			usedPName : "",
			usedPPrice: "",
			usedPSellPrice: "",
			manufacturer : "",
			usedtime : "",
			grade : "",
			content : ""
		}
	},// data
	components: {VueEditor},
	methods : {
		fnGetInfo : function(){
			var self = this;
			var param = {usedPNo : self.usedPNo};
			$.ajax({
				url : "/used/usedSellAdd.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	self.list.uSellPrice = String(self.list.uSellPrice);
                	self.list.usedPSellPrice = String(self.list.usedPSellPrice);
                	console.log(self.list);
                }
            }); 
		},
        formatNumber() {
            var self = this;
            const inputSellPrice = self.list.usedPSellPrice.replace(/\D/g, '');
            const formattedSellPrice = Number(inputSellPrice).toLocaleString();
            self.list.usedPSellPrice = formattedSellPrice;
            
            const inputNumber = self.list.uSellPrice.replace(/\D/g, '');
            const formatted = Number(inputNumber).toLocaleString();
            self.list.uSellPrice = formatted;
        },
        fnAdd(){
        	var self = this;
        	if(self.list.usedPName == ""){
				alert("제품명을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.usedNameInput.focus();
		        });
				return;
			}
        	if(self.list.manufacturer == ""){
				alert("제조국을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.manufacturerInput.focus();
		        });
				return;
			}
        	if(self.list.usedtime == "" && self.list.usedtime != '0'){
				alert("사용기간을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.usedtimeInput.focus();
		        });
				return;
			}
        	if(self.list.grade == ""){
				alert("제품상태를 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.gradeInput.focus();
		        });
				return;
			}
        	if(self.list.usedPSellPrice == "" || self.list.usedPSellPrice == 0){
				alert("매입가격을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.usedSellPriceInput.focus();
		        });
				return;
			}
        	if(self.list.uSellPrice == "" || self.list.uSellPrice == 0){
				alert("최종판매가격을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.uSellPriceInput.focus();
		        });
				return;
			}
			var param = self.list;
			param.uSellPrice = self.list.uSellPrice.replace(/\D/g, '');
	        param.usedPSellPrice = self.list.usedPSellPrice.replace(/\D/g, '');
			$.ajax({
				url : "/used/addPurchaseEx.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("매입 사례 / 판매 등록이 완료되었습니다.");
                	location.href="purchaseEx.do";
                }
            });
        },
        fnGoList(){
			location.href="purchaseEx.do";
		},
		fnEdit(){
        	var self = this;
        	if(self.list.usedPName == ""){
				alert("제품명을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.usedNameInput.focus();
		        });
				return;
			}
        	if(self.list.usedPSellPrice == "" || self.list.usedPSellPrice == 0){
				alert("희망판매가격을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.usedSellPriceInput.focus();
		        });
				return;
			}
        	if(self.list.manufacturer == ""){
				alert("제조국을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.manufacturerInput.focus();
		        });
				return;
			}
        	if(self.list.usedtime == ""){
				alert("사용기간을 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.usedtimeInput.focus();
		        });
				return;
			}
        	if(self.list.grade == ""){
				alert("제품상태를 입력해주세요.");
				self.$nextTick(function() {
		            self.$refs.gradeInput.focus();
		        });
				return;
			}
			var param = self.list;
			$.ajax({
				url : "/used/purchaseUpdate.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("수정이 완료되었습니다.");
                	location.href="/used/purchase.do";
                }
            });
        },
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInfo();
	}// created
});
</script>