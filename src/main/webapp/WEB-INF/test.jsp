<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<button onclick="setCookie()">
	ADD TO CART
	
	</button>
</body>
</html>

<script>
//쿠키 저장하는 함수
function setCookie(key, value, unixTime) {
    var todayDate = new Date();
    todayDate.setTime(todayDate.getTime() + unixTime);
    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

//쿠키 값 가져오는 함수
function getCookie(key) {
    var result = null;
    var cookie = document.cookie.split(';');
    cookie.some(function (item) {
        // 공백을 제거
        item = item.replace(' ', '');
 
        var dic = item.split('=');
 
        if (key === dic[0]) {
            result = dic[1];
            return true;    // break;
        }
    });
    return result;
}

//쿠키 삭제하는 함수
function delete_cookie(name) {
    document.cookie = encodeURIComponent(name) + '=; expires=Thu, 01 JAN 1999 00:00:10 GMT';
}



//팝업을 실행해주는 페이지 (parent)
var popup = getCookie("eventpopup");
if (popup != "false") {
    // 팝업 실행
}
 
// 팝업 페이지
function closeWindow() {
    var check = document.getElementById("check");
    if (check.checked) {
        setCookie("eventpopup", "false", 1);
    }
    self.close();
}




</script>