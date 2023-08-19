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
<link href="../css/inquiry.css" rel="stylesheet">
<link href="../css/review.css" rel="stylesheet">
<link href="../css/productView.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>상품 상세 페이지</title>
<style>
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
									{{defaultPrice | formatPrice}}원
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
							<div class="inquiry-a"><a href="#inquiry">문의 <span class="review-span" v-if="inquiryListCnt > 0">{{inquiryListCnt}}</span></a></div>
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
								<div class="review-title2" >
									<span class="review-text1">리뷰 </span><span class="review-text2" v-if="csat.csatCnt > 0"> {{csat.csatCnt}}</span>
									<button class="review-btn" @click="openScrapModal" v-if="reviewUser.length != 0">리뷰쓰기</button>
								</div>
								<div class="modal" v-if="showScrapModal">
									
							        <div class="review-add">
							        <div class="review-back">
										<button @click="closeScrapModal()"><i  class="fa-solid fa-x fa-2x" style="color: #bdbdbd;"></i></button>
									</div>
							        	<div class="review-add-box">
								        	<div class="review-add-product">
								        		<div class="review-title1">리뷰쓰기</div>
								        		<div class="review-top-wrap">
									        		<div class="review-product-img">
									        			<img class="review-product-img1" alt="리뷰상품이미지" :src="mainImg">
									        		</div>
									        		<div class="review-product-name">
									        			<div class="review-product">
											        		<div class="review-manufacturer">
																{{product.manufacturer}}
															</div>
										        			<div class="review-add-name">{{product.productName}}</div>
										        			<span class="review-add-option" v-for="(item, index) in reviewUser">
										        				{{item.optionName}}
										        				<span v-if="index !== reviewUser.length - 1">+</span>	
										        			</span>
									        			</div>
									        		</div>
								        		</div>
								        		
									        	<div class="review-product-csat">
									        		<div :class="reviewCsatClass">
									        			별점 평가
									        		</div>
									        		<span class="notCheck" v-if="reviewCsatCheck == true">필수 입력 항목입니다.</span>
									        		<div class="review-csat-box">
										        		<div class="review-csat1">만족도</div>									        	
														<div class="star-rating">
														  <i v-for="(star, index) in stars" :key="index"
														      :class="starClass(index)"
														      @mouseover="hover(index + 1)"
															  @click="rate(index + 1)"
															  @mouseout="clearHover"></i>
														</div>
													</div>																									
									        	</div>
									        	<div class="img-add">
									        		<div class="img-add1">사진 첨부(선택)</div>
									        		<div class="img-add2">사진을 첨부해주세요.(최대 1장)</div>
									        	</div>
									        	<div class="review-img-btn-wrap">
									        		<input type="file" id="file1" name="file1" style="display: none;" @change="handleFileChange">
												    <label for="file1" class="file-upload-label">
												      <div class="img-icon"><i class="fa-regular fa-image fa-2x" style="color: #A782C3;"></i></div>
												      <div class="img-btn-text">사진 추가하기</div>
												    </label>
									        	</div>	
									        	<p class="fileName" v-if="selectedFile">파일 이름: {{ selectedFile.name }}</p>
									        	<div :class="reviewTitleClass">
									        		리뷰 작성
									        	</div>
									        	<span class="notCheck" v-if="reviewCheck == true">필수 입력 항목입니다.</span>
									        	<div class="review-add-textarea">
									        		<textarea :class="reviewTextareaClass" @click="reviewTextarea" @input="updateCharacterCount" rows="10" cols="53.9" v-model="reviewText" placeholder="자세하고 솔직한 리뷰는 다른고객에게 큰 도움이 됩니다."></textarea>
									        		 <div class="character-count">{{ characterCount }} / 200</div>
									        	</div>
									        	<div class="review-add-btn-wrap"> 
									        		<button @click="fnReviewAdd" class="review-add-btn">완료</button>
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
									<template v-if="pageCount > 1">
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
							<div class="inquiry-wrap" id="inquiry">
								<div class="review-title2" >
									<span class="review-text1">문의 </span><span class="review-text2" v-if="inquiryListCnt > 0"> {{inquiryListCnt}}</span>
									<button class="review-btn" @click="openScrapModal2">문의하기</button>
								</div>
								<div class="modal" v-if="showScrapModal2">
									<div class="inquiry-add-wrap">
										<div class="review-back">
											<button @click="closeScrapModal2()"><i  class="fa-solid fa-x fa-2x" style="color: #bdbdbd;"></i></button>
										</div>
										<div class="inquiry-add-box">										
											<div class="inquiry-add-title">
												상품 문의하기
											</div>
											<div class="inquiry-add-category">
												<div class="inquiry-content-title">
													문의 유형
												</div>
												<div class="inquiry-category-box">
													<div class="category-box active category-box1" @click="changeCategoryStyle('상품')">상품</div>
													<div class="category-box category-box2" @click="changeCategoryStyle('배송')">배송</div>
													<div class="category-box category-box3" @click="changeCategoryStyle('반품')">반품</div>
													<div class="category-box category-box4" @click="changeCategoryStyle('교환')">교환</div>
													<div class="category-box category-box5" @click="changeCategoryStyle('환불')">환불</div>
													<div class="category-box category-box6" @click="changeCategoryStyle('기타')">기타</div>
												</div>											
											</div>
											<div class="inquiry-add-option">
												<div class="inquiry-content-title">
													상품 및 옵션	
												</div>
												<div class="inquiry-option-select">
													<select class="option-select-box" v-model="inquiryOption">
														<option value=0>상품을 선택하세요.</option>
														<option v-for="item in option" :value="item.optionNo">
															{{item.optionName}}
														</option>
													</select>
													<div class="option-not-check">
														<label class="styled-checkbox">																												
															<input class="inquiry-checkbox" type="checkbox">														    														
															<span class="inquiry-span">선택안함</span>
														</label>
													</div>
												</div>
											</div>
											<div class="inquiry-add-content">
												<div :class="reviewTitleClass">
													문의내용
												</div>												
												<textarea :class="reviewTextareaClass" @click="reviewTextarea" @input="updateCharacterCount" rows="10" cols="53.9" v-model="inquiryText" placeholder="문의 내용을 입력하세요."></textarea>
									        	<div class="character-count">{{ characterCount }} / 200</div>
											</div>
											<div class="privateText" v-if="privateCheck">
												<label class="styled-checkbox">	
													<input class="inquiry-checkbox" type="checkbox" id="openYnCheckbox" @click="privateInquiry">
													<span class="inquiry-span">비밀글로 문의하기</span>
												</label>
											</div>
											<div class="inquiry-add-btn-wrap">
												<button @click="inquiryAdd" class="inquiry-add-btn">완료</button>
											</div>
										</div>
									</div>
								</div>
								<div class="inquiry-content" v-for="item in inquiryList" v-if="inquiryListCnt > 0">
									<div class="inquiry-category">
										{{item.purchaseYn}}  | {{item.inquiryCategory}}  | <span class="reply-Y" v-if="item.reply!=undefined">답변완료</span><span v-if="item.reply==undefined">미답변</span>
									</div>
									<div class="inquiry-user">
										<span class="inquiry-nick">{{item.nick}}</span>
										<span class="inquiry-time">{{item.cDateTime}}</span>
									</div>
									<div v-if="item.openYn =='Y'" class="inquiry-question">
										<span class="a-icon">
											<i class="fa-solid fa-q" style="color: #A782C3;"></i>
										</span>
										<span class="inquiry-content-text">
											{{item.content}}
										</span>
									</div>
									<div  class="inquiry-answer">
										<span class="a-icon" v-if="item.reply != undefined && item.openYn =='Y'">
											<i  class="fa-solid fa-a" style="color: #A782C3;"></i>
										</span>
										<span class="inquiry-reply" v-if="item.reply!=undefined && item.openYn =='Y'">
											{{item.reply}}
										</span>
									</div>
									<div class="private-inquiry" v-if="item.openYn=='N'">
										<span class="q-icon">
											<i  class="fa-solid fa-q" style="color: #A782C3;"></i>
										</span>
										<span class="rock-icon">
											<i class="fa-solid fa-lock" style="color: rgb(175, 175, 175);"></i>
										</span>
										<span class="private-text">
											비밀글입니다.
										</span>
									</div>
								</div>
								<div v-if="inquiryListCnt == 0" class="non-inquiry-cnt">
									문의 내역이 없습니다.
								</div>
								<template v-if="pageCount1 > 1">
									  <paginate
									    :page-count="pageCount1"
									    :page-range="5"
									    :margin-pages="2"
									    :click-handler="fnSearch1"
									    :prev-text="'<'"
									    :next-text="'>'"
									    :container-class="'pagination'"
									    :page-class="'page-item'">
									  </paginate>
									</template>
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
		openYn : "Y",
		privateCheck : false,
		purchaseYn : "",
		inquiryText : "",
		inquiryCategory : "상품",
		inquiryOption : 0,
		inquiryListCnt : 0,
		inquiryList : [],
		reviewTitleClass : 'review-title',
		reviewTextareaClass : 'review-add-text',
		reviewCsatClass : 'review-csat',
		reviewCsatCheck : false,
		reviewCheck : false,
		characterCount: 0,
		defaultPrice : 0,
		stars: Array(5).fill('empty'),
	    selectedRating: 0,
	    hoveringRating: 0,
		reviewText : "",
		selectedFile: null,
		reviewPrice : 0,
		reviewUser : [],
		userNo : '${sessionNo}',
		totalPrice : 0,
		selectedOptions : [],
		discountPrice : 0,
		optionName : "",
		option1 : "",
		option : [],
		optionPrice : "",
		productNo : '${map.no}',
		product : {},
		csat : {},
		csatAvg : [],
		imgList : [],
		img : [],
		imgList2 : [],
		reviewList : [],
		num : 0 ,
		mainImg : "",
		csatCnt : [],
		selectPage: 1,
		selectPage1: 1,
		pageCount: 1,
		pageCount1: 1,
		cnt : 0,
		cnt1 : 0,
		showScrapModal : false,
		showScrapModal2 : true,
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
	               		self.defaultPrice = self.product.productPrice;
	                }                
	            }); 
		},
		fnGetInquiryList : function(){
			 	var self = this;
				var startNum = ((self.selectPage1-1) * 5);
				var lastNum = 5;
	            var nparmap = {productNo : self.productNo,startNum : startNum, lastNum : lastNum};	            
	            $.ajax({
	                url : "/selectInquiryList.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.inquiryList = data.inquiryList;
	               		self.cnt1 = data.cnt;
						self.pageCount1 = Math.ceil(self.cnt1 / 5);
	               		console.log(self.inquiryList);
	               		for(var i=0; i<self.inquiryList.length; i++){
	               			if(self.inquiryList[i].purchaseYn=="Y"){
	               				self.inquiryList[i].purchaseYn="구매"
	               			}else{
	               				self.inquiryList[i].purchaseYn="비구매"
	               			}
	               			console.log(self.inquiryList[i].reply);
	               		}
	                }                
	            }); 
		},
		 fnSearch1 : function(pageNum){
				var self = this;
				self.selectPage1 = pageNum;
				var startNum = ((self.selectPage1-1) * 5);
				var lastNum = 5;
				var nparmap = {productNo : self.productNo,startNum : startNum, lastNum : lastNum};
				$.ajax({
					url : "/selectInquiryList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.inquiryList = data.inquiryList;
						self.cnt1 = data.cnt;
						self.pageCount1 = Math.ceil(self.cnt1 / 5);
						for(var i=0; i<self.inquiryList.length; i++){
	               			if(self.inquiryList[i].purchaseYn=="Y"){
	               				self.inquiryList[i].purchaseYn="구매"
	               			}else{
	               				self.inquiryList[i].purchaseYn="비구매"
	               			}
	               		}
					}
				});
			},
		fnGetInquiryListCnt : function(){
			 var self = this;
	            var nparmap = {productNo : self.productNo};	            
	            $.ajax({
	                url : "/selectInquiryListCnt.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                
	               		self.inquiryListCnt = data.inquiryListCnt;
						console.log(self.inquiryListCnt);               			         
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
	                	if(self.reviewUser.length==0){
	                		self.purchaseYn = "N"
	                	}else{
	                		self.purchaseYn = "Y"
	                	}
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
	                	console.log(self.purchaseYn);
	                }                
	            })
		},
		handleFileChange(event) {
		     
		      this.selectedFile = event.target.files[0];
		    },
		fnReviewAdd : function(){
			var self = this;
			if(self.reviewText == ""){
				self.reviewCheck = true;
				self.changeTextareaStyle();
			}
			if(self.selectedRating ==0){
				self.reviewCsatCheck = true;
				self.changeCsatStyle();
			}
			if(self.reviewCheck){
				return;	
			}
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
	       	     	if(self.selectedFile != null){
	       	     		self.upload(form); 	       	     		
	       	     	}else{
	       	     		self.optionName = "";	       	     		
	       	     		self.reviewPrice = 0;
	       	     		self.selectedRating = 0;
	       	     		self.reviewText = "";
	       	     		self.showScrapModal = false;
		       	 		self.fnReview();
		       			self.fnReviewCnt();
		       			self.fnReviewUser();
		       			self.fnAvg();
	       	     	}
                }
            });
		},
		 upload : function(form){
	    	var self = this;
	         $.ajax({
	             url : "/reviewFileUpload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        		self.fnReview();
	       			self.fnReviewCnt();
	       			self.fnReviewUser();
	       			self.fnAvg();
	       			self.optionName = "";	       	     		
       	     		self.reviewPrice = 0;
       	     		self.selectedRating = 0;
       	     		self.reviewText = "";
       	     		self.showScrapModal = false;
	           }	           
	       });
		},
		changeCsatStyle() {
		      if (this.reviewCsatCheck) {		    	
		        this.reviewCsatClass = 'not-check-csat';
		      } else {
		        this.reviewCsatClass = 'review-csat';		        
		      }	
		},
		changeTextareaStyle() {
		      if (this.reviewCheck) {
		        this.reviewTextareaClass = 'not-check-textarea';
		        this.reviewTitleClass = 'not-check-title';
		      } else {
		        this.reviewTextareaClass = 'review-add-text';
		        this.reviewTitleClass = 'review-title';
		      }	
		},
		changeCategoryStyle() {
		      if (this.reviewCsatCheck) {		    	
		        this.reviewCsatClass = 'not-check-csat';
		      } else {
		        this.reviewCsatClass = 'review-csat';		        
		      }	
		},
		changeTextareaStyle1() {
		      if (this.reviewCheck) {
		        this.reviewTextareaClass = 'not-check-textarea';
		        this.reviewTitleClass = 'not-check-title';
		      } else {
		        this.reviewTextareaClass = 'review-add-text';
		        this.reviewTitleClass = 'review-title';
		      }	
		},
		reviewTextarea(){
			this.reviewCheck=false;
			this.changeTextareaStyle();
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
		openScrapModal2: function() {
		    var self = this;
		    self.showScrapModal2 = true;
		    },
		closeScrapModal: function() {
			var self = this;
			self.showScrapModal = false;
			self.selectedFile = null;
			},
		closeScrapModal2: function() {
			var self = this;
			self.showScrapModal2 = false;
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
			 this.reviewCsatCheck = false;
			 this.changeCsatStyle();
			 },
		clearHover() {
			 if (this.selectedRating === 0) {
			   this.hoveringRating = 0;
			    }
			 },
		updateCharacterCount() {
			 this.characterCount = this.reviewText.length;
			 this.characterCount = this.inquiryText.length;
			 },
		changeCategoryStyle(category) {
			// inquiryCategory 변수를 업데이트
			this.inquiryCategory = category;
			if(category =="상품"){
				this.privateCheck = false;
			}else{
				this.privateCheck = true;
			}
			// 선택된 요소의 active 클래스를 추가하고 나머지 요소의 active 클래스를 제거
			const boxes = document.querySelectorAll('.category-box');
			boxes.forEach(box => box.classList.remove('active'));
			event.target.classList.add('active');
			},
		privateInquiry(){
				var self = this;
				const checkbox = document.getElementById('openYnCheckbox');
			    self.openYn = checkbox.checked ? "N" : "Y";
			},
		inquiryAdd(){
				 var self = this;
				 if(self.inquiryText == ""){
					 self.changeTextareaStyle();
					 this.reviewCheck = true;
					 return;
				 }
				 if(self.inquiryOption == 0){
					 
				 }
		         var nparmap = {productNo : self.productNo, userNo : self.userNo, content : self.inquiryText, openYn : self.openYn, inquiryCategory : self.inquiryCategory, purchaseYn : self.purchaseYn, optionNo : self.inquiryOption};
		         $.ajax({
		             url : "/inquiryAdd.dox",
		             dataType:"json",	
		             type : "POST", 
		             data : nparmap,
		             success : function(data) {
		                alert(data.message);
		                self.fnGetInquiryList();
		        		self.fnGetInquiryListCnt();
		        		self.showScrapModal2=false;
		        		self.inquiryText = "";
		        		self.inquiryOption = 0;
		        		self.inquiryCategory = "상품";
		        		self.privateCheck = false;
		             }             
		            });
			},
			  
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
		self.changeCsatStyle();
		self.changeTextareaStyle();
		self.fnGetInquiryList();
		self.fnGetInquiryListCnt();
	}// created
});
</script>