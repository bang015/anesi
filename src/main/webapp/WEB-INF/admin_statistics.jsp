<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../../css/adminH.css" rel="stylesheet">
<link href="../../css/admin_statistics.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.statistics{
	background: white;
	color: #5E503F;
	border-radius: 10px 0px 0px 10px;
}
</style>
</head>
<!-- 주석 꼭 남겨주세요 -->
<body>
	<jsp:include page="adminH.jsp"></jsp:include>
	<div id="app">
		<div id="container">
			<div class="containerTitle cursorPointer" @click="fnReload">판매 통계</div>
			<div class="containerstatistics">
				<div class="salesListBox" v-if="StatisticsInfo.overallToday != undefined">
					<div>
						<div class="salesTitle">오늘 판매금액</div>					
						<div>
							<span class="salesSpan">{{numberWithCommas(StatisticsInfo.overallToday)}}</span> 원
						</div>
					</div>
					<div>
						<div class="salesTitle">누적 판매금액</div>					
						<div>
							<span class="salesSpan">{{numberWithCommas(StatisticsInfo.overallTotal)}}</span> 원
						</div>

					</div>
					<div>
						<div class="salesTitle">오늘 주문건수</div>
						<div>
							<span class="salesSpan">{{numberWithCommas(StatisticsInfo.todayOrders)}}</span> 건
						</div>
					</div>
					<div>
						<div class="salesTitle">누적 주문건수</div>
						<div>
							<span class="salesSpan">{{numberWithCommas(StatisticsInfo.totalOrders)}}</span> 건
						</div>
					</div>
				</div>
			</div>
			<div class="containerWeeklySalesBox">
				<div id="chart">
			    	<apexchart type="bar" height="350" :options="chartOptions" :series="series"></apexchart>
			    </div>	
			</div>
		</div>
	</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
    components: {
        apexchart: VueApexCharts,
    },
	data : {
		StatisticsInfo : {},
		WeeklySalesList : [],
		series: [{
            name: '매출',
            data: []
          }],
          chartOptions: {
            chart: {
              height: 300,
              type: 'bar',
            },
            plotOptions: {
              bar: {
                borderRadius: 4,
                dataLabels: {
                  position: 'top', // top, center, bottom
                },
              }
            },
            dataLabels: {
              enabled: true,
              formatter: function (val) {
                return val + "원";
              },
              offsetY: -20,
              style: {
                fontSize: '12px',
                colors: ["#304758"]
              }
            },
            
            xaxis: {
              categories: [],
              position: 'top',
              axisBorder: {
                show: false
              },
              axisTicks: {
                show: false
              },
              crosshairs: {
                fill: {
                  type: 'gradient',
                  gradient: {
                    colorFrom: '#D8E3F0',
                    colorTo: '#BED1E6',
                    stops: [0, 100],
                    opacityFrom: 0.4,
                    opacityTo: 0.5,
                  }
                }
              },
              tooltip: {
                enabled: true,
              }
            },
            yaxis: {
              axisBorder: {
                show: false
              },
              axisTicks: {
                show: false,
              },
              labels: {
                show: false,
                formatter: function (val) {
                  return val + "원";
                }
              }
            
            },
            title: {
              text: '주간 매출 통계',
              floating: true,
              offsetY: 330,
              align: 'center',
              style: {
                color: '#444'
              }
            }
          },
	},// data
	methods : {
		fnReload(){
			location.reload();
		},
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
		numberWithCommas(number) {
            return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        },
        fnGetWeeklySales(){
			var self = this;
			var nparmap = {};
			$.ajax({
                url : "/admin/searchWeeklySales.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.WeeklySalesList = data.list;
                	console.log(self.WeeklySalesList);
                	var weeklyData = self.WeeklySalesList.map(item => ({
                        order_date: item.orderDate,
                        total_order_amount: item.totalOrderAmount
                    }));
                    self.chartOptions = {
                   		xaxis : {
                  			categories : weeklyData.map(item => item.order_date.substring(0,5)+'일')
                   		}
                 	};
                    self.series = [{
                    	data : weeklyData.map(item => item.total_order_amount)
                    }]
                    		
                } 
			})
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetStatisticsProduct();
		self.fnGetWeeklySales();
	}// created
});
</script>