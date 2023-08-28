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
<link href="../css/ontop_category.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>스토어메인카테고리</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<div id="store-main-ontop-category__container">
	<div class="title1"><h1>카테고리</h1></div>
	<ul id ="product-main-category__total">
	 <li v-for="(category, index) in categories" :key="category.id" @click="fnMoveaa(category.id)">
        <a @click="addPulseAnimation(index)">
          <img :src="category.image" :class="{ 'animate__animated': category.animated, 'animate__pulse' : category.animated}" @mouseover="addPulseAnimation(index)" @mouseleave="removePulseAnimation(index)">
          <span :class="{ 'aaa': category.animated }">{{ category.name }}</span>
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
		userNick : '${sessionNick}',
		categories : [
			{ id: '10', name: '가구', image: '../css/image/productMain/productMain_category1.png', animated: false },
			{ id: '20', name: '조명', image: '../css/image/productMain/productMain_category2.png', animated: false },
			{ id: '30', name: '패브릭', image: '../css/image/productMain/productMain_category3.png', animated: false },
			{ id: '40', name: '가전', image: '../css/image/productMain/productMain_category4.png', animated: false },
			{ id: '50', name: '데코/식물', image: '../css/image/productMain/productMain_category5.png', animated: false },
			{ id: '60', name: '반려동물', image: '../css/image/productMain/productMain_category6.png', animated: false },
		]
		

	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {categoryOrderBar : self.categoryOrderBar};
            /* $.ajax({
                url : "/product/store_main.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            });  */
		},
		


	      
	    //이미지 마우스 오버했을때 pulse 애니메이션
        addPulseAnimation: function(index) {
        	 this.categories[index].animated = true;
        },
        removePulseAnimation: function(index) {
        	 this.categories[index].animated = false;
        },
        
        
      
	    //category 눌렀을때 메뉴별로 배열해줌
	      fnMoveaa : function(item){
	            var self = this;
	         $.pageChange("/product/storemain_byCategory.do",{no : item});//보낼필요없을때 파라미터 빈값으로{}
	      }
	
	    
	 
	        
	    
	        
     }, // methods
	created : function() {
		var self = this;
		self.fnGetList();

	}// created
});
</script>