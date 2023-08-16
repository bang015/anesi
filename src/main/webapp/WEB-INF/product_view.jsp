<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>상품 상세 페이지</title>
<style>
	/* html { 
  		scroll-behavior: smooth;
	} */
	.content{
		position: relative;
    	min-height: 1px;
		width: 1300px;
		margin: 0 auto;
		margin-top : 170px;
		
	}
	.content-box{
		display : flex;
		width: 1200px;
		margin: 0 auto;
		margin-bottom: 30px;
		min-height: 700px;
	}
	.main-left{
		width: 60%;
		display: inline-block;
		position: relative;
	}
	.main-box{
		width : 400px;
		display: inline-block;
		margin-left: 30px;
		margin-top: 50px;
	}
	.category-wrap{
		margin-top: 20px;
		font-size: 15px;
		color: #424242;
	}
	.main-img-table{
	}
	.main-ul{
		list-style-type: none;
		padding-left: 0px;
	}
	.main-li{
		margin-bottom: 5px;
		margin-top: 0px;
		
	}
	.main-li img{
		width: 100px;
		height: 100px;
		border-radius: 10px;
	}
	.main-img{
		position : absolute;
		left : 110px;
		top : 51px;
		width: 600px;
		height: 600px;
		
	}
	.main-img img{
		width: 600px;
		height: 600px;
		border-radius: 10px;	
	}
	.main-title{
		font-size: 30px;
		font-weight:bold;
		margin-top: 0;
		
	}
	.main-csat{
		font-size : 20px;
		margin-top: 20px;
	}
	.main-discount{
		margin-top: 20px;
		font-size: 20px;
	}
	.price{
		text-decoration: line-through;
	}
	.discount-price{
		height : 50px;
		border-bottom: 1px solid #ededed;
		font-size: 30px;
	}
	.main-price2{
		height : 50px;
		border-bottom: 1px solid #ededed;
		font-size: 30px;
		margin-top: 20px;
	}
	.main-option{
		margin-top: 30px;
	}
	.option-box{
		width: 100%;
		height: 50px;
		font-size: 18px;
		border-radius: 5px;
		border: 1px solid #ededed;
	}
	.main-btn-wrap{
		margin-top: 30px;
	}
	.main-btn-wrap button{
		width: 198px;
		height: 50px;
		border-radius: 5px;
		font-size: 17px;
	}
	.btn1{
		border: 1.5px solid #A782C3;
		color: #A782C3;
		background-color: #fff;
		font-weight: bold;
	}
	.btn2{
		border: 0;
		color: #fff;
		background-color: #A782C3;
	}
	.nav-box{
		overflow: auto;
		position: sticky;
		top: 185px;
		z-index: 999;
	}
	.nav-wrap{
    	border-bottom: 1px solid #ededed;
		border-top: 1px solid #ededed;
		width : 100%;
		height: 52px;
		background-color: #fafafa;
		
	}
	.nav-wrap div{
		font-size : 16px;
		font-weight : bold;
		line-height : 50px;
		text-align : center;
		width: 395.5px;
		height : 50px;
		display: inline-block;
		
	}
	.nav-wrap div:hover{
		border-bottom: 2px solid #A782C3;
		color: #A782C3;
	}
	.nav-wrap a{
		font-family: 'Pretendard-Regular';
		font-size: 17px;
		padding: 17px 165px 17px 168px;
	}
	.content-img{
		margin-left: 40px;
		width: 700px;
		display: inline-block;
	}
	.content-img img{
		width: 700px;
	}
	.content-title{
		font-size: 20px;
		font-weight: bold;
		margin-left: 40px;
		margin-top: 20px;
		width: 700px;
		display: inline-block;
	}
	.content-text-box{
		background-color: #FDF4F5;
		text-align: center;
		width: 700px;
		height : 200px;
		font-size: 20px;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	.text1{
		color: #F54644;
		line-height: 80px;
		font-weight: bold;
		font-size: 30px;
	}
	.content-review{
		margin-left: 40px;
		width: 700px;
		display: inline-block;
		margin-top: 30px;
	}
	.review-span{
		color : rgba(0,0,0,.4);
		font-weight: bold;
		font-size: 17px;
	}
	.review-title{
		font-size: 18px;
		font-weight: bold;
		display: inline-block;
		width: 700px;
	}
	.review-text2{
		color:#A782C3; 
	}
	.review-btn{
		float: right;
		background-color: #fff;
		border : 0;
		color : #A782C3;
		font-size: 15px;
		font-weight: bold;
		font-family: 'Pretendard-Regular';
	}
	.csat-box{
		background-color: #f7f8fa;
		width: 700px;
		height : 150px;
		border-radius: 8px;
		margin-top: 30px;
		display: flex;
	}
	.csat1{
		display : inline-block;
		width: 300px;
		height: 120px;
		border-right: 2px solid #ededed;
		margin-top: 20px;
		margin-left: 30px;
		 
	}
	.csat-box1{
		margin-top : 45px;
		margin-left: 55px;
	}
	.csatAvg{
		margin-left: 10px;
		font-size: 25px;
		font-weight: bold;
	}
	.csat2{
		display: inline-block;
	}
	.recently-viewed{
		border: 1px solid;
		width: 400px;
		height: 525px;
		position: sticky;
		top: 240px;
	}
	.content-box2{
		display: flex;
	}
	.content-view{
		width: 800px;
	}
	.user-profile{
		display: inline-block;
		width: 25px;
		height: 25px;
		margin-right: 5px;
	}
	.user-profileImg{
		width: 25px;
		height: 25px;
		border-radius: 100px;
		
	}
	.review-user{
		display: inline-block;
	}
	.user-nick{
		margin-left: 2px;
		font-size: 14px;
		color: #424242;
		margin-bottom: 1px;
	}
	.review-user-box{
		display: inline-block;
		margin-top: 20px;
	}
	.review-box{
		border-top: 1px solid #ededed;
		margin-top: 10px;
	}
	.review-box2{
		font-size: 16px;
		margin-top: 10px;
		margin-left: 250px;
		margin-bottom: 30px;
	}
	.review-optionName{
		margin-top: 10px;
		border-left: 3px solid #ededed;
	}
	.review-optionName1{
		margin-left: 5px;
	}
	.review-wrap{
		margin-top: 30px;
	}
	.review-content{
		margin-top : 20px;
		margin-bottom : 20px;
		font-size: 17px;
	}
	.help-btn{
		height: 30px;
		border: 1px solid #A782C3;
		background-color: #fff;
		color: #A782C3;
		border-radius: 5px;
		font-weight: bold;
	}
	.review-img-box{
		width: 200px;
		height: 200px;
		margin-top: 20px;
	}
	.review-img{
		width: 200px;
		height: 200px;
		border-radius: 5px;
	}
	.pagination {
        display: inline-flex;
        margin-top: 40px;
        margin-left: 200px;
    }
    ul {
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	    padding: 4px 12px ;
	}
	.pagination li.active {
	    background-color : #A782C3;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	    
	}
	.pagination a{
		padding: 4px 12px ;
	}
	.quantity-box {
	  display: flex;
	  align-items: center;
	}
	.choice-option ul{
		padding: 0;
	}
	.choice-option li{
		list-style: none;
		background-color:#ededed; 
		border-radius: 5px;
		padding: 10px;
	}
	.choice-option li span{
		font-size: 17px;
		margin-top: 30px;
		margin-left: 8px;
	}
	.choice-option li .del-btn{
		border: 0;
		background-color: #ededed;
		float: right;
		
	}
	.option-stock{
		display: flex;
  		align-items: center;
	}
	.quantity-box{
	    border-radius: 4px;
		border: 1px solid rgb(218, 221, 224);
		background: rgb(255, 255, 255);
		width: 77px;
		margin-top: 12px;
		margin-left: 8px;
	}
	.quantity-box input{
		border: 0;
		width: 25px;
		height: 30px;
		text-align: center;
	}
	.minus-btn, .plus-btn{
		background-color: #fff;
		border: 0;
	}
	.option-stock-price{
		overflow: auto;
		font-size: 18px;
		font-weight: bold;
		flex: 1 1 0%;
    	text-align: right;
    	margin-top: 25px;
	}
	.total-price{
		margin-top: 30px;
		display: flex;
		align-items: center;
	}
	.total-title{
		font-size: 18px;
		font-weight: bold;
	}
	.total-price1{
		flex: 1 1 0%;
	}
	.total-price2{
		float: right;
	}
	.review-add{
		background-color: #fff;
		width: 700px;
		border-radius: 5px;
	}
	.review-product-name{
		margin-top: 20px;
	}
	.review-add-name{
		font-size: 20px;
		display: inline-block;
		margin-right: 5px;
	}
	.review-add-option{
		font-size: 17px;
	}
	.review-add-box{
		width: 400px;
		margin: 0 auto;
		
	}
	.review-product-price{
		font-size: 16px;
		margin-bottom: 10px;
	}
	.review-product-csat{
		margin-bottom: 20px;
		border-bottom: 1px solid #ededed;
		padding-bottom: 10px;
	}
	.file-upload-label{
		width: 400px;
		height: 40px;
		border-radius: 5px;
		border: 1px solid #A782C3;
		background-color: #fff;
		color: #A782C3;
		font-size: 16px;
		font-weight: bold;
		display: flex;
		
	}
	.img-icon{
		margin-left: 140px;
		margin-top: 2px;
	}
	.img-btn-text{
		margin-top : 8px;
		margin-left: 10px;
	}
	.review-img-btn-wrap{
		margin-bottom: 10px;
	}
	.fileName{
		margin: 0;
	}
	.review-add-text{
		margin-top : 20px;
		width: 394px;
		border-radius: 5px;
	}
	.review-add-btn{
		margin-top : 20px;
		width: 400px;
		height: 40px;
		border-radius: 5px;
		border: 1px solid #A782C3;
		background-color: #fff;
		margin-bottom: 20px;
		color: #A782C3;
		font-size: 16px;
		font-weight: 900;
	}
	.review-back{
		float: right;
		margin-top: 10px;
		margin-right: 10px;
	}
	.review-back button{
		background-color: #fff;
		border: 0;
	}
	.star-rating {
	  position: relative;
	  display: inline-block;
	  font-size: 0; /* To remove white space between inline-block elements */
	}	
	.fa-star.half {
	  width: 50%;
	  overflow: hidden;
	}
	
	.fa-star.filled {
	  color: #A782C3;
	}
	
	.fa-star.empty {
	  color: #ababab;
	}
	.custom-star {
  	  font-size: 2rem;
	}	
</style>
</head>
<!-- 상품 상세 페이지 -->
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div id="app">
		<div id="container">
			<div class="content">
				<div class="content-box">
					<div class="main-left">
						<div class="category-wrap">
							이거 > 저거 > 요거
						</div>
						<div class="main-view">
							<div class="main-img-table">
								<ul class="main-ul">
									<li class="main-li" v-for="item in img">
										<a href="javascript:;">
											<img alt="콘텐츠 이미지" :src="item.imgPath+'/'+item.imgName" @click="clickImg(item.imgPath, item.imgName)">
										</a>	
									</li>
									<li class="main-li" v-for="item in imgList">
										<a href="javascript:;">
											<img alt="콘텐츠 이미지" :src="item.imgPath+'/'+item.imgName" @click="clickImg(item.imgPath, item.imgName)">
										</a>
									</li>
								</ul>
							</div>
							<div class="main-img">
								<img alt="썸네일" :src="mainImg">
							</div>
						</div>
					</div>
						<div class="main-box">
							<div class="manufacturer">
								{{product.manufacturer}}
							</div>
							<div class="main-title" >
								{{product.productName}}
							</div>
							<div class="main-csat">
								<div v-for="(rating, index) in csatAvg" :key="index">
							      <span v-for="star in 5" :key="star">
							        <template v-if="rating >= star ">
							          <i class="fa-solid fa-star" style="color: #A782C3;"></i> <!-- 채워진 별표 -->
							        </template>
							        <template v-else-if="rating +0.3 >= star">
							         <span style="display: inline-block; position: relative;">
							            <i class="fa-solid fa-star" style="color: #ababab;"></i> <!-- 반채워진 별표 -->
							            <i class="fa-solid fa-star" style="color: #A782C3; position: absolute; left: 0; top:1.5px; width: 65%; overflow: hidden;"></i>
							          </span>
							        </template>
							        <template v-else-if="rating + 0.5 >= star">
							         <span style="display: inline-block; position: relative;">
							            <i class="fa-solid fa-star" style="color: #ababab;"></i> <!-- 반채워진 별표 -->
							            <i class="fa-solid fa-star" style="color: #A782C3; position: absolute; left: 0; top:1.5px; width: 50%; overflow: hidden;"></i>
							          </span>
							        </template>
							        <template v-else-if="rating +0.8 >= star">
							         <span style="display: inline-block; position: relative;">
							            <i class="fa-solid fa-star" style="color: #ababab;"></i> <!-- 반채워진 별표 -->
							            <i class="fa-solid fa-star" style="color: #A782C3; position: absolute; left: 0; top:1.5px; width: 40%; overflow: hidden;"></i>
							          </span>
							        </template>
							        
							        <template v-else>
							         <i class="fa-solid fa-star" style="color: #ababab;"></i> <!-- 빈 별표 -->
							        </template>
							      </span>
							    </div>
								{{csat.csatAvg}}({{csat.csatCnt}})
								
							</div>
							<div v-if="product.discount > 0">
								<div class="main-discount">
									{{product.discount}}% <span class="price">{{product.productPrice | formatPrice}}원</span>
								</div>
								<div class="discount-price">
									{{discountPrice | formatPrice}}원
								</div>
							</div>
							<div v-else>
								<div class="main-price2">
									{{product.productPrice}}원
								</div>
							</div>
							<div class="main-option">
								<select class="option-box" v-model="option1" @change="addToSelectedOptions">
									<option value="">상품을 선택하세요.</option>
									<option v-for="item in option" :key="item.optionNo + '-' + item.optionName" :value="item.optionNo">
										{{item.optionName}}(+{{item.optionPrice | formatPrice}}원)
									</option>
								</select>
							</div>
							<div class="choice-option">
								<ul>
							       <li v-for="(selectedOption, index) in selectedOptions" :key="index">
							        <span>{{ selectedOption.optionName }}</span>
							        <button class="del-btn"  @click="removeSelectedOption(index)">
							        	<i class="fa-solid fa-x" style="color: #6e86af;"></i>
							        </button> 
							        <div class="option-stock">
							        	 <div class="quantity-box">
										   <button class="minus-btn" @click="decreaseQuantity(selectedOption)">
										   		<i class="fa-solid fa-minus" style="color: #4c6794;"></i>
										   </button>
							               <input v-model ="selectedOption.quantity" min="1">
							               <button class="plus-btn" @click="increaseQuantity(selectedOption)">
							               		<i class="fa-solid fa-plus" style="color: #4b638b;"></i>
							               </button>
										 </div>
										 <div class="option-stock-price">
										 	{{ calculateTotalPrice(selectedOption) | formatPrice}}원
										 </div>
							        </div>							        
							       </li>
							    </ul>
							    
							</div>
							<div class="total-price">
							    <div class="total-title">주문금액</div>
							    <div class="total-price1">
							    	<span class="total-price2">{{totalPrice | formatPrice}}원</span>
							    </div>
							</div>
							<div class="main-btn-wrap">
								<button class="btn1">장바구니</button>
								<button class="btn2" @click="fnPay">바로구매</button>
							</div>
						</div>
					</div>
					<div class="nav-box">
						<div class="nav-wrap">
							<div class="product-a"><a href="#product">상품정보</a></div>
							<div class="review-a"><a href="#review">리뷰  <span class="review-span" v-if="csat.csatCnt > 0"> {{csat.csatCnt}}</span></a></div>
							<div class="inquiry-a"><a>문의</a></div>
						</div>
					</div>
					<div class="content-box2">
						<div class="content-view">
							<div class="content-title" id="product">
								상품 정보
								<div class="content-text-box">
									<div class="text1">판매자 직거래 주의 안내</div>
									<div>판매자를 사칭하여 현금 입금 유도하는 소비자 피해 사례가 늘고 있습니다.</div>
									<div>판매자와 문자/카톡으로 소통하실 때, 고객분들의 주의를 부탁드리며,</div>
									<div>의심되는 경우 아네시 고객센터로 신고해 주시기 바랍니다.</div>
								</div>
							</div>
							<div class="content-img" v-for="item in imgList2">
								<img alt="콘텐츠이미지" :src="item.imgPath+'/'+item.imgName">
							</div>
							<div class="content-review" id="review">
								<div class="review-title" >
									<span class="review-text1">리뷰 </span><span class="review-text2" v-if="csat.csatCnt > 0"> {{csat.csatCnt}}</span>
									<button class="review-btn" @click="openScrapModal" v-if="reviewUser.length != 0">리뷰쓰기</button>
								</div>
								<div class="modal" v-if="showScrapModal">
									
							        <div class="review-add">
							        <div class="review-back">
										<button @click="closeScrapModal()"><i  class="fa-solid fa-x fa-2x" style="color: #410349;"></i></button>
									</div>
							        	<div class="review-add-box">
								        	<div class="review-add-product">
								        		<div class="review-product-name">
								        			<div class="review-add-name">{{product.productName}}</div>
								        			<span class="review-add-option" v-for="(item, index) in reviewUser">
								        				{{item.optionName}}
								        				<span v-if="index !== reviewUser.length - 1">+</span>	
								        			</span>
								        		</div>
								        		<div class="review-product-price">
								        			<span class="review-add-price">{{reviewPrice | formatPrice}}원</span>
									        	</div>
									        	<div class="review-product-csat">
									        		<div>
													    <div class="star-rating">
													      <i v-for="(star, index) in stars" :key="index"
													         :class="starClass(index)"
													          @mouseover="hover(index + 1)"
														      @click="rate(index + 1)"
														      @mouseout="clearHover"></i>
													    </div>
													    <p>선택한 별점: {{ selectedRating }}</p>
													</div>
									        	</div>
									        	<div class="review-img-btn-wrap">
									        		<input type="file" id="file1" name="file1" style="display: none;" @change="handleFileChange">
												    <label for="file1" class="file-upload-label">
												      <div class="img-icon"><i class="fa-regular fa-image fa-2x" style="color: #A782C3;"></i></div>
												      <div class="img-btn-text">사진 추가</div>
												    </label>
									        	</div>	
									        	<p class="fileName" v-if="selectedFile">파일 이름: {{ selectedFile.name }}</p>
									        	<div class="review-add-textarea">
									        		<textarea class="review-add-text" rows="10" cols="53.9" v-model="reviewText"></textarea>
									        	</div>
									        	<div class="review-add-btn-wrap"> 
									        		<button @click="fnReviewAdd" class="review-add-btn">리뷰 등록</button>
									        	</div>
								        	</div>
							        	</div>
							        	
							        </div>
								</div>
								<div class="csat-box">
									<div class="csat1">
										<div class="csat-box1">
											<div style="display: inline-block" v-for="(rating, index) in csatAvg" :key="index">
										      <span v-for="star in 5" :key="star">
										        <template v-if="rating >= star ">
										          <i class="fa-solid fa-star fa-2x" style="color: #A782C3;"></i> <!-- 채워진 별표 -->
										        </template>
										        <template v-else-if="rating +0.3 >= star">
										         <span style="display: inline-block; position: relative;">
										            <i class="fa-solid fa-star fa-2x" style="color: #ababab;"></i> <!-- 반채워진 별표 -->
										            <i class="fa-solid fa-star fa-2x" style="color: #A782C3; position: absolute; left: 0; width: 65%; overflow: hidden;"></i>
										          </span>
										        </template>
										        <template v-else-if="rating + 0.5 >= star">
										         <span style="display: inline-block; position: relative;">
										           <i class="fa-solid fa-star fa-2x" style="color: #ababab;"></i> <!-- 반채워진 별표 -->
										            <i class="fa-solid fa-star fa-2x" style="color: #A782C3; position: absolute; left: 0; width: 50%; overflow: hidden;"></i>
										          </span>
										        </template>
										        <template v-else-if="rating +0.8 >= star">
										         <span style="display: inline-block; position: relative;">
										            <i class="fa-solid fa-star fa-2x" style="color: #ababab;"></i> <!-- 반채워진 별표 -->
										            <i class="fa-solid fa-star fa-2x" style="color: #A782C3; position: absolute; left: 0; width: 40%; overflow: hidden;"></i>
										          </span>
										        </template>
										        
										        <template v-else>
										          <i class="fa-solid fa-star fa-2x" style="color: #ababab;"></i>
										        </template>
										      </span>
										    </div>
											<span class="csatAvg">{{csat.csatAvg}}</span>
										</div>
									</div>
									<div class="csat2">
										<div id="chart">
        									<apexchart type="bar" height="150" :options="chartOptions" :series="series"></apexchart>
     									</div>
									</div>
								</div> <!-- csat-box end -->
								<div class="review-wrap">
									<div class="review-box" v-if="reviewList.length > 0" v-for="item in reviewList">
										<div class="user-profile">
												<img class="user-profileImg" alt="프로필이미지" :src="item.uImgPath+'/'+item.uImgName">
										</div>
										<div class="review-user">
											
											<div class="review-user-box">
												<div class="user-nick">{{item.nick}}</div>
												<span v-for="index in item.csat"><i class="fa-solid fa-star" style="color: #A782C3;"></i></span><span v-for="index in 5-item.csat"><i class="fa-solid fa-star" style="color: #ababab;"></i></span>
												<span>{{item.createDate}}</span>
												
											</div>
										</div>
										<div v-if="item.optionName != undefined" class="review-optionName">
											<span class="review-optionName1">{{item.optionName}}</span>
										</div>
										<div class="review-img-box" v-if="item.rImgName !=undefined">
											<img class="review-img" alt="리뷰이미지" :src="item.rImgPath+'/'+item.rImgName">
										</div>
										<div class="review-content">
											{{item.content}}
										</div>
										<div class="review-help">
											<button class="help-btn">도움이 돼요</button> <span v-if="item.help > 0">{{item.help}}명에게 도움이 되었습니다.</span>
										</div>
										 
									</div>
									<div class="review-box2" v-if="reviewList.length == 0">
										첫 리뷰를 남겨주세요!
									</div>
									<template v-if="cnt > 0">
									  <paginate
									    :page-count="pageCount"
									    :page-range="5"
									    :margin-pages="2"
									    :click-handler="fnSearch"
									    :prev-text="'<'"
									    :next-text="'>'"
									    :container-class="'pagination'"
									    :page-class="'page-item'">
									  </paginate>
									</template>
								</div> <!-- review-wrap end -->
							</div><!-- content-review end -->
							<div class="inquiry-wrap">
								<div class="review-title" >
									<span class="review-text1">문의 </span><span class="review-text2"> {{csat.csatCnt}}</span>
									<button class="review-btn">문의하기</button>
								</div>
							</div>
						</div>
						<div class="recently-viewed">
      						최근본 상품
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
<script src="../js/jquery.js"></script>
<script>
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
	el : '#app',
	components: {
        apexchart: VueApexCharts,
      },
	data : {
		optionName : "",
		stars: Array(5).fill('empty'),
	    selectedRating: 0,
	    hoveringRating: 0,
		reviewText : "",
		selectedFile: null,
		reviewPrice : 0,
		reviewUser : [],
		userNo : '${sessionNo}',
		totalPrice : 0,
		optionPrice : "",
		selectedOptions : [],
		discountPrice : 0,
		option1 : "",
		productNo : '${map.no}',
		product : {},
		csat : {},
		csatAvg : [],
		option : [],
		imgList : [],
		img : [],
		imgList2 : [],
		reviewList : [],
		num : 0 ,
		mainImg : "",
		csatCnt : [],
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		showScrapModal : false,
		/* 그래프 시작 */
		series: [{
            data : []
          }],
          chartOptions: {
            chart: {
              type: 'bar',
              height: 50,
              toolbar : {show : false},
              
            },
            tooltip:{
            	 enabled : false
            },
            plotOptions: {
              bar: {
                borderRadius: 4,
                horizontal: true,
              }
            },
            dataLabels: {
             
            },
            fill: {
            	colors: ['#A782C3']
              },
            xaxis: {
            	labels : {show : false},
              categories: ['5점', '4점', '3점', '2점', '1점'
              ],
              axisTicks: { show: false },
              axisBorder: { show: false },
            }
          }, /* 그래프 끝 */
	},// data
	filters: {
	    formatPrice(price) {
	      return price.toLocaleString('ko-KR');
	    },
	  },
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
	               		self.product = data.product;
	               		var price = self.product.productPrice - Math.round(self.product.productPrice * (self.product.discount/100));
	               		var price2 = Math.floor(price / 100) * 100;
	               		self.discountPrice =price2
	               		self.product.productPrice = self.product.productPrice
	                }                
	            }); 
		},
		fnAvg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/csatSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.csat = data.csat;
	               		self.num = 5 - self.csat.csatAvg;
	               		self.csatAvg = [self.csat.csatAvg];	         
	                }                
	            }); 
		},
		fnOption : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/optionSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.option = data.option;
	              
	                }                
	            }); 
		},
		fnImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.imgList = data.imgList;
	                }                
	            }); 
		},
		fnThumbnailImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgThumbnailSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.img = data.img;
	               		self.mainImg = self.img[0].imgPath+"/"+self.img[0].imgName
	                }                
	            }); 
		},
		fnContentImg : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/imgSearch2.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.imgList2 = data.imgList2;
	                }                
	            }); 
		},
		fnReview : function(){
			 var self = this;
			 	var startNum = ((self.selectPage-1) * 5);
	    		var lastNum = 5;
	            var nparmap = {productNo : self.productNo,startNum : startNum, lastNum : lastNum};	            
	            $.ajax({
	                url : "/reviewSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.reviewList = data.reviewList;
	               		self.cnt = data.cnt;
		                self.pageCount = Math.ceil(self.cnt / 5);
		                console.log(self.reviewList);
	                }                
	            })
		},
		 fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 5);
			var lastNum = 5;
			var nparmap = {productNo : self.productNo,startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/reviewSearch.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.reviewList = data.reviewList;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 5);
				}
			});
		},
		fnReviewCnt : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/reviewCntSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	var csat1 = data.csat1
	                	var csat2 = data.csat2
	                	var csat3 = data.csat3
	                	var csat4 = data.csat4
	                	var csat5 = data.csat5
	               		self.csatCnt = [csat5, csat4, csat3, csat2, csat1];
	               		self.series = [{
	                        data: self.csatCnt
	                      }]
	                }                
	            })
		},
		fnReviewUser : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo, userNo : self.userNo};	            
	            $.ajax({
	                url : "/reviewUserSearch.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	self.reviewUser = data.user	
	                	
	                	for (var i = 0; i < self.reviewUser.length; i++) {
	                		  self.reviewPrice += self.reviewUser[i].orderPrice;
	                		  self.optionName += self.reviewUser[i].optionName + ' + '; // 각 옵션 이름 누적
	                		}

	                		// 누적된 문자열 마지막에 있는 '+' 기호 제거
	                		if (self.optionName.endsWith(' + ')) {
	                		  self.optionName = self.optionName.slice(0, -3);
	                		}
	                	console.log(self.reviewUser);
	                	console.log(self.optionName);
	                }                
	            })
		},
		handleFileChange(event) {
		     
		      this.selectedFile = event.target.files[0];
		    },
		fnReviewAdd : function(){
			var self = this;
            var nparmap = {userNo : self.userNo, reviewText : self.reviewText, productNo : self.productNo, csat : self.selectedRating, optionName : self.optionName};
            $.ajax({
                url:"/reviewAdd.dox",
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
		},
		 upload : function(form){
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
		},
		addToSelectedOptions() {
		      const selectedItem = this.option.find(item => item.optionNo === this.option1);
		      if (selectedItem) {
		    	const existingOption = this.selectedOptions.find(opt => opt.optionNo === selectedItem.optionNo);
		    	if (existingOption) {
		            existingOption.quantity++; // 이미 있는 상품의 수량 증가
		          }else{
		        	  this.selectedOptions.push({
		        		  productNo : this.productNo,
				          optionNo: selectedItem.optionNo,
				          optionName: selectedItem.optionName,
				          quantity : 1
				        }); 
		        	  this.calculateOrderTotal();
		          }
		        this.option1="";
		      }
		      console.log(this.selectedOptions);
		    },
		removeSelectedOption(index) {
		        this.selectedOptions.splice(index, 1);
		        this.calculateOrderTotal();
		      },
		decreaseQuantity(selectedOption) {
		        if (selectedOption.quantity > 1) {
		          selectedOption.quantity--;
		          this.calculateOrderTotal();
		        }
		      },
		increaseQuantity(selectedOption) {
		    	  selectedOption.quantity = selectedOption.quantity + 1;
		    	  this.calculateOrderTotal();
		        
		      },
		calculateTotalPrice(selectedOption) {
		        const item = this.option.find(opt => opt.optionNo === selectedOption.optionNo);
		        this.totalPrice = item.optionPrice * selectedOption.quantity+this.discountPrice
		        return item ? item.optionPrice * selectedOption.quantity : 0;
		        
		      },
		   // totalPrice 계산 메서드
		calculateTotalPrice(selectedOption) {
		        const item = this.option.find(opt => opt.optionNo === selectedOption.optionNo);
		        return item ? (item.optionPrice+this.discountPrice) * selectedOption.quantity : 0;
		      },

		      // 총 주문금액 계산 메서드
		calculateOrderTotal() {
		        this.totalPrice = this.selectedOptions.reduce((total, option) => {
		          return total + this.calculateTotalPrice(option);
		        }, 0);
		      },
		fnPay : function(){
			 var self = this;
			 if(self.selectedOptions.length == 0){
				 alert("상품을 선택해주세요.");
				 return;
			 }else{
				 $.pageChange("../order/main.do" , {product : self.selectedOptions});
			 }
			},
		clickImg : function(imgPath,imgName){
			var self = this
			self.mainImg = imgPath+"/"+imgName;
			},
		prevPage() {
			this.currentPage--;
			},
		nextPage() {
			this.currentPage++;
			},
		openScrapModal: function() {
		    var self = this;
		    self.showScrapModal = true;
		    },
		closeScrapModal: function() {
			var self = this;
			self.showScrapModal = false;
			self.selectedFile = null;
			},
			starClass(index) {
			      const rating = this.hoveringRating || this.selectedRating;
			      if (rating >= index + 1) {
			        return 'fa-solid fa-star custom-star filled';
			      } else if (rating >= index + 0.5) {
			        return 'fa-solid fa-star custom-star half';
			      } else {
			        return 'fa-solid fa-star custom-star empty';
			      }
			    },
			    hover(rating) {
			      this.hoveringRating = rating;
			    },
			    rate(rating) {
			      this.selectedRating = rating;
			      this.hoveringRating = 0; // 클릭했을 때 호버 상태 제거
			    },
			    clearHover() {
			      if (this.selectedRating === 0) {
			        this.hoveringRating = 0;
			      }
			    }
			  
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnAvg();
		self.fnOption();
		self.fnImg();
		self.fnThumbnailImg();
		self.fnContentImg();
		self.fnReview();
		self.fnReviewCnt();
		self.fnReviewUser();
	}// created
});
</script>