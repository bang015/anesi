<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>커뮤니티 뷰</title>
</head>
<style>
#app{
	margin-top : 180px;
}
#container{
	margin : 10px auto;
	width: 700px;
	padding : 10px 0px;
}
.thum{
	width : 700px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		 <img class="thum" src="../css/image/community/commu_test.jpg">
		 <div><h1>{{info.title}}</h1></div>
		 <div>{{info.cDateTime}}</div>
		 <div>{{info.nick}}</div>
		 <div>{{info.content}}</div>
	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		bNo : "${map.boardNo}",
		info : {}
	},// data
	methods : {
		fnGetInfo : function(){
			var self = this;
			var nparmap = {bNo : self.bNo};
            $.ajax({
                url : "/community/boardView.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
        			console.log(data.info);
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
		console.log(self.sessionNick);
		self.fnGetInfo();
	}// created
});
</script>