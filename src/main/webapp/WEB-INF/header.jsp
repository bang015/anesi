<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!--자동검색기능  -->
<meta charset="EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">

<link href="../css/Header.css" rel="stylesheet">
<link href="../css/mainCss.css" rel="stylesheet">

<style>
/* 드롭다운 메뉴를 오른쪽 정렬 */
</style>
</head>
<body>
<% 
    boolean isLoggedIn = false;
    Object sessionNo = session.getAttribute("sessionNo");
    if (sessionNo != null) {
        isLoggedIn = true;
    }
%>

	<header>
		<span> <a href="/main.do"><img class="logo"
				src="../css/image/anesilogo.png" /> </a></span> <a class="aaa"
			href="/product/storemain.do">스토어</a> <a class="bbb"
			href="/community/main.do">커뮤니티</a> <a class="ccc" href="javascript:;">중고장터</a>

		<ul id="header_navi">
			<li id="login-button"><a href="#" id="login-button-link"><i class="fa-solid fa-door-open"></i></a><span
				class="fon" id="login-button-text"></span></li>
			<li><a href="../join.do"><i class="fa-solid fa-user-plus "></i></a><span
				class="fon">회원가입</span></li>
			<li><a href="../mypage.do"><i class="fa-solid fa-user "></i></a><span
				class="fon">마이페이지</span></li>
			<li><a href="http://localhost:8080/scrapbook.do"><i class="fa-solid fa-bookmark "></i></a><span></span></li>
			<li><a><i class="fa-solid fa-bell "></i></a><span></span></li>
			<li><a href="../product/cart.do"><i
					class="fa fa-shopping-cart "></i></a><span></span></li>
			<li><a href="" class="headerbtn" title="Button fade blue/green"
				class="button btnFade btnBlueGreen">Fade</a></li>
		</ul>
		<hr>
		<span>
			<button class="category-toggle">
				<span> <i class="fa-solid fa-grip-lines"></i>카테고리 
			</button> <span class="headerfont"> <a class="href">추천 </a> <a
				class="href">랭킹</a> <a class="href">특가</a> <a class="href">기획전</a> <a
				class="href">브랜드관</a>
		</span> <span>
	<div class="search-container">
  <input type="text" id="search_input" placeholder="제품명을 입력하세요">
  <a id="glass" class="glass"><i class="fa-solid fa-magnifying-glass"></i></a>
  <div id="recent_search" class="recent-search-container" style="display: none;"></div>
</div>

		</span>
		</span>

		<hr>

		<div class="category-list-container" style="display: none;">
			<ul class="category-list">

				<li><a onclick="fnMoveaa('10')">가구</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">침대</a></li>
						<li><a class="category-link">소파</a></li>
						<li><a class="category-link">수납장</a></li>
						<li><a class="category-link">의자</a></li>
						<li><a class="category-link">식탁</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('20')">조명</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">장스텐드</a></li>
						<li><a class="category-link">단스탠드</a></li>
						<li><a class="category-link">무드등</a></li>
						<li><a class="category-link">천장등</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('30')">패브릭</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">침구</a></li>
						<li><a class="category-link">커튼</a></li>
						<li><a class="category-link">러그</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('40')">가전</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">냉장고</a></li>
						<li><a class="category-link">tv</a></li>
						<li><a class="category-link">세탁기</a></li>
						<li><a class="category-link">음향/영상가전</a></li>
						<li><a class="category-link">청소가전</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('50')">데코/식물</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">조화</a></li>
						<li><a class="category-link">꽃다발</a></li>
						<li><a class="category-link">화병</a></li>
						<li><a class="category-link">그림 액자</a></li>
						<li><a class="category-link">캔들 디퓨저</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('60')">반려동물</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a class="category-link">하우스/방석</a></li>
						<li><a class="category-link">캣타워/스크래쳐</a></li>
						<li><a class="category-link">안전문/울타리</a></li>
						<li><a class="category-link">밥그릇/급식기</a></li>
						<li><a class="category-link">위생용품</a></li>
					</ul></li>
			</ul>
		</div>
	</header>
	<script>
	   var isLoggedIn = <%= isLoggedIn %>;
	    console.log('isLoggedIn:', isLoggedIn);

	    console.log('sessionNo:', '<%= sessionNo %>');

	    $(document).ready(function() {
	    	  $(".subcategory-list > li > a").click(function() {
	    	    // 클릭된 a 요소의 부모 li 요소와 그의 부모 li 요소인 대분류 a 요소에서 데이터를 가져옵니다.
	    	    var $parent_li = $(this).closest("li");
	    	    var $category_a = $parent_li.parents(".category-list > li").find("> a");
	    	    var category_no = $category_a.data("category-no");
	    	    var category_name = $category_a.data("category-name");
	    	    var subcategory_name = $(this).text();
	    	    loadSubcategoryProducts(category_no, category_name, subcategory_name);
	    	  });
	    	});
	function saveRecentSearch(search) {
		  if (!search) return;

		  // 검색어 기록을 가져옵니다.
		  var recentSearches = JSON.parse(localStorage.getItem("recentSearches")) || [];
		  
		  
		  // 동일한 검색어가 있는지 확인하고, 있다면 제거합니다.
		  var index = recentSearches.indexOf(search);
		  if (index > -1) recentSearches.splice(index, 1);

		  // 최근 검색어 기록에 새로운 검색어를 추가합니다.
		  recentSearches.unshift(search);
		  
		  // 최근 검색어 목록을 최대 10개로 유지합니다.
		  recentSearches = recentSearches.slice(0, 6);

		  // 변경된 검색어 기록을 저장합니다.
		  localStorage.setItem("recentSearches", JSON.stringify(recentSearches));
		  
		  // 화면에 변경된 검색어 기록을 표시합니다.
		  showRecentSearches();
		}
	function showRecentSearches() {
		  // localStorage에서 최근 검색어를 가져옵니다.
		  var recentSearches = JSON.parse(localStorage.getItem("recentSearches")) || [];

		  // 최근 검색어 목록을 비웁니다.
		  $('#recent_search').empty();
			
		  if (recentSearches.length === 0) {
			    // 최근 검색어가 없다면 메시지를 출력합니다.
			    var message = $('<li>').text('최근 검색어가 없습니다.');
			    $('#recent_search').append(message);
			  } else {
		  // 목록을 순회하며 화면에 최근 검색어를 추가합니다.
		  for (var i = 0; i < recentSearches.length; i++) {
		    var search = recentSearches[i];
		    var li = $('<li class="recent-search-item"></li>').text(search);
		    var deleteIcon = $('<i class="fa-solid fa-xmark"></i>');
		    li.append(deleteIcon);
		    $('#recent_search').append(li);
		  }
			  }
		}
		$('#search_input').focus(function() {
			  $('#recent_search').show();
			});

			$('#search_input').blur(function() {
			  setTimeout(function() {
			    $('#recent_search').hide();
			  }, 200);
			});
		
		$(document).ready(function() {
			  showRecentSearches();
			});
		$('body').on('click', '.recent-search-item', function() {
			  var search = $(this).text();
			  $('#search_input').val(search);
			  searchProduct(search);
			});
		$('body').on('click', '.recent-search-item .fa-xmark', function() {
			$(document).ready(function(){
		        var isLoggedIn = <%= isLoggedIn %>; // 로그인이 되어 있는지 여부를 나타내는 변수입니다.

		        // 로그인되어 있지 않은 경우 로그인 버튼 및 아이콘을 조작합니다.
		        if(!isLoggedIn) {
		            $('#login-button-link').attr('href', '../login.do'); // 로그인 링크를 설정합니다.
		            $('#login-button-text').text('로그인'); // 로그인 버튼의 텍스트를 "로그인"으로 설정합니다.
		            $('.fa-door-open').removeClass('fa-door-open').addClass('fa-door-closed');
		            // 로그인 아이콘의 클래스를 변경하여 닫힌 문 모양으로 설정합니다.
		        } else { // 로그인되어 있는 경우 로그아웃 버튼 및 아이콘으로 조작합니다.
		            $('#login-button-link').attr('href', '../logout.do'); // 로그아웃 링크를 설정합니다.
		            $('#login-button-text').text('로그아웃'); // 로그인 버튼의 텍스트를 "로그아웃"으로 설정합니다.
		            $('.fa-door-closed').removeClass('fa-door-closed').addClass('fa-door-open');
		            // 로그인 아이콘의 클래스를 변경하여 열린 문 모양으로 설정합니다.
		        }
		    });
			  // 이벤트 버블링 상위 요소에 영향을 주지 않도록 합니다.
			  return false;
			});
		
	
		// 카테고리 토글
		$('.category-toggle').click(function() {
			$('.category-list-container').slideToggle('fast');
		});

		// 서브 카테고리 토글 이벤트
		$('.category-list > li > a').click(function(event) {
			event.preventDefault();
			$(this).siblings('.subcategory-list').slideToggle('fast');
		});
		function searchProduct(productName) {
			  if(!productName) return;
		    $.ajax({
		        url: "/product/searchProduct.dox",
		        method: "POST",
		        data: {
		            productName: productName,
		        },
		    }).done(function(response) {
		        console.log(response);

		        // 세션 정보와 검색어를 함께 저장합니다.
		        sessionStorage.setItem("searchResult", JSON.stringify(response));
		        sessionStorage.setItem("searchKeyword", productName);

		        // searchProduct.jsp로 이동합니다.
		        window.location.href = "/searchProduct.do?productName=" + encodeURIComponent(productName);
		    });
		    
		}
		// 검색 아이콘 클릭 시 검색어를 가지고 searchProduct 함수를 실행합니다.
		$('#glass').click(function() {
		    var productName = $('#search_input').val();
			
		    console.log("productName:", productName);
		    saveRecentSearch(productName);
		    searchProduct(productName);
		});

		
		$("#search_input").on("keypress", function(e) {
		    if (e.keyCode === 13) {
		        var productName = $(this).val();

		        console.log("productName:", productName);
		        saveRecentSearch(productName);
		        searchProduct(productName);
		    }
		});
		function loadCategoryProducts(categoryName) {
			  // 서버에서 카테고리별 상품 데이터를 가져오는 AJAX 요청
			  $.ajax({
			    method: "POST",
			    url: "/product/getProductsByCategory.dox",
			    data: {
			      category: categoryName
			    },
			    success: function(response) {
			    	 console.log("Full response data:", response); // 'data' 대신 'response' 사용
			         console.log("Products list:", response.list); // 'data' 대신 'response' 사용
			    	// 응답 데이터를 바로 사용하십시오 (JSON.parse 사용하지 말것)
			        var data = response;

			        // 가져온 상품 데이터를 페이지에 출력하는 로직
			        var productContainer = $("#product-container");
			        productContainer.empty(); // 기존 상품 데이터 삭제
			                                
			        // 상품 데이터를 추가
			        $.each(data.list, function(index, product) {
			            // 여기에 각 상품을 표시하는 HTML 코드를 작성하세요.
			            // 예를 들어, 아래와 같이 간단한 div를 사용할 수 있습니다.
			            var productDiv = $("<div>").text(product.name).appendTo(productContainer);
			        });
			    },
			    error: function(error) {
			      console.error("Error occurred while fetching category data:", error);
			    }
			  });
			}
			
		$(document).ready(function() {
			  $(".subcategory-list > li > a").click(function() {
			    // 클릭된 a 요소의 부모 li 요소와 그 부모의 대분류를 찾기 위한 코드
			    var $parent_li = $(this).closest("li");
			    var $category_a = $parent_li.parents(".category-list > li").find("> a");

			    // 대분류 카테고리 번호와 이름을 찾기 위한 코드
			    var category_no = $category_a.attr("onclick").match(/'(\d+)'/)[1];
			    var category_name = $category_a.text();

			    // 소분류 카테고리 이름
			    var subcategory_name = $(this).text();

			    // 클릭된 소분류 카테고리 정보 출력을 확인해 볼 수 있는 코드
			    console.log("category_no:", category_no);
			    console.log("category_name:", category_name);
			    console.log("subcategory_name:", subcategory_name);

			    // 이후 로직: 로드하는 상품이나 다른 작업 수행
			    // 예시) loadSubcategoryProducts(category_no, category_name, subcategory_name);
			  });
			});
		


		/* //category 눌렀을때 메뉴별로 배열해줌
		 function fnMoveaa (item){
		 var self = this;
		 $.pageChange("storemain_byCategory.do",{no : item});//보낼필요없을때 파라미터 빈값으로{}
		 }
		 */
	</script>