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
	height : 30px;
	float : left;
	object-fit: cover;
}
.profile2{
	border-radius : 50%;
	width : 40px;
	height : 40px;
	float:left;
	margin-top: 5px;
	object-fit: cover;
}
.nick{
	font-size: 16px;
    line-height: 29px;
    margin-left: 40px;
}
.time{
	margin-top: 10px;
    font-size: 13px;
    float:right;
    color : gray;
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
.comment-edit-input{
	border: 1px solid #c5c5c5;
    border-radius: 7px;
    width: 470px;
    height: 48px;
    padding: 0px 10px;
    margin-right: 10px;
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
.cNick{
	position: relative;
    display: flex;
    flex-wrap: wrap;
    -webkit-box-align: center;
    align-items: center;
    width: 100%;
    font-size : 17px;
}
.cComm{
	margin: 8px 0px;
}
.c-profile{
	position: absolute;
    top: 0px;
    left: -45px;
    width: 30px;
    height: 30px;
    border-radius: 100%;
    object-fit: cover;
}
.comment-item{
	padding-left: 43px;
	margin-left: 7px;
	margin: 20px 0px;
	width: 580px;
}
#comment-body{
	margin-left : 6px;
}
.cDate{
	color: #9f9f9f;
    font-size: 12px;
	margin: 10px 0px;
}
.guide{
    text-align: center;
    border: 1px solid gray;
    border-radius: 5px;
    padding: 20px 10px;
    margin: 20px 22px 37px;
    border-color: #d1d1d1;
    color: gray;
}
.pagination {
    text-align: center;
    margin-top: 65px;
    font-size:14px;
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
    border: 1px solid;
    padding: 8px 10px;
    border-radius: 6px;
    background: #A782C3;
}
.pagination li.active a{
	color : white;
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
			<div class="stat-out" @click="copyAddress"><img class="stat-icon" src="../css/image/community/share.png"></div>
		</div>
		<div id="container">
			<div class="thum1">
				<img class="thum2" src="../css/image/community/commu_test.jpg">
			</div>
			<div id="content-head">
				<div><h1>{{info.title}}</h1></div>
				<div><img class="profile" :src="uProfileImg.uImgPath+'/'+uProfileImg.uImgName"></div>
				<div class="time">{{postCalculateTime(info.cDateTime)}}<span v-if="info.cDateTime!=info.uDateTime"> · {{calculateTime(info.uDateTime)}} 수정</span></div>
				<div class="nick">{{info.nick}}</div>
			</div>
			<hr class="hrr">
			<div id="comment"></div>
			<div style="overflow: auto;">
			    <pre v-html="info.content"></pre>
			</div>
			<div class="stat"><!-- 좋아요 <span class="stat-detail">2</span> 　 -->댓글 <span class="stat-detail">{{cCnt}}</span> 　조회 <span class="stat-detail">{{info.view}}</span>
			
			<button class="btn2" @click="fnBack">목록으로</button>
			<button class="btn2" @click="fnDelete" v-if="sessionNick==info.nick||sessionNick=='관리자'">삭제</button>
			<button class="btn2" @click="fnEdit(bNo)" v-if="sessionNick==info.nick">수정</button>
			</div>
			<hr class="hrr">
			<div style="font-size:19px;">댓글 <span>{{cCnt}}</span></div>
			<div id="comment-head">
				<div v-if="sessionNo!=''">
					<img class="profile2" :src="profileImg.uImgPath+'/'+profileImg.uImgName"><input class="comment-input" type="text" v-model="content">
					<button class="btn1" @click="fnComInsert">입력</button>
				</div>
				<div v-else class="guide">로그인 후 댓글 입력 가능합니다.</div>
			</div>
			<div id="comment-body">
				<div v-for="(item, index) in commentList">
					    <div class="comment-item">
					        <div>
					            <div class="cNick">{{item.cNick}}<img class="c-profile" :src="item.uImgPath+'/'+item.uImgName"></div>
					            <div class="cComm">
					                <span v-if="item.commFlg==true">
					                    <input v-model="item.comm" class="comment-edit-input" @keyup.enter="fnComEdit(item.commentNo, item.comm)">
					                    <button @click="fnComEdit(item.commentNo, item.comm)" class="btn1">수정</button>
					                </span>
					                <span v-else>
					                    {{item.comm}}
					                </span>
					            </div>
					            <div class="cDate"><span>{{calculateTime(item.cCDateTime)}} </span><span v-if="item.cCDateTime!=item.cUDateTime"> · {{calculateTime(item.cUDateTime)}} 수정</span>
					                <span v-if='sessionNick==item.cNick'>
					                     · <a @click="fnComEditOpen(item.commentNo)">수정</a>
					                </span>
					                <span v-if='sessionNick==item.cNick||sessionNick=="관리자"'>
					                     · <a @click="fnComDelete(item.commentNo)">삭제</a>
					                </span>
					            </div>
					        </div>
					    </div>
					</div>
					<template>
						<paginate
					    	:page-count="pageCount"
					    	:page-range="3"
					    	:margin-pages="2"
					    	:click-handler="fnSearch"
					    	:prev-text="'<'"
					    	:next-text="'>'"
					    	:container-class="'pagination'"
					    	:page-class="'page-item'" v-if="(cList.length>0)">
						</paginate>
					</template>
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
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		bNo : "${map.boardNo}",
		userNo : "",
		info : {},
		cCnt : "",
		userInfo : {},
		content : "",
		cList : [],
		commentList: [],
		comNo : "",
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		profileImg : {},
		uProfileImg : {}
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
                	self.userInfo = data.userInfo;
                	self.userNo = data.userInfo.userNo;
                	self.fnGetUserProfile();
                	self.cCnt = data.cCnt;
                	console.log(self.bNo);
                }
            });
		},
		fnGetComment : function(){
			var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = 10;
			var param = {bNo : self.bNo, startNum : startNum, lastNum : lastNum};
			$.ajax({
                url : "/community/cList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) {
                	self.cList = data.list;
                	self.commentList = self.cList.map(comment => ({ ...comment, commFlg: false }));
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
                }
            }); 
		},
		fnSearch : function(pageNum){
			var self = this;
			var startNum = ((pageNum-1) * 10);
			var lastNum = 10;
			var nparmap = {bNo : self.bNo, startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/community/cList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.cList = data.list;
                	self.commentList = self.cList.map(comment => ({ ...comment, commFlg: false }));
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 10);
				}
			});
		},
		postCalculateTime: function(cDateTime) {
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
		        if (diffInDays === 1) {
		            return '어제';
		        } else if (diffInDays < 7) {
		            return diffInDays + '일 전';
		        } else {
		            return postTime.toLocaleString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric' });
		        }
		    }
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
		    } else if (diffInMinutes < 30 * 24 * 60) {  // 30일 미만이면 일자로 표시
		        const diffInDays = Math.floor(diffInMinutes / (24 * 60));
		        return diffInDays + '일 전';
		    } else if (diffInMinutes < 12 * 30 * 24 * 60) {  // 12개월 미만이면 개월로 표시
		        const diffInMonths = Math.floor(diffInMinutes / (30 * 24 * 60));
		        return diffInMonths + '개월 전';
		    } else {
		        return postTime.toLocaleString({ year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'});
		    }
		},
        scrollToComment() {
            const commentSection = document.getElementById('comment');
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
		},
		fnComInsert : function(){
			var self = this;
			var nparmap = {bNo : self.bNo, nick : self.sessionNick, cUserNo : self.sessionNo, content: self.content};
            $.ajax({
                url : "/community/addComment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	location.reload();
                }
            });
		},
		fnComDelete : function(cNo){
			var self = this;
			var nparmap = {cNo : cNo};
			console.log(cNo);
            $.ajax({
                url : "/community/deleteComm.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("삭제되었습니다.");
                	location.reload();
                }
            });
		},
		fnComEditOpen: function(commentNo) {
		    var self = this;
		    const comment = self.commentList.find(item => item.commentNo === commentNo);
		    if (comment) {
		        self.commentList.forEach(item => {
		            if (item.commentNo === commentNo) {
		                item.commFlg = !item.commFlg;  // 수정 input을 열거나 닫도록 commFlg 값을 토글
		            } else {
		                item.commFlg = false;  // 다른 댓글의 수정 input은 닫음
		            }
		        });
		    }
		},
		fnComEdit: function(commentNo, comm) {
		    var self = this;
		    var nparmap = {cNo: commentNo, comm: comm};
		    $.ajax({
		        url: "/community/editComm.dox",
		        dataType: "json",
		        type: "POST",
		        data: nparmap,
		        success: function(data) {
		            // 수정 완료 후 수정 모드 종료
		            self.commentList.forEach(item => {
		                if (item.commentNo === commentNo) {
		                    item.commFlg = false;
		                    item.comm = comm; // 수정된 내용으로 댓글 내용 업데이트
		                }
		            });
		        }
		    });
		},
		copyAddress() {
			const info = {
	                bNo : this.bNo
	            };
	            const queryParams = new URLSearchParams(info).toString();
	            const fullUrl = window.location.href + '?' + queryParams;

	            const dummyTextArea = document.createElement('textarea');
	            dummyTextArea.value = fullUrl;
	            document.body.appendChild(dummyTextArea);
	            dummyTextArea.select();
	            document.execCommand('copy');
	            document.body.removeChild(dummyTextArea);
	            alert('주소가 복사되었습니다.');
        },
        fnGetProfile(){
			var self = this;
			var nparmap = {userNo : self.sessionNo};
			$.ajax({
                url : "/profileImg.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.profileImg = data.img;
                }
			})
		},
		fnGetUserProfile(){
			var self = this;
			var nparmap = {userNo: self.userNo};
			$.ajax({
                url : "/profileImg.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.uProfileImg = data.img;
                	console.log(self.uProfileImg);
                }
			})
		}
	}, // methods
	created : function() {
		var self = this;
		console.log(self.uProfileImg.uImgPath);
		self.fnGetInfo();
		self.fnGetProfile();
		self.fnGetComment();
	}// created
});
</script>