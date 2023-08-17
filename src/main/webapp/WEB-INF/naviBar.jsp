<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/NaviBar.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="container">

  <div class="choi">
    최근본상품
  </div>
  <div class="thumbnail-container">
    <c:forEach items="${recentProducts}" var="product">
      <div class="thumbnail">
        <img src="${product.imageUrl}" alt="${product.name}" width="100" height="100">
        <p>${product.name}</p>
      </div>
    </c:forEach>
  </div>
  
  ...
  
</div>
</body>
</html>