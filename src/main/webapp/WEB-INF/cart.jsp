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
            <input type="checkbox" v-model="allChecked" @change="toggleAllChecked">
            <label>전체 삭제</label>
            <table>
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
            <button @click="removeCheckedItems">선택 삭제</button>
        </div>
        <div class="firstbox2">
            <button @click="changeOption">옵션 변경</button>
            <button @click="directPurchase">바로 구매</button>
        </div>
    </div>
    <script>
        var app = new Vue({
            el: '#app',
            data: {
                cartItemList: [
                    {
                        productNo: 'PD001',
                        productName: '아이패드',
                        manufacturer: '애플',
                        country: '미국',
                        imgPath: 'http://lorempixel.com/400/200/technics/1',
                        productPrice: 1000000,
                        quantity: 1,
                        checked: false
                    },
                    {
                        productNo: 'PD002',
                        productName: '갤럭시북',
                        manufacturer: '삼성',
                        country: '한국',
                        imgPath: 'http://lorempixel.com/400/200/technics/2',
                        productPrice: 800000,
                        quantity: 2,
                        checked: false
                    }
                ],
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
                    // 수량 변경에 대한 로직 처리
                    // ex) 쿠키, 로컬스토리지, 서버 API 호출 등
                    // ...
                },
                toggleChecked: function() {
                    this.allChecked = this.cartItemList.every(item => item.checked);
                },
                toggleAllChecked: function() {
                    this.cartItemList.forEach(item => item.checked = this.allChecked);
                },
                removeCheckedItems: function() {
                    this.cartItemList = this.cartItemList.filter(item => !item.checked);
                    this.allChecked = false;
                }
            },
            computed: {
                totalPrice: function() {
                    // 장바구니 내 상품 총 가격 계산 로직 추가
                    // ex) 반복문을 통한 합산, reduce 등
                    // ...
                    return this.cartItemList.reduce((prev, item) => prev + item.productPrice * item.quantity, 0);
                }
            },
            created: function() {
                // 장바구니 내역 가져오는 로직 추가
                // ex) 쿠키, 로컬스토리지, 서버 API 호출 등
                // ...
            }
        });
    </script>
</body>
</html>
