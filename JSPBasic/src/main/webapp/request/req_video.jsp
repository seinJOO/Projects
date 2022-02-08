<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 테이블 페이지에서 a태그의 url 주소 뒤에 title 변수로 식별값을 담아서 이동
		 result 페이지에서는 넘어오는 값에 따라서 if~ else if 형태를 사용하여 다른 화면이 보여지도록 처리-->
		 
		 <div align="center">
		 	<table border="1" >
		 		<tr>
		 			<th>이미지</th>
		 			<th>장르</th>
		 			<th>이름</th>
		 			<th>등록일</th>
		 		</tr>
		 		<tr>
		 			<td width="100">
		 				<a href="req_video_ok.jsp?num=1">
		 					<img src="img/test1.png" width="100" height="100">
		 				</a>
		 			</td>
		 			<td>시스코 네트워크</td>
		 			<td>
		 			<a href="req_video_ok.jsp?num=1">1. 종소리</a>
		 			</td>
		 			<td>2022.01.12</td>
		 		</tr>
		 		
		 		<tr>
		 			<td width="100">
		 				<a href="req_video_ok.jsp?num=2">
		 					<img src="img/test2.png" width="100" height="100">
		 				</a>
		 			</td>
		 			<td>시스코 네트워크</td>
		 			<td>
		 			<a href="req_video_ok.jsp?num=2">2. 자기소개</a>
		 			</td>
		 			<td>2022.01.19</td>
		 		</tr>
		 	</table>
		 
		 </div>
</body>
</html>