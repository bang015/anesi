<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">

<!-- swipper 추가-->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<meta charset="UTF-8">
<title>ANESI🏠</title>
</head>
<style>
#app{
	margin-top:180px;
}
 	html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      font-size: 14px;
      color: #black;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 1300px;
      height: 600px;
      object-fit: cover;
    }




</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
 
 <!-- 슬라이드 전체 감싸는 컨테이너 -->
<div class="swiper mySwiper">
  <!-- wrapper 추가 필수 -->
  <div class="swiper-wrapper">
    <!-- 실제 이미지나 컨텐츠가 들어갈 slide들 -->
    
    <div class="swiper-slide">
   	   <img src="../css\image\Main\banner4.png">
    
    </div>
    <div class="swiper-slide">
   	   <img src="../css\image\Main\banner5.png">
    
    </div>
    <div class="swiper-slide">
   	   <img src="../css\image\Main\banner6.png">
    
    </div>
    <div class="swiper-slide">
	   <img src="../css\image\Main\banner1.png">
    </div>
    <div class="swiper-slide">
   	   <img src="../css\image\Main\banner2.png">
    </div>
    
   
    ...
  </div>
  <!-- pagination 필요할 경우 추가 -->
  <div class="swiper-pagination"></div>

  <!-- navigation buttons 필요할 경우 추가 -->
<!--   <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div> -->
</div>
 
 
 
 
</div>
</body>
<jsp:include page="product_store_best_product.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>

var swiper = new Swiper(".mySwiper", {
    // 옵션 시작 부분
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    spaceBetween: 30,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    
    // 옵션 끝 부분
  });

  


</script>