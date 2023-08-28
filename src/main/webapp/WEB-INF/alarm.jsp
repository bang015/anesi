<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/alarm.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>알림</title>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
	<h2 class="title" v-if="list.length!=''">새소식 <span class="new">{{list.length}}</span></h2>
	<h2 class="title" v-else>새소식</h2>
		<hr class="hrr">
		
		
		<div class="content_cont" >
			<div v-if="item.alarmNo !=''"  v-for="item in list">
				<i class="iconB fa-regular fa-circle-xmark" v-if="list.length!=''"  @click="fnRemoveAlarm(item.alarmNo)"></i>
			    <div class="content"  @click="fnMove(item)">
					<i :class="item.icon" class="iconA"></i>
						<div style="margin-top:5px;">
						<span class="nick" v-if="item.alarmType == 1 || item.alarmType ==4 || item.alarmType == 5">{{item.nick}}님 </span>{{item.alarmContent}}
						<span class="time"> {{item.cTime.substring(0,13)}}시</span>
						</div>
				</div>
			</div>
				<div class="contentA"  v-if="list.length==0">최근 소식이 없습니다.</div>	
			
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
			 $.ajax({
	                url : "../alarmList.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.list = data.list;
	                }
            }); 
		},
		fnInsertAlarm : function(alarmType){
			var self = this;
			var nparmap = {userNo:self.userNo, alarmType};

			 $.ajax({
	                url : "addAlarm.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	               }
            }); 
			
		},
		
		fnRemoveAlarm : function(alarmNo){
			var self = this;
			var nparmap = {userNo:self.userNo, alarmNo};

			 $.ajax({
	                url : "removeAlarm.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	self.fnGetAlarm();
	                	
	               }
           }); 
			
		},
		fnMove : function(item) {
			var self = this;
			var alarmType=item.alarmType;
			var alarmNo=item.alarmNo;
			self.fnRemoveAlarm(alarmNo);
			if(alarmType==6){
				self.fnRemoveAlarm(alarmNo);
				location.href="/mypage/myInquiry.do"
			}else if(alarmType==5 || alarmType==4){
				self.fnRemoveAlarm(alarmNo);
				location.href="/community/main.do"
			}else if(alarmType==2 || alarmType==3){
				self.fnRemoveAlarm(alarmNo);
				location.href="/mypage/myShopping.do"
			}else if(alarmType==1){
				self.fnRemoveAlarm(alarmNo);
				location.href="/mypage/myCoupon.do"
			}
			
		}

		
		
	}, // methods
	created : function() {
		var self = this;
		if(self.userNo == ''){
			location.href="login.do";
		}
		self.fnGetAlarm();
	}// created
});
</script>