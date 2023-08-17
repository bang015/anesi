<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
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
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    text-align : center;
    position: relative;
}
.board1{
    position: relative;
    display: flex;
    text-align : center;
}
.photo1{
	position: relative;
    width: 300px;
    height: 200px;
    overflow: hidden;
    border-radius : 5px;
}
.photo2{
	position: absolute; 
    top: 0;
    left: 0;
	width: 300px;
    height: 200px;
    object-fit: cover;
    transition: opacity 0.3s, visibility 0.3s;
}
.photo2:hover{
	opacity: 0.7;
	visibility: visible;
	cursor : pointer;
}
.board1_item{
	width: 300px;
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
.glass{
    width: 18px;
    float: right;
	margin: 3px 10px 0px 5px;
}
.new{
	position: absolute;
    width: 50px;
    top: 8px;
    left: 8px;
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
		                    <a @click="fnView(item.boardNo)"><img class="photo2" src="../css/image/community/commu_test.jpg"></a>
		                <img class="new" v-if="isNew(item.cDateTime)" src="../css/image/community/new.png">
		                </div>
		                </div>
		                <a class="title_a" @click="fnView(item.boardNo)"><div class="title">{{item.title}}</div></a>
		                <div class="nick">{{item.nick}}</div>
		                <div class="view">조회 {{item.view}} · 댓글 {{item.commCnt}}</div>
		            </div>
		        </div>
	    	</div>
		</div>
		<hr class="hrr">
		<div id="board-body">
			<div id="board-body-head"><h2>전체글<span class="text1"> {{list.length}}</span></h2></div>
			<div class="searchbar">
				<button class="btn" @click="fnWrite">글쓰기(임시)</button>
				<input type="text" class="search-input" @keyup.enter="fnSearch" v-model="keyword"><img class="glass" src="../css/image/community/m-glass.png">
			</div>
		</div>
		<div class="part">
			<div v-for="(item, index) in list">
		        <div class="board1">
		            <div class="board1_item">
		                <div class="photo1">
		                    <a @click="fnView(item.boardNo)"><img class="photo2" src="../css/image/community/commu_test.jpg"></a>
		                <img class="new" v-if="isNew(item.cDateTime)" src="../css/image/community/new.png">
		                </div>
		                <a class="title_a" @click="fnView(item.boardNo)"><div class="title">{{item.title}}</div></a>
		                <div class="nick">{{item.nick}}</div>
		                <div class="view">조회 {{item.view}} · 댓글 {{item.commCnt}}</div>
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
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		bList : [],
		keyword : "",
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}"
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/community/boardList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
        			self.list = data.list;
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
            var nparmap = {keyword : self.keyword};
            $.ajax({
                url : "/community/search.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.sList;
                }
            }); 
        },
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnGetBestList();
		console.log(self.sessionNick);
	}// created
});
</script>