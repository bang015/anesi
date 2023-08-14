<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/Cart.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<h2>장바구니</h2>
			<div id="cart-app" class="container">
  <table id="cart-table" class="table table-bordered">
    <thead>
      <tr>
        <th>상품 번호</th>
        <th>상품 이름</th>
        <th>이미지</th>
        <th>제조사</th>
        <th>제조국</th>
        <th>가격</th>
        <th>사용자 번호</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="item in cartItems">
        <td>{{ item.productNo }}</td>
        <td>{{ item.productName }}</td>
        <td><img alt="" :src="item.imgPath+'/'+item.imgName"  class="cartImg" ></td>
        <td>{{ item.manufacturer }}</td>
        <td>{{ item.country }}</td>
        <td>{{ item.productPrice }}</td>
        <td>{{ item.userNo }}</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>
<script>
new Vue({
	  el: '#cart-app',
	  data: {
	    cartItems: []
	  },
	  mounted() {
	    this.loadCartList();
	  },
	  methods: {
	    loadCartList() {
	      const self = this;
	      const userNo = '${sessionNo}';

	      // 사용자 번호가 존재할 때만 장바구니 목록을 불러옴
	      if (userNo) {
	        $.ajax({
	          url: '/product/viewCartList.dox',
	          method: 'POST',
	          dataType: 'json',
	          data: { userNo: userNo },
	          success: function (response) {
	            console.log(response);
	            self.cartItems = response.list;
	          }
	        });
	      } else {
	        alert('사용자 번호가 없습니다. 로그인 후 이용해주세요.');
	      }
	    }
	  }
	});
</script>