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
<title>장바구니</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
	<button class="btn">구매하기</button>
			<h2>장바구니</h2>
			<span><button class="non">선택 삭제</button></span>
			<div id="cart-app" class="container">
  <table id="cart-table" class="table table-bordered">
     <input type="checkbox" id="cb1">
    <label for="cb1"></label>
    <thead>
      <tr>
        <th>상품 번호</th>
        <th>상품 이름</th>
        <th>이미지</th>
        <th>제조사</th>
        <th>제조국</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody class="fon">
      <tr v-for="item in cartItems">
        <td>{{ item.productNo }}</td>
        <td>{{ item.productName }}</td>
        <td><img alt="" :src="item.imgPath+'/'+item.imgName"  class="cartImg" ></td>
        <td>{{ item.manufacturer }}</td>
        <td>{{ item.country }}</td>
        <td>{{ item.productPrice }}</td>
      </tr>
    </tbody>
  </table>
  <div class="cal">
  <p>총 가격: {{ totalPrice }}원</p>
  <p>총 배송비: {{ totalShippingCost }}원</p>
  <p>총 할인금액: {{ totalDiscount }}원</p>
  <p>최종 가격: {{ finalPrice }}원</p>
  </div>
</div>
	

</body>
</html>
<script>
new Vue({
	  el: '#cart-app',
	  data: {
	    cartItems: []
	  },
	  computed: {
	    totalPrice() {
	      return this.cartItems.reduce((total, item) => {
	        return total + parseInt(item.productPrice);
	      }, 0);
	    },
	    totalShippingCost() {
	      // 배송비를 계산하는 로직을 추가하시면 됩니다. 예를 들어, 모든 상품에 대해 배송비가 2,500원이라면:
	    	return this.totalPrice >= 30000 ? 0 : this.cartItems.length * 2500;
	    },
	    totalDiscount() {
	      // 할인 금액을 계산하는 로직을 추가하시면 됩니다. 예를 들어, 모든 상품에 대해 할인율이 10%라면:
	      return this.totalPrice * 0.1;
	    },
	    finalPrice() {
	      return this.totalPrice + this.totalShippingCost - this.totalDiscount;
	    }
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
