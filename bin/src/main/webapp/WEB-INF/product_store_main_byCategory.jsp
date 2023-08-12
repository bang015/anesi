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
<meta charset="EUC-KR">
<title>가구메인페이지</title>
<style>




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
	float : right;
	margin-right : 100px;
	background-color:#A782C3;
	border: #fff;
	text-align: center;
	border-radius:10px; 
	padding:8px;
	height:35px; 
	width: 100px;
	font-family: 'Pretendard-Regular';
	color :  #fff;
	
	
	
  }
.category-order_toggle:hover {
    background-color:rgb(235, 236, 237);
    transition: 0.7s;
    
}  
.category-order-list {

  list-style-type: none;
  padding: 0;
  margin: 0;
}

.category-order-list li {

  /* 카테고리 스타일링 */
  padding: .5em;
  border-bottom: 1px solid #ccc;
}
.category-order-list-container {
	background :  #fff;
   	width: 100px;
   	float : right;
    

}

.aaa {
  color: #A782C3; /* 원하는 색상 */
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
  font-size: 18px; /* 원하는 크기 */
  /* 다른 스타일 속성도 추가 가능 */
}






</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="product_store_main_ontop_category.jsp"></jsp:include>


	<div id="store_main_furniture">
	
	
<!-- 상품 정렬하는 버튼-->	
<button class="category-order_toggle">
	  정렬<i class="fa-solid fa-chevron-down"></i>
</button>
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

  

		<h1 >{{categoryNo}}</h1>
	
	
		<div class="production-item__content" v-for="item in list" >
		
		
		
			<a href="javascript:;" class="production-item-thumnail">
		    <img class="production-item-thumnail__image animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation"
			    src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header"  >
			    <span class="production-item-header__brand">{{item.manufacturer}}</span>
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
				<a><i class="fa fa-shopping-cart modal-toggle-button" @click="openCartModal"></i></a>
		    	<a><i class="fa-solid fa-share-nodes"></i></a>
		    	<a><i class="fa-regular fa-bookmark modal-toggle-button" @click="openScrapModal"></i></a>
	    </div> <!-- class="production-item__content" 끝-->
	    
	    
	    
    	<div class="modal" v-if="showCartModal">
		  <div class="modal-card">
		    <h2>장바구니에 추가</h2>
		    <p>상품을 장바구니에 담았습니다.장바구니로 이동하시겠습니까?</p>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveCart" >장바구니로 이동하기</button>
		  </div>
		</div>
		
    	<div class="modal" v-if="showScrapModal">
		  <div class="modal-card">
		    <h2>스크랩북에 등록</h2>
		    <p>상품이 스크랩되었습니다.</p>
		    <button @click="closeModal">쇼핑계속하기</button>
		    <button @click="fnMoveMyPage">마이페이지로 이동하기</button>
		  </div>
		</div>
	
	    
    </div>


	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>



var app = new Vue({
	el : '#store_main_furniture',
	data : {
		list : [],
		list2 : [],
		item : "",
		item2 : "",
		showCartModal: false,
		showScrapModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}',
		categoryNo : '${map.no}',
		categoryName : ""
		
		
		
	
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar, categoryNo : self.categoryNo, categoryName : self.categoryName};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
				
                	self.list = data.list;
                	self.list2 = data.list2;
                	console.log(self.list2.categoryNo);
             
                }
            }); 
		},
		


	     fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // 카테고리 정렬값 설정
            self.fnGetList(); // AJAX 요청 보내기
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
	    // 모달 닫기
	    closeModal: function() {
	      this.showCartModal = false;
	      this.showScrapModal = false;
	    },
	    
	    fnMoveCart : function() {
        	location.href = "/product/cart.do";
	    },
	    fnMoveMyPage : function() {
        	location.href = "/mypage.do";
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	        
	        
     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});


$(document).ready(function() {
    // 상품정렬 버튼 클릭 이벤트 추가
    $('.category-order_toggle').click(function() {
       $('.category-order-list-container').slideToggle('fast');
    });
});

</script>