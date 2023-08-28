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
<link href="../css/review.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>나의 리뷰</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myShopping.do'">나의 쇼핑</a></li>
				<li class="my_li1 on"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">나의 리뷰</a></li>
				<li class="my_li1"><a href="../mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<div id="container2">
			<div class="rBtnBox">
				<button class="btn4 btn5 btn6" :class="{'on2' : selectType == 1}" @click="fnSetSelectType('1')">베스트순</button>
				<button class="btn4 btn5 btn6" :class="{'on2' : selectType == 0}" @click="fnSetSelectType('0')">최신순</button>
			</div>	
			<div class="reviewListBox">
				<div v-for="item in sliceReviewList" class="reviewBox">
					<div>
						<div class="title1">{{item.productName}}</div>
						<div class="optionName1">{{item.optionName}}</div>
						<span v-for="index in item.csat"><i class="fa-solid fa-star" style="color: #A782C3;"></i></span><span v-for="index in 5-item.csat"><i class="fa-solid fa-star" style="color: #ababab;"></i></span>
						<div class="content1">{{item.content}}</div>
						<div>도움 : {{item.helpCnt}}</div>
					</div>
					<div class="imgEditBox">
						<img alt="" :src="item.rImgPath+'/'+item.rImgName" v-if="item.rImgPath != 0" class="imgBox">
						<div><button class="btn4 btn5" @click="fnEditReview(item)">수정하기</button></div>
					</div>
				</div>
			</div>
			<button @click="fnIncreaseDisplayed" v-if="reviewList.length > maxInquiry && reviewList.length > 0" class="btn4 btn5 btn6 btn7 btn8">더보기</button>
		</div>
		<div class="modal noneDisplay" v-if="showScrapModal" :class="{'showDisplay' : showScrapModal}">
			<div class="review-add">
		        <div class="review-back">
					<button class="back-btn" @click="closeModal"><i  class="fa-solid fa-x fa-2x" style="color: #bdbdbd;"></i></button>
				</div>
				<div class="review-add-box">
		        	<div class="review-add-product">
		        		<div class="review-title1">리뷰수정</div>
		        		<div class="review-top-wrap">
			        		<div class="review-product-img">
			        			<img class="review-product-img1" alt="리뷰상품이미지" :src="mainImg">
			        		</div>
			        		<div class="review-product-name">
			        			<div class="review-product">
					        		<div class="review-manufacturer">
					        			{{info2.manufacturer}}
									</div>
				        			<div class="review-add-name">{{info2.productName}}</div>
				        			<span class="review-add-option">
				        				{{info.optionName}}
				        			</span>
			        			</div>
			        		</div>
		        		</div>
		        		
			        	<div class="review-product-csat">
			        		<div class="review-csat">
			        			별점 평가
			        		</div>
			        		<div class="review-csat-box">
				        		<div class="review-csat1">만족도</div>									        	
								<div class="star-rating">
								 <i v-for="(star, index) in stars" :key="index"
														      :class="starClass(index)"
														      @mouseover="hover(index + 1)"
															  @click="rate(index + 1)"
															  @mouseout="clearHover"></i>
								</div>
							</div>																									
			        	</div>
			        	<div class="img-add">
			        		<div class="img-add1">사진 첨부(선택)</div>
			        		<div class="img-add2">사진을 첨부해주세요.(최대 1장)</div>
			        	</div>
			        	<div class="review-img-btn-wrap">
			        		<input type="file" id="file1" name="file1" style="display: none;" @change="fnOnFileChange">
						    <label for="file1" class="file-upload-label">
						      <div class="img-icon"><i class="fa-regular fa-image fa-2x" style="color: #A782C3;"></i></div>
						      <div class="img-btn-text">사진 추가하기</div>
						    </label>
			        	</div>
			        	<p class="fileName">파일 이름: {{imgName}}</p>	
			        	<div class="review-title">
			        		리뷰 작성
			        	</div>
			        	<div class="review-add-textarea">
			        		<textarea @input="updateCharacterCount1()" class="review-add-text" rows="10" cols="53.9" v-model="content" placeholder="자세하고 솔직한 리뷰는 다른고객에게 큰 도움이 됩니다." class=""></textarea>
			        		 <div class="character-count">{{characterCount1}} / 200</div>
			        	</div>
			        	<div class="review-add-btn-wrap"> 
			        		<button @click="fnEditReview2" class="review-add-btn">완료</button>
			        	</div>
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
		selectType : '0',
		info : {},
		info2 : {},
		showScrapModal : false,
		mainImg : '',
		stars: Array(5).fill('empty'),
		selectedRating: 0,
	    hoveringRating: 0,
	    characterCount1 : 0,
	    file : '',
	    imgName : '',
	    fileEditflg : false,
	    content : '',
	    sliceReviewList : [],
		maxInquiry : 4,
	},// data
	methods : {
		fnGetMyReview(){
			var self = this;
			var nparmap = {userNo : self.userNo, selectType : self.selectType};
			$.ajax({
                url : "searchMyReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	self.sliceReviewList = self.reviewList.slice(0, 4);
                }
			})
		},
		fnSetSelectType(num){
			var self = this;
			self.selectType = num;
			self.fnGetMyReview();
		},
		fnEditReview(item){
			var self = this;
			self.info = item;
			self.fnGetProductInfo(item.productNo);
			self.fnThumbnailImg(item.productNo);
			self.selectedRating = item.csat;
			self.characterCount1 = item.content.length;
			self.imgName = item.rImgOrgName;
			self.content = item.content;
			
       		self.openScrapModal();
		},
		// 모달열기
		openScrapModal: function() {
			var self = this;
			self.showScrapModal = true;
		},
		// 모달 닫기
		closeModal: function() {
			var self = this;
			self.showScrapModal = false;
			location.reload();
		},
		fnThumbnailImg(productNo){
			var self = this;
	        var nparmap = {productNo};	            
            $.ajax({
                url : "../imgThumbnailSearch.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		self.img = data.img;
               		self.mainImg = self.img[0].imgPath+"/"+self.img[0].imgName;
                }                
            }); 
		},
		fnGetProductInfo(productNo){
			var self = this;
	        var nparmap = {productNo};
	        $.ajax({
                url : "../productSearch.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info2 = data.product;
                }                
            }); 
		},
		starClass(index) {
			 const rating = this.hoveringRating || this.selectedRating;
			 if (rating >= index + 1) {
			     return 'fa-solid fa-star custom-star filled';
			  } else if (rating >= index + 0.5) {
			     return 'fa-solid fa-star custom-star half';
			  } else {
			     return 'fa-solid fa-star custom-star empty';
			   }
		 },
		hover(rating) {
			 this.hoveringRating = rating;
		 },
		rate(rating) {
			 this.selectedRating = rating;
			 this.hoveringRating = 0; // 클릭했을 때 호버 상태 제거
			 this.reviewCsatCheck = false;
			 this.changeCsatStyle();
		 },
		clearHover() {
			 if (this.selectedRating === 0) {
			   this.hoveringRating = 0;
			    }
		 },
		 changeCsatStyle() {
		      if (this.reviewCsatCheck) {		    	
		        this.reviewCsatClass = 'not-check-csat';
		      } else {
		        this.reviewCsatClass = 'review-csat';		        
		      }	
		},
		updateCharacterCount1() {
			 this.characterCount1 = this.content.length;			
		 },
	 		fnOnFileChange(event) {
				var self = this;
				self.errMsg2 = "";
			    const file = event.target.files[0];	
			    if (file) {
			    	self.file = file;
			    	self.imgName = file.name;
			    	self.fileEditflg = true;
		    }
		},
		fnEditReview2(){
			var self = this;
			var nparmap = {rNo : Number(self.info.rNo), content : self.content, csat : self.selectedRating};
			 $.ajax({
	                url : "/mypage/editReview.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	                }                
	            });
			 if(self.fileEditflg){
				 self.fnImageEdit();
			 }
			 self.closeModal();
		},
		fnImageEdit(){
			var self = this;
			var form = new FormData();
   	        form.append( "file1",  self.file );	
   	        form.append("rImgName", self.info.rImgName);
   	     	form.append("rNo", self.info.rNo);
	   	     return new Promise((resolve, reject) => {
					$.ajax({
				      	url: "../fileEdit.dox",
				      	type: "POST",
				      	processData: false,
				      	contentType: false,
				      	data: form,
				      	success: function (response) {
				      		resolve(response);
				      	},
				      	error: function (error) {
				      		reject(error);
				      	}
			    	});
				});
		},
		fnIncreaseDisplayed(){
			var self = this;
			self.maxInquiry += 4;
			self.sliceReviewList = self.reviewList.slice(0, self.maxInquiry);
		}
	}, // methods
	created : function() {
		var self = this;
		if(self.userNo == ''){
			location.href="../login.do";
		}
		self.fnGetMyReview();
	}// created
});
</script>