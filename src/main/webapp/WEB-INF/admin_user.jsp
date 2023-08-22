<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../../css/mainCss.css" rel="stylesheet">
<link href="../../css/admin_user.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">

<meta charset="UTF-8">
<title>고객관리</title>

</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
			<div id="container">
				<div class="containerTitle">고객관리</div>
				
				<div class="containerProductList">
					<div class="productListTitle">
						<span>고객목록 (총 {{list.length}}개)</span>
					</div>
					<div class="btnBox">
						<button class="btn1 btn2 btn3" @click="fnCheckSituation('N')">선택판매</button>
						<button class="btn1 btn2 btn3" @click="fnCheckSituation('S')">선택중지</button>
						<button class="btn1 btn2 btn3" @click="fnCheckSituation('Y')">선택종료</button>
					</div>
					<div class="tableBox">
						<div class="table-container">
							<table>
								<tr>
									<th><input type="checkbox" @click="fnAllCheck" v-model="allChecked"></th>
									<th>수정</th>
									<th>고객번호</th>
									<th>고객아이디</th>
									<th>고객성함</th>
									<th>등록일</th>
									<th>수정일</th>
									<th>계정삭제여부</th>
									<th>로그인시도횟수</th>
								</tr>
								<tr v-for="item in list">
									<td><input type="checkbox" v-model="checkList" :value="item.userNo" @change="updateAllCheck"></td>
									<td><button class="btn1" @click="fnUserEdit(item.userNo)">수정</button></td>
									<td>{{item.userNo}}</td>
									<td>{{item.userEmail}}</td>
									<td>{{item.userName}}</td>
									<td>{{item.cDateTime}}</td>
									<td>{{item.uDateTime}}</td>
									<td>{{item.deleteYn}}</td>
									<td>{{item.cnt}}</td>
									
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal" v-if="showViewModal">
			        <div class="modal-card">
			        	<div class="modalTitle">고객정보 수정</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">고객번호</span>
			        		<span>{{info.userNo}}</span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">고객아이디</span>
			        		<span>{{info.userEmail}}</span>
			        	</div>
			     		 <div class="modalStyle1">
			        		<span class="modalSpan1">이름</span>
			        		<span><input v-model="info.userName" class="inputStyle inputStyle2"></span>
			        	</div>
			     		 <div class="modalStyle1">
			        		<span class="modalSpan1">닉네임</span>
			        		<span><input v-model="info.nick" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">연락처</span>
			        		<span><input v-model="info.phone" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">생년월일</span>
			        		<span><input v-model="info.birthday" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">성별</span>
			        		<span><input v-model="info.gender" class="inputStyle inputStyle2"></span>
			        	</div>
			        	<div class="modalStyle1">
			        		<span class="modalSpan1">문자수신여부</span>
			        		<span><input v-model="info.smsYn" class="inputStyle inputStyle2"></span>
			        	</div>
			        	
			        	
			        	
			        	
		        		<div class="modalStyle4">
		        			<span>
			        			<button class="btn1 btn2" @click="fnUpdateUser(info)">저장</button>
			        			<button @click="closeModal" class="btn1 btn2 btn3">취소</button>
		        			</span>
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
		list : [],
		item : "",
		
		checkList : [],
		allChecked : false,
		
		showViewModal : false,
		info : {},
		userNo : ""

		
	},// data
	methods : {
		//고객 전체 검색
		fnGetUser(){
			var self = this;
			var nparmap = {};
            $.ajax({
                url : "/admin/userList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.list = data.list;

					}
            });
		},
		 // 올체크
		fnAllCheck(){
			var self = this;
		    if (self.checkList.length === self.list.length) {
				self.checkList = [];
		    } else {
			    self.checkList = self.list.map(item => item.userNo);
		    }
		},
		// 체크박스 체크
		updateAllCheck() {
			var self = this;
			if (self.checkList.length === self.list.length) {
				self.allChecked = true;
			} else {
				self.allChecked = false;
			}
		},
		//고객 상세 정보 불러오기
		fnUserEdit(userNo){
			var self = this;
			var nparmap = {userNo};
			self.userNo = userNo
            $.ajax({
                url : "/admin/userInfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                	self.openViewModal();
                }

            });
			
		},
		// 모달열기
		openViewModal: function() {
			var self = this;
			self.showViewModal = true;
		},
		// 모달 닫기
		closeModal: function() {
			var self = this;
			self.showViewModal = false;
			location.reload();
		},
		//수정 정보 업데이트
		fnUpdateUser(info){
			var self = this;
			var nparmap = info;
			console.log(info);

			$.ajax({
                url : "/admin/editUser.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	             	console.log(data);

                }
            });
			alert("저장성공");
			self.closeModal(); 
			
		},
		
		//상품 상태
		fnCheckSituation(situation){
			var self = this;
			if(self.checkList.length > 0){
				var checkList = JSON.stringify(self.checkList);
				var nparmap = {	checkList, situation};
				$.ajax({
	                url : "/admin/productSituation.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	alert(data.cnt+"개 업데이트");
	                	self.checkList = []
	                	self.fnGetProduct();
	                	self.allChecked = false;
	                }
	            });
			}
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetUser();
	}// created
});
</script>