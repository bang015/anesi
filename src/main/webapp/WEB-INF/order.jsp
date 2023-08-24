<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/order.css" rel="stylesheet">
<link href="../css/checkbox.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>결제 페이지</title>
<style>
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<h1 class="orTitle">주문/결제</h1>
			<div class="amount">
				<div class="payment">
					<div class="amountBox">
						<h2 class="moneyText">결제 금액</h2>
						<div>
							<div class="orNameText">총 상품 금액<span class="allMoneyText">{{numberWithCommas(totalProductAmount)}}원</span></div>
							<div class="orNameText">배송비<span class="allMoneyText">3,000원</span></div>
							<div class="orNameText">쿠폰 사용<span class="allMoneyText">{{numberWithCommas(discount)}}원</span></div>
						</div>
						<div class="FinalPaymentAmount">최종 결제 금액<span class="allMoneyText"><span>{{numberWithCommas(finalAmount+deliveryfee+discount)}}</span> 원</span></div>
					</div>
					<div class="orTerms">
						<div class="allTerms">
							<div class="custom-checkbox" @click="fnAllCheck" :class="checkAm.length == 2 ? 'checked' : ''">
					            <div class="checkbox-icon">
					              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
					            </div>
							</div>
							<span>아래 내용에 모두 동의합니다.(필수)</span>
							<div class="err">{{errMsg}}</div>
						</div>
						<div class="orAgreement">
							<div class="agreementBox">
								<div class="textBox">
									<div class="custom-checkbox1" :class="{ 'checked': checkAm.includes('privacy') }" @click="fnInsertCheckAm('privacy')">
							            <div class="checkbox-icon" :class="flg ? 'checked' : ''">
							              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
							            </div>
									</div>
									<input type="checkbox" v-model="checkAm" value="privacy">
									<span>개인정보 수집 이용 및 제 3자 제공 동의 (필수)</span>
								</div>
								<div class="textBox">
									<div class="custom-checkbox1" :class="{ 'checked': checkAm.includes('paymentAgent') }" @click="fnInsertCheckAm('paymentAgent')">
							            <div class="checkbox-icon" :class=" flg ? 'checked' : ''">
							              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
							            </div>
									</div>
									<input type="checkbox" v-model="checkAm" value="paymentAgent">
									<span>결제대행 서비스의 이용약관 동의 (필수)</span>
								</div>	
							</div>						
						</div>
					</div>
				</div>
				<button class="orBtuStyle" @click="fnOrder">{{finalAmount}}원 결제하기</button>
			</div>
			<div class="orInformation">
				<div class="subheading">주문자</div>
				<div class="orderer">
					<label>
					    <span :class="!flgName ? '' : 'orRed'">이름</span>
					    <div class="orInputBox">
					        <input v-model="order.name" @input="fnCheck('name')" :class="!flgName ? '' : 'orRed'">
					    </div>
					</label>
					<label>
					    <span :class="!flgEmail1 ? '' : 'orRed'">이메일</span>
					    <div class="orInputBox">
					        <input v-model="order.email1" placeholder="이메일" @input="fnCheck('email1')" :class="!flgEmail1 ? '' : 'orRed'"> @
					    </div>
					    <div class="orInputBox">
					        <select v-model="order.email2" class="email2" ref="emailInput2" @change="fnCheck('email2')" :class="!flgEmail2 ? '' : 'orRed'">
					            <option value="">선택해주세요.</option>
					            <option value="naver.com">naver.com</option>
					            <option value="hanmail.net">hanmail.net</option>
					            <option value="daum.net">daum.net</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="nate.com">nate.com</option>
					            <option value="hotmail.com">hotmail.com</option>
					            <option value="icloud.com">icloud.com</option>
					        </select>
					    </div>
					</label>
					<label>
					    <span :class="!flgPhone ? '' : 'orRed'">휴대전화</span>
					    <div class="orSelectBox">
					        <select v-model="order.phone1">
					            <option value="010">010</option>
					            <option value="011">011</option>
					            <option value="016">016</option>
					            <option value="017">017</option>
					            <option value="018">018</option>
					            <option value="019">019</option>
					        </select>
					    </div>
					    <div class="orInputBox">
					        <input v-model="order.phone2" placeholder="입력해주세요" @input="fnCheck('phone')" :class="!flgPhone ? '' : 'orRed'">
					    </div>
					</label>
				</div>
				<div class="subheading address">배송지<span class="sameButton" @click="fnSameVal">위와 동일하게 채우기</span></div>
				<div class="addr">
					<label>
					    <div class="orInputBox3" v-if="userNo != ''">
					        <select @change="fnAddrChange" v-model="defaule">
					        	<option v-for="item in addrList" :value="item.defaultYn">{{item.addrKind}} : {{item.addr}}</option>
					        	<option> 직접입력 </option>
					        </select>
					    </div>
					</label>
					<label>
					    <span :class="!flgAddrName ? '' : 'orRed'">배송지명</span>
					    <div class="orInputBox">
					        <input v-model="addr.addrName" @input="fnCheck('addrName')" :class="!flgAddrName ? '' : 'orRed'">
					    </div>
					</label>
					<label>
					    <span :class="!flgAdName ? '' : 'orRed'">받는 사람</span>
					    <div class="orInputBox">
					        <input v-model="addr.name" @input="fnCheck('adName')" :class="!flgAdName ? '' : 'orRed'">
					    </div>
					</label>
					<label>
					    <span :class="!flgAdPhone ? '' : 'orRed'">휴대전화</span>
					    <div class="orSelectBox">
					        <select v-model="addr.phone1">
					            <option value="010">010</option>
					            <option value="011">011</option>
					            <option value="016">016</option>
					            <option value="017">017</option>
					            <option value="018">018</option>
					            <option value="019">019</option>
					        </select>
					    </div>
					    <div class="orInputBox">
					        <input v-model="addr.phone2" placeholder="입력해주세요" @input="fnCheck('adPhone')" :class="!flgAdPhone ? '' : 'orRed'">
					    </div>
					</label>
					<label>
						<span :class="!flgAddr ? '' : 'orRed'">주소</span>
						<button class="addrButton" @click="openAddressSearch">주소찾기</button>
						<div class="orInputBox">
					        <input v-model="addr.zip" readonly class="inpRead" :class="!flgAddr ? '' : 'orRed'">
					    </div>
					</label>
					<label>
						<div class="orInputBox addr2">
					        <input v-model="addr.addr1" readonly class="inpRead" :class="!flgAddr ? '' : 'orRed'">
					    </div>
					</label>
					<label>
						<div class="orInputBox addr2">
					        <input v-model="addr.addr2" placeholder="상세주소 입력" :class="!flgAddr ? '' : 'orRed'">
					    </div>
					</label>
					<div class='addr3' v-if="userNo != ''">
						<div class="custom-checkbox1" :class="{ 'checked': addr.addrDefault == 'Y' }" @click="fnDefaultAddr">
				            <div class="checkbox-icon" :class="flg ? 'checked' : ''">
				              	<i class="fa-solid fa-check fa-2xs" style="color: #ffffff;"></i>
				            </div>
						</div>
						<span class="defaultAddrText">기본 배송지로 저장</span>
					</div>
					<div>
						<section class="sectionSelect">
						    <select v-model="addr.deliveryRq" class="orSelectBox2">
						    	<option value="0">배송시 요청사항을 선택해주세요</option> 
						        <option value="1">부재시 문앞에 놓아주세요</option>
						        <option value="2">부재시 경비실에 맡겨주세요</option>
						        <option value="3">부재시 집 앞에 놓아주세요</option>
						        <option value="4">배송 전에 연락주세요</option>
						        <option value="5">직접 입력</option>
						    </select>
						    <input type="text" v-if="addr.deliveryRq == '5'" v-model="addr.customDeliveryRq" class="orSelectBox2">
						</section>
					</div>
				</div>
				<div class="orProductList">
					<div class="subheading">주문상품 <span class="text">1건</span></div>
					<div>
						<div class="orProduct" v-for="item in productList">
							<img alt="" :src="item.path+'/'+item.imgName">
							<div>
								<div class="prProductName">{{item.productName}}</div>
								<div class="prProductOption">{{item.optionName}}</div>
								<div class="prProductPrice">{{numberWithCommas(item.productPrice)}}원 <span>| {{item.cnt}}개</span></div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="subheading address">장바구니 쿠폰
						<span class="text2" v-if="couponList.length == 0">사용 가능한 쿠폰이 없습니다.</span>
					</div>
					<div>
						<div v-for="item in couponList" class="orCoupon el-radio">
							<input type="radio" v-model="order.couponNo" name="coupon" :value="item.couponNo" :id="item.couponNo" @change="fnCouponApply">
							<label class="el-radio-style" :for="item.couponNo"></label>
							<div>
								<div class="coupon1">
									<span v-if="item.disFlg=='A'">{{item.discount}}원 할인</span>
									<span v-else>{{item.discount}}% 할인</span>
								</div>
								<div>{{item.couponName}}<span v-if="item.maxDi != '0'" class="coupon2">(최대 {{item.maxDi}}원 할인)</span></div>
							</div>
						</div>
						<div class="orCoupon  el-radio" v-if="couponList.length != 0">
							<input type="radio" v-model="order.couponNo" name="coupon" value="" id="nonCoupon" @change="fnCouponApply">
							<label class="el-radio-style" for="nonCoupon"></label>
							<div class="coupon1">
								<span>적용 안 함</span>
							</div>
						</div>
					</div>	
				</div>
				<div>
					<div class="subheading address">결제 수단</div>
					<div class="paymentS">
						<button @click="fnChangepayment('card')" class="orBtn cardBtn" :class="{onpayment : payment == 'html5_inicis'}">
							<div>
								<div class="card">카드</div>
								<div><i class="fa-regular fa-credit-card fa-2xl"></i></div>
							</div>
						</button>
						<button @click="fnChangepayment('kakao')" class="orBtn" :class="{onpayment_right : payment == 'html5_inicis', onpayment : payment == 'kakaopay.TC0ONETIME'}"> 
							<div>
								<div>카카오페이</div>
								<div><img alt="" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_kakaopay.png?w=144&h=144&c=c" class="btnImg"></div>
							</div>
						</button>
						<button @click="fnChangepayment('toss')" class="orBtn" :class="{onpayment_right : payment == 'kakaopay.TC0ONETIME', onpayment : payment == 'tosspay'}">
							<div>
								<div>토스</div>
								<div><img alt="" src="https://image.ohou.se/i/bucketplace-v2-development/pg/img_toss_v2.png?w=144&h=144&c=c" class="btnImg"></div>
							</div>
						</button>
					</div>
				</div>
			<div class="modal noneDisplay" v-if="showScrapModal" :class="{'showDisplay' : showScrapModal}">
		        <div class="modal-card">
		        	<div class="modalStyle1">주문완료</div>
		        	<div class="modalStyle2">
		        		<div class="modalStyle4">결제정보</div>
		        		<div class="modalStyle3">
		        			<div>상품이름 : {{productList[0].productName}}</div>
		        			<div>결제금액 : {{finalAmount}}원</div>
		        		</div>
		        	</div>
		        	<div class="modalStyle2">
		        		<div class="modalStyle4">주문번호</div>
		        		<div class="modalStyle3">{{"ORD"+formatDate(new Date())+"-"+cnt}}</div>
		        	</div>
		        	<div class="modalStyle2">
		        		<div class="modalStyle4">배송지</div>
		        		<div class="modalStyle3">
		        			<div>{{addr.name}}</div>
		        			<div>{{addr.phone1 +addr.phone2}}</div>
		        			<div>{{addr.addr1}}</div>
		        			<div>{{addr.addr2}}</div>
		        			<div>({{addr.zip}})</div>
		        		</div>
		        	</div>
		        	<div class="modalStyle2">
		        		<div class="modalStyle4">배송 방법</div>
		        		<div class="modalStyle3">택배</div>
		        	</div>
		        	<div class="modalStyle2">
		        		<div>배송 요청사항</div>
		        		<div class="modalStyle3">{{request}}</div>
		        	</div>
		        	<div class="modalButBox">
		        		<button class="modalBut" onclick="location.href='../main.do'">메인페이지</button>
		        		<button class="modalBut2" onclick="location.href='../mypage/myShopping.do'">나의 쇼핑</button>
		        	</div>
		        </div>
		        
		      </div>
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
		totalProductAmount : 0,
		finalAmount : 0,
		productNoList : ${map.product},
		productList : [],
		order : {
			name : "",
			email1 : "",
			email2 : "",
			phone1 : "010",
			phone2 : "",
			couponNo : "", 
			addrNo : ""
		},
		addr : {
			userNo : '${sessionNo}',
			name : "",
			addrName : "",
			phone1 : "010",
			phone2 : "",
			addr1 : "",
			addr2 : "",
			zip : "",
			addrDefault : 'N',
			deliveryRq : "0",
			customDeliveryRq : "",
			nonUserNo : ''
		},
		flgName: '',
		flgEmail1: '',	
		flgEmail2: '',
		flgPhone: '',
		flgAddrName: '',
		flgAdName: '',
		flgAdPhone : '',
		flgAddr : '',
		checkAm : [],
		flg : false,
		userNo : '${sessionNo}',
		couponList : [],
		errMsg : "",
		addrList : [],
		addrAdd : false,
		defaule : 'Y',
		discount : 0,
		cnt : 0,
		deliveryfee : 3000,
		payment : '',
		showScrapModal : false,
		request : ''
	},// data
	methods : {
		fnAllCheck(){
			var self =this;
			if(self.checkAm.length == 2){
				self.checkAm = [];
			} else{
				self.checkAm = ['privacy', 'paymentAgent'];
			}
		},
		fnInsertCheckAm(text){
			var self = this;
			if(self.checkAm.length == 0){
				self.checkAm.push(text);
				return;
			}
			for(let i=0; i< self.checkAm.length; i++){
				if(self.checkAm[i] == text){
					self.checkAm.splice(i, 1);
					return;
				}
				if(i == (self.checkAm.length-1)){
					self.checkAm.push(text);
					return;
				}
			}
		},
		fnCheck(text) {
		    var self = this;
		    if (text === 'name') {
		        if (self.order[text].trim() === '' || self.order[text] !== self.order[text].trim()) {
		            self.flgName = true;
		        } else {
		            self.flgName = false;
		        }
		    }
		    const regex = /^[a-z0-9]+$/;
		    if (text === 'email1') {
		        if (self.order.email1.trim() === '' || self.order.email1 !== self.order.email1.trim()) {
		            self.flgEmail1 = true;
		        } else if(!regex.test(self.order.email1)){
		        	 self.flgEmail1 = true;
		        } else {
		            self.flgEmail1 = false;
		        }
		    }
		    if (text === 'email2') {
		        if (self.order[text].trim() === '' || self.order[text] !== self.order[text].trim()) {
		            self.flgEmail2 = true;
		        } else {
		            self.flgEmail2 = false;
		        }
		    }
		    const regex1 = /^[0-9]+$/;
		    if (text === 'phone') {
		        if (self.order.phone2.trim() === '' || self.order.phone2 !== self.order.phone2.trim()) {
		            self.flgPhone = true;
		        }else if(!regex1.test(self.order.phone2)){
		        	 self.flgPhone = true;
		        } else {
		            self.flgPhone = false;
		        }
		    }
		    if (text === 'addrName') {
		        if (self.addr.addrName.trim() === '' || self.addr.addrName !== self.addr.addrName.trim()) {
		            self.flgAddrName = true;
		        } else {
		            self.flgAddrName = false;
		        }
		    }
		    if (text === 'adName') {
		        if (self.addr.name.trim() === '' || self.addr.name !== self.addr.name.trim()) {
		            self.flgAdName = true;
		        } else {
		            self.flgAdName = false;
		        }
		    }
		    if (text === 'adPhone') {
		        if (self.addr.phone2.trim() === '' || self.addr.phone2 !== self.addr.phone2.trim()) {
		            self.flgAdPhone = true;
		        } else {
		            self.flgAdPhone = false;
		        }
		    }
		    if (text === 'addr') {
		        if (self.addr.zip.trim() === '') {
		            self.flgAddr = true;
		        } else {
		            self.flgAddr = false;
		        }
		    }
		},
		  fnSameVal(){
			  var self = this;
			  self.addr.name = self.order.name;
			  self.addr.phone1 = self.order.phone1;
			  self.addr.phone2 = self.order.phone2;
		  },
		  openAddressSearch() {
		      var option = "width=500,height=500,top=100,left=200,location=no";
		      window.open("../addr.do", "test", option);
		      this.fnCheck('addr');
		    },
		    handleAddressCallback(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		      this.addr.addr1 = roadAddrPart1 + roadAddrPart2;
		      this.addr.addr2 = addrDetail;
			  this.addr.zip = zipNo;
			  this.fnCheck('addr');
			  this.addrAdd = true;
		    },
		    fnDefaultAddr(){
		    	var self = this;
		    	if(self.addr.addrDefault == 'N'){
		    		self.addr.addrDefault = 'Y'
		    	} else {
		    		self.addr.addrDefault = 'N'
		    	}
		    },
		    fnDeliveryRq(){
		    	var self = this;
		    	if(self.addr.deliveryRq == '5'){
		    		
		    	}
		    },
		    fnGetCoupon(){
		    	var self = this;
		    	if(self.userNo == ''){
		    		return;
		    	}
				var nparmap = {userNo : self.userNo};
	            $.ajax({
	                url : "../order/getCoupon.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
						self.couponList = data.list;
	                }
	            });
		    },
		    fnOrder(){
		    	var self = this;
		    	self.fnCheck('name');
		    	self.fnCheck('email1');
		    	self.fnCheck('email2');
		    	self.fnCheck('phone');
		    	if(self.flgName || self.flgEmail1 || self.flgEmail2 || self.flgPhone){
		    		window.scrollTo({
		    	        top: 0,
		    	        behavior: "smooth"
		    	      });
		    		return;
		    	}
		    	self.fnCheck('addrName');
		    	self.fnCheck('adName');
		    	self.fnCheck('adPhone');
		    	self.fnCheck('addr');
		    	if(self.flgAddrName || self.flgAdName || self.flgAdPhone || self.flgAddr){
		    		window.scrollTo({
		    	        top: 300,
		    	        behavior: "smooth"
		    	      });
		    		return;
		    	}
		    	if(self.checkAm.length != 2){
		    		self.errMsg = "결제 진행 필수사항을 동의해주세요";
		    		return;
		    	}
		    	self.errMsg = '';
		    	if(self.addrAdd){
			    	var nparmap = self.addr;
		            $.ajax({
		                url : "../order/addAddr.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
		                	self.order.addrNo = data.no;
		                	self.fnOrrder2();
		                }
		            });
		           
		    	} else{
		    		if(self.addr.addrDefault == 'Y'){
		    			var nparmap = {addrNo : self.order.addrNo, userNo : self.userNo};
		    			 $.ajax({
				                url : "../order/editAddr.dox",
				                dataType:"json",	
				                type : "POST", 
				                data : nparmap,
				                success : function(data) {
				                	
				                }
		    			 });
			    	}
		    		self.fnOrrder2();
		    	}
		    },
		    fnOrrder2(){
		    	var self = this;
		    	var orderEmail = self.order.email1 +'@'+ self.order.email2
		    	var orderPhone = self.order.phone1 + self.order.phone2;
		    	var receiptPhone = self.addr.phone1 + self.addr.phone2;
		    	self.request = '';
		    	switch (self.addr.deliveryRq) {
			        case '1':
			            request = '부재시 문앞에 놓아주세요';
			            break;
			        case '2':
			            request = '부재시 경비실에 맡겨주세요';
			            break;
			        case '3':
			            request = '부재시 집 앞에 놓아주세요';
			            break;
			        case '4':
			            request = '배송 전에 연락주세요';
			            break;
			        case '5':
			            request = self.addr.customDeliveryRq;
			            break;
			        default:
			            request = '';
		   		 }
		    	self.finalAmount = self.finalAmount+self.deliveryfee+self.discount
		    	var productName = '';
		    	if(self.productNoList.length > 1){
		    		productName = self.productList[0].productName+"등 "+self.productNoList.length+"개";
		    	} else{
		    		productName = self.productList[0].productName;
		    	}
	              IMP.request_pay({ // param
	              pg: self.payment, //kakaopay.TC0ONETIME
	              pay_method: "card",
	              merchant_uid: "ORD"+self.formatDate(new Date())+"-"+self.cnt,
	              name: productName,
	              amount: self.finalAmount,
	              buyer_email: orderEmail,
	              buyer_name: self.order.name,
	              buyer_tel: receiptPhone,
	              buyer_addr: self.addr.addr1,
	              buyer_postcode: "01181"
	            }, rsp => { // callback
	              if (rsp.success && rsp.paid_amount == self.finalAmount) {
	            	  
	            	  for(let i=0;i < self.productNoList.length;i++){
	            	  	 var nparmap = {productNo : self.productNoList[i].productNo, optionNo : self.productNoList[i].optionNo, userNo : self.userNo, addrNo : self.order.addrNo, request : self.request, orderPrice : self.finalAmount, orderName : self.order.name, orderEmail : orderEmail, orderPhone : orderPhone, receiptName : self.addr.name, receiptPhone : receiptPhone, cnt : self.productNoList[i].quantity, paymentNo : "ORD"+self.formatDate(new Date())+"-"+self.cnt, nonUserNo : self.addr.nonUserNo};
		 		    	 $.ajax({
		 		                url : "../order/order.dox",
		 		                dataType:"json",	
		 		                type : "POST", 
		 		                data : nparmap,
		 		                success : function(data) {
		 		                	
		 		                	if(self.order.couponNo != ''){
		 		                		var nparmap = {couponNo : self.order.couponNo};
		 		                		 $.ajax({
		 		     		                url : "../order/couponRemove.dox",
		 		     		                dataType:"json",	
		 		     		                type : "POST", 
		 		     		                data : nparmap,
		 		     		                success : function(data) {
		 		     		                }
		 		                		 });
		 		                	}
		 		                	var nparmap = {optionNo : self.productNoList[i].optionNo, cnt : self.productNoList[i].quantity};
	 		                		 $.ajax({
	 		     		                url : "../order/optionStock.dox",
	 		     		                dataType:"json",	
	 		     		                type : "POST", 
	 		     		                data : nparmap,
	 		     		                success : function(data) {
	 		     		                }
	 		                		 });
		 		                }
		 		    	 });
	            	  }
	            	  self.openScrapModal();
	            	  
	              } else {
	                // 결제 실패 시 로직,
	            	  self.finalAmount = self.finalAmount-self.deliveryfee-self.discount;
	              }
	            });
		    	
		    },
		    fnGetAddrList(){
		    	var self = this;
		    	if(self.user == ''){
		    		return;
		    	}
		    	var nparmap = {userNo : self.userNo};
	            $.ajax({
	                url : "../order/searchAddr.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
						self.addrList = data.list;
						for(let i = 0; i < self.addrList.length; i++){
							if(self.addrList[i].defaultYn == 'Y'){
								self.addr.addrName= self.addrList[i].addrKind;
								self.addr.addr1= self.addrList[i].addr;
								self.addr.addr2= self.addrList[i].addr2;
								self.addr.zip= self.addrList[i].zipcode;
								self.order.addrNo = self.addrList[i].addrNo;
								self.addr.addrDefault = 'Y';
							}
						}
	                }
	            });
		    },
		    fnAddrChange(event){
		    	var self = this;
		    	self.addr.addrDefault = 'N';
		    	 const selectedIndex = event.target.selectedIndex;
		    	 const selectedItem = self.addrList[selectedIndex];
		    	 if(selectedItem == undefined){
		    		 	self.addr.addrName= '';
						self.addr.addr1= '';
						self.addr.addr2= '';
						self.addr.zip= '';
						self.order.addrNo = '';
						self.addrAdd = true;
						return;
		    	 }
	    	 	self.addr.addrName= selectedItem.addrKind;
				self.addr.addr1= selectedItem.addr;
				self.addr.addr2= selectedItem.addr2;
				self.addr.zip= selectedItem.zipcode;
				self.order.addrNo = selectedItem.addrNo;
				self.addrAdd = false;
		    },
		    fnGetProduct(){
		    	var self = this;
		    	for(let i = 0; i < self.productNoList.length; i++){
					var nparmap = {productNo : self.productNoList[i].productNo};
		            $.ajax({
		                url : "../productSearch.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
		                	let productName1 = data.product.productName;
		                	let productPrice1 = data.product.productPrice;
		                	let optionName1 = '';
		                	
		                	if(data.product.discountYn == 'Y'){
		                		productPrice1 = Math.floor( (productPrice1*((100-data.product.discount)/100)) / 100) * 100;
		                	}
		                	
							var nparmap = {optionNo : self.productNoList[i].optionNo};	
				            $.ajax({
				                url : "../order/optionSearchInfo.dox",
				                dataType:"json",	
				                type : "POST", 
				                data : nparmap,
				                success : function(data) {
				                	self.addr.nonUserNo = data.cookie;
				                	self.fnCntOrder();
				                	productPrice1 = productPrice1 + data.info.optionPrice;
				                	optionName1 = data.info.optionName;
						            self.productList.push({productName : productName1, productPrice : (productPrice1*self.productNoList[i].quantity), optionName : optionName1, cnt : self.productNoList[i].quantity, path : data.info.imgPath, imgName : data.info.imgName});
						            self.finalAmount = self.finalAmount + (productPrice1*self.productNoList[i].quantity);
						            self.totalProductAmount = self.totalProductAmount + (productPrice1*self.productNoList[i].quantity);
				                }
				            });
				            
		                }
		            
		            });
		    	}
		    	
		    },
		    fnCouponApply(){
		    	var self = this
		    	for(let i=0;i<self.couponList.length;i++){
		    		if(self.order.couponNo == ''){
	     	           self.discount = 0;
	     	            return;
		    		}
		    		if(self.couponList[i].couponNo == self.order.couponNo){
		    			if(self.couponList[i].disFlg == 'A'){
		    				self.discount = -self.couponList[i].discount;
		    			} else{
		    				
		    				self.discount = -(self.totalProductAmount * (self.couponList[i].discount/100));
		    				self.discount = Math.floor(self.discount / 10) * 10
		    			}
		    		}
		    	}
		    },
		    formatDate(date) {
		        const year = date.getFullYear();
		        const month = String(date.getMonth() + 1).padStart(2, '0');
		        const day = String(date.getDate()).padStart(2, '0');
		        const result = this.fngenerateRandomString();
		        return result+""+year+""+month+""+day;
		      },
      		fngenerateRandomString(){
		    	  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		    	    let result = '';

		    	    for (let i = 0; i < 5; i++) {
		    	        const randomIndex = Math.floor(Math.random() * characters.length);
		    	        result += characters.charAt(randomIndex);
		    	    }

		    	    return result;
	    	  },
		      fnCntOrder(){
		    	  var self = this;
					var nparmap = {userNo : self.userNo};
		            $.ajax({
		                url : "../order/cntOrder.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
		                	self.cnt = data.cnt+1;
		                }
		            });
		      },
		      fnChangepayment(type){
		    	  var self = this;
		    	  if(type == 'card'){
		    		  self.payment = 'html5_inicis';
		    	  } else if(type == 'kakao'){
		    		  self.payment = 'kakaopay.TC0ONETIME';
		    	  } else if(type == 'toss'){
		    		  self.payment = 'tosspay';
		    	  }
		      },
		   // 모달열기
	      openScrapModal: function() {
	               var self = this;
	               self.showScrapModal = true;
	            },

	      // 모달 닫기
	            closeModal: function() {
	              this.showCartModal = false;
	              this.showScrapModal = false;
	              this.showScrapModalBan = false;
	              this.showScrapDeleteModal = false;
	           
	              location.reload();

	            },
	            numberWithCommas(number) {
	                return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	            },
	            
	}, // methods
	created : function() {
		var self = this;
		self.fnGetCoupon();
		self.fnGetAddrList();
		self.fnGetProduct();
		var IMP = window.IMP;
		IMP.init('imp41836047');
		window.jusoCallBack = self.handleAddressCallback;
	}// created
});
</script>