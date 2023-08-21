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
<title>나의 게시글📚</title>
<style>
#app{
	margin-top : 160px;
}
#container{
	margin : 30px auto;
	width: 1000px;
}
.box{
	border: 1px solid #d1d1d1;
    border-radius: 5px;
    padding: 40px;
    box-shadow: 0px 2px 11px -3px #dddbdb;
}
li{
	list-style : none;
}
.my_menu1 {
	list-style : none;
	display : flex;
	justify-content: center;
	padding: 5px 0px 0px 0px;
}
.my_li1 {
	margin: 0px 30px 0px 30px;
    font-size: 17px;
}
.my_li2 {
	margin: 0px 45px 0px 45px;
    font-size: 17px;
}
.my_li2 {
	font-size: 14px;
}
.my_a1_ch {
	color : #A782C3;
}
.my_a2 {
	text-decoration: none;
	position: relative;
	text-align: center; 
	cursor: pointer;
}
.my_a2:before { 
	text-decoration: none;
	content: "";
	position: absolute;
	bottom: -15px; 
	left: 53%; 
	transform: translateX(-50%);
	width: 130%;
	height: 4px;
	background-color: #A782C3;
	visibility: hidden; 
	opacity: 0; 
	transition: opacity 0.3s, visibility 0.3s;
}
.my_a2:hover:before { 
	visibility: visible;
	text-decoration: none;
	opacity: 1;
}
.my_a2_ch {
    position: relative;
    text-align: center;
    cursor: pointer;
    color : #A782C3;
}
.my_a2_ch:before {
    text-decoration: none;
	content: "";
	position: absolute;
	bottom: -15px; 
	left: 53%; 
	transform: translateX(-50%);
	width: 130%;
	height: 4px;
	background-color: #A782C3;
	visibility: visible; 
	opacity: 1; 
}
.hrr{
	margin : 4px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.hrr2{
	margin : 30px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.profile{
	border: 1px solid #d1d1d1;
    border-radius: 5px;
    height: 235px;
    padding: 40px;
    box-shadow: 0px 2px 11px -3px #dddbdb;
}
.profile_img{
	width: 160px;
    border-radius: 50%;
	margin: 15px 65px 15px 68px;
}
.nickName{
    font-size: 17px;
    text-align : center;
}
.profile_left{
	float : left;
	width: 300px;
	border-right: 1px solid #eee;
}
.profile_right{
	padding : 10px 50px 50px;
	float : left;
}
.icon{
	width: 56px;
    margin: 0px 22px 10px 3px;
}
.comment:hover{
	color : #424242;
}
.profile_list{
	display : flex;
}
.btn1{
	border : 1px solid #A782C3;
    border-radius: 7px;
    padding: 13px 9px;
    margin: 10px 0px;
    background-color : white;
    transition: background 0.3s;
    cursor: pointer;
    margin: 30px 10px;
    width: 236px;
}
.btn1:hover{
	background-color : #A782C3;
	color : white;
}
.icon_label{
	transition: opacity 0.3s, visibility 0.3s;
}
.icon_label:hover{
	opacity: 0.7; 
}
.part{
	display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    text-align : center;
    position: relative;
    margin-top: 12px;
    place-items: center;
}
.board1{
    position: relative;
    display: flex;
    text-align : center;
}
.photo1{
	position: relative;
    width: 170px;
    height: 170px;
    overflow: hidden;
    border-radius : 5px;
}
.photo2{
	position: absolute; 
    top: 0;
    left: 0;
	width: 170px;
    height: 170px;
    object-fit: cover;
    transition: opacity 0.3s, visibility 0.3s;
}
.photo2:hover{
	opacity: 0.7;
	visibility: visible;
	cursor : pointer;
}
.title{
	margin : 14px 0px 10px 0px;
	font-size: 17px;
}
.nick{
	margin-bottom : 12px;
	font-size : 14px;
}
.view{
	margin-bottom : 10px;
	font-size : 12px;
	color : #9b9b9b
}
.title_a:hover{
	color: #424242;
}
.text1{
	font-size: 15px;
    font-weight: 100;
    color: #9b9b9b;
    margin-left: 3px;
}
.text2{
	position: absolute;
	font-size: 15px;
    font-weight: 100;
    color: #9b9b9b;
    margin-left: 3px;
}
#board-body-head{
	display: inline-block;
}
.searchbar{
	float:right;
	margin-top: 12px;
}
.search-input{
    border: 1px solid #c5c5c5;
    border-radius: 5px;
    padding: 5px 9px;
    font-size: 14px;
    margin-right : 7px;
}
.new{
	position: absolute;
    width: 50px;
    top: 8px;
    left: 8px;
}
.pagination {
    text-align: center;
    margin-top: 65px;
    font-size : 13px;
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
.partName{
	margin: 0 0 26px 25px;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div class="top_menu">
		<ul class="my_menu1">
			<li class="my_li1"><a href="/mypage.do" class="my_a1_ch" style="color : #A782C3;">프로필</a></li>
			<li class="my_li1"><a href="/myShopping.do" class="my_a1">나의 쇼핑</a></li>
			<li class="my_li1"><a class="my_a1">나의 리뷰</a></li>
			<li class="my_li1"><a href="user_edit.do" class="my_a1">설정 </a></li>
		</ul>
	</div>
	<hr class="hrr">
		<ul class="my_menu1">
			<li class="my_li2"><a href="/mypage.do" class="my_a2">모두 보기</a></li>
			<li class="my_li2"><a class="my_a2">나의 문의</a></li>
			<li class="my_li2"><a href="/mypage/myBoard.do" class="my_a2_ch" style="color : #A782C3;">나의 게시글</a></li>
			<li class="my_li2"><a href="/scrapbook.do" class="my_a2">스크랩북</a></li>
		</ul>
	<hr class="hrr">
	
	<div id="container">
		<div class="box">
			<div><h2 class="partName">커뮤니티 <span class="text1">{{cnt}}</span></h2></div>
			<div class="part">
			<div v-for="(item, index) in list">
		        <div class="board1">
		            <div class="board1_item">
		                <div class="photo1">
		                   	<a @click="fnView(item.boardNo)"><img class="photo2" src="../css/image/community/commu_test.jpg"></a>
		               		<img class="new" v-if="isNew(item.cDateTime)" src="../css/image/community/new.png">
		               	</div>
		               	<a class="title_a" @click="fnView(item.boardNo)"><div class="title">{{item.title}}</div></a>
		               	<div class="view">조회 {{item.view}} · 댓글 {{item.commCnt}}</div>
		           	</div>
		        </div>
			</div>
			<div v-if="list.length < 1" class="text2">등록된 게시글이 없습니다.</div>
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
			  <hr class="hrr2">
			<div><h2 class="partName">중고 <span></span></h2></div>
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
		bList : [],
		keyword : "",
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		searchCnt : 0,
		searchPageCount : 1,
		boardFlg : true,
		searchFlg : false
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
            var startNum = ((self.selectPage-1) * 8);
    		var lastNum = 8;
			var param = {startNum : startNum, lastNum : lastNum, nick : self.sessionNick};
			$.ajax({
				url : "/community/myBoardList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 8);
                }
            }); 
		},
		fnPageSearch : function(pageNum){
			var self = this;
			var startNum = ((pageNum-1) * 8);
			var lastNum = 8;
			var nparmap = {startNum : startNum, lastNum : lastNum, nick : self.sessionNick};
			$.ajax({
				url : "/community/myBoardList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 8);
				}
			});
		},
		fnWrite : function(){
			location.href="/community/write.do";
		},
		fnView : function(boardNo){
			var self = this;
			$.pageChange("/community/view.do", {boardNo : boardNo});
		},
		isNew: function(cDateTime) {
			const currentTime = new Date();
			const postTime = new Date(cDateTime);
			const diffInHours = (currentTime - postTime) / (1000 * 60 * 60);
			
			return diffInHours < 24;
		},
        fnSearch : function(){
        	var self = this;
        	if(self.keyword==''){
        		alert("검색어를 입력하세요.");
        		return;
        	}
            var startNum = ((0) * 12);
    		var lastNum = 12;
            var nparmap = {keyword : self.keyword, startNum : startNum, lastNum : lastNum};
            $.ajax({
                url : "/community/search.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.sList;
                	self.searchCnt = data.cnt;
	                self.searchPageCount = Math.ceil(self.searchCnt / 12);
	                self.searchFlg=true;
					self.boardFlg=false;
                }
            }); 
        },
        fnSearchPageSearch : function(pageNum){
			var self = this;
			var startNum = ((pageNum-1) * 12);
			var lastNum = 12;
			var nparmap = {keyword : self.keyword, startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/community/search.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.sList;
					self.searchCnt = data.cnt;
					self.searchPageCount = Math.ceil(self.searchCnt / 12);
					self.searchFlg=true;
					self.boardFlg=false;
				}
			});
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		console.log(self.sessionNick);
	}// created
});
</script>