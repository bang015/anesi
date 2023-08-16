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
	<header>
		<span> <a href="/main.do"><img class="logo"
				src="../css/image/anesilogo.png" /> </a></span> <a class="aaa"
			href="/product/storemain.do">스토어</a> <a class="bbb"
			href="javascript:;">커뮤니티</a> <a class="ccc" href="javascript:;">중고장터</a>

		<ul id="header_navi">
			<li><a><i class="fa fa-shopping-cart "></i></a></li>
			<li><a href="../login.do"><i class="fa-solid fa-door-open "></i></a><span
				class="fon">로그인</span></li>
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
		<select id="category_no">
			<!-- 카테고리 선택 옵션 추가 -->
		</select>
		<select id="category_order_bar">
			<!-- 카테고리 정렬 옵션 추가 -->
		</select>
		<ul id="product_list"></ul>
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
		        window.location.href = "/searchProduct.do";
		    });
		    
		}
		$("#search_input").on("keypress", function(e) {
		    if (e.keyCode === 13) {
		        var productName = $(this).val();

		        console.log("productName:", productName);

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