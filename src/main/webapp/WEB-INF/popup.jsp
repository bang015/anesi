<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #2f3438;
}

.popup-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.popup {
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.popup-title1 {
    font-size: 15px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align : center;
}

.popup-title2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.point {
   border-radius: 4px;
   font-size: 15px;
   font-weight: bold;
   text-shadow: -1px 0px yellow, 0px 1px yellow, 1px 0px yellow, 0px -1px yellow;
    
   

}
.popup-text1 {
    font-size: 16px;
    margin-bottom: 20px;
    font-weight:bold;
}
.popup-text2 {
    font-size: 20px;
}

.popup-button {
    background-color: #A782C3;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
}

.popup-button:hover {
    background-color: #8C5FAC;
}

.popup-checkbox {
    display: flex;
    align-items: center;
}

.popup-checkbox input {
    margin-right: 5px;
}



</style>
</head>
<body style="width : 600px;">
	 <div id="pop" class="popup-wrapper">
        <div class="popup">
            <div class="popup-title1">딱! 7일 한정</div>
            <div class="popup-title2">ANESI  2주년 감사 행사</div>
            <div class="popup-text">회원님들만 만나 볼 수 있어요~</div>
            <div class="popup-text2"><span class="point">혜택1 </span>전품목 30% 할인 쿠폰</div>
            <div class="popup-text1">10000원 이상 구매고객, 최대 100만원까지</div>
            <button class="popup-button" @click="fnCoupon">쿠폰받기</button>

            <div class="popup-text2"><span class="point">혜택2 </span> 3000원 할인 쿠폰</div>
            <div class="popup-text1">10000원 이상 구매고객</div>
            <button class="popup-button" @click="fnCoupon2">쿠폰받기</button>

            <div class="popup-text">단, 발급일로부터 열흘간만 사용 가능</div>
            <div class="popup-checkbox">
                <input type="checkbox" id="check" onclick="closePopup()">
                <label for="check">더 이상 보지 않기</label>
            </div>
        </div>
    </div>
</body>
</html>
<script>
var app = new Vue({
	el : '#pop',
	data : {
		userNo : '${sessionNo}',

	},// data
	methods : {
			fnCoupon(){
				var self = this;
				if(self.userNo!=''){
				var nparmap = {userNo:self.userNo};
				   $.ajax({
		                url : "coupon.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		        			alert("쿠폰등록");
		                }
		            }); 
				} else{
					alert("로그인 후 이용가능합니다.");
					window.close();
				}
				
			},
			fnCoupon2(){
				var self = this;
				if(self.userNo!=''){
				var nparmap = {userNo:self.userNo};
				   $.ajax({
		                url : "coupon2.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		        			alert("쿠폰등록");
		                }
		            }); 
				} else{
					alert("로그인 후 이용가능합니다.");
					window.close();
				}
				
			},
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});

</script>
