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
<title>나의 문의</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a href="/mypage.do" class="my_a1_ch" style="color : #A782C3;">프로필</a></li>
				<li class="my_li1"><a href="/mypage/myShopping.do" class="my_a1">나의 쇼핑</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">나의 리뷰</a></li>
				<li class="my_li1"><a href="/mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<ul class="my_menu1">
			<li class="my_li2"><a href="/mypage.do" class="my_a2">모두 보기</a></li>
			<li class="my_li2"><a class="my_a2_ch">나의 문의</a></li>
			<li class="my_li2"><a href="/mypage/myBoard.do" class="my_a2">나의 게시글</a></li>
			<li class="my_li2"><a href="/scrapbook.do" class="my_a2">스크랩북</a></li>
		</ul>
		<div id="container2">
			<div v-if="inquiryList.length == 0" class="nonInquiry">아직 문의한 내역이 없습니다.</div>
			<div>
				<div v-for="item in inquiryList" class="inquiryBox">
					<div class="replyBox1">
						<span class="replyflgBox">{{item.reply == undefined ? '미답변' : '답변완료'}}</span>
						<span class="cDateTime">{{item.cDateTime.substring(0,11)}}</span>
					</div>
					<div class="productNameBox">
						<span>상품</span>
						<span @click="fnMoveView(item.productNo)">{{item.productName}}</span>
					</div>
					<div class="inquiryContent">
						<div class="iconBack"><i class="fa-solid fa-q fa-sm" style="color: #A782C3;"></i></div>
						<span>{{item.content}}</span>
					</div>
					<div v-if="item.reply != undefined" class="replyBox2">
						<div>{{item.reply}}</div>
						<span>관리자 · {{item.udatetime.substring(0,11)}}</span>
					</div>
					<div>
						<button class="btn4 btn5 btn6 btn7" @click="fnRemoveInquiry(item.enquiryNo)">삭제</button>
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
		inquiryList : [],
		
	},// data
	methods : {
		fnGetInquiry(){
			var self = this;
			var nparmap = {userNo : self.userNo};
			$.ajax({
                url : "searchInquiryList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.inquiryList = data.list;
                }
			})
		},
		fnMoveView(productNo){
			$.pageChange("/product/view.do", {no : productNo} );
		},
		fnRemoveInquiry(enquiryNo){
			var self = this;
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			var nparmap = {enquiryNo};
			$.ajax({
                url : "removeInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.fnGetInquiry();
                }
			})
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetInquiry();
	}// created
});
</script>