<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/scrapbook.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<h2>스크랩북</h2>
			<div id="inner">
				<div><img alt="프로필" src="../css/image/pfimgG2.png" class="pfSytle"></div>
				<div class="nickStyle">{{userNick}}</div>
				<div class="allTextBox">
					<div class="allText">상품({{list.length}})</div>
				</div>
				<div class="editText" @click="editSb" v-if="!flg">편집</div>
				<div class="editText" v-if="flg">
					<span :class="checkSb.length == 0 ? 'delText' : 'delText2'" @click="delScrapbook">삭제</span>
					<span @click="editSb">취소</span>
				</div>
				
				<div v-if="list.length == '0'" class="nonList">
					<div>아직 스크랩한</div>
					<div>상품이 없습니다.</div>
					<div class="nonListText">마음에 드는 상품을 발견하면 스크랩해보세요.</div>
				</div>
				
				<div v-else class="imgBox">
					<div v-for="item in list" class="chStandard" @click="imgClick(item)">
						<img alt="" :src="item.imgPath+'/'+item.imgName"  class="sbImg">
						<input type="checkbox" class="sbCheckBox" v-model="checkSb" :value="item.scrapbookNo" v-if="flg">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		userNo : '${sessionNo}',
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		list : [],
		checkSb : [],
		flg : false,
	},// data
	methods : {
		getSbList(){
			var self = this;
			var nparmap = {userNo : self.userNo};
            $.ajax({
                url : "scrapbook/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                }
            });
		},
		editSb(){
			var self = this;
			self.flg = !self.flg;
			self.checkSb = [];
		},
		imgClick(item){
			var self = this;
			if(self.checkSb.length == 0){
				self.checkSb.push(item.scrapbookNo);
				return;
			}
			for(let i=0; i< self.checkSb.length; i++){
				if(self.checkSb[i] == item.scrapbookNo){
					self.checkSb.splice(i, 1);
					return;
				}
				if(i == (self.checkSb.length-1)){
					self.checkSb.push(item.scrapbookNo);
					return;
				}
			}
		},
		delScrapbook(){
			var self = this;
			if(!confirm("선택한 상품을 스크랩북에서 삭제하시겠습니까?")){
				return;
			}
			var checkSb = JSON.stringify(self.checkSb);
			var nparmap = {checkSb};
            $.ajax({
                url : "scrapbook/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.getSbList();
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		self.getSbList();
	}// created
});
</script>