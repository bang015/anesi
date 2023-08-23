<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>알림</title>
<style>

#app{
	margin-top : 195px;
}

.title {
	margin: 0px 30px 0px 30px;
	padding: 5px 0px 0px 0px;
    font-size: 20px;
   	display : flex;
	justify-content: center;
}

.content {
    width: 1300px;
    height: 500px;
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-content: stretch;
    align-items: center;
    flex-wrap: nowrap;
    flex-direction: column;
}
	
}

</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="title">알림</div>
		<hr class="hrr">
		<div class="content">최근 소식이 없습니다.</div>
		
	</div>
<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {

	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>