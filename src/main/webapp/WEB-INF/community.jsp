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
<title>커뮤니티📝</title>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 10px auto;
	width: 1278px;
	padding : 10px 0px;
}
.part{
	display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    text-align : center;
    position: relative;
    margin-top: 12px;
}
.board1{
    position: relative;
    display: flex;
    text-align : center;
}
.photo1{
	position: relative;
    width: 400px;
    height: 300px;
    overflow: hidden;
    border-radius : 5px;
}
.photo2{
	position: absolute; 
    top: 0;
    left: 0;
	width: 400px;
    height: 300px;
    object-fit: cover;
    transition: opacity 0.3s, visibility 0.3s;
}
.photo2:hover{
	opacity: 0.7;
	visibility: visible;
	cursor : pointer;
}
.board1_item{
	width: 400px;
}
.title{
	margin : 14px 0px 10px 0px;
	font-size: 17px;
}
.nick{
	margin-bottom: 15px;
    font-size: 15px;
}
.view{
	margin-bottom : 10px;
	font-size : 12px;
	color : #9b9b9b
}
.title_a:hover{
	color: #424242;
}
.hrr {
	margin : 30px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.text1{
	font-size: 15px;
    font-weight: 100;
    color: #9b9b9b;
    margin-left: 3px;
}
.text2{
	font-size: 15px;
    font-weight: 100;
    margin-left: 3px;
}
.text3{
	text-align:center;
	font-size: 18px;
    font-weight: 100;
    color: #9b9b9b;
    margin : 50px 0px;
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
    margin: 15px 16px 0px 0;
}
.m-glass{
   	width: 15px;
    float: right;
    margin: 21px 0px 0px -39px;
    position: absolute;
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
    font-size:14px;
    padding: 0;
}
.pagination li {
    margin: 6px;
    border-radius: 6px;
    display: inline;
    margin: 15px;
    padding: 8px 10px;
}
.pagination li:hover {
	background:#eee;
}
.page-item a {
	color:#666;
	text-decoration: none;
}
.pagination li.active {
	color: white;
    font-weight: bold;
    padding: 8px 10px;
    border-radius: 6px;
    background: #A782C3;
}
.pagination li.active a{
	color : white;
}
.profile{
	width: 25px;
    height: 25px;
    border-radius: 50%;
    object-fit: cover;
    position: relative;
    top: 6.5px;
    left: -5px;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div><h2>인기글</h2></div>
		<div class="part">
			<div v-for="(item, index) in bList">
		        <div class="board1">
		            <div class="board1_item">
		           		<div>
		                <div class="photo1">
		                    <a @click="fnView(item.boardNo)"><img class="photo2" :src="item.imgPath+'/'+item.imgName"></a>
		                <img class="new" v-if="isNew(item.cDateTime)" src="../css/image/community/new.png">
		                </div>
		                </div>
		                <a class="title_a" @click="fnView(item.boardNo)"><div class="title">{{item.title}}</div></a>
		                <div class="nick"><img :src="item.uImgPath+'/'+item.uImgName" class="profile">{{item.nick}}</div>
		                <div class="view">좋아요 {{item.gCnt}} · 조회 {{item.view}} · 댓글 {{item.commCnt}}</div>
		            </div>
		        </div>
	    	</div>
		</div>
		<hr class="hrr">
		<div id="board-body">
			<div id="board-body-head"><h2>전체글<span class="text1"> {{cnt}}</span> <span class="text2" v-if="searchFlg==true">검색된 글 <span class="text1">{{searchCnt}}</span></span></h2></div>
			<div class="searchbar">
				<input type="text" class="search-input" @keyup.enter="fnSearch" v-model="keyword"><img class="m-glass" src="../css/image/community/m-glass.png">
			</div>
		</div>
		<div class="part">
			<div v-for="(item, index) in list">
		        <div class="board1">
		            <div class="board1_item">
		                <div class="photo1">
		                    <a @click="fnView(item.boardNo)"><img class="photo2" :src="item.imgPath+'/'+item.imgName"></a>
		                <img class="new" v-if="isNew(item.cDateTime)" src="../css/image/community/new.png">
		                </div>
		                <a class="title_a" @click="fnView(item.boardNo)"><div class="title">{{item.title}}</div></a>
		                <div class="nick"><img :src="item.uImgPath+'/'+item.uImgName" class="profile">{{item.nick}}</div>
		                <div class="view">좋아요 {{item.gCnt}} · 조회 {{item.view}} · 댓글 {{item.commCnt}}</div>
		            </div>
		        </div>
			</div>
		</div>
		<div v-if="list < 1" class="text3"> 검색된 게시글이 없습니다.</div>
		<template>
	  <paginate
	    :page-count="pageCount"
	    :page-range="3"
	    :margin-pages="1"
	    :click-handler="fnPageSearch"
	    :prev-text="'〈'"
	    :next-text="'〉'"
	    :container-class="'pagination'"
	    :page-class="'page-item'" v-if="boardFlg==true">
	  </paginate>
	  <paginate
	    :page-count="searchPageCount"
	    :page-range="3"
	    :margin-pages="1"
	    :click-handler="fnSearchPageSearch"
	    :prev-text="'〈'"
	    :next-text="'〉'"
	    :container-class="'pagination'"
	    :page-class="'page-item'" name="searchPage" v-if="searchFlg==true && list.length > 0">
	  </paginate>
	</template>
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
            var startNum = ((self.selectPage-1) * 9);
    		var lastNum = 9;
			var param = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/community/boardList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 9);
	                console.log(self.list);
                }
            }); 
		},
		fnPageSearch : function(pageNum){
			var self = this;
			var startNum = ((pageNum-1) * 9);
			var lastNum = 9;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/community/boardList.dox",
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
		fnGetBestList : function(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/community/bestBoardList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
        			self.bList = data.bList;
                }
            });
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
		self.fnGetBestList();
		console.log(self.sessionNick);
	}// created
});
</script>