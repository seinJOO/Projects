<%@page import="com.myweb.board.model.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="brand">BOARD</div>        
<div class="address-bar">매일의 기록</div>
<%@ include file="/include/_header.jsp" %>
<div class="container" align = "center">	
	<h3>MyWeb 게시판</h3>
	<table class="table table-bordered">
		<!-- 게시물 리스트 출력  -->
		<thead style="text-align : center; background-color : #d4d4d499;">
			<tr>
				<th width="10%">글 번호</th>
				<th width="20%">작성자</th>
				<th width="30%">제목</th>
				<th width="20%">날짜</th>
				<th width="20%">조회수</th>
			</tr>
		</thead>
		<!-- DB로부터 게시글 정보를 불러옴 -->
		<tbody style="background-color : #fcfcfc99;">		
		<c:forEach var="vo" items="${list }" >			
			<tr>
				<td>${vo.num }</td>
				<td>${vo.writer }</td>
				<td><a href="content.board?num=${vo.num }">${vo.title }</a></td>
				<td>${vo.regdate }</td>
				<td>${vo.hit }</td>
			</tr>
		</c:forEach>			
		</tbody>
		<!-- 게시물 검색 부분 -->
		<tbody>
		<tr>
			<td colspan="5" align="right">
				<form action="" class="form-inline">
					<div class="form-group">
						<input type="text" name="search" placeholder="제목" class="form-control">
						<input type="submit" value="검색" class="btn btn-default">
						<input type="button" value="글 작성" class="btn btn-info" onclick="location.href='/MyWeb/board/write.board'">
						<!-- MVC2의 특징 : VIEW로 바로 접근하지 않고, 꼭 Controller를 통해서 접근한다 !!! -->
					</div>
				</form>
			</td>
		</tr>
		</tbody>
	</table>
		<!-- 페이징 작업 공간 -->
		<div align="center">
			<ul class="pagination pagination-sm">
				<li><a href="#">이전 페이지</a></li>
				<li><a href="#"> 1 </a></li>
				<li><a href="#">다음 페이지</a></li>
			</ul>
		</div>
	
	

</div>
</body>
</html>
<%@ include file="/include/_footer.jsp" %>