<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="../js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link href="../css/mainCss.css" rel="stylesheet">
    <link href="../css/Cart.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
    <div id="app">
        <h2>장바구니</h2>

        <div class="firstbox">
            <label class="custom-checkbox" :class="{ 'checked': allChecked }">
                <input type="checkbox" v-model="allChecked" @change="toggleAllChecked">
            </label>
            <label class="all">전체 삭제</label>
            <table calss="cartTable">
            <br>
                <thead>
                    <tr>
                        <th>썸네일</th>
                        <th>상품 번호</th>
                        <th>상품 이름</th>
                        <th>제조사</th>
                        <th>제조국</th>
                        <th>상품 가격</th>
                        <th>수량</th>
                        <th>선택</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(item, index) in cartItemList" :key="item.productNo">
                        <td><img :src="item.imgPath" alt="Product thumbnail" width="100"></td>
                        <td>{{ item.productNo }}</td>
                        <td>{{ item.productName }}</td>
                        <td>{{ item.manufacturer }}</td>
                        <td>{{ item.country }}</td>
                        <td>{{ item.productPrice }}</td>
                        <td><input type="number" v-model.number="item.quantity" @input="updateCartItemList"></td>
                        <td><input type="checkbox" v-model="item.checked" @change="toggleChecked"></td>
                    </tr>
                </tbody>
            </table>
    <button @click="removeCheckedItems" class="cartbtn">선택 삭제</button>
    <button @click="changeOption" class="cartbtn">옵션 변경</button>
        </div>
        
   
  
<div class="price-summary">
    <h4>총합 계산</h4>
    <p>총 가격: {{ totalPrice }}원</p>
</div>
      <button @click="directPurchase" class="cartbtn2">바로 구매</button>
    </div>
 
    <script>
    var app = new Vue({
        el: '#app',
        data: {
            cartItemList: [],
            allChecked: false
        },
        methods: {
            changeOption: function() {
                alert('옵션 변경');
            },
            directPurchase: function() {
                alert('바로 구매');
            },
            updateCartItemList: function() {

            },
            toggleChecked: function() {
                this.allChecked = this.cartItemList.every(item => item.checked);
            },
            toggleAllChecked: function() {
                if (this.cartItemList) {
                    this.cartItemList.forEach(item => item.checked = this.allChecked);
                } else {
                    console.log('Cart item list is not loaded yet');
                }
            },
            removeCheckedItems: function() {
                this.cartItemList = this.cartItemList.filter(item => !item.checked);
                this.allChecked = false;
            },
        },
        created: function() {
            // jQuery를 사용하여 서버에서 장바구니 내역을 가져옴
            $.ajax({
                url: '/product/cartList.dox',
                method: 'POST',
                dataType: 'json',
                success: (response) => {
                    this.cartItemList = response.list;
                },
                error: (jqXHR, textStatus, errorThrown) => {
                    console.error('Error: ' + textStatus, errorThrown);
                }
            });
        },
        computed: {
            totalPrice: function() {
                if (this.cartItemList) {
                    return this.cartItemList.reduce((accumulator, item) => {
                        return accumulator + (item.productPrice * item.quantity);
                    }, 0);
                } else {
                    return 0;
                }
            }
        }
    });
    </script>
</body>
</html>
