<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>상품메인페이지</title>
<style>

body{
	width: 1300px;
	margin: 0px  auto;
	font-size: 14px;
	font-family: 'Pretendard-Regular';
}

.product-main-category__image{
	width:100px;
	height:100px;
}


.production-item-thumnail__image{
	width:200px;
	height:250px;
}

.product-main-category__name{
	font-size : 15px;
}
.won_icon,.production-item-price__orginal2{
	text-decoration: line-through;
}

.production-item__content{
	width:200px;
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
	
  }
.category-order_toggle:hover {
    background-color:rgb(235, 236, 237);
    transition: 0.7s;
   	color :  black;
    
}  


.category-list {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

.category-list li {
  /* 카테고리 스타일링 */
  padding: .5em;
  border-bottom: 1px solid #ccc;
}
.category-list-container {
background :  #fff;
    position: absolute;
   	width: 100px;
    

}

</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<div id="app">
	<div><h1>카테고리</h1></div>
	<ul id ="product-main-category__total">
	
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>가구</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>조명</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>패브릭</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>가전</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>데코/식물</span></a></li>
		<li><a href="javascript:;"><img src="../css/image/productMain/productMain_category1.png"><span>반려동물</span></a></li>
		
	</ul>
	
<button class="category-order_toggle">
  <span>카테고리 <i class="fa-solid fa-chevron-down"></i></span>
</button>
<div class="category-list-container" style="display:none;">
  <ul class="category-list" v-model="categoryOrderBar">
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

  
	<div><h1>인기상품</h1></div>
	
		<div class="production-item__content" v-for="item in list">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
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
			    <span class="production-item-price__orginal2" >{{item.productPrice}}</span>
			   </span>
			    
			    
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2" v-if="item.discountPrice!=''">{{item.discountPrice}}</span>
			    <span class="production-item-price__sell2" v-else>{{item.productPrice}}</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    	<a><i class="fa-solid fa-share-nodes"></i></a>
		    	<a><i class="fa-regular fa-bookmark"></i></a>
	    </div> <!-- class="production-item__content" 끝-->
		
	</div>
</body>
</html>
<script>

$(document).ready(function() {
    // 버튼 클릭 이벤트 추가
    $('.category-order_toggle').click(function() {
       $('.category-list-container').slideToggle('fast');
    });
    
    // 서브 카테고리 토글 이벤트 추가
    $('.category-list > li > a').click(function(event) {
      event.preventDefault();
      $(this).siblings('.subcategory-list').slideToggle('fast');
    });
});


var app = new Vue({
	el : '#app',
	data : {
		list : [],
		item : "",
		//상품 정렬하는 셀렉트 태그 v-model 이름
		categoryOrderBar : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar};
            $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
		},
		
		
		
	    fnOrderBy: function (orderBy) {
            var self = this;
            self.categoryOrderBar = orderBy; // 카테고리 정렬값 설정
            self.fnGetList(); // AJAX 요청 보내기
	      }
     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});
</script>