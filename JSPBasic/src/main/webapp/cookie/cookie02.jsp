<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] arr = request.getCookies();
	String date = null;
	
	/* 내가 쓴 답
	if (arr != null) {
		for (int i = 0 ; i < arr.length ; i++ ) {		
			 if (arr[i].getName().contains("show")) {
				out.println(arr[i].getName() + "   " + arr[i].getValue());				
			} else out.println("쿠키가 없습니다"); break;
		}
	} else out.println("쿠키가 없습니다");
	*/
	
	if (arr != null) {
		for (int i = 0 ; i < arr.length ; i++ ) {		
			 if (arr[i].getName().equals("show")) {
				date = arr[i].getValue();				
			}
		}
	} 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 값 확인</title>
</head>
<body>
<% if (date == null) {%>
		쿠키값이 없습니다.
<% 	} else {%>
		마지막 접속 날짜 : <%=date %>
<%  }%>
</body>
</html>