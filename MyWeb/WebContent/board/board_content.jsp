<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- boardlist에서 num을 controller로 넘김-> 인터페이스를 통해 DAO로 받은 값을 request로 현재 페이지에 넘김 -> 값 받아서 처리  -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="brand">BOARD</div>        
<div class="address-bar">매일의 기록</div>
<%@ include file="/include/_header.jsp" %>
	<section>
		<div align="center" class="container">
		<form>
			<table border="1" width="500" class="table table-bordered" style="background-color : #fcfcfce6;">
				<tr>
					<td width="20%">글번호</td>
					<td width="30%">${vo.num }</td> <!-- DB로부터 전달받을 부분 -->
					<td width="20%">조회수</td>
					<td width="30%">${vo.hit }</td>	<!-- DB로부터 전달받을 부분 -->
				</tr>
				<tr>
					<td>작성일</td>
					<td>${vo.regdate }</td> <!-- DB로부터 전달받음 -->
					<td>작성자</td>
					<td>${vo.writer }</td>	<!-- DB로부터 전달받음 -->
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">${vo.title }</td>
				</tr>
				<tr height="200">
					<td>내용</td>
					<td colspan="3">${vo.content }</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<input type="button" value="목록" onclick="location.href='list.board'" class="btn btn-default">
					<input type="button" value="수정" onclick="location.href='modify.board?num=${vo.num}'" class="btn btn-info">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</section>
</body>
</html>
<%@ include file="/include/_footer.jsp" %>