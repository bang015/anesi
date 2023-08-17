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
			href="javascript:;">커뮤니티</a> <a class="ccc" href="javascript:;">중고장터</a>

		<ul id="header_navi">
			<li><a><i class="fa fa-shopping-cart "></i></a></li>
			<li id="login-button"><a href="#" id="login-button-link"><i class="fa-solid fa-door-open"></i></a><span
				class="fon" id="login-button-text"></span></li>
			<li><a href="../join.do"><i class="fa-solid fa-user-plus "></i></a><span
				class="fon">회원가입</span></li>
			<li><a href="../mypage.do"><i class="fa-solid fa-user "></i></a><span
				class="fon">마이페이지</span></li>
			<li><a><i class="fa-solid fa-bookmark "></i></a><span></span></li>
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
						<li><a>침대</a></li>
						<li><a>소파</a></li>
						<li><a>수납장</a></li>
						<li><a>의자</a></li>
						<li><a>식탁</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('20')">조명</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a>장스텐드</a></li>
						<li><a>단스탠드</a></li>
						<li><a>무드등</a></li>
						<li><a>천장등</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('30')">패브릭</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a>침구</a></li>
						<li><a>커튼</a></li>
						<li><a>러그</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('40')">가전</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a>냉장고</a></li>
						<li><a>tv</a></li>
						<li><a>세탁기</a></li>
						<li><a>음향/영상가전</a></li>
						<li><a>청소가전</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('50')">데코/식물</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a>조화</a></li>
						<li><a>꽃다발</a></li>
						<li><a>화병</a></li>
						<li><a>그림 액자</a></li>
						<li><a>캔들 디퓨저</a></li>
					</ul></li>
				<li><a onclick="fnMoveaa('60')">반려동물</a>
					<ul class="subcategory-list" style="display: none;">
						<li><a>하우스/방석</a></li>
						<li><a>캣타워/스크래쳐</a></li>
						<li><a>안전문/울타리</a></li>
						<li><a>밥그릇/급식기</a></li>
						<li><a>위생용품</a></li>
					</ul></li>
			</ul>
		</div>
	</header>
	<script>
	   var isLoggedIn = <%= isLoggedIn %>;
	    console.log('isLoggedIn:', isLoggedIn);

	    console.log('sessionNo:', '<%= sessionNo %>');

	    $(document).ready(function(){
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

		


		/* //category 눌렀을때 메뉴별로 배열해줌
		 function fnMoveaa (item){
		 var self = this;
		 $.pageChange("storemain_byCategory.do",{no : item});//보낼필요없을때 파라미터 빈값으로{}
		 }
		 */
	</script>