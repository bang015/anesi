<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>중고 매입 문의하기</title>
</head>
<style>
#app{
	margin-top : 170px;
}
#container{
	margin : 10px auto;
	width: 800px;
	padding : 10px 0px;
}
.edit{
	border: 1px solid #d1d1d1;
    border-radius: 5px;
    padding: 30px 40px;
    box-shadow: 0px 2px 11px -3px #dddbdb;
    height : 800px;
	position: relative;
}
.left{
	float:left;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div class="edit">
			<div><h1>중고 매입 문의하기</h1></div>
			<div class="left">
				<div>이름</div>
				<div>전화번호</div>
				<div>물품명</div>
				<div>가격</div>
				<div>제조국</div>
				<div>사용기간</div>
				<div>상태</div>
			</div>
			<div class="right">
			 	<div><input type="text"></div>
			 	<div><input type="text"></div>
			 	<div><input type="text"></div>
			 	<div><input type="text"></div>
			 	<div><input type="text"></div>
			 	<div>
			 		<select>
			 			<option>1년 미만</option>
			 			<option>1년</option>
			 			<option>2년</option>
			 			<option>3년</option>
			 			<option>4년</option>
			 			<option>5년</option>
			 			<option>5년 이상</option>
			 		</select>
			 	</div>
			</div>
			<div>
				<vue-editor></vue-editor>
			</div>
			
		</div>
	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;

var app = new Vue({
	el : '#app',
	data : {
		list : []
	},// data
	components: {VueEditor},
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
				url : "/used/purchaseList.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                }
            }); 
		},
		formatDate: function (dateString) {
            var date = new Date(dateString);
            var options = { year: 'numeric', month: 'numeric', day: 'numeric' };
            var formattedDate = date.toLocaleDateString(undefined, options);

            // 마지막 점 제거
            formattedDate = formattedDate.replace(/\.$/, '');

            return formattedDate;
        },
        fnInquire : function(){
			location.href="/used/inquire.do";
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>