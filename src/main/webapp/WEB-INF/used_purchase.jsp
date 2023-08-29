<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="UTF-8">
<title>중고 매입 문의 게시판</title>
</head>
<style>
#app{
	margin-top : 185px;
}
#container{
	margin : 10px auto;
	width: 1200px;
	padding : 10px 0px;
}
table,td{
	border-bottom: 1px solid #cdcdcd;
	border-collapse: collapse;
}
table{
	width: 1000px;
	text-align:center;
    margin: 30px auto;
}
th,td{
	padding : 12px;
	font-size: 16px;
}
td{
	text-align:center;
	font-size:15px;
}
th{
	border-bottom: 2px solid #c9b4d9;
}
.tr2:hover{
	background : #fbfbfb;
}
li{
	list-style : none;
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
	padding: 20px 0px 30px 0px;
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
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
<div>
	<div class="used_menu">
		<div class="used_menu_li" style="border-left: 1px solid #ededed;"><a href="../usedSell.do">중고 판매</a></div>
		<div class="used_menu_li_ch"><a href="purchase.do" style="color:#A782C3;">중고 매입</a></div>
		<div class="used_menu_li"><a href="purchaseEx.do">중고 매입 사례</a></div>
	</div>
</div>
	<div id="container">
		<div>
		<div><h1>중고 매입 문의 게시판</h1></div>
			<table>
				<tr>
					<th>No.</th>
					<th style="width: 400px;">물품</th>
					<th>답변여부</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<tr v-for="(item, index) in list" class="tr2">
					<td>{{item.usedPNo}}</td>
					<td><a @click="fnUsedView(item.usedPNo)">{{item.usedPName}}</a></td>
					<td v-if="item.purchase=='W'">대기</td>
					<td v-else-if="item.purchase=='Y'" style="color:#A782C3;">완료</td>
					<td v-else-if="item.purchase=='N'" style="color:#A782C3;">완료</td>
					<td>{{item.userName}}</td>
					<td>{{formatDate(item.usedPCdatetime)}}</td>
				</tr>
			</table>
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
		<div class="btnDIV"><button class="btn1" @click="fnInquire">문의하기</button></div>
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
			var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
			var param = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/used/purchaseList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	self.cnt = data.cnt;
                	self.pageCount = Math.ceil(self.cnt / 10);
                }
            }); 
		},
		fnPageSearch : function(pageNum){
			var self = this;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/used/purchaseList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
                	self.searchCnt = data.cnt;
	                self.pageCount = Math.ceil(self.searchCnt / 10);
				}
			});
		},
		formatDate: function (dateString) {
            var date = new Date(dateString);
            var options = { year: 'numeric', month: 'numeric', day: 'numeric' };
            var formattedDate = date.toLocaleDateString(undefined, options);

            // 마지막 점 제거
            formattedDate = formattedDate.replace(/\.$/, '');

            return formattedDate;
        },
        fnInquire : function(){
        	var self = this;
        	if(self.sessionNo==""){
        		alert("로그인 후 이용 가능합니다.");
        		return;
        	}
			location.href="/used/inquire.do";
        },
        fnUsedView : function(usedPNo){
        	var self = this;
    		var param = {usedPNo : usedPNo};
    		$.ajax({
    			url : "/used/inquireView1.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
	                if(self.sessionStatus=='A'){
						$.pageChange("/used/inquireView.do", {usedPNo : usedPNo});
	                }else if(self.sessionNo!=data.list.userNo){
	              		alert("본인 또는 관리자만 조회 가능합니다.");
	    	        	return;
	              	}else if(self.sessionStatus=='U' && self.sessionNo==data.list.userNo){
	              		$.pageChange("/used/inquireView.do", {usedPNo : usedPNo});
	              	}		           
               	}
         	}); 
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>