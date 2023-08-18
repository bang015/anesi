<!DOCTYPE html>
<html>
<head>
<link href="../css/NaviBar.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
</head>
<body>
<div id="recentProductsApp">
  <div class="choi">
  </div>
  <div class="thumbnail-container">
    <div v-for="product in recentProducts" :key="product.productNo" class="thumbnail">
      <img class="production-item-thumnail__image " alt="썸네일" :src="product.imgPath + '/' + product.imgName">
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
  },
});
</script>
</html>
