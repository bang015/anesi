<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/myShopping.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>나의 쇼핑</title>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div class="top_menu">
			<ul class="my_menu1">
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage.do'">프로필</a></li>
				<li class="my_li1 on"><a class="my_a1" onclick="location.href='../mypage/myShopping.do'">나의 쇼핑</a></li>
				<li class="my_li1"><a class="my_a1" onclick="location.href='../mypage/myReview.do'">나의 리뷰</a></li>
				<li class="my_li1"><a href="../mypage/user_edit.do" class="my_a1">설정 </a></li>
			</ul>
		</div>
		<div id="container">
			<div class="order_list_menu">
				<a class="aBox" @click="fnClickOption(1)">
					<div class="textBox">
						<div>결제완료</div>
						<div>{{deliverySit.order}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnClickOption(2)">
						<div>배송준비</div>
						<div>{{deliverySit.ready}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnClickOption(3)">
						<div>배송중</div>
						<div>{{deliverySit.shipping}}</div>
					</div>
					<i class="fa-solid fa-arrow-left fa-rotate-180 fa-2xl"></i>
				</a>
				<a class="aBox">
					<div class="textBox" @click="fnClickOption(4)">
						<div>배송완료</div>
						<div>{{deliverySit.completed}}</div>
					</div>
				</a>
			</div>
			<div class="order_list">
				<div class="optionListBox">
					<div>
					    <div class="selectBox2" @mouseover="showOptions" @mouseleave="hideOptions" :class="{ active: optionsVisible }">
					      <button class="label">{{ selectedOption }}</button>
					      <ul class="optionList">
					        <li v-for="(option, index) in options" :key="index" class="optionItem" @click="handleSelect(option.value)">{{ option.text }}</li>
					      </ul>
					    </div>					
					</div>
					<div v-for="(item, index) in optionList">
						<div class="optionBox" @click="fnOptionDel(index)" v-if="item.name != undefined">{{item.name}} <i class="fa-solid fa-circle-xmark" style="color: #ffffff;"></i></div>
					</div>
				</div>
				<div>
				    <div v-for="item in orderList" class="box5">
				    	<div class="deliverySitName">{{item.deliverySitName}}</div>
					   <div class="orderBox">
					   	 <img alt="" :src="item.imgPath+'/'+item.imgName" class="imgBox">
					    <div class="productName">
					    	<div class="manufacturer">{{item.manufacturer}}</div>
					    	<div class="name" @click="fnReviewMove(item.productNo)">{{item.productName}}</div>
					    </div>
					    <div class="optionName">
					    	<div>{{item.optionName}}</div>
					    	<div class="productPrice">{{numberWithCommas(item.productPrice)}}<span class="span1"> | </span><span class="span2">{{item.cnt}}개</span></div>
					    </div>
					    <div class="buttonBox">
					    	<button @click="fnReOrder(item)" class="btn1">재구매</button>
					    	<button @click="fnReviewMove(item.productNo)" class="btn2">리뷰작성</button>
					    </div>
					   </div>
				    </div>
				</div>
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
		userNo : '${sessionNo}',
		orderList : [],
		deliverySit : {
			order : 0,
			ready : 0,
			shipping : 0,
			completed : 0
		},
		optionList : [{},{}],
		selectedOption: '기간',
        options: [
          { text: '1개월 전', value: '1' },
          { text: '3개월 전', value: '3' },
          { text: '6개월 전', value: '6' },
          { text: '1년 전', value: '12' },
          { text: '2년 전', value: '24' },
          { text: '3년 전', value: '36' },
        ],
        optionsVisible: false
	},// data
	methods : {
		fnGetOrderList(){
			var self = this;
			var nparmap = {userNo : self.userNo};
            $.ajax({
                url : "searchOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                	for(let i = 0; i < self.orderList.length; i++){
                		switch (self.orderList[i].deliverySit) {
                	    case '1':
                	        self.deliverySit.order++;
                	        self.orderList[i].deliverySitName = '결제완료';
                	        break;
                	    case '2':
                	        self.deliverySit.ready++;
                	        self.orderList[i].deliverySitName = '배송준비';
                	        break;
                	    case '3':
                	        self.deliverySit.shipping++;
                	        self.orderList[i].deliverySitName = '배송중';
                	        break;
                	    case '4':
                	        self.deliverySit.completed++;
                	        self.orderList[i].deliverySitName = '배송완료';
                	        break;
                	    default:
                	        break;
                	}
                		self.orderList[i].productPrice = self.orderList[i].productPrice * ((100-self.orderList[i].discount)/100) + self.orderList[i].optionPrice;
                		self.orderList[i].productPrice = Math.floor( self.orderList[i].productPrice / 100) * 100
                	}
                	console.log(self.orderList);
                }
            });
		},
		fnReOrder(item){
			$.pageChange("/order/main.do", {product : [{productNo : item.productNo, optionNo : item.optionNo, quantity : item.cnt}]} );
		},
		fnReviewMove(productNo){
			$.pageChange("/product/view.do", {no : productNo} );
		},
		fnOrderList(){
			var self = this;
			var month = isNaN(Number(self.optionList[1].value)) ? 1 : Number(self.optionList[1].value);
			var nparmap = {userNo : self.userNo, deliverySit : self.optionList[0].deliverySit, month};
            $.ajax({
                url : "searchOrderList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.orderList = data.list;
                }
            });
		},
		fnOptionDel(index){
			var self = this;
			if(index == 0){
				self.optionList[0]= ({name : undefined, deliverySit : undefined});
			} else {
				self.optionList[1]= ({name : undefined, value : undefined});
			}
			self.fnOrderList();
		},
        handleSelect(value) {
	          this.selectedOption = value ? this.options.find(option => option.value === value).text : '기간';
	          this.optionsVisible = false;
	          var month = '';
	          switch(value){
				case '1':  month = '1개월 전'; break;
				case '3':  month = '3개월 전'; break;
				case '6':  month = '6개월 전'; break;
				case '12':  month = '1년 전'; break;
				case '24':  month = '2년 전'; break;
				case '36':  month = '3년 전'; break;
				default : break;
			}
	          if(this.optionList.length == 2){
	        	  this.optionList[1] = ({name : month, value});
	          }
	          this.fnOrderList();
        },
        showOptions() {
            this.optionsVisible = true;
        },
        hideOptions() {
           this.optionsVisible = false;
        },
        fnClickOption(deliverySit){
        	var deliverySitName ='';
			switch(deliverySit){
				case 1:  deliverySitName = '결제완료'; break;
				case 2:  deliverySitName = '배송준비'; break;
				case 3:  deliverySitName = '배송중'; break;
				case 4:  deliverySitName = '배송완료'; break;
				default : break;
			}
			this.optionList[0] = ({name : deliverySitName, deliverySit : deliverySit});
			this.fnOrderList();
        },
        numberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
	}, // methods
	created : function() {
		var self = this;
		if(self.userNo == ''){
			location.href="../login.do";
		}
		self.fnGetOrderList();
	}// created
});
</script>