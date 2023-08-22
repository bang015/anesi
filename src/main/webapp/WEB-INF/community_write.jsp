<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	font-size : 24px;
	border-color : #c7c7c7;
}
textarea{
	width : 500px;
	border : none;
	margin : 10px;
}
.ql-editor {
    min-height: 500px;
    font-size: 16px;
}
.hrr {
	margin : 30px 0px;
	border: none; 
	border-top: 1px solid #eee; 
}
.filebox{
	margin : 10px 0px;
}
.filebox input[type="file"] {
  position: absolute;
  width: 0;
  height: 0;
  padding: 0;
  overflow: hidden;
  border: 0;
}
.filebox label {
  display: inline-block;
  padding: 10px 20px;
  color: #6f6f6f;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #cdcdcd;
  border-radius: 5px;
}
.filebox .upload-name {
  display: inline-block;
  height: 35px;
  padding: 0 10px;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-radius: 5px;
}
.btn1{
    color: #494949;
    background-color: #f9f9f9;
    border-radius: 7px;
    padding: 0px 9px;
    margin: 10px 3px;
    transition: background 0.3s;
    cursor: pointer;
    width: 130px;
    height: 34px;
    float: right;
    border: 1px solid #c9c9c9
}
.btn1:hover{
	color: #ffffff;
    background-color: #A782C3;
    border: 1px solid #ffffff;
}
input:focus {
	outline: none;
}
.pvImg{
	width: 700px;
}
</style>
<jsp:include page="header.jsp"></jsp:include>
<body>
<div id="app">
	<div id="container">
		<div>
			<input class="title" v-model="info.title" placeholder="제목을 입력하세요.">
		</div>
		<div class="filebox"> 
			<label for="file1">썸네일 업로드</label> 
			<input type="file" id="file1" name="file1" @change="fnOnFileChange"> 
			<input class="upload-name" value="파일선택">
		</div>
    	<div><img v-if="image1" :src="image1" alt="Image preview" class="pvImg" ref="image" required></div>
    	<div v-if="info.imgPath!='' && !image1 && info.imgPath!=undefined"><img :src="info.imgPath+'/'+info.imgName" class="pvImg"></div>
		<div>
			<vue-editor v-model="info.content"></vue-editor>
		</div>
		
		<button @click="fnAdd" v-if="bNo==''||bNo=='undefined'" class="btn1">등록</button>
		<button v-else @click="fnEdit" class="btn1">수정</button>
		<button @click="fnBack" class="btn1">뒤로가기</button>
	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script>
$(document).ready(function(){ 
	  var fileTarget = $('#file1'); 
	  fileTarget.on('change', function(){ // 값이 변경되면
	      var cur=$(".filebox input[type='file']").val();
	    $(".upload-name").val(cur);
	}); 
}); 
	
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
		},
		image1 : '',
		
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
                	console.log(self.info);
                }
            });
		},
		fnAdd : function(){
			var self = this;
			if (!self.image1) {
				alert("썸네일을 선택해주세요.");
	            return;
	        }
			if(!confirm("게시글을 등록하시겠습니까?")){
				return;
			}
			var nparmap = self.info;   // { title : self.info.title, contents : self.info.contents } 
			nparmap.nick = self.sessionNick; // { title : self.info.title, contents : self.info.contents, nick : self.nick }    
			nparmap.userNo = self.sessionNo;
			$.ajax({
				url : "/community/insert.dox",
				dataType:"json",   
	 			type : "POST", 
				data : nparmap,
				success : function(data) {
					console.log(data.bNo);
	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "bNo", data.bNo); // pk
	           		self.fnThumbnail(form); 
					location.href = "main.do";
				}
			}); 
		},
	    fnThumbnail : function(form){
			var self = this;
	         $.ajax({
	            url : "/thumbfileUpload.dox", 
	            type : "POST", 
	            processData : false, 
	            contentType : false, 
	            data : form, 
	            success : function(response) { 
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
	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "bNo", self.bNo); // pk
	           		self.fnThumbnailUpdate(form); 
					
		            $.pageChange("view.do", {boardNo : self.bNo});
		        }
			});
		},
		fnThumbnailUpdate : function(form){
			var self = this;
	         $.ajax({
	            url : "/thumbfileUpdate.dox", 
	            type : "POST", 
	            processData : false, 
	            contentType : false, 
	            data : form, 
	            success : function(response) { 
				}
	           
	       });
		},
		fnOnFileChange(event) {
	         var self = this;
	          const file = event.target.files[0];   
	          if (file) {
	            self.image1 = URL.createObjectURL(file);
	          }
	    }

	}, // methods
	created : function() {
		var self = this;
		if(self.bNo != ""){
			self.fnGetInfo();
		}
	}// created
});
</script>