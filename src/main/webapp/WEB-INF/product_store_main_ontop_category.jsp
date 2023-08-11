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
<title>스토어메인카테고리</title>
<style>


#store-main-ontop-category__container{
	margin-top: 160px;

}

.product-main-category__image{
	width:100px;
	height:100px;
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


.aaa {
  color: #A782C3; 
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); 
  font-size: 18px; 
}


.category_container{
	width:100px;
	height:130px;
}

.category_name{

    font-size: 20px;
    font-weight: bold;
    color: #A782C3; /* 원하는 색상 */
}
#c_name1:hover,
#c_name2:hover,
#c_name3:hover,
#c_name4:hover,
#c_name5:hover,
#c_name6:hover{

  color: #A782C3;
  

}


</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>

<div id="store-main-ontop-category__container">
	<div><h1>카테고리</h1></div>
	<ul id ="product-main-category__total">
	
		<li >
			<a href="storemain_furniture.do" class="category_container">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span class="category_name" id="c_name1">가구</span>
	    	</a>
    	</li>
		<li>
			<a href="storemain_light.do" class="category_container">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span class="category_name" id="c_name2">조명</span>
	    	</a>
    	</li>
		<li>
			<a href="storemain_fabric.do" class="category_container">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span class="category_name" id="c_name3">패브릭</span>
	    	</a>
    	</li>
		<li>
			<a href="storemain_electronic.do" class="category_container">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span class="category_name" id="c_name6">가전</span>
	    	</a>
    	</li>
		<li>
			<a href="storemain_deco_plant.do" class="category_container">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span class="category_name" id="c_name5">데코/식물</span>
	    	</a>
    	</li>
		<li>
			<a href="storemain_pet.do" class="category_container">
				<img src="../css/image/productMain/productMain_category1.png"
				class="animate__animated animate__pulse" 
			    @mouseover="addPulseAnimation" @mouseleave="removePulseAnimation">
			    <span class="category_name" id="c_name6">반려동물</span>
	    	</a>
    	</li>
		
	</ul>
	
</div>
</body>
</html>
<script>

$(document).ready(function() {
    // 상품정렬 버튼 클릭 이벤트 추가
    $('.category-order_toggle').click(function() {
       $('.category-order-list-container').slideToggle('fast');
    });
});


var app = new Vue({
	el : '#store-main-ontop-category__container',
	data : {
		list : [],
		item : "",
		showCartModal: false,
		showScrapModal: false,
		userId : '${sessionId}',
		userNick : '${sessionNick}'
		
		

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
</script>