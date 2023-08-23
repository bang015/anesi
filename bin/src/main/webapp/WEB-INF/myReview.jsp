<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1_ch" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myShopping.do'">나의 쇼핑</a></li>
				<li class="my_li1 on"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">나의 리뷰</a></li>
				<li class="my_li1"><a href="../mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<div id="container2">
			<div class="rBtnBox">
				<button class="btn4 btn5 btn6" :class="{'on2' : !onflg}">베스트순</button>
				<button class="btn4 btn5 btn6" :class="{'on2' : onflg}">최신순</button>
			</div>	
			<div class="reviewListBox">
				<div v-for="item in reviewList" class="reviewBox">
					<div>
						<div class="title1">{{item.productName}}</div>
						<div class="optionName1">{{item.optionName}}</div>
						<span v-for="index in item.csat"><i class="fa-solid fa-star" style="color: #A782C3;"></i></span><span v-for="index in 5-item.csat"><i class="fa-solid fa-star" style="color: #ababab;"></i></span>
						<div class="content1">{{item.content}}</div>
					</div>
					<div class="imgEditBox">
						<img alt="" :src="item.rImgPath+'/'+item.rImgName" v-if="item.rImgPath != 0" class="imgBox">
						<div><button class="btn4 btn5">수정하기</button></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		userNo : '${sessionNo}',
		reviewList : [],
		onflg : true,
	},// data
	methods : {
		fnGetMyReview(){
			var self = this;
			var nparmap = {userNo : self.userNo};
			$.ajax({
                url : "searchMyReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	console.log(self.reviewList);
                }
			})
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetMyReview();
	}// created
});
</script>