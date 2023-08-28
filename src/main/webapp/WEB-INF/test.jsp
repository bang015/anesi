<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/mainCss.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.flow-text {
	  display: flex;
      flex: 0 0 auto;
      white-space: nowrap;
      overflow: hidden;
      transition: 0.3s;
      font-size: 2.5rem;
 
      color: #9D9993;
  }
  .flow-text:hover {
    color: #000;
  }
  .flow-text:hover .flow-wrap {
    animation-play-state: paused;
    cursor: pointer;
  }
  .flow-wrap {
    animation: textLoop 10s linear infinite;
    padding-right: 1.4881vw;
  }
  
  @keyframes textLoop {
    0% {
      -webkit-transform: translate3d(0, 0, 0);
      transform: translate3d(0, 0, 0);
    }
    100% {
      -webkit-transform: translate3d(-100%, 0, 0);
      transform: translate3d(-100%, 0, 0);
    }
  }
    
</style>
</head>
<body>

  


</body>
</html>

<script>

console.log
(`.             |
		 　╲　　　　　　　　　　　╱
		  　　　　　　　　/
		  　　　╲　　　　　　　　╱
		  -　-　　　　저기요　　　-　-
		  　　╱　   　　　　　　╲
		  　╱　　/             .
		  　　╱　　　　　　　　╲
		  　　　　　/　|　　　
		  　　　　　　　.
		         
		.           |
		　╲　　　　　　　　　　　╱
		　　　　　　　　　/
		　　　╲　　　　　　　　╱
		　　╲　　    설마...　　　╱
		-　-　　　제 목소리가　　-　-　-
		　　╱　   들리시나요?　　╲
		　╱　　/               .
		　　╱　　　　　　　　╲
		　　　　　/　|　　　
		　　　　　　　.`);
</script>