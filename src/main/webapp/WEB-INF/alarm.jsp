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

.iconA {
	float : left;
	width : 7%;
	box-sizing :border-box;
	font-size : 35px;
	color : #A782C3;
	margin-right : 20px;
}
.iconB {
	float : right;
	width : 3%;
	box-sizing :border-box;
	font-size : 20px;
	color : #A782C3;
}

.title {
	margin: 0px 30px 0px 30px;
	padding: 5px 0px 0px 0px;
    font-size: 20px;
   	display : flex;
	justify-content: center;
}

.content_cont {
    width: 1300px;
    height: 500px;
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-content: stretch;
    align-items: center;
    flex-wrap: nowrap;
    flex-direction: column;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}
.content{
	width: 900px;
    height: 30px;
    background : #a782c369;
    margin : 10px;
    border-radius: 10px;
    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.2);
    padding : 20px;
}

.content:hover{
	background : #63229469;
  	cursor: pointer;
	
}
.time{
    font-size: 14px;
}
.nick{
  	font-weight : bold;
}

</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
	<h2 class="title">새소식</h2>
		<hr class="hrr">
		<div class="content_cont">
		    <div class="content" v-for="item in list" >
				<i :class="item.icon" class="iconA"></i>
					<span class="nick" v-if="item.alarmType == 1 || item.alarmType ==4">{{item.nick}}님 </span>{{item.alarmContent}}
					<span class="time"> {{item.cTime}}</span>
				<i class="iconB fa-regular fa-circle-xmark" @click="fnDelete"></i>
			</div>
			
			
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		item : "",
		userNo : '${sessionNo}',


	},// data
	methods : {
		fnGetAlarm : function() {
			var self = this;
			var nparmap = {userNo : self.userNo};
        	console.log(self.userNo);

			 $.ajax({
	                url : "alarmList.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.list = data.list;
	                	console.log(data.list);
	                }
            }); 
			
		}
		
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetAlarm();
	}// created
});
</script>