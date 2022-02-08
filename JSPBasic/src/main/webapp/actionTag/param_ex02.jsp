<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!-- forward 시에 파라미터 값을 추가해서 넘기는 경우 -->
<jsp:forward page="param_ex03.jsp">
	<jsp:param value="똑똑이" name="nick"/>
</jsp:forward>
