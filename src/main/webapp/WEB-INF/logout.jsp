<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Logging out</title>
</head>
<body>

<%
  // 세션 무효화 처리
  session.invalidate();
  // 로그아웃 처리 후 메인 페이지로 리다이렉트
  response.setBufferSize(1); // 버퍼 크기를 최소화합니다.
response.sendRedirect("../main.do"); // 메인 페이지로 리다이렉트합니다.
%>

</body>
</html>