<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/scrapbook.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<jsp:include page="header.jsp"></jsp:include>
<body>

	<div id="app">
		<div id="container">
			<h2>스크랩북</h2>
			<div id="inner">
				<div><img alt="프로필" src="../css/image/pfimgG2.png" class="pfSytle"></div>
				<div class="nickStyle">{{userNick}}</div>
			</div>
		</div>
	</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		userId : '${sessionId}',
		userNick : '${sessionNick}'
	},// data
	methods : {
		
	}, // methods
	created : function() {
		var self = this;

	}// created
});
</script>