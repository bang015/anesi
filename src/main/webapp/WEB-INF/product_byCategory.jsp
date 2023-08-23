<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!--페이징-->
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/store_main.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet">

<meta charset="EUC-KR">
<title>카테고리별 상품메인페이지</title>
<style>
#store_main_byCategory{
	margin-top: 200px;
	margin-bottom: 40px;
}
.pagination {
    margin-left : 40%;
 }
 .category-wrap{
 	font-size: 17px;
 	font-weight: bold;
 }
 .ca{
 	margin-left: 32px;
 }
 .category-wrap{
 	display: inline-block;
 }
 .category-name1{
 	margin-left: 5px;
 }

 .production-item__content{
 	display: inline-block;
 }
 .pa{
 	clear: both;
 }
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div id="store_main_byCategory">
		<div id="store_main_cont">
			<div class="flex-container">
				<div class="ca">
					<div class="category-wrap" v-for="(item,index) in category">
						<span class="category-name1">{{item.categoryName}}</span> 
						<span class="category-span" v-if="index !== category.length - 1"> <i class="fa-solid fa-chevron-right" style="color: #424242; font-size : 14px;"></i> </span>
					</div>
				</div>
		 			<div class="selectBox2" @mouseover="showOptions" @mouseleave="hideOptions" :class="{ active: optionsVisible }">
				      <button class="label">{{ selectedOption }}</button>
				      <ul class="optionList">
				        <li v-for="(option, index) in options" :key="index" class="optionItem" @click="handleSelect(option.value)">{{ option.text }}</li>
				      </ul>
				    </div>		
			</div>
			
		<div class="production-item__content" v-for="item in list" >
			<div class="production-item-header"  @click="fnProductView(item.productNo)">
	            <a  class="production-item-thumnail">
	                <div class="production-item-thumnail__overlay"></div>
				    <img class="production-item-thumnail__image"alt="썸네일" :src="item.imgPath + '/' + item.imgName">
			    </a>
		  		  <div class="brand_name">
            		<span class="production-item-header__brand">{{item.manufacturer}}</span>
                	<span class="production-item-header__name">{{item.productName}}</span>
            	</div>
                <div class="category_country">
                    <span class="production-item-header__kind">{{item.categoryName}},</span>
                    <span class="production-item-header__country">{{item.country}}</span>
                </div>
		    </div>
			 
           <div class="production-item-price">
                <div class="production-item-price__orginal" v-if="item.discountPrice!=''">정가
                    <span class="won_icon">￦</span>
                    <span class="production-item-price__orginal2">{{ formatPrice(item.productPrice) }}</span>
                    <span class="production-item-price__percent">{{ item.discount }}%</span>
                </div>
                <!-- production-item-price__sell  : 파는 가격 -->
                <div class="production-item-price__sell">
                    <span class="won_icon">￦</span>
                    <span class="production-item-price__sell2" v-if="item.discountPrice!=''">{{formatPrice(item.discountPrice)}}</span>
                    <span class="production-item-price__sell2" v-else>{{ formatPrice(item.productPrice) }}</span>
                </div>
            </div>
            
		         <!--  production-item-rating : 별점-->
            <div class="production-item-rating">
                <!-- 별모양-->
                <i class="fa-solid fa-star" style="color: #A782C3;"></i>
                <span class="production-item-rating__score ">{{item.csatAvg}}</span>
            </div>
           <!-- 장바구니버튼-->
             <a class="cart_button">
			    <i
			      @click="userId ? (cartList.includes(item.productNo) ? fnUpdateUserCart(item) : fnInsertUserCart(item)) : (nonuserCartList.includes(item.productNo) ? fnUpdateUserCart(item) : fnAddNonUserCart(item))"
			      class="fa-solid fa-cart-shopping fa-xl"
			    ></i>
			  </a>
            <!-- 공유하기버튼-->
            <a class="share_button" @click="shareSelectedOption()"><i class="fa-solid fa-share-nodes fa-xl"></i></a>
            <!-- 스크랩북버튼-->
             <a v-if="userId!=''" class="scrap_button">
                <i @click="fnInsertScrapbook(item)" v-if="!(scrapbookList.includes(item.productNo))" class="fa-regular fa-bookmark modal-toggle-button  fa-xl"></i>
                <i @click="fnDeleteScrapbook(item)" v-if="scrapbookList.includes(item.productNo)"class="fa-regular fa-solid fa-bookmark  fa-xl " style="color:#A782C3;"></i>
            </a>
            <a v-else class="scrap_button">
                <i @click="openScrapModal"class="fa-regular fa-bookmark modal-toggle-button fa-xl"></i>
            </a>
    	    </div> <!-- class="production-item__content" 끝-->

    	    </div><!-- store_main_cont 끝-->
			<!-- 페이징 -->
			<div class="pa" >
			<template v-if="pageCount > 1">
				<paginate :page-count="pageCount" :page-range="3" :margin-pages="2"
					:click-handler="fnSearch" :prev-text="'<'" :next-text="'>'"
					:container-class="'pagination'" :page-class="'page-item'">
				</paginate>
			</template>
	    	</div>
	    
    	<div class="modal" v-if="showCartModal" >
		  <div class="modal-card">
		    <h2>장바구니에 추가</h2>
		    <p>상품을 장바구니에 담았습니다.장바구니로 이동하시겠습니까?</p>
		    <button @click="closeModal" class="left_button">쇼핑계속하기</button>
		    <button @click="fnMoveCart" class="right_button">장바구니로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModal">
		  <div class="modal-card"  v-if="userId!=''">
		    <h2>스크랩북에 등록</h2>
		    <p>상품이 스크랩되었습니다.</p>
		    <button @click="closeModal" class="left_button">쇼핑계속하기</button>
		    <button @click="fnMoveScrapbook" class="right_button">스크랩북으로 이동하기</button>
		  </div>
		  
		  <div class="modal-card"  v-else>
		    <h2>로그인후 사용 가능합니다.</h2>
		    <p>로그인하시겠습니까?</p>
		    <button @click="closeModal" class="left_button">쇼핑계속하기</button>
		    <button @click="openScrapModal3" class="right_button">로그인페이지로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapDeleteModal">
		  <div class="modal-card">
		    <h2>스크랩북에서 삭제되었습니다.</h2>
		    <button @click="closeModal" class="left_button">쇼핑계속하기</button>
		    <button @click="fnMoveScrapbook" class="right_button">스크랩북으로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModalBan">
		  <div class="modal-card">
		    <h2>이미 담긴상품입니다.</h2>
		    <p>스크랩북을 확인해주세요</p>
		    <button @click="closeModal" class="left_button">쇼핑계속하기</button>
		    <button @click="fnMoveMyPage" class="right_button">스크랩북으로 이동하기</button>
		  </div>
		</div>
		
		
		<!-- 로그인 페이지로 이동-->
		<div class="modal" v-if="showScrapModal3">
              <div class="container">
	              <div class="review-back">
	                 <button @click="closeModal"><i  class="fa-solid fa-x fa-2x" style="color: #bdbdbd;"></i></button>
	              </div>
                 <div class="content1">
                    <div class="logo2">
                       <a href="main.do"><img alt="logo" src="../css/image/footer_img.png" ></a>
                    </div>
                    <div class="login-wrap">
                       <div class="login-title">
                          <span class="title1">로그인</span>
                       </div>
                       <div class="login-box"> <!-- 로그인 입력 박스 -->
                          <input class="login-input" v-model="userEmail" placeholder="이메일" @keyup.enter="fnLogin">
                          <input class="login-input" type="password" v-model="pwd" placeholder="패스워드" @keyup.enter="fnLogin">
                       </div>
                       <div class="login-btn">
                          <button class="loginBtn btn" @click="fnLogin">로그인</button>
                       </div>
                    </div>
                    <div class="a-wrap"> <!-- 기타등등 -->
                       <a href="/selectEmail.do" class="a a1">아이디찾기</a>
                       <a href="/join.do" class="a a2">회원가입</a>
                    </div>
                    <div class="non-user-wrap1"> <!-- 비회원 주문 조회 -->
                       <button class="loginBtn1 btn" @click="">비회원 구매하기</button>
                    </div>
                 </div>
              </div>      
          </div>
	
	    
    </div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>
<!--페이징 -->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
	el : '#store_main_byCategory',
	data : {
		list : [],
		list2 : [],
		item : "",
		item2 : "",
		showCartModal: false,
		showScrapModal: false,
		showScrapModalBan: false,
		showScrapDeleteModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		userNo : '${sessionNo}',
		categoryNo : '${map.categoryNo}',
		categoryName : "",
		productNo : "",
		scrapbookList : [],
		cartList : [],
		nonuserCartList : [],
		nonuserNo : "",
		userEmail : "",
        pwd : "",
        showScrapModal3 : false,
        <!-- 페이징 -->
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		
		optionList : [],
		selectedOption: '정렬',
	    options: [
	      { text: '낮은가격순', value: '1' },
	      { text: '높은가격순', value: '2' },
	      { text: '최신순', value: '3' },
	    ],
	    optionsVisible: false,
	    order : "",
	    category : {},

	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            <!-- 페이징 -->
			var startNum = ((self.selectPage-1) * 12);
    		var lastNum = 12;
            var nparmap = { 
            				order : self.order,
            				categoryNo : self.categoryNo, 
            				startNum : startNum, 
            				lastNum : lastNum};
            console.log(nparmap);
            $.ajax({
                url : "/categoryProduct.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.productList;
                	console.log(data.productList);
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 12);
                }
            }); 
		},
		
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum; 
			var startNum = ((pageNum-1) * 12);
			var lastNum = 12;
			var nparmap = {startNum : startNum, lastNum : lastNum};
		 $.ajax({
                url : "/categoryProduct.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
					self.list = data.list;
                	self.list2 = data.list2;

					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 12);
				}
			});
		},
		fnGetCategory : function(){
			var self = this;
            var nparmap = {categoryNo : self.categoryNo};	            
            $.ajax({
                url : "../categorySearch.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                
               		self.category = data.category;
               		
                }                
            }); 
		},
	     formatPrice: function(price) {
	            // 100의 자리까지 내림하여 표시하며 천 단위마다 쉼표(,)를 추가합니다.
	            const truncatedPrice = Math.floor(price / 100) * 100;
	            return truncatedPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         },
        
        // 모달 열기
	    openCartModal: function() {
          var self = this;
          self.showCartModal = true;
	    },
	    openScrapModal: function() {
          var self = this;
          self.showScrapModal = true;
	    },
	    openScrapDeleteModal: function() {
          var self = this;
          self.showScrapDeleteModal = true;
	    },
	    openScrapModal3: function() {
	          var self = this;
	          self.showScrapModal3 = true;
	    },
	    // 모달 닫기
	    closeModal: function() {
	      this.showCartModal = false;
	      this.showScrapModal = false;
	      this.showScrapModalBan = false;
	      this.showScrapDeleteModal = false;
    	  this.showScrapModal3 = false;
	      location.reload();
	    },
	    //모달에서 페이지이동 함수
	    fnMoveCart : function() {
        	location.href = "/product/cart.do";
	    },
	    fnMoveMyPage : function() {
        	location.href = "/mypage.do";
	    },
	  	    
	    fnCheckCart : function() {
	    	var self = this;
	         var nparmap = {nonuserNo : self.nonuserNo, userNo: self.userNo};      
            $.ajax({
                url : "/product/selectCartList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	for(let i=0; i<data.list.length;i++){
	                	if(self.userNo != '' && self.userNo != null) {
	                        self.cartList.push(data.list[i].productNo.toString());
	                	}else{
	                        self.nonuserCartList.push(data.list[i].productNo.toString());
	                	}
                     }
                   }
            }); 
		},
		
	   fnInsertUserCart : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
            $.ajax({
                url : "/product/insertCart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	/* alert("등록완"); */
                   console.log(self.userNo);
                }
            }); 
            self.openCartModal();
            console.log(self.showCartModal);
		}, 
	    fnUpdateUserCart : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
            $.ajax({
                url : "/product/addCartCnt.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 

                }
            }); 
            self.openCartModal();
            console.log(self.showCartModal);

		}, 
		fnCheckScrap : function(item) {
	    	var self = this;
            var nparmap = {userNo: self.userNo};
            $.ajax({
                url : "/product/selectScrapList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	for(let i=0; i<data.list.length;i++){
                        self.scrapbookList.push(data.list[i].productNo.toString());
                     }
                }
            }); 
            
		},
	    fnInsertScrapbook : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
           
            $.ajax({
                url : "/product/insertScrap.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                }
            }); 
            self.openScrapModal();
            console.log(self.showScrapModal);
		},
	    fnDeleteScrapbook : function(item) {
	    	var self = this;
            var nparmap = { userNo: self.userNo, productNo: item.productNo};
           
            $.ajax({
                url : "/product/deleteScrap.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
            self.openScrapDeleteModal();
            console.log(self.showScrapModal);
		},
		//'제품상세보기' 페이지 이동
		fnProductView : function(productNo){
	    	var self = this;
	    	   $.pageChange("/product/view.do",{no : productNo});//보낼필요없을때 파라미터 빈값으로{}
		},
		
		//비회원 번호 쿠키불러오는 애 
		fnaaa : function(item){
			var self = this;
            var nparmap = '';
            //{ nonuserNo: self.nonuserNo, productNo: item.productNo};
			 $.ajax({
	                url : "/nonUserCookie.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.nonuserNo = data.value;
	            		self.fnCheckCart();

	                }
	            }); 
		},
		//비회원 장바구니 추가
		fnAddNonUserCart : function(item) {
	    	var self = this;
            var nparmap = 
            	{nonuserNo: self.nonuserNo, productNo: item.productNo}
            $.ajax({
                url : "/product/addNonUserCart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
            self.openCartModal();
            console.log(self.showCartModal);
		},
		
		fnLogin : function(){
            var self = this;
            var nparmap = {userEmail : self.userEmail, pwd : self.pwd};
            if(self.userEmail == ""){
               alert("이메일을 입력하세요.");
               return;
            }
            if(self.pwd == ""){
               alert("비밀번호를 입력하세요.");
               return;
            }
            $.ajax({
                url : "../login.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) {                
                     if(data.success){                      
                        location.reload();                      
                      } else {   
                         alert(data.message);
                      }
                }                
            }); 
        },
        
        handleSelect(value) {
	          this.selectedOption = value ? this.options.find(option => option.value === value).text : '정렬';
	          this.optionsVisible = false;
	          this.order = value;
	          this.fnGetList();
    	},
      
        showOptions() {
          this.optionsVisible = true;
        },
        hideOptions() {
         this.optionsVisible = false;
        },

     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnaaa();
		self.fnCheckScrap();
		self.fnGetCategory();
	}// created
});




</script>