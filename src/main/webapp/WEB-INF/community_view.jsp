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
<title>커뮤니티 뷰👀</title>
</head>
<style>
#app{
	margin-top : 180px;
}
#app2{
	position: relative;
	min-height: 1px;
	width: 1100px;
	margin : 10px auto;
}
#container{
	margin : 10px auto;
	width: 700px;
	padding : 10px 0px;
}
.thum1{
	position: relative;
    width: 700px;
    height: 400px;
    overflow: hidden;
}
.thum2{
	position: absolute; 
    top: 0;
    left: 0;
	width: 700px;
    height: 400px;
    object-fit: cover;
}
.hrr {
	margin : 30px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.profile{
	border-radius : 50%;
	width : 30px;
	float:left;
}
.profile2{
	border-radius : 50%;
	width : 40px;
	float:left;
	margin-top: 5px;
}
.nick{
	font-size: 15px;
    line-height: 29px;
    margin-left: 40px;
}
.time{
	margin-top: 10px;
    font-size: 13px;
    float:right;
}
.stat{
	margin-top : 70px;
	color : #9b9b9b;
}
.stat-detail{
	font-weight:bold;
}
.comment-input{
	border: 1px solid #c5c5c5;
    border-radius: 7px;
    width: 550px;
    height: 48px;
    margin: 0px 10px;
    padding: 0px 10px;
}
#comment-head{
	margin : 18px 0px;
}
.btn1{
	width: 60px;
    height: 50px;
    border: none;
    color: white;
    background-color: #c5b2d3;
    border-radius: 7px;
    padding: 0px 9px;
    transition: background 0.3s;
    cursor: pointer;
}
.btn1:hover{
	background-color: #A782C3;
}
.move{
    height: 300px;
    position: sticky;
    float: right;
    top: 215px;
    right: -20px;
}
.stat-out{
	border-radius: 50%;
    border: 1px solid #d9d9d9;
    width: 55px;
    height: 55px;
    background: white;
    box-shadow: 1px 2px 5px -3px #bdbdbd;
    margin : 10px 0px;
}
.stat-out:hover{
	cursor : pointer;
}
.stat-icon{
	width: 28px;
    margin: 14px 0px 0px 14px;
}
.btn2{
    width: 73px;
    float: right;
    height: 24px;
    font-size: 12px;
    background: #ffffff;
    border: 1px solid #c3c3c3;
    color: #757575;
    border-radius: 7px;
    padding: 0px 9px;
    transition: background 0.3s;
    cursor: pointer;
    margin: -5px 2px;
}
.btn2:hover{
	background : #efefef;
}
h1{
	margin: 30px 0px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="app2">
		<div class="move">
			<div class="stat-out"><img class="stat-icon" src="../css/image/community/joahyo.png"></div>
			<div class="stat-out"><img class="stat-icon" src="../css/image/community/an-joahyo.png"></div>
			<div class="stat-out"><img class="stat-icon" src="../css/image/community/comment.png" name="comment" @click="scrollToComment"></div>
			<div class="stat-out"><img class="stat-icon" src="../css/image/community/share.png"></div>
		</div>
		<div id="container">
			<div class="thum1">
				<img class="thum2" src="../css/image/community/commu_test.jpg">
			</div>
			<div id="content-head">
				<div><h1>{{info.title}}</h1></div>
				<div><img class="profile" src="../css/image/profile.png"></div>
				<div class="time">{{calculateTime(info.cDateTime)}}</div>
				<div class="nick">{{info.nick}}</div>
			</div>
			<hr class="hrr">
			<div style="overflow: auto;">
			    <pre v-html="info.content"></pre>
			</div>
			<div class="stat">좋아요 <span class="stat-detail">2</span> 　댓글 <span class="stat-detail">3</span> 　조회 <span class="stat-detail">{{info.view}}</span>
			
			<button class="btn2" @click="fnBack">돌아가기</button>
			<button class="btn2" @click="fnDelete" v-if="sessionNick==info.nick">삭제</button>
			<button class="btn2" @click="fnEdit(bNo)" v-if="sessionNick==info.nick">수정</button>
			</div>
			<hr class="hrr">
			<div style="font-size:19px;">댓글</div>
			<div id="comment-head">
				<img class="profile2" src="../css/image/profile.png"><input class="comment-input" type="text">
				<button class="btn1">입력</button>
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
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		bNo : "${map.boardNo}",
		info : {}
	},// data
	methods : {
		fnGetInfo : function(){
			var self = this;
			var nparmap = {bNo : self.bNo};
            $.ajax({
                url : "/community/boardView.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
        			console.log(data.info);
                }
            });
		},
		calculateTime: function(cDateTime) {
            const currentTime = new Date();
            const postTime = new Date(cDateTime);
            const diffInMinutes = Math.floor((currentTime - postTime) / (1000 * 60));
            
            if (diffInMinutes < 1) {
                return '방금 전';
            } else if (diffInMinutes < 60) {
                return diffInMinutes + '분 전';
            } else if (diffInMinutes < 24 * 60) {
                const diffInHours = Math.floor(diffInMinutes / 60);
                return diffInHours + '시간 전';
            } else {
                const diffInDays = Math.floor(diffInMinutes / (24 * 60));
                return postTime.toLocaleString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' });
            }
        },
        scrollToComment() {
            const commentSection = document.getElementById('comment-head');
            if (commentSection) {
              commentSection.scrollIntoView({ behavior: 'smooth' });
            }
        },
        fnBack : function(){
			location.href="main.do";
		},
		fnDelete : function(){
			if(!confirm("게시글을 삭제하시겠습니까?")){
				return;
			}
			var self = this;
			var nparmap = {bNo : self.bNo};
            $.ajax({
                url : "/community/delete.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("게시글이 삭제되었습니다.");
                	location.href="main.do";
                }
            });
		},
		fnEdit : function(bNo){
			$.pageChange("/community/write.do", {bNo : bNo});
		}
	}, // methods
	created : function() {
		var self = this;
		console.log(self.sessionNick);
		self.fnGetInfo();
	}// created
});
</script>