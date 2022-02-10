<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String name = (String)session.getAttribute("name"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="brand">BOARD</div>        
<div class="address-bar">오늘을 기록하기</div>
<%@ include file="/include/_header.jsp" %>
	<section>
		<div align="center">		
		<form name="writeform" action="register.board" method="post">
			<h2 class="pre">오늘의 기억</h2>
			<hr>
			<table border="1" width="500">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" size="10" class="form-control"
					<% if (name != null) {	%>
						value = "${name }" readonly
					<% } %>		></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td><input type="text" name="title" class="form-control"></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td><textarea rows="10" style="width:100%;" name="content" class="form-control"></textarea></td>
				</tr>
				<!-- 글 등록 메뉴 -->
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="registCheck()" class="btn btn-primary">
						<input type="button" value="목록" onclick="location.href='list.board'" class="btn btn-info">
					</td>
				</tr>		
			</table>		
		</form>		
		</div>	
	</section>

	<script type="text/javascript">
		function registCheck() {			
			if (document.writeform.writer.value == '') {
				alert("작성자를 입력하세요!");
				return;
			} else if (document.writeform.title.value == '') {
				alert("글 제목을 입력하세요!");
				return;
			} else if (document.writeform.content.value == '') {
				alert("글 내용을 입력하세요!");
				return;
			} else if(confirm("게시물을 등록하시겠습니까?")){
				document.writeform.submit();
			}			
		}
	</script>
</body>
</html>
<%@ include file="/include/_footer.jsp" %>