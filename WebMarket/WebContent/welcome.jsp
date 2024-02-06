<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Welcome</title>
</head>
<body>
	<!-- nav 영역 -->
	<%@ include file="menu.jsp" %>
	<%!
		// 변수 greeting, tagline에 각각 문자열을 저장하도록 선언문 태그를 작성한다.
		String greeting = "Welcome to Web Shopping Mall";
		String tagline = "welcome to Web Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<!-- 변수 greeting의 값을 출력하도록 표현문 태그를 작성한다. -->
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<!-- 변수 tagline의 값을 출력하도록 표현문 태그를 작성한다. -->
				<%=tagline %>
			</h3>
			<%
				Date day = new Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0) {
					am_pm = "AM";
				} else {
					am_pm = "PM";
					hour = hour - 12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속 시간 : " + CT);
			%>
		</div>
		<hr/>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>