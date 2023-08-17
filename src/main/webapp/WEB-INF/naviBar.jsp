<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/NaviBar.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
</head>
<body>
<div id="container">

  <div class="choi">
    최근본상품
  </div>
  <div class="thumbnail-container">
  <div v-for="product in recentProducts" :key="product.id" class="thumbnail">
    <img :src="item.imgPath + '/' + item.imgName" :alt="product.name" width="100" height="100">
    <p>{{ product.name }}</p>
  </div>
</div>

  
</div>
</body>
<script>
// 세션 값 출력
     var productNo = '<%=session.getAttribute("productNo")%>';
    console.log('productNo:', productNo);



document.addEventListener("DOMContentLoaded", function() {
	  var app = new Vue({
	    el: "#container",
	    data: {
	    	  productNo: productNo
	    },
	    methods: {
	      getRecentProducts: function() {
	        var self = this;
	        $.ajax({
	          url: "/selectLatest.dox",
	          type: "POST",
	          dataType: "json",
	          success: function(response) {
	            var data = response.list;
	            self.recentProducts = data;
	          },
	          error: function(error) {
	            console.log(error);
	          }
	        });
	      }
	    },
	    mounted: function() {
	      this.getRecentProducts();
	    }
	  });
	});
</script>

</html>