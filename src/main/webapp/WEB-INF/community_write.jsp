<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="../js/jquery.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<title>커뮤니티 글쓰기✏</title>
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
.title{
	border : none;
	border-bottom: 1px solid black;
	width : 693px;
	margin : 10px 0px;
	font-size : 25px;
	border-color : #c7c7c7;
}
textarea{
	width : 500px;
	border : none;
	margin : 10px;
	height : 500px;
}
.hrr {
	margin : 30px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div>
			<input class="title" v-model="info.title" placeholder="제목을 입력하세요.">
		</div>
		<div>
			<vue-editor v-model="info.content"></vue-editor>
		</div>
		
		<button @click="fnAdd" v-if="bNo==''||bNo=='undefined'">등록</button>
		<button v-else @click="fnEdit">수정</button>
		<button @click="fnBack">뒤로가기</button>
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
		sessionNick : "${sessionNick}",
		sessionNo : "${sessionNo}",
		bNo : "${map.bNo}",
		info : {
    		title : "",
			content : ""
		}
	},// data
	components: {VueEditor},
	methods : {
		fnGetInfo : function(){
			var self = this;
			var nparmap = {bNo : self.bNo, view : "update"};
            $.ajax({
                url : "/community/boardView.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                }
            });
		},
		fnAdd : function(){
			var self = this;
			if(!confirm("게시글을 등록하시겠습니까?")){
				return;
			}
			var nparmap = self.info;   // { title : self.info.title, contents : self.info.contents } 
			nparmap.nick = self.sessionNick; // { title : self.info.title, contents : self.info.contents, bUser : self.bUser }    
			console.log(nparmap);
			$.ajax({
				url : "/community/insert.dox",
				dataType:"json",   
	 			type : "POST", 
				data : nparmap,
				success : function(data) { 
					alert("게시글이 등록되었습니다.");
						location.href = "main.do";
					}
	            }); 
	        },
		fnBack(){
			location.href = "main.do";
		},
	    fnEdit(){
	    	var self = this;
	        if(!confirm("게시글을 수정하시겠습니까?")){
	        	return;
	        }
	        var nparmap = self.info; 
	        nparmap.bNo = self.bNo;
	        console.log(nparmap);
	        $.ajax({
				url : "/community/edit.dox",
				dataType:"json",
				type : "POST", 
				data : nparmap,
				success : function(data) { 
	            	alert("게시글이 수정되었습니다.");
		            $.pageChange("view.do", {boardNo : self.bNo});
		        }
			});
		}		
	}, // methods
	created : function() {
		var self = this;
		if(self.bNo != ""){
			self.fnGetInfo();
		}
		console.log(self.sessionNick);
	}// created
});
</script>