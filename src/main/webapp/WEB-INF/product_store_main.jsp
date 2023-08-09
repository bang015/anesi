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

.production-item__content{
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
	
	<div><h1>인기상품</h1></div>
	
		<div class="production-item__content">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header">
			    <span class="production-item-header__brand">한샘</span>
			    <span class="production-item-header__name">빕스타르</span>
			    <div class="production-item-header__kind">식탁보
			    <span class="production-item-header__size">150X150</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal">
			    정가
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__orginal2">109,000</span>
			    </span>
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2">87,200</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    
	    </div> <!-- class="production-item__content" 끝-->
		<div class="production-item__content">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header">
			    <span class="production-item-header__brand">한샘</span>
			    <span class="production-item-header__name">빕스타르</span>
			    <div class="production-item-header__kind">식탁보
			    <span class="production-item-header__size">150X150</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal">
			    정가
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__orginal2">109,000</span>
			    </span>
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2">87,200</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
				<a><i class="fa-regular fa-bookmark"></i></a>
		    
	    </div> <!-- class="production-item__content" 끝-->
		<div class="production-item__content">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header">
			    <span class="production-item-header__brand">한샘</span>
			    <span class="production-item-header__name">빕스타르</span>
			    <div class="production-item-header__kind">식탁보
			    <span class="production-item-header__size">150X150</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal">
			    정가
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__orginal2">109,000</span>
			    </span>
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2">87,200</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    
	    </div> <!-- class="production-item__content" 끝-->
		<div class="production-item__content">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header">
			    <span class="production-item-header__brand">한샘</span>
			    <span class="production-item-header__name">빕스타르</span>
			    <div class="production-item-header__kind">식탁보
			    <span class="production-item-header__size">150X150</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal">
			    정가
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__orginal2">109,000</span>
			    </span>
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2">87,200</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    
	    </div> <!-- class="production-item__content" 끝-->
		<div class="production-item__content">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header">
			    <span class="production-item-header__brand">한샘</span>
			    <span class="production-item-header__name">빕스타르</span>
			    <div class="production-item-header__kind">식탁보
			    <span class="production-item-header__size">150X150</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal">
			    정가
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__orginal2">109,000</span>
			    </span>
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2">87,200</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    
	    </div> <!-- class="production-item__content" 끝-->
		<div class="production-item__content">
			<a href="javascript:;" class="production-item-thumnail">
			    <img class="production-item-thumnail__image" src="../css/image/productMain/productMain_category1.png" >
		    </a>
		    <div class="production-item-header">
			    <span class="production-item-header__brand">한샘</span>
			    <span class="production-item-header__name">빕스타르</span>
			    <div class="production-item-header__kind">식탁보
			    <span class="production-item-header__size">150X150</span>
			    </div>
		    </div>
			 
		    <span class="production-item-price">
		    
		       <span class="production-item-price__orginal">
			    정가
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__orginal2">109,000</span>
			    </span>
			    <!-- production-item-price__sell  : 파는 가격 -->
		       <div class="production-item-price__sell">
			    <span class="won_icon">￦</span>
			    <span class="production-item-price__sell2">87,200</span>
			    </div>
	        </span>
	        
	        
			    <!--  production-item-rating : 별점-->
		       <div class="production-item-rating">
		       	<!-- 별모양-->
			   	<i class="fa-solid fa-star" style="color: #A782C3;"></i>
			    <span class="production-item-rating__score">4.5</span>
			   </div>
				<a><i class="fa fa-shopping-cart "></i></a>
		    
	    </div> <!-- class="production-item__content" 끝-->
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>