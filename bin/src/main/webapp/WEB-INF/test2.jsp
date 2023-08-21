<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<style>
	table{
		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
</style>
</head>
<body>
<div id="app">
	<table>
		<tr>
			<td width="30%">제목</td>
			<td width="70%"><input v-model="title"></td>
		</tr>
		<tr>
			<td width="30%">파일</td>
			<td width="70%"><input type="file" id="file1" name="file1"></td>
		</tr>
		<tr>
			<td width="30%">내용</td>
			<td width="70%"><textarea rows="5" cols="25" v-model="content"></textarea> </td>
		</tr>
	</table>
	<button @click="fnAdd">저장</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		title : "",
		content : ""
	},// data
	methods : {
		fnAdd : function(){
            var self = this;
            var nparmap = {title : self.title, content : self.content};
            console.log( self.content );
            $.ajax({
                url:"/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data.idx);
	           		var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "idx",  data.idx); // pk
	           		self.upload(form); 
                	
                }
            });  
        }
	
		// 파일 업로드
	    , upload : function(form){
	    	var self = this;
	         $.ajax({
	             url : "/fileUpload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}
		
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>