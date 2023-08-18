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

<meta charset="UTF-8">
<title>장바구니</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
  <div id="app">
    <div id="container">
  
      <div id="cart-app" class="container">
  <table id="cart-table" class="table table-bordered">
  <!--    <input type="checkbox" id="cb1" class="chbox">
    <label for="cb1" class="chbox"></label> -->
 <div class="cart-item container mb-4" v-for="item in cartItems">
  <div class="row align-items-center">
    <div class="col-md-3">
      <img class="img-fluid" :src="item.imgPath+'/'+item.imgName" />
    </div>
    <div class="col-md-6">
      <h5 class="mb-2">{{ '['+ item.productName +']' }} {{ '['+item.manufacturer+']' }}</h5>
      <p>{{ item.productPrice }}원</p>
   <button class="btn btn-primary" id="btnbuy" @click="goToPurchasePage">구매하기</button>
    </div>
    <div class="col-md-3">
      <button class="btn btn-sm btn-danger" v-on:click="deleteItem(item)">
        <i class="fas fa-trash-alt" aria-hidden="true" id="delete"></i> 삭제
      </button>
    </div>
  </div>
</div>
   
  
  </table>
<div class="cal container mt-4">
  <div class="row">
    <div class="col-md-6">
      <p>총 가격: {{ totalPrice }}원</p>
      <p>총 배송비: {{ totalShippingCost }}원</p>
    </div>
    <div class="col-md-6">
      <p>총 할인금액: {{ totalDiscount }}원</p>
      <p>최종 가격: {{ finalPrice }}원</p>
    </div>
    <div class="col-md-12 text-right mt-2">
      <button class="btn btn-primary" id="btnbuy2" @click="goToPurchasePage">전체 구매하기</button>
    </div>
  </div>
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
      	return this.totalPrice >= 30000 ? 0 : this.cartItems.length * 2500;
      },
      totalDiscount() {
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
      },
      deleteItem(item) {
    	    const requestData = {
    	        productNo: item.productNo,
    	        userNo: '${sessionNo}'
    	    };
    	    console.log(requestData);
    	  
    	    $.ajax({
    	        url: "/product/deleteCartlist.dox",
    	        method: "POST",
    	        data: requestData
    	    })
    	    .done(function(response) {
    	        if (response.success) {
    	            alert(response.success);
    	            location.reload();
    	        } else {
    	            alert("삭제 실패");
    	        }
    	    })
    	    .fail(function() {
    	        alert("요청 처리 실패");
    	    });
    	},
    	deleteAllCartItems(item) {
    	    // userNo를 requestData 객체에 추가
    	    const requestData = {
    	        userNo: '${sessionNo}'
    	    };
    	    console.log(requestData);

    	    $.ajax({
    	        url: "/product/deleteAllCartItems.dox",
    	        method: "POST",
    	        data: requestData
    	    })
    	    .done(function (response) {
    	        if (response.success) {
    	            alert(response.success);
    	            location.reload();
    	        } else {
    	            alert("삭제 실패");
    	        }
    	    })
    	    .fail(function () {
    	        alert("요청 처리 실패");
    	    });
    	},


      goToPurchasePage() {
          if (this.cartItems.length > 0) {
            sessionStorage.setItem('cartItems', JSON.stringify(this.cartItems));
            window.location.href = "../order/main.do";
          } else {
            alert('장바구니에 상품이 없습니다. 상품을 추가한 후 다시 시도해주세요.');
          }
        }
    }
});
</script>
