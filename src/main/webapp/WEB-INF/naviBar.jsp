<!DOCTYPE html>
<html>
<head>
<link href="../css/NaviBar.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
<style>

</style>

</head>
<body>
<div id="recentProductsApp">
  <div class="choi">
  </div>
  <div class="navi-container">
    <div v-for="product in recentProducts" :key="product.productNo" class="thumbnail">
      <img class="navi-item-thumnail__image" alt="썸네일" :src="product.imgPath + '/' + product.imgName" @click="fnProductView(product.productNo)">
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
    getRecentProducts: function() {
      const recentProductKey = 'recentProducts';
      return JSON.parse(localStorage.getItem(recentProductKey) || '[]');
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
