<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>상품 상세 페이지</title>
<style>
</style>
</head>
<!-- 상품 상세 페이지 -->
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="category-wrap">
					이거 > 저거 > 요거
				</div>
				<div class="main-view">
					<div class="main-img-table">
						<ul>
							<li></li>
						</ul>
					</div>
					<div class="main-img">
						
					</div>
					<div class="main-box">
						<div class="main-title">
							{{list[0].productName}}
						</div>
						<div class="main-csat">
						
						</div>
						<div class="main-discount">
							
						</div>
						<div class="main-price">
							{{list[0].productPrice}}
						</div>
						<div class="main-option">
							<select >
								<option v-for="item in list">{{item.optionNo}}</option>
							</select>
						</div>
						<div class="main-btn-wrap">
							<button>장바구니</button>
							<button>바로구매</button>
						</div>
					</div> <!-- main-view-end -->
					<div class="nav-wrap">
						<button>상품정보</button>
						<button>리뷰</button>
						<button>문의</button>
					</div>
					<div class="content-view">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		productNo : 3,
		list : []
	},// data
	methods : {
		fnGetList : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/productSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.list = data.list;
	               		console.log(self.list);
	                }                
	            }); 
		},
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>