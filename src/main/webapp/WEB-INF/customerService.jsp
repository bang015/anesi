<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mainCss.css" rel="stylesheet">
<meta charset="UTF-8">
<link href="../css/mainCss.css" rel="stylesheet">
<link href="../css/customer.css" rel="stylesheet">
<title>Insert title here</title>



</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div id="app">	
	
	<div class="help">
		<h2>무엇을 도와드릴까요?</h2>

		<div class="qna">
			<ul>
				<li onclick="toggleAnswer(this)">배송은 얼마나 걸리나요?
					<div class="answer" style="display: none;">배송은 보통 3-5일 안에
						이루어집니다.</div>
				</li>
				<li onclick="toggleAnswer(this)">주문 취소는 어떻게 하나요?
					<div class="answer" style="display: none;">주문 취소는 주문 내역에서
						가능합니다.</div>
				</li>
				<li onclick="toggleAnswer(this)">제품이 불량일 때는?
					<div class="answer" style="display: none;">제품 불량시 고객센터로 연락
						주세요.</div>
				</li>
				<li onclick="toggleAnswer(this)">카카오 계정으로 로그인하면 이미 가입되었다고 합니다
					<div class="answer" style="display: none;">이메일과 비밀번호를 확인 후 다시
						시도해주세요.</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="center">
		<h2>고객센터 09:00~18:00</h2>
		<li>평일: 전체문의 상담 가능</li>
		<li>주말/공휴일: 오늘의집 직접배송건에 한해서 전화상담 가능</li>

		<div>1588-2222</div>
		<div
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xiVxdVG"
  data-title="question"
  data-size="large"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>
		 <button class="btn4" id="copyEmailButton">이메일 주소복사</button>
    <div id="messageBox" style="display: none;"></div>
		  <script>
        const copyEmailButton = document.getElementById('copyEmailButton');
        const messageBox = document.getElementById('messageBox');

        copyEmailButton.addEventListener('click', () => {
            const emailToCopy = 'test@test.com';
            const tempInput = document.createElement('input');
            tempInput.value = emailToCopy;
            document.body.appendChild(tempInput);
            tempInput.select();
            document.execCommand('copy');
            document.body.removeChild(tempInput);

            messageBox.textContent = '이메일 주소가 복사되었습니다';
            messageBox.style.display = 'block';

            // Hide the message after a delay
            setTimeout(() => {
                messageBox.style.display = 'none';
            }, 3000); // 3 seconds
        });
    </script>


	</div>

	<div class="buttons">
		<button class="btn">전체</button>
		<button class="btn">주문/결제</button>
		<button class="btn">배송관련</button>
		<button class="btn">취소/환불</button>
		<button class="btn">반품/교환</button>
		<button class="btn">증빙서류발급</button>
		<button class="btn">로그인/회원정보</button>
		<button class="btn">서비스/기타</button>
		<button class="btn">취소/환불</button>
	</div>


	<div class="qnaList">
		<ul>
			<li onclick="toggleAnswer(this)" data-category="로그인/회원정보">회원가입시 이미
				가입된 이메일이라고 표시됩니다. 어떻게 해야되나요?
				<div class="answer" style="display: none;">test@test.com로 문의
					바랍니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="서비스/기타">오늘의집을 PC나 맥에서도 볼수 있나요?
				<div class="answer" style="display: none;">아니요 지금은 웹페이지만
					지원하고있습니다.</div>
				<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="주문/결제">신용카드 무이자 할부가 되나요?
				<div class="answer" style="display: none;">제품 불량시 고객센터로 연락
					주세요.</div>
				<hr>
			</li>
			<li onclick="toggleAnswer(this) " data-category="주문/결제">신용카드 결제 후 할부 개월 수를 변경 가능한가요?
				<div class="answer" style="display: none;">결제 후 결제 정보 변경은 불가능
					합니다. 단, 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="주문/결제">주문 후 결제 방법을 변경하고 싶은데 어떻게 해야
				하나요?
				<div class="answer" style="display: none;" data-category="주문/결제">결제 후 결제 정보 변경은 불가능
					합니다. 단, 입금 대기 및 결제 완료 단계에서는 취소 후 재주문을 통해 변경 가능합니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="주문/결제">가상계좌 입금은 언제 확인 되나요?
				<div class="answer" style="display: none;">입금 후 24시간 이내에
					확인됩니다. 24시간 이후에도 입금확인이 되지 않는 경우 결제 금액과 입금한 금액이 같은지, 올바른 계좌로 입금하였는지
					확인 후 [ 고객센터 > 1:1 카톡 상담하기]를 통해 문의 부탁드립니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="주문/결제">가상계좌 입금인을 다르게 적은경우 어떻게 해야하나요?
				<div class="answer" style="display: none;">입금인이 달라도 가상계좌번호만
					같으면 문제없습니다..</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="배송관련">배송비는 얼마인가요?
				<div class="answer" style="display: none;">오늘의집은 상품정보 중계 및 판매
					매체이며, 판매 업체 별로 배송비 정책이 상이합니다각 상품상세페이지에서 배송비를 확인하실 수 있습니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="배송관련">배송은 얼마나 걸리나요?
				<div class="answer" style="display: none;">상품 배송 기간은 배송 유형에 따라
					출고 일자 차이가 있습니다.자세한 사항은 구매하신 상품의 상세 페이지에서 확인 가능하며, 배송 유형 별 기본 출고 기간은
					아래와 같습니다. ∙ 일반 택배 / 화물 택배 : 결제 후 1~3 영업일 이내 출고됩니다. ∙ 업체 직접 배송 : 배송
					지역에 따라 배송 일자가 상이할 수 있으므로 상품 상세 페이지에서 확인 해주세요. ※ 영업일은 주말, 공휴일을 제외한
					기간입니다. ※ 제조사의 사정에 따라 출고일은 지연될 수 있는 점 양해 부탁드립니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="배송관련">해외배송이 가능한가요?
				<div class="answer" style="display: none;">현재는 국내배송만 진행하고
					있습니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="배송관련">배송조회를 해보면 배송완료로 확인되는데 택배를 받지
				못했습니다. 어떻게 해아하나요?
				<div class="answer" style="display: none;">경비실 또는 무인택배함을 먼저 확인
					부탁드립니다. 별도의 위탁 장소가 없는 경우 배송기사님께서 임의의 장소에 보관하셨을 수 있으니, 기사님께 문의
					부탁드립니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)"data-category="주문/결제">주문 취소는 어떻게 하나요?
				<div class="answer" style="display: none;">판매처에서 주문을 확인하기 전이라면
					언제든 취소하실 수 있으며, [나의 쇼핑 > 주문배송내역 조회 > 주문상세보기]에서 직접 주문취소하실 수 있습니다. ※
					이미 판매처에서 상품을 확인해 준비 중이라면, 직접 취소가 어렵습니다. 상세 페이지에 확인되는 판매자 연락처 또는
					오늘의집 고객센터로 문의 부탁드립니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="취소/환불">취소 후 환불은 언제되나요?
				<div class="answer" style="display: none;">신용카드 및 체크카드의 경우
					카드사에서 확인 절차를 거치는 관계로 평균 3~7일 영업일 이내 환불처리가 완료됩니다. 무통장 입금의 경우 평균 5영업일
					이내 요청 하신 계좌로 환불됩니다. 휴대폰 소액결제의 경우 평균 3영업일 이내 환불 또는 취소 처리가 완료됩니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="취소/환불">제품이 불량입니다. 반품 혹은 교환은 어떻게 하나요?
				<div class="answer" style="display: none;">업체(브랜드)마다 발송처 및
					반품절차가 다릅니다. - 우측 상단 프로필 사진을 클릭 후 [나의쇼핑] 페이지에서 원하는 주문의 상세보기 버튼을 클릭 후
					교환/반품 접수 후 진행 할수 있습니다. 교환/반품 접수 없이 임의로 반송한 경우에는 처리가 늦어질 수 있습니다. -
					교환/반품 접수 시 원활한 처리를 위해 불량 사진이 필요하오니, 가급적 사진을 첨부하여 주시기 바랍니다. 단, 구매확정
					이후 교환/반품을 원하시는 경우 판매 업체에 교환/반품 가능 여부를 먼저 문의 부탁드립니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="반품/교환">제품의 교환 또는 반품을 할 수 있나요?
				<div class="answer" style="display: none;">상품을 수령하신 후 7일 이내에
					교환, 반품이 가능하며, 고객님의 변심에 의한 교환/반품의 경우 배송비용이 부과될 수 있습니다. ※ 단, 아래의 경우
					교환/반품이 불가능합니다. - 고객님의 책임 사유로 인해 상품 등이 멸실 또는 훼손된 경우 - 개봉 및 포장이 훼손으로
					상품가치가 현저히 상실된 경우 - 시간 경과에 의해 재판매가 어려울정도로 상품 가치가 현저히 저하된 경우 - 고객주문
					확인 후 상품제작에 들어가는 주문 제작 상품 - 직접 조립하는(DIY) 상품을 조립 한 경우</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="반품/교환">반품 시, 사은품도 같이 반품해야 하나요?
				<div class="answer" style="display: none;">사은품도 같이 동봉하여 반품해
					주셔야 반품처리가 완료됩니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="반품/교환">주문한 것과 다른 상품이 왔습니다. 어떻게 해아하나요?
				<div class="answer" style="display: none;">우측 상단 프로필 사진을 클릭 후
					[나의쇼핑 > 고객센터 > 1:1 카톡 상담하기]를 통해 문의 주시면 확인 도움드리겠습니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="증빙서류발급">세금계산서를 받고 싶은데 어떻게 해야 하나요?
				<div class="answer" style="display: none;">세금계산서 발급은 어려우며, 결제
					시 지출증빙 또는 현금영수증 발행은 가능합니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="증빙서류발급">주문건의 결제 금액을 나눠서 영수증 발행이 가능한가요?
				<div class="answer" style="display: none;">주문하신 내역 중 일부 상품에
					대해서만 분할로 영수증을 발급 받으실 수는 없습니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="로그인/회원정보">회원탈퇴 후 재가입이 가능한가요?
				<div class="answer" style="display: none;">제품 불량시 고객센터로 연락
					주세요.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="로그인/회원정보">오늘의집 웹에서는 애플 아이디로 로그인이 가능한가요?
				<div class="answer" style="display: none;">아니요 애플아이디는 지원하고있지
					않습니다</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="서비스/기타">제품의 자세한 정보는 어떻게 알 수 있나요?
				<div class="answer" style="display: none;">각 제품의 상세 페이지에서 확인
					가능하며, 더욱 자세한 정보는 제품상세페이지 내 문의하기를 통해 판매 업체에 문의 가능합니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="서비스/기타">Q상담방법과 상담가능시간 유선번호는 어떻게 되나요?
				<div class="answer" style="display: none;">상담 시간은 평일 09:00 ~
					18:00 (주말 & 공휴일 제외)이며, 전화번호는 1670-0876 입니다. 우측 상단 프로필 사진을 클릭 후
					[나의쇼핑 > 고객센터 > 1:1 카톡 상담하기] 를 이용하시면 상담원과 채팅으로 더욱 빠르고 편리하게 문의 가능합니다.</div>
			<hr>
			</li>
			<li onclick="toggleAnswer(this)" data-category="서비스/기타">Q"좋아요"를 누른 콘텐츠(사진/집들이/노하우/등)들은
				어디서 볼 수 있나요?
				<div class="answer" style="display: none;">우측 상단 프로필 사진을 클릭 후
					[마이홈 > 좋아요] 페이지에서 확인 가능합니다.</div>
			</li>
		</ul>
	</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
  integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
<script>
  Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<div id="add-channel-button"></div>

<script>
  window.kakaoAsyncInit = function() {
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.channel.min.js';
    js.integrity = 'sha384-suN4Zc1CFiRm8j96GVFtk9WqRwjWWhDoYbIrYCXyrsvKZZ2XRUIoUyH/AyjszUEj';
    js.crossOrigin = 'anonymous';
    fjs.parentNode.insertBefore(js, fjs);
  })(document, 'script', 'kakao-js-sdk');
</script>
</body>



<script>

const kakakoChatBtn = document.getElementById('kakao-talk-channel-chat-button');

if (kakakoChatBtn) {
    kakakoChatBtn.addEventListener('click', () => {
        // 카카오톡 딥 링크 URL
        const kakaoDeepLink = "kakaoplus:http://pf.kakao.com/_xiVxdVG/chat";

        // 카카오톡 앱으로 링크 열기
        window.location.href = kakaoDeepLink;
    });

    // 이전에 오류가 발생한 해당 코드를 수정된 if문 내부로 옮깁니다.
    kakakoChatBtn.addEventListener('click', () => {
        const kakaoDeepLink = "kakaoplus:http://pf.kakao.com/_xiVxdVG/chat";
        window.location.href = kakaoDeepLink;
    });
} else {
}

function scrollToRelatedQuestion(questionText) {
	  const qnaList = document.querySelector('.qnaList');
	  const allQuestions = qnaList.querySelectorAll('li');
	  const headerHeight = 320; // 헤더의 높이 설정

	  for (const question of allQuestions) {
	    if (question.textContent.includes(questionText)) {
	      const targetScrollPosition = question.offsetTop - headerHeight;
	      window.scrollTo({ top: targetScrollPosition, behavior: 'smooth' });
	      break;
	    }
	  }
	}

function toggleAnswer(clickedElem) {
    var answerElem = clickedElem.querySelector(".answer");
    var questionText = clickedElem.textContent.trim(); // 질문 텍스트 추출
    
    if (answerElem.style.display == 'block') {
        answerElem.style.display = 'none';
    } else {
        answerElem.style.display = 'block';
        scrollToRelatedQuestion(questionText); // 연관된 질문 찾아 이동
    }
}
        
        const btns = document.querySelectorAll('.btn');
        btns.forEach(btn => {
          btn.addEventListener('click', () => {
            filterQuestions(btn.textContent); // 버튼의 텍스트 값을 인자로 전달
          });
        });
        
        function filterQuestions(category) {
        	  const allQuestions = document.querySelectorAll('.qnaList li');
        	  
        	  allQuestions.forEach(question => {
        	    const questionCategory = question.getAttribute('data-category');
        	    
        	    if (questionCategory === category || category === '전체') {
        	      question.style.display = 'block';
        	    } else {
        	      question.style.display = 'none';
        	    }
        	  });
        	}

       
       
    </script>
</html>