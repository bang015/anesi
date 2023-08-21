<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/NaviBar.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
<style>
 #recentProductsApp{
 	
 }
</style>

</head>
<body>
<div id="recentProductsApp">
  <div class="choi">
   <div class="just" >최근본상품</div>
  </div>
  <div class="navi-container">
   <div v-for="product in recentProducts" :key="product.productNo" class="thumbnail" @mouseover="onMouseOver(product)" @mouseleave="onMouseLeave(product)">
  <span class="product-name" v-bind:class="{ visible: product.hover }"></span>
  <img class="navi-item-thumnail__image" :title="product.productName" alt="썸네일" :src="product.imgPath + '/' + product.imgName" @click="fnProductView(product.productNo)">
</div>
  </div>
</div>
 
</body>

<script>
var recentProductsApp = new Vue({
  el: '#recentProductsApp',
  data: {
    recentProducts: [],
  },
  mounted: function() {
    this.recentProducts = this.getRecentProducts();
  },
  methods: {
	  onMouseOver: function(product) {
		    product.hover = true;
		  },
		  onMouseLeave: function(product) {
		    product.hover = false;
		  },
		  getRecentProducts: function() {
			  const recentProductKey = 'recentProducts';
			  const products = JSON.parse(localStorage.getItem(recentProductKey) || '[]');
			  products.forEach(product => product.hover = false);
			  return products;
			},
		
    fnProductView : function(productNo){
      var self = this;
        
      // 썸네일 클릭 시 실행될 코드를 이곳에서 정의하실 수 있습니다.
      console.log("썸네일 클릭됨: ", productNo);
      
      $.pageChange("/product/view.do",{no : productNo}); //보낼 필요없을때 파라미터 빈값으로 {}	   
    }
  },
});
</script>
</html>
