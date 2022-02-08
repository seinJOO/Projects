<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {		
		text-align : center;
		width : 400px;	
	}
	td {
		border : 1px solid black;
	}

</style>
</head>
<body>
	<%-- 1~100까지의 합
<%	int sum = 0;
	for (int i = 1 ; i <= 100 ; i++) {
		sum = sum + i;
	}
%>
	결과 : <%=sum %> --%>
	
	<!-- jstl의 변수 선언 -->
	<c:set var="sum" value="0" /> <!-- 변수 선언 및 초기화 -->
	<c:forEach var="i" begin="1" end="100" step="1" >
		<c:set var="sum" value="${sum + i }" /> <!-- 변수 가져와서 foreach 내에서 연산 -->
	</c:forEach>
	결과 : ${sum } <br>
	결과 : <c:out value="${sum }" />
	<hr>
	<h2>구구단 3단 출력</h2>
	<c:forEach var="stg1" begin="2" end="9" step="1">
		3 X ${stg1 } = ${3 * stg1 }<br>
	</c:forEach>
	
	<hr>
	<h2>모든 구구단 출력</h2>
	<table>
	<tr><td colspan=6 style="background-color:black;color:white;">구구단</td></tr>
	<c:forEach var="num2" begin="1" end="9" step="1">
		<c:if test="${num2 == 1 or num2 == 4 or num2 == 7}"><tr></c:if>
		<td style="background-color: black ; color : white">${num2 }단</td>
		<td>
		<c:forEach var="stg2" begin="2" end="9" step="1">		
			${num2 } X ${stg2 } = ${num2 * stg2 }<br>
		</c:forEach>
		</td>
		<c:if test="${num2 == 3 or num2 == 6 or num2 == 9}"></tr></c:if>		
	</c:forEach>
	</table>
	
	<hr>
	<h2>향상된 for문</h2>
	<%
		int[] arr = {1,2,3,4,5,6};
		for (int a : arr) {
			out.println(a);
		}	
	%>
	<br>
	<c:set var="arr2" value="<%=new int[] {1,2,3,4,5,6} %>" />
	<h3>jstl을 이용한 향상된 for문 출력</h3>
	<c:forEach var="i" items="${arr2 }">
		${i }
	</c:forEach>
	
	
</body>
</html>