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
<title>중고 매입 문의</title>
</head>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 10px auto;
	width: 800px;
	padding : 10px 0px;
}
.used_menu{
	display : flex;
	justify-content: center;
	border-bottom: 1px solid gainsboro;
}
.used_menu_li {
    font-size: 17px;
    padding: 15px 35px;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid white;
    transition: background-color 0.3s;
}
.used_menu_li:hover {
    background-color: #f7f7f7; 
}
.used_menu_li_ch{
    font-size: 17px;
    padding: 15px 35px;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid #A782C3;
}
.edit{
    padding: 30px 50px;
	position: relative;
}
table,td{
	border-bottom: 1px solid #dddddd;
	border-collapse: collapse;
}
table{
	width: 100%;
}
th,td{
	padding: 17px 13px;
	font-size: 16px;
}
td{
	font-size:15px;
}
.title{
	width: 150px;
	border-right: 1px solid #dddddd;
}
.tr2:hover{
	background : #fbfbfb;
}

.bottom{
    font-size: 20px;
    margin: 14px 0 15px 11px;
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
	margin: 20px 0px 20px 12px;
}
.text1{
	font-size: 13px;
    color: #979797;
}
.text2{
	color: #5f5f5f;
    margin: 0 0px 20px 0;
}
.content{
	padding: 30px 13px;
    font-size: 15px;
}
.hr1{
	border:none;
	border-bottom:1px solid #A782C3;
}
.hr2{
	border:none;
	border-bottom:2px solid #A782C3;
}
.btnDIV{
	text-align:center;
}
.btnDIV2{
	text-align: right;
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
.btn2{
    color: #494949;
    background-color: #f9f9f9;
    border-radius: 7px;
    padding: 0px 9px;
    margin: 10px 3px;
    transition: background 0.3s;
    cursor: pointer;
    width: 75px;
    height: 23px;
    border: 1px solid #c9c9c9;
    font-size: 12px;
}
.btn2:hover{
	color: #ffffff;
    background-color: #A782C3;
    border: 1px solid #ffffff;
}
.img{
	width: 100%;
}
h3{
	margin-left:20px;
}
.purchase{
	margin: 13px 0 15px 14px;
}
.text3{
	font-size: 18px;
    font-weight: 600;
    margin-right: 10px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
<div class="used_menu">
		<div class="used_menu_li" style="border-left: 1px solid #ededed;"><a href="">중고 판매</a></div>
		<div class="used_menu_li_ch"><a href="purchase.do" style="color:#A782C3;">중고 매입</a></div>
		<div class="used_menu_li"><a href="">중고 매입사례</a></div>
</div>
	<div id="container">
		<div class="edit">
			<div>
			<div><h1>중고 매입 문의</h1></div>
				<table>
					<tr style="border-top:2px solid #A782C3;">
						<td class="title">문의 번호</td>
						<td>No.{{list[0].usedPNo}}</td>
					</tr>
					<tr>
						<td class="title">이름</td>
						<td>{{list[0].userName}}</td>
					</tr>
					<tr>
						<td class="title">전화번호</td>
						<td>{{list[0].userPhone}}</td>
					</tr>
					<tr>
						<td class="title">제품명</td>
						<td>{{list[0].usedPName}}</td>
					</tr>
					<tr>
						<td class="title">구매가격</td>
						<td>{{list[0].usedPPrice.toLocaleString()}}원</td>
					</tr>
					<tr>
						<td class="title">희망판매가격</td>
						<td>{{list[0].usedPSellPrice.toLocaleString()}}원</td>
					</tr>
					<tr>
						<td class="title">제조국</td>
						<td>{{list[0].manufacturer}}</td>
					</tr>
					<tr>
						<td class="title">사용기간</td>
						<td v-if="list[0].usedtime==0">1년 미만</td>
						<td v-if="list[0].usedtime>=1">{{list[0].usedtime}}년</td>
						<td v-if="list[0].usedtime>=6">5년 이상</td>
					</tr>
					<tr style="border-bottom:2px solid #A782C3;">
						<td class="title">제품상태</td>
						<td v-if="list[0].grade=='A'">상</td>
						<td v-if="list[0].grade=='B'">중</td>
						<td v-if="list[0].grade=='C'">하</td>
					</tr>
					
				</table>
				<div class="bottom">상세내용</div>
				<hr class="hr1">
				<div v-html="list[0].content" class="content"></div>
				<hr class="hr2">
				<div class="bottom">첨부사진</div>
				<hr class="hr1">
				<div class="content">
					<img class="img" v-for="(item, index) in list" :src="item.pImgPath + '/' + item.pImgName">
				</div>
				<div class="btnDIV2"><button class="btn2" v-if="list[0].userNo==sessionNo">수정</button><button class="btn2" v-if="list[0].userNo==sessionNo || sessionStatus=='A'" @click="fnDelete()">삭제</button></div>
				<hr class="hr2">
				<div v-if="purchaseFlg==true">
					<div><h1>문의 답변</h1></div>
					<hr class="hr1">
					<div>
						<div class="content">
							<div>
								<span class="text3">매입 여부</span>
								<span v-if="list[0].purchase=='Y'" style="color:#A782C3;">가능</span>
								<span v-if="list[0].purchase=='N'" style="color:#f19c9c;">불가능</span>
							</div>
							<div v-html="aInfo.aContent" style="margin: 30px 0;"></div>
						</div>
						<div class="btnDIV2" v-if="sessionStatus=='A'"><button class="btn2" @click="fnAnsEdit()">답변 수정</button><button class="btn2" @click="fnAnswerDelete()">답변 삭제</button></div>
					</div>
					<hr class="hr2">
				</div>
				<div v-if="answerFlg==true">
					<div><h1>문의 답변하기</h1></div>
					<hr class="hr1">
					<div><vue-editor v-model="aInfo.aContent"></vue-editor></div>
					<div class="purchase">
						<div><span class="text3">매입 여부</span> <label><input type="radio" v-model="list[0].purchase" value="Y"> 매입 가능 </label> <label><input type="radio" v-model="list[0].purchase" value="N"> 매입 불가 </label></div>
					</div>
				</div>
			</div>
			<div class="btnDIV">
				<button class="btn1" v-if="sessionStatus=='A' && answerFlg==false && purchaseFlg==false" @click="fnChange()">답변하기</button>
				<button class="btn1" v-if="answerFlg==true && answerEditFlg==false" @click="fnAnswer()">답변 등록</button>
				<button class="btn1" v-if="answerFlg==true && answerEditFlg==true" @click="fnAnswerEdit()">답변 수정</button>
				<button class="btn1" @click="fnGoList()">목록으로</button>
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
		sessionStatus : "${sessionStatus}",
		usedPNo : "${map.usedPNo}",
		list : [{usedPPrice : 0, usedPSellPrice : 0}],
		aInfo : {
			aContent : ""
		},
		purchaseFlg : false,
		answerFlg : false,
		answerEditFlg : false,
		purchase : ""
	},// data
	components: {VueEditor},
	methods : {
		fnGetInfo : function(){
			var self = this;
			var param = {usedPNo : self.usedPNo};
			$.ajax({
				url : "/used/inquireView.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                	console.log(self.list[0].purchase);
                	if(self.list[0].purchase!='W'){
        				self.fnGetAInfo();
        				console.log(self.purchaseFlg);
        			}
                	
                }
            }); 
		},
		fnGetAInfo : function(){
			var self = this;
			var param = {usedPNo : self.usedPNo};
			$.ajax({
				url : "/used/answerView.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	console.log(data);
                	self.aInfo = data.aInfo;
                	console.log(self.aInfo);
                	if(self.aInfo!=undefined){
                		self.purchaseFlg = true;
                	}
                }
            }); 
		},
		fnGoList(){
			location.href="purchase.do";
		},
		fnChange(){
			var self = this;
			self.answerFlg = true;
		},
		fnDelete(){
			var self = this;
			if(!confirm("문의글을 삭제하시겠습니까?")){
				return;
			}
			var param = {usedPNo : self.usedPNo};
			$.ajax({
				url : "/used/delete.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	location.href="purchase.do";
                }
            }); 
		},
		fnAnswer(){
			var self = this;
			if(!confirm("답변을 등록하시겠습니까?")){
				return;
			}
			self.purchase = self.list[0].purchase;
			var param = {usedPNo : self.usedPNo, aContent : self.aInfo.aContent, purchase : self.purchase};
			$.ajax({
				url : "/used/answer.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("답변이 등록되었습니다.");
                	location.href="purchase.do";
                }
            }); 
		},
		fnAnsEdit(){
			var self = this;
			self.answerFlg=true;
			self.purchaseFlg=false;
			self.answerEditFlg=true;
		},
		fnAnswerEdit(){
			var self = this;
			if(!confirm("답변을 수정하시겠습니까?")){
				return;
			}
			self.purchase = self.list[0].purchase;
			var param = {usedPNo : self.usedPNo, aContent : self.aInfo.aContent, purchase : self.purchase};
			$.ajax({
				url : "/used/answerEdit.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("답변이 수정되었습니다.");
                	location.reload();
                }
            }); 
		},
		fnAnswerDelete(){
			var self = this;
			if(!confirm("답변을 삭제하시겠습니까?")){
				return;
			}
			self.purchase = self.list[0].purchase;
			var param = {usedPNo : self.usedPNo, purchase : 'W'};
			$.ajax({
				url : "/used/answerDelete.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("답변이 삭제되었습니다.");
                	location.reload();
                }
            }); 
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInfo();
	}// created
});
</script>