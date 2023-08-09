<%@page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/Cart.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>장바구니</title>
<style>
</style>
</head>
<body>
    <h2>장바구니</h2>
   	<div class="firstbox">
   	<input type="checkbox">전체 삭제
   
    <table>
        <tr>
            <th>썸네일</th>
           <th>상품 번호</th>
            <th>상품 이름</th>
            <th>제조사</th>
            <th>제조국</th>
            <th>상품 가격</th>
        </tr>
        <tr v-for="(item, index) in cartItemList">
            <td><img :src="item.imgPath" alt="Product thumbnail" width="100"></td>
            <td>{{ item.productNo }}</td>
            <td>{{ item.productName }}</td>
            <td>{{ item.manufacturer }}</td>
            <td>{{ item.country }}</td>
            <td>{{ item.productPrice }}</td>
        </tr>
    </table>
    </div>
    <div class="firstbox2">
    <a><span>옵션변경</span></a> <a><span>바로구매</span></a>
    </div>
</body>
</html>
<script>
var app = new Vue({
    el : '#app',
    data : {
        cartItemList: [
            { imgPath: "", productNo"", productName: "", manufacturer: "", country: "", productPrice: "",  },
        ]
    },// data
    methods : {
        
    }, // methods
    created : function() {
        var self = this;
        // 장바구니 내역 가져오는 로직 추가
        // ex) 쿠키, 로컬스토리지, 서버 API 호출 등
        // ...
    }// created
});
</script>