<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 측정 프로그램</title>
</head>
<body> 
		<%-- 1. form태그를 이용하여 post형식으로 이름, 키, 몸무게를 입력받음
			 2. req_quiz_result.jsp로 전송
			 3. 전달받은 페이지에서는 넘어간 값을 처리하여 BMI지수 산출
			 4. BMI공식 = kg / (cm/100 * cm/100) -> String형식으로 전달된 값을 형변환 해줘야 함!
			 	Integer.parseInt() or Double.parseDouble() 사용
			 5. 화면에 이름, 키, 몸무게, BMI지수를 출력
			 6. if를 통해 bmi지수가 25 이상이면 과체중, 18 이하면 저체중, 나머지는 정상으로 출력
			 --%>
			 
	<form action = "req_quiz01_result.jsp" method="post">
		이름 : <input type="text" size="10" name="name"><br><br>
		키 : <input type="text" size="10" name="height"><br><br>
		몸무게 : <input type="text" size="10" name="weight"><br><br>
		당신의 BMI 지수는 ? <input type="submit" value="확인"><br>
	</form>

</body>
</html>