<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
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
	<section>
		<div align = "center" class = "container">
		<form name = "regform" action = "update.board" method = "post">
			<table border="1" width="500" class="table table-bordered" style="background-color : #fcfcfce6;">
				<tr>
					<td width="10%">글번호</td>
					<td width="40%"><input type="text" name="num" value="${vo.num }" readonly class="form-control"></td> 
					<td width="10%">조회수</td>
					<td width="40%"><input type="text" name="hit" value="${vo.hit }" readonly class="form-control"></td>	
				</tr>
				<tr>
					<td>작성일</td>
					<td>${vo.regdate }</td>
					<td>작성자</td>
					<td>${vo.writer }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name = "title" value="${vo.title }" class="form-control"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="200"><textarea class="form-control h-25" rows="15" name="content">${vo.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<input type="button" value="수정하기" onclick="modifyCheck()" class="btn btn-info">
					<input type="button" value="취소" onclick="history.go(-1)" class="btn btn-default">
					<input type="button" value="삭제하기" onclick="deleteCheck()" class="btn btn-primary">					
					</td>
				</tr>
			</table>
		</form>
	</div>
	</section>

<script type="text/javascript">
	function modifyCheck() {
		// 글 제목에 공백 확인 후 공백 아니면 submit() 처리
		if (document.regform.title.value == "") {
			alert('제목을 입력해주세요!');
			return;
		} else if (confirm("게시글을 수정하시겠습니까?")) {
			document.regform.submit();
		}
	}	
	function deleteCheck() {
		if (confirm("게시글을 정말 진짜 진심으로 삭제하시겠습니까?")) {
			location.href="delete.board?num=" + ${vo.num};
		}
	}
</script>
</body>
</html>
<%@ include file="/include/_footer.jsp" %>