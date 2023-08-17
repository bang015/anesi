Copy code
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="../js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="../css/mainCss.css" rel="stylesheet">
    <link href="../css/store_main.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>스토어메인페이지</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="product_store_main_ontop_category.jsp"></jsp:include>
    <div id="store_main">
        <span class="main-category__title">전체상품</span>
        <span><button class="category-order_toggle">정렬<i class="fa-solid fa-chevron-down"></i></button></span>
        <!-- 상품 정렬하는 버튼-->
        <div class="category-order-list-container" style="display:none;">
            <ul class="category-order-list">
                <li value=""><a>전체</a></li>
                <li value="LowestPrice"><a @click="fnOrderBy('LowestPrice')">가격낮은순</a></li>
                <li value="HighestPrice"><a @click="fnOrderBy('HighestPrice')">가격높은순</a></li>
                <li value="NewArrival"><a @click="fnOrderBy('NewArrival')">최신순</a></li>
                <li><a>--아직못함↓--</a></li>
                <li value="HighestPurchase"><a @click="fnOrderBy('HighestPurchase')">구매높은순</a></li>
                <li value="HighestScrap"><a @click="fnOrderBy('HighestScrap')">스크랩많은순</a></li>
                <li value="ManyReview"><a @click="fnOrderBy('ManyReview')">리뷰많은순</a></li>
            </ul>
        </div>
        <div class="production-item__content" v-for="item in list">
            <a @click="fnProductView(item.productNo)" class="production-item-thumnail">
                <div class="production-item-thumnail__overlay"></div>
                <img class="production-item-thumnail__image " alt="썸네일" :src="item.imgPath + '/' + item.imgName">
            </a>
            <div class="production-item-header">
                <span class="production-item-header__brand">{{item.manufacturer}}</span>
                <span class="production-item-header__name">{{item.productName}}</span>
                <div class="production-item-header__kind">{{item.categoryName}}
                    <span class="production-item-header__country">{{item.country}}</span>
                </div>
            </div>
            <span class="production-item-price">
                <span class="production-item-price__orginal" v-if="item.discountPrice!=''">정가
                    <span class="won_icon">￦</span>
                    <span class="production-item-price__orginal2">{{ formatPrice(item.productPrice) }}</span>
                </span>
                <!-- production-item-price__sell  : 파는 가격 -->
                <div class="production-item-price__sell">
                    <span class="won_icon">￦</span>
                    <span class="production-item-price__sell2" v-if="item.discountPrice!=''">{{formatPrice(item.discountPrice)}}</span>
                    <span class="production-item-price__sell2" v-else>{{ formatPrice(item.productPrice) }}</span>
                </div>
            </span>
            <!--  production-item-rating : 별점-->
            <div class="production-item-rating">
                <!-- 별모양-->
                <i class="fa-solid fa-star" style="color: #A782C3;"></i>
                <span class="production-item-rating__score">4.5</span>
            </div>
            <!-- 장바구니버튼-->
            <a v-if="userId!=''">
                <i @click="fnInsertUserCart(item)" v-if="!(cartList.includes(item.productNo))" class="fa fa-shopping-cart modal-toggle-button" ></i>
                <i @click="fnUpdateUserCart(item)" v-if="cartList.includes(item.productNo)" class="fa fa-shopping-cart modal-toggle-button" ></i>
            </a>
            <!-- 유저번호가 없을때, 로그인화면으로 전환-->
            <a v-else>
                <i @click="fnAddNonUserCart(item)" v-if="!(nonuserCartList.includes(item.productNo))" class="fa fa-shopping-cart modal-toggle-button" ></i>
                <i @click="fnUpdateUserCart(item)" v-if="nonuserCartList.includes(item.productNo)" class="fa fa-shopping-cart modal-toggle-button" ></i>
            </a>
            <!-- 공유하기버튼-->
            <a><i class="fa-solid fa-share-nodes"></i></a>
            <!-- 스크랩버튼-->
            <a v-if="userId!=''">
                <i @click="fnInsertScrapbook(item)" v-if="!(scrapbookList.includes(item.productNo))" class="fa-regular fa-bookmark modal-toggle-button"></i>
                <i @click="fnDeleteScrapbook(item)" v-if="scrapbookList.includes(item.productNo)"class="fa-regular fa-solid fa-bookmark"></i>
            </a>
            <a v-else>
                <i @click="openScrapModal"class="fa-regular fa-bookmark modal-toggle-button"></i>
            </a>
        </div> <!-- class="production-item__content" 끝-->
	    
	    
    	<div class="modal" v-if="showCartModal" >
		  <div class="modal-card">
		    <h2>장바구니에 추가</h2>
		    <p>상품을 장바구니에 담았습니다.장바구니로 이동하시겠습니까?</p>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveCart" >장바구니로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModal">
		  <div class="modal-card"  v-if="userId!=''">
		    <h2>스크랩북에 등록</h2>
		    <p>상품이 스크랩되었습니다.</p>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveScrapbook">스크랩북으로 이동하기</button>
		  </div>
		  
		  <div class="modal-card"  v-else>
		    <h2>로그인후 사용 가능합니다.</h2>
		    <p>로그인하시겠습니까?</p>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveLoginPage">로그인페이지로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapDeleteModal">
		  <div class="modal-card">
		    <h2>스크랩북에서 삭제되었습니다.</h2>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveScrapbook">스크랩북으로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModalBan">
		  <div class="modal-card">
		    <h2>이미 담긴상품입니다.</h2>
		    <p>스크랩북을 확인해주세요</p>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveMyPage">스크랩북으로 이동하기</button>
		  </div>
		</div>
		
    </div><!--storeMain 끝-->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>



var app = new Vue({
	el : '#store_main',
	data : {
		list : [],
		list2 : [],
		item : "",
		showCartModal: false,
		showScrapModal: false,
		showScrapModalBan: false,
		showScrapDeleteModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		userNo : '${sessionNo}',
		nonuserNo : '${nonuserNo}',
		productNo : "",
		scrapbookList : [],
		cartList : [],
		nonuserCartList : []
	
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar, productNo : self.productNo};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                	self.list = data.list;
                	self.list2=data.list2;
                    console.log(self.nonuserNo);
                }
            }); 
		},
	     fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // 카테고리 정렬값 설정
            self.fnGetList(); // AJAX 요청 보내기
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
	
	    // 모달 닫기
	    closeModal: function() {
	      this.showCartModal = false;
	      this.showScrapModal = false;
	      this.showScrapModalBan = false;
	      this.showScrapDeleteModal = false;
	      location.reload();
	    },
	    
	    fnMoveCart : function() {
        	location.href = "/product/cart.do";
	    },
	    fnMoveScrapbook : function() {
        	location.href = "/scrapbook.do";
	    },
	    fnMoveLoginPage : function() {
        	location.href = "/login.do";
	    },
	    fnCheckCart : function(item) {
	    	var self = this;
            var nparmap = {userNo: self.userNo};           
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
	                    console.log(self.nonuserNo);
	                }
	            }); 
		},
		//비회원 장바구니 추가
		fnAddNonUserCart : function(item) {
	    	var self = this;
            var nparmap = 
            	{nonuserNo: self.nonuserNo, productNo: item.productNo}
            console.log(self.nonuserNo);
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
		}

     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnCheckCart();
		self.fnCheckScrap();
		self.fnaaa();

	}// created
});
</script>
	
