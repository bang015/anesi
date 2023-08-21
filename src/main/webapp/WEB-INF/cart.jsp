<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/Cart.css" rel="stylesheet">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>

<meta charset="UTF-8">
<title>장바구니</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div id="cart-app">
    <div id="container">
  
     <div class="cart-item container mb-4" v-for="item in cartItemsUnique">
    <div class="row align-items-center">
      <div class="col-md-3">
        <img class="img-fluid" :src="item.imgPath + '/' + item.imgName" />
      </div>
      <div class="col-md-6">
        <h5 class="mb-2">{{ "[" + item.productName + "]" }} {{ "[" + item.manufacturer + "]" }}</h5>
        <p>{{ item.productPrice }}원</p>

        <div class="main-option">
       <select class="option-box" v-model="item.option" @change="addToSelectedOptions">
  <option value="">이걸 눌러야 값이 출력됩니다 </option>
  <option v-for="(option, index) in item.options" :key="option.optionNo + index" :value="option.optionNo">
    {{ option.optionName + " (+" + option.optionPrice + "원)" }}
  </option>
</select>
        </div>

   <button v-on:click="goToPurchasePage(cartItems.map(item => item.productNo))">구매하기</button>
      </div>
      <div class="col-md-3">
        <button class="btn btn-sm btn-danger" v-on:click="deleteItem(item)">
          <i class="fas fa-trash-alt" aria-hidden="true" id="delete"></i> 삭제
        </button>
      </div>
    </div>
  </div>
</div>





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
      <button v-on:click="goToPurchasePage(item.mapProduct)" class="btn btn-primary">
  구매하기
</button>
    </div>
  </div>
</div>
</div>

    
  <template>
	  <paginate
	    :page-count="pageCount"
	    :page-range="3"
	    :margin-pages="2"
	    :click-handler= "goToPurchasePage"
	    :container-class="'pagination'"
	    :page-class="'page-item'">
	  </paginate>
	</template>

</body>
</html>
<script src="../js/jquery.js"></script>
<script>
Vue.component('paginate', VuejsPaginate)
new Vue({
	 el: '#cart-app',
	  data: {
	    cartItems: [],
	    optionName: "",
	    option1: "",
	    option: [],
	    optionPrice: "",
	    selectedOptions: [],
	    selectPage: 1,
	    pageCount: 1,
	    cnt: 0, // 선택된 옵션 정보를 저장할 배열
	    productNoList: []
	  },
    computed: {
    	 cartItemsUnique() {
    		    const unique = [... new Set(this.cartItems.map(item => item.productNo))];
    		    return unique.map(pno => {
    		      return this.cartItems.find(item => item.productNo === pno);
    		    });
    		  },
    	
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
                success: function(response) {
                  console.log(response);
                  self.cartItems = response.list.map(item => ({
                	    ...item,
                	    mapProduct: item.productNo,  // 이 상품에 대한 mapProduct 속성을 추가합니다.
                	  }));
                  self.cartItems = response.list;
                  response.list.forEach(function(item) {
                    console.log('상품 번호: ' + item.productNo);
                    console.log('상품 이름: ' + item.productName);
                    
                    // 각 상품마다 옵션들을 불러오기
                    self.fnOption(item.productNo, function(options) {
                      // 각 상품의 옵션을 추가
                      item.options = [{ optionNo: '', optionName: '상품을 선택하세요.', optionPrice: 0 }].concat(options);
                      // 옵션 배열에 해당 상품의 옵션들을 추가해준다.
                      self.option = self.option.concat(options); 
                    });
                  });
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


    	 goToPurchasePage(productNoList) {
    	      const self = this;

    	      const startNum = ((self.selectPage - 1) * 2);
    	      const lastNum = 10;
    	      const param = { startNum: startNum, lastNum: lastNum };

    	      if (this.cartItems.length > 0) {
    	        sessionStorage.setItem('cartItems', JSON.stringify(this.cartItems));

    	        // 여기에서 order.do로 이동하면서 데이터를 넘겨줍니다.
    	        const productData = this.cartItems.map(item => ({
    	          productNo: item.productNo,
    	          productName: item.productName,
    	          productPrice: item.productPrice,
    	          optionNo: item.optionNo,
    	          quantity : 1
    	        }));

    	        let queryString = '';
    	        productData.forEach(item => {
    	          queryString += `&productData[]=${JSON.stringify(item)}`;
    	        });

    	        productNoList.forEach(item => {
    	          queryString += `&productNoList[]=${JSON.stringify(item)}`;
    	        });

    	        const queryParams = encodeURI(`?startNum=${startNum}&lastNum=${lastNum}${queryString}`);
						console.log(productData);
    		    	   $.pageChange("/order/main.do", { product: productData });
    			
    	        
    	      } else {
    	        alert('장바구니에 상품이 없습니다. 상품을 추가한 후 다시 시도해주세요.');
    	      }
    	    },
        addToSelectedOptions() {
            const selectedItem = this.option.find(item => item.optionNo === this.option1);
            if (selectedItem) {
              const existingOption = this.selectedOptions.find(opt => opt.optionNo === selectedItem.optionNo);
              if (existingOption) {
                existingOption.quantity++; // 이미 있는 상품의 수량 증가
              } else {
                // 옵션을 새로 추가
                this.selectedOptions.push({
                  productNo: item.productNo, // 상품 번호도 함께 저장
                  optionNo: selectedItem.optionNo,
                  optionName: selectedItem.optionName,
                  quantity: 1
                });
              }
              this.option1="";
            }
            console.log(this.selectedOptions);
          },
  	    fnOption: function(productNo, callback) {
  	      var self = this;
  	      var nparmap = { productNo: productNo };
  	      $.ajax({
  	        url: '/optionSearch.dox',
  	        dataType: 'json',
  	        type: 'POST',
  	        data: nparmap,
  	        success: function(data) {
  	          // 옵션들을 콜백 함수로 전달
  	          typeof callback === 'function' && callback(data.option);
  	        },
  	        error: function(err) {
  	          console.error('옵션을 불러오는 데 실패했습니다.', err);
  	        }
  	      });
  	    },
  	  mounted() { // 또는 created()를 사용해도 됩니다.
  	    	 this.productNoList = JSON.parse(`${map.product}`);
  	    	this.$nextTick(function() {
  	        for(let i in this.cartItems) {
  	          var dropdownElement = this.$refs['optionBox_' + i][0];
  	          if (dropdownElement) {
  	            dropdownElement.click();
  	          }
  	        }
  	      });
  	    },
  
  }
        
        
});
</script>
