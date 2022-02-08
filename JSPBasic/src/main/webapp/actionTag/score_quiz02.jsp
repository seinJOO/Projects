<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");
/* 
	1. 앞에서 전달 받은 폼값을 받아서 평균을 구한다.
	2. 평균의 값이 60점 이상인 경우에는 score_quiz_03.jsp로 이동 / 미만인 경우 score_quiz_04.jsp로 이동
	3. score_quiz03.jsp에는 "'이름'님 평균 xx점 합격입니다"
	4. score_quiz04.jsp에는 "'이름'님 평균 xx점 불합격입니다"
*/

	String name = request.getParameter("name");
	int ko = Integer.parseInt(request.getParameter("ko"));
	int en = Integer.parseInt(request.getParameter("en"));
	int math = Integer.parseInt(request.getParameter("math"));

	double avg = (ko + en + math) /3;
	
	String path="";
	
	if (avg >= 60) {
		path = "score_quiz03.jsp";	
	} else {
		path = "score_quiz04.jsp";
	}		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="<%=path %>">
			<jsp:param value="<%=name %>" name="name" />
			<jsp:param value="<%=avg %>" name="avg" />
		</jsp:forward>
</body>
</html>