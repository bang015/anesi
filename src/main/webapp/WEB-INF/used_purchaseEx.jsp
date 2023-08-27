<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="UTF-8">
<title>중고 매입 사례</title>
</head>
<style>
#app{
	margin-top : 185px;
}
#container{
	margin : 10px auto;
	width: 1000px;
	padding : 10px 0px;
}
.used_menu{
	display : flex;
	justify-content: center;
	border-bottom: 1px solid gainsboro;
}
.used_menu_li {
	font-size: 17px;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid white;
    transition: background-color 0.3s;
    width: 145px;
    text-align: center;
    padding: 15px 0px 0 0;
}
.used_menu_li:hover {
    background-color: #f7f7f7; 
}
.used_menu_li_ch{
    font-size: 17px;
    width: 145px;
	text-align: center;
    padding: 15px 0px 15px 0;
    border-right: 1px solid #ededed;
    border-bottom: 4px solid #A782C3;
}
h1{
	text-align: center;
	padding: 20px 0px 0px 0px;
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
.btn1:hover{
    background-color: #8966a3;
}
.pagination {
    text-align: center;
    margin-top: 50px;
    font-size: 13px;
    padding: 0;
    margin-bottom: 50px;
}
.pagination li {
    margin: 6px;
    border-radius: 6px;
    display: inline;
    margin: 15px;
    padding: 5px 9px;
}
.pagination li:hover {
	background:#eee;
}
.page-item a {
	color:#666;
	text-decoration: none;
}
.pagination li.active {
	color: #A782C3;
    font-weight: bold;
    border: 1px solid;
    padding: 5px 9px;
    border-radius: 6px;
}
.pagination li.active a{
	color : #A782C3;
}
.purchaseImg{
	border-radius: 5px;
    width: 300px;
    height: 300px;
    object-fit: cover;
}
.part{
	display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    text-align: center;
    position: relative;
    margin-top: 12px;
}
.title{
	margin: 10px 0;
    font-size: 17px;
}
.part-in{
	width : 300px;
}
.text1DIV{
	margin: 0 0 63px 0;
    text-align: center;
    font-size: 16px;
}
.bottom{
	margin: 60px 0 10px 0;
}
.bottom-in{
	margin : 40px 0;
}
.text1{
	font-size: 14px;
    font-weight: 100;
    color: #8f8f8f;
}
.text2{
	font-size: 15px;
    font-weight: 100;
    color: #9b9b9b;
    margin-left: 3px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
<div>
	<div class="used_menu">
		<div class="used_menu_li" style="border-left: 1px solid #ededed;"><a href="../usedSell.do">중고 판매</a></div>
		<div class="used_menu_li"><a href="purchase.do">중고 매입</a></div>
		<div class="used_menu_li_ch"><a href="purchaseEx.do" style="color:#A782C3;">중고 매입 사례</a></div>
	</div>
</div>
	<div id="container">
		<div>
			<div><h1>중고 매입 사례</h1></div>
			<div class="text1DIV"><span class="text1">🏡 상담부터 수거까지, 편안하고 편리한 아네시의 중고 장터 🚛</span></div>
			<div><h3>등록된 사례 <span class="text2">{{cnt}}</span></h3></div>
			<div class="part">
				<div v-for="(item, index) in list" class="part-in">
					<div><a @click="fnView(item.usedPNo)"><img class="purchaseImg" :src="item.pImgPath+'/'+item.pImgName"></a></div>
					<div class="title"><a @click="fnView(item.usedPNo)">{{item.usedPName}}</a></div>
				</div>
			</div>
			
			<paginate
			    :page-count="pageCount"
			    :page-range="3"
			    :margin-pages="1"
			    :click-handler="fnPageSearch"
			    :prev-text="'〈'"
			    :next-text="'〉'"
			    :container-class="'pagination'"
			    :page-class="'page-item'" v-if="list.length > 0">
			</paginate>
			
			<div v-if="sessionStatus=='A'" class="bottom">
			<hr class="hrr">
				<div class="bottom-in"><h2>판매 미등록 상품 <span class="text1">관리자 전용, 매입 확인된 상품 등록바랍니다.</span></h2></div>
				<div class="part">
					<div v-for="(item, index) in nList" class="part-in">
							<div><a @click="fnAdd(item.usedPNo)"><img class="purchaseImg" :src="item.pImgPath+'/'+item.pImgName"></a></div>
						<div class="title"><a @click="fnAdd(item.usedPNo)">{{item.usedPName}}</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		nList : [],
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		sessionStatus : "${sessionStatus}",
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		searchCnt : 0,
		searchPageCount : 1
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var startNum = ((self.selectPage-1) * 9);
    		var lastNum = 9;
			var param = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/used/usedSellYList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 9);
                }
            }); 
		},
		fnPageSearch : function(pageNum){
			var self = this;
			var startNum = ((pageNum-1) * 9);
			var lastNum = 9;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/used/usedSellYList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
                	self.searchCnt = data.cnt;
	                self.pageCount = Math.ceil(self.searchCnt / 9);
				}
			});
		},
		fnGetNList : function(){
			var self = this;
			var param = {};
			$.ajax({
				url : "/used/usedSellNList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.nList = data.list;
                }
            }); 
		},
		fnView(usedPNo){
			$.pageChange("/used/purchaseExView.do", {usedPNo : usedPNo});
		},
		fnAdd(usedPNo){
			$.pageChange("/used/purchaseExAdd.do", {usedPNo : usedPNo});
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnGetNList();
	}// created
});
</script>