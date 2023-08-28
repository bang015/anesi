<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/adminH.css" rel="stylesheet">
<link href="../css/admin_main.css" rel="stylesheet">
<meta charset="UTF-8">
<title>관리자센터</title>
<style>
</style>
</head>
<body>
	
	 <jsp:include page="adminH.jsp"></jsp:include>
	<div id="admin_first">
		<div class="delivery">
			<span>결제/배송/판매액</span>
			<hr>
			<i class="iconA fa-solid fa-truck cursor_pointer" @click="fnMoveDelivery"></i>
				<ul class="deliveryA">
					<li>결제완료</li>
					<li>배송중</li>
					<li>배송준비</li>
					<li>배송완료</li>
				</ul>
				<ul class="deliveryB" v-if="orderList[0] != undefined">
					<li>{{orderList[0].totalCount}}건</li>
					<li>{{orderList[1].totalCount}}건</li>
					<li>{{orderList[2].totalCount}}건</li>
					<li>{{orderList[3].totalCount}}건</li>
				</ul>
			<i class="iconA fa-solid fa-won-sign"></i>
				<ul class="deliveryC">
					
					<li>오늘판매금액</li>
					<li>누적판매금액</li>
					<li>오늘주문건수</li>
					<li>누적주문건수</li>
				</ul>
				<ul class="deliveryD" v-if="StatisticsInfo.overallToday != undefined">
					<li>{{numberWithCommas(StatisticsInfo.overallToday)}}원</li>
					<li>{{numberWithCommas(StatisticsInfo.overallTotal)}}원</li>
					<li>{{StatisticsInfo.todayOrders}}건</li>
					<li>{{StatisticsInfo.totalOrders}}건</li>
				</ul>
		
		</div>
		
		<div class="usedA">
			<span>중고상품현황</span>
			<hr>
    		<i class="iconA fa-solid fa-couch cursor_pointer" @click="fnMoveUsed()"></i>
				<ul class="usedB">
					<li>전체</li>
					<li>등록신청</li>
					<li>판매중</li>
					<li>매입거부</li>
				</ul>
				<ul class="usedC" v-if="usedList[1] != undefined">
					<li>{{usedList[1].adminCnt + usedList[2].adminCnt + usedList[0].adminCnt}}건</li>
					<li>{{usedList[1].adminCnt}}건</li>
					<li>{{usedList[2].adminCnt}}건</li>
					<li>{{usedList[0].adminCnt}}건</li>
				</ul>
			
		</div>
			<div class="review">
				<span>리뷰<span class="iTime">최근 1주일기준</span> <button @click="fnMoveReview" class="cursor_pointer review_button">전체 리뷰 보기 ></button></span>
				<hr>
				<i class="iconA fa-solid fa-comments"></i>
				<ul class="deliveryA">
					<li>전체리뷰</li>
					<li>새로 작성된 리뷰</li>
					<li>평점높은리뷰</li>
					<li>평점낮은리뷰</li>
				</ul>
				<ul class="deliveryB" style="width : 10%" >
					<li>{{reviewList.length}}건</li>
					<li>{{reviewCnt1}}건</li>
					<li>{{reviewCnt2}}건</li>
					<li>{{reviewCnt3}}건</li>
				</ul>
			
				<span class="revC">
					<div id="chart2">
				        <apexchart type="bar" height="150"  :options="chartOptions2" :series="series2" ></apexchart>
				    </div>
				</span>
			</div>
			
			<div class="product">
				<span>상품현황<span class="iTime">최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-chart-line"></i>				
				<ul class="productA">
					<li>판매중</li>
					<li>판매중지</li>
				</ul>
				<ul class="productB" v-if="productList[0]!= undefined">
					<li>{{productList[0].de}}건</li>
					<li>{{productList[1].de}}건</li>
				</ul>
				<ul class="productA">
					<li>품절</li>
					<li>할인중</li>
				</ul>
				<ul class="productB" v-if="productList[0]!= undefined">
					<li>{{productList[2].de}}건</li>
					<li>{{productList2[0].dis}}건</li>
				</ul>
				<div id="chart" >
			        <apexchart type="bar" height="270" :options="chartOptions" :series="series" ></apexchart>
		       </div>
		       
			</div>
			
			<div class="inquiry">
				<span class="inquiryTitle">미답변문의<span class="iTime">최근 1주일기준</span></span>
				<hr>
				<i class="iconA fa-solid fa-file-circle-exclamation cursor_pointer" @click="fnInquiry()" style="padding : 11px 20px;"></i>
				<ul class="inquiryA">
					<a class="inquiryB"  @click="fnInquiry(1)">상품/배송<span class="inquiryD">{{inquiryCnt1}}</span></a>
					<a class="inquiryB"  @click="fnInquiry(2)">환불/반품/교환<span class="inquiryD">{{inquiryCnt2}}</span></a>
					<a class="inquiryB" @click="fnInquiry(3)">기타<span class="inquiryD">{{inquiryCnt3}}</span></a>
				</ul>
				<div class="inquiryC_cont">
					<div class="inquiryC" v-for="inquiry in inquiryList">
						<span> <i class="fa-solid fa-circle-question" style="color:#5E503F;"></i> {{inquiry.content}}</span>
						<span class="iTime">{{inquiry.cDateTime}}</span>
					</div>
				</div>
				<button @click="fnMoveInquiry()" class="cursor_pointer">문의 관리></button>
			</div>
			
    	</div><!-- 컨테이너 end-->
	</div>
</body>
</html>

<script>
var app = new Vue({
	el : '#admin_first',
	components: {
      apexchart: VueApexCharts,
    },
	data : {
		list :[],
		orderList:[],
		reviewList:[],
		productList:[],
		productList2:[],
		inquiryList:[],
		usedList:[],
		inquiryCnt:[],
		reviewlow : 0,
		inquiry:"",
		review:"",
		inquiryCnt1:0,
		inquiryCnt2:0,
		inquiryCnt3:0,
		searchOption :"",
		reviewCnt1 : 0,
		reviewCnt2 : 0,
		reviewCnt3 : 0,
		StatisticsInfo : {},
		//상품차트
		productChart : [],
		series: [{
			name: [],
			data: []
		}],
      	chartOptions: {
        chart: {
          type: 'bar',
          height: 270,
          fontFamily: 'Pretendard-Regular'
         },
        plotOptions: {
          bar: {
            borderRadius: 4,
            horizontal: true,
          }
        },
        dataLabels: {
       	  enabled: true,
             offsetY: 0,
             style: {
               fontSize: '15px',
               colors: ["#304758"]
             }
           },
        xaxis: {
          categories: [],
        },
           colors:['#A782C3']
      	},
        //만족도차트
        csatChart : [],
        series2: [{
            name: '1점',
            data: []
          }, {
            name: '2',
            data: []
          }, {
            name: '3',
            data: []
          }, {
            name: '4',
            data: []
          }, {
            name: '5',
            data: []
          }],
         chartOptions2: {
        	 
       	 	
            chart: {
              type: 'bar',
              height: 350,
              stacked: true,
              stackType: '100%',
              fontFamily: 'Pretendard-Regular'

              
            },
            plotOptions: {
              bar: {
                horizontal: true,
              },
            },
            stroke: {
              width: 1,
              colors: ['#fff']
            },
           
            xaxis: {
              categories: ['리뷰평점비율'],
            },
            
            colors:['#b0a2bb','#A782C3','#834683','#6e4091','#3f2951',],
            
            tooltip: {
              y: {
                formatter: function (val) {
                  return val + "건"
                }
              }
            },
            fill: {
              opacity: 1
            
            },
            legend: {
              position: 'bottom',
              horizontalAlign: 'left',
              offsetX: 90
            }
          },
		
	},// data
	methods : {
		fnGetList(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/mainList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	//문의수
                	self.inquiryCnt = data.list.inquiryCnt;
                	self.inquiryCnt.forEach(item => {
                		if(item.inquiryCategory == '상품' || item.inquiryCategory == '배송' ){
                			self.inquiryCnt1 += item.inqCnt;
                		}else if(item.inquiryCategory == '환불' || item.inquiryCategory == '반품' || item.inquiryCategory == '교환'){
                			self.inquiryCnt2 += item.inqCnt;
                		}else{
                			self.inquiryCnt3 += item.inqCnt;
                		}
                	})
                	//결제,배송
                	self.orderList = data.list.order;
                	//중고물품개수 인덱스 0 : N(매입거부) , 1 : W(등록신청), 2 : Y(판매중)
                	self.usedList = data.list.used;
                	//판매물품개수 인덱스 0 : N(판매중) , 1 : S(판매중지), 2 : Y(판매종료)
                	self.productList = data.list.product1;
                	self.productList2 = data.list.product2;
                } 
			})
		},
		//문의리스트
		fnInquiry : function(searchOption){
			var self = this;
			var nparmap = {searchOption : searchOption};
			$.ajax({
                url : "/admin/mainInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.inquiryList = data.list;
                } 
			})
		},
		
		//리뷰리스트
		fnReview : function(searchOption){
			var self = this;
			var nparmap = {searchOption : searchOption};
			$.ajax({
                url : "/admin/mainReview.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.reviewList = data.list;
                	
                	const currentDate = new Date(); // 현재 시간
                	currentDate.setDate(currentDate.getDate() - 7); // 7일 전 시간
                	self.reviewList.forEach(item => {
	               	    const itemCreateDate = new Date(item.createDate);
	
	               	    if (itemCreateDate > currentDate) {
	               	        self.reviewCnt1++;
	               	    }
	               	 	if (item.csat > 3){
	               	    	self.reviewCnt2++;
	               	    }else {
	               	    	self.reviewCnt3++;
	               	    }
	               	});
                } 
			})
		},
		//판매량
		fnGetStatisticsProduct(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchStatisticsProduct.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.StatisticsInfo = data.info;
                } 
			})
		},
		//상품차트
		fnProductChart(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/productChart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.productChart = data.list;
                	var productData = self.productChart.map(item => ({
                        CategoryGroup: item.CategoryGroup,
                        TotalCount: item.TotalCount
                    }));
                	
               		 self.chartOptions = {
                       		xaxis : {
                      			categories : productData.map(item => item.CategoryGroup)
                       		}
                   	 }
               		self.series = {
                      	name : productData.map(item => item.CategoryGroup)
                   	 }
               		 
               		self.series = [{
                    	data : productData.map(item => item.TotalCount)
                    }]
               	
                	
                } 
			})
		},
		//만족도 차트
		fnCsatChart(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/csatChart.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.csatChart = data.list;
                	
                	var csatData = self.csatChart.map(item => ({
                        csatCount: item.csatCount
                    }));
                
                
                   self.series2 = [{
                	   name : '1',
                	   data : [csatData[0].csatCount]
                   },{
                	   name : '2',
                	   data : [csatData[1].csatCount]
                   },{
                	   name : '3',
                	   data : [csatData[2].csatCount]
                   },{
                	   name : '4',
                	   data : [csatData[3].csatCount]
                   },{
                	   name : '5',
                	   data : [csatData[4].csatCount]
                   }]; 
                	
                } 
			})
		},
		
		
		numberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
		fnMoveReview(){
			location.href="review.do";
		},
		fnMoveDelivery(){
			location.href="delivery.do";
		},
		fnMoveUsed(){
			location.href="used.do";
		},
		fnMoveInquiry(){
			location.href="inquiry.do";
		},
	
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		self.fnInquiry();
		self.fnReview();
		self.fnGetStatisticsProduct();
		self.fnProductChart();
		self.fnCsatChart();

	

	}// created
});
</script>