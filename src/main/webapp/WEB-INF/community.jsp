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
}
.board1_item{
	width: 300px;
}
.title{
	margin : 14px 0px 10px 0px;
	font-size: 16px;
}
.nick{
	margin-bottom : 10px;
	font-size : 12px;
}
.view{
	margin-bottom : 10px;
	font-size : 12px;
	color : #9b9b9b
}
.title_a:hover{
	color: #424242;
}
img{
	transition: opacity 0.3s, visibility 0.3s;
}
img:hover{
	opacity: 0.7;
	visibility: visible;
	text-decoration: none;
	cursor : pointer;
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
		                <div class="photo1">
		                    <a @click="fnView(item.boardNo)"><img class="photo2" src="../css/image/community/commu_test.jpg"></a>
		                </div>
		                <a class="title_a" @click="fnView(item.boardNo)"><div class="title">{{item.title}}</div></a>
		                <div class="nick">{{item.nick}}</div>
		                <div class="view">조회 {{item.view}} · 댓글 5</div>
		            </div>
		        </div>
	    	</div>
		</div>
		<hr class="hrr">
		<div><h2>전체글 <span class="text1">{{list.length}}</span></h2></div>
		<div class="part">
			<div v-for="(item, index) in list">
		        <div class="board1">
		            <div class="board1_item">
		                <div class="photo1">
		                    <img class="photo2" src="../css/image/community/commu_test.jpg">
		                </div>
		                <a class="title_a"><div class="title">{{item.title}}</div></a>
		                <div class="nick">{{item.nick}}</div>
		                <div class="view">조회 {{item.view}} · 댓글 5</div>
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
        			console.log(self.list);
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
        			console.log(self.bList);
                }
            });
		},
		fnView : function(boardNo){
			var self = this;
			$.pageChange("/community/view.do", {boardNo : boardNo});
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