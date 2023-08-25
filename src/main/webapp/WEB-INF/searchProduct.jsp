<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/store_main.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>스토어메인페이지</title>
<style>

/* 
*{
border : 1px solid black;
} */
.main-category__title{
 	 font-size : 25px;
 	 font-weight : bold;
}
.product-main-category__image{
	width:100px;
	height:100px;
}


.production-item-thumnail__image{
	width:250px;
	height:250px;
}

.product-main-category__name{
	font-size : 15px;
}
.won_icon,.production-item-price__orginal2{
	text-decoration: line-through;
}

.production-item__content{
	width:220px;
	height:338px;
	float : left;
	margin : 50px;
}

#product-main-category__total > li {
        display: inline-block;
        position: relative;
        top: 10px;
      }
#product-main-category__total > li > a {
  display:block; position:relative; padding-bottom:19px;
  margin: 40px;
}
#product-main-category__total > li > a > img {
  width:100px; height:100px;
}
#product-main-category__total > li > a > span {
  position:absolute; bottom:0; left:50%; color:#666; line-height:1.462em; white-space:nowrap; transform:translate(-50%, 0)
}
      
.category-order_toggle{
	background-color:#A782C3;
	border: #fff;
	text-align: center;
	border-radius:10px; 
	padding:8px;
	height:35px; 
	width: 100px;
	font-family: 'Pretendard-Regular';
	color :  #fff;
 	 position:relative;
  	flex : 0 0 5;
 }
.category-order_toggle:hover {
    background-color:rgb(235, 236, 237);
    transition: 0.7s;
    
}  
.category-order-list {

  list-style-type: none;
  padding: 0;
  margin: 0;
  position:absolute;
}

.category-order-list li {

  /* 카테고리 스타일링 */
  padding: .5em;
  border-bottom: 1px solid #ccc;
}
.category-order-list-container {
	background :  #fff;
   	width: 100px;
    

}

.aaa {
  color: #A782C3; /* 원하는 색상 */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
}


.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* 불투명한 검은색 배경 */
  display: flex;
  align-items: center;
  justify-content: center;
    z-index:1000;
  
}

.modal-card {
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
}
.noneDisplay{
	display: none !important;
}
.showDisplay{
	display: flex !important;
}



</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="product_store_main_ontop_category.jsp"></jsp:include>
<div id="session-data" data-session-product-name="<%=session.getAttribute("sessionProductName") %>"></div>

	<div id="store_main">
	



<div class="category-order-list-container" style="display:none;">


  <ul class="category-order-list" >
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
		
			    <img class="production-item-thumnail__image animate__animated animate__pulse"
			         alt="썸네일" :src="item.imgPath + '/' + item.imgName">
		    </a>
		    <div class="production-item-header" >
			    <span class="production-item-header__brand" >{{item.manufacturer}}</span>
			    <span class="production-item-header__name">{{item.productName}}</span>
			    <div class="production-item-header__kind">{{item.categoryName}} 
			    <span class="production-item-header__country">{{item.country}}</span>
			    </div>
		    </div>

		    <span class="production-item-price">
		       <span class="production-item-price__orginal" v-if="item.discountPrice!=''">
			    정가
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
					<i @click="fnInsertUserCart(item)" v-if="!(cartList.includes(item.productNo))"class="fa fa-shopping-cart modal-toggle-button" ></i>
					<i @click="fnUpdateUserCart(item)" v-if="cartList.includes(item.productNo)" class="fa fa-shopping-cart modal-toggle-button" ></i>
				</a>
				
		    	<!-- 공유하기버튼-->
		    	<a><i class="fa-solid fa-share-nodes"></i></a>
		    	<!-- 스크랩버튼-->
		    	<a v-if="userId!=''">
		    		<i @click="fnInsertScrapbook(item)" v-if="!(scrapbookList.includes(item.productNo))" class="fa-regular fa-bookmark modal-toggle-button"></i>
		    		<i @click="fnDeleteScrapbook(item)" v-if="scrapbookList.includes(item.productNo)"class="fa-regular fa-solid fa-bookmark"></i>
	    		</a>
		    	<a v-else><i @click="openScrapModal"class="fa-regular fa-bookmark modal-toggle-button"></i></a>
	    </div> <!-- class="production-item__content" 끝-->
	    
	    
	    
		<div class="modal noneDisplay" v-if="showCartModal" :class="{'showDisplay' : showCartModal}">
			<div class="modal-card">
				<h2>장바구니에 추가</h2>
				<p>상품을 장바구니에 담았습니다.장바구니로 이동하시겠습니까?</p>
				<button @click="closeModal" class="left_button">쇼핑계속하기</button>
				<button @click="fnMoveCart" class="right_button">장바구니로 이동하기</button>
			</div>
		</div>

		<div class="modal noneDisplay" v-if="showScrapModal" :class="{'showDisplay' : showScrapModal}">
			<div class="modal-card" v-if="userId!=''">
				<h2>스크랩북에 등록</h2>
				<p>상품이 스크랩되었습니다.</p>
				<button @click="closeModal" class="left_button">쇼핑계속하기</button>
				<button @click="fnMoveScrapbook" class="right_button">스크랩북으로
					이동하기</button>
			</div>

			<div class="modal-card" v-else>
				<h2>로그인후 사용 가능합니다.</h2>
				<p>로그인하시겠습니까?</p>
				<button @click="closeModal" class="left_button">쇼핑계속하기</button>
				<button @click="openScrapModal3" class="right_button">로그인페이지로
					이동하기</button>
			</div>
		</div>

		<div class="modal noneDisplay" v-if="showScrapDeleteModal" :class="{'showDisplay' : showScrapDeleteModal}">
			<div class="modal-card">
				<h2>스크랩북에서 삭제되었습니다.</h2>
				<button @click="closeModal" class="left_button">쇼핑계속하기</button>
				<button @click="fnMoveScrapbook" class="right_button">스크랩북으로
					이동하기</button>
			</div>
		</div>

		<div class="modal noneDisplay" v-if="showScrapModalBan" :class="{'showDisplay' : showScrapModalBan}">
			<div class="modal-card">
				<h2>이미 담긴상품입니다.</h2>
				<p>스크랩북을 확인해주세요</p>
				<button @click="closeModal" class="left_button">쇼핑계속하기</button>
				<button @click="fnMoveMyPage" class="right_button">스크랩북으로
					이동하기</button>
			</div>
		</div>
	    
    </div>
<div id="app" data-session-product-name="<%=session.getAttribute("sessionProductName") %>"></div>

	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>

$(document).ready(function() {
	  try {
	        const sessionDataDiv = document.getElementById('session-data');
	        const sessionProductName = sessionDataDiv.dataset.sessionProductName;
	        console.log('Session Product Name:', sessionProductName);
	        // 이 부분에 원하는 로직을 추가합니다.
	    } catch (e) {
	        console.error('Error while reading session data:', e);
	    }
	});
	
	// 상품정렬 버튼 클릭 이벤트 추가
    var isListOpen = false; // Flag to track the state of the list container

    $('.category-order_toggle').click(function() {
        if (!isListOpen) { // 현재 목록이 닫혀있는 경우에만 열기
            $('.category-order-list-container').slideDown('slow');
            isListOpen = true;
        }
    });

    // 목록 항목 클릭 이벤트 추가
    $('.category-order-list a').click(function() {
        // 목록 항목을 클릭하면 목록을 닫습니다.
        $('.category-order-list-container').slideUp('slow');
        isListOpen = false;
    });


    var app = new Vue({
        el: '#store_main',
        data: {
            list: [],
            list2: [],
            item: "",
            showCartModal: false,
            showScrapModal: false,
            showScrapModalBan: false,
            showScrapDeleteModal: false,
            userId: '${sessionId}',
            userNick: '${sessionNick}',
            userNo: '${sessionNo}',
            productNo: "",
            productName: '${searchKeyword}',
            scrapbookList: [],
            cartList: [],
        },
        methods: {
            fnGetList: function() {
                var self = this;
                var params = {
                    productName: self.productName
                };
                $.ajax({
                    url: "/product/searchBarProduct.dox",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    data: params,
                    success: function(data) {
                        self.list = data.products;
                    }
                });
            },
            fnOrderBy: function(orderBy) {
                var self = this;
                self.categoryOrderBar = orderBy;
                self.fnGetList();
            },

    		//이미지 마우스 오버했을때 pulse 애니메이션
    		addPulseAnimation: function(event) {
    			event.currentTarget.classList.add('animate__animated', 'animate__pulse');
    		},
    		removePulseAnimation: function(event) {
    			event.currentTarget.classList.remove('animate__animated', 'animate__pulse');
    		},

    		formatPrice: function(price) {
    			// 천 단위마다 쉼표(,)를 추가하는 정규식 처리
    			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
    						self.cartList.push(data.list[i].productNo.toString());
    					}
    				}
    			});
    		},

    		fnAddNonUserCart : function(item) {
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
    					console.log("삭제완")
    				}
    			});

    			self.openScrapDeleteModal();
    			console.log(self.showScrapModal);
    		},
			
    		fnProductView : function(productNo){
    			var self = this;
    			$.pageChange("/product/view.do",{no : productNo});//보낼필요없을때 파라미터 빈값으로{}
    		},
    		
    		
    
    	},// methods
    	mounted: function() {
            this.fnGetList(); // Vue 앱이 생성된 직후 상품 목록을 가져옵니다.
        },
        created : function() {
            var self = this;
            self.fnGetList();
            self.fnCheckCart();
            self.fnCheckScrap();
        }
    });
</script>