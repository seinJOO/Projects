<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 예약 설정 확인하기
	// 1. 리스트 2개를 생성 (좌석을 저장한 리스트(예약확정), 사본을 저장한 리스트(예약요청))
	List<String> list = new ArrayList<>();
	List<String> temp = new ArrayList<>();
	
	// 2. app에 예약 현황이 있다면 원본 리스트에 저장 
	if (application.getAttribute("seats") != null) {
		list = (List<String>)application.getAttribute("seats");
	}
	// 3. reserve.jsp에서 넘어온 예약 값 확인
	String[] seat = request.getParameterValues("seat");
	
	// 4.seat에 저장된 값이 list에 포함되어 있는 지 확인	
	for (String s : seat) {
		if (list.contains(s)) { // 예약을 시도한 좌석이 이미 예약된 경우
			break;
		} else { // 예약을 시도한 좌석이 예약되지 않은 경우
			temp.add(s);
		}
	}
	
	// 5. arr의 길이와 temp의 길이를 체크함. 같다면 중복된 좌석이 없는 경우 에약현황(list) 리스트에 추가
	if (seat.length == temp.size()) {
		list.addAll(temp);
	} // 예약 실패 시 작업
	
	// 6. application에 저장
	application.setAttribute("seats", list);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
	
		<h2>예약 신청 결과</h2>
		<p>
			<b>선택한 좌석</b>
			<%	for (String s:seat) { %>
					[<%=s %>]
			<%	} %>
			<br><br>
			<b>예약 신청 결과 : </b>
			<%=seat.length == temp.size() ? "성공" : "실패" %>
			<br>
			<% if (seat.length != temp.size()) { %>
					이미 예약된 좌석입니다.
			<%} %>
		</p>
		<a href = "reserve.jsp">다시 예약하기</a>
	</div>
	
</body>
</html>