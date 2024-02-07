<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>주문 완료</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<%
		String shopping_shoppingDate = "";
		String shopping_cartId = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shopping_cartId")){
					shopping_cartId = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
				if(n.equals("Shopping_shoppingDate")){
					shopping_shoppingDate = URLDecoder.decode(thisCookie.getValue(), "UTF-8");
				}
			}
		}
		
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은	<%=shopping_shoppingDate %>에 배송될 예정입니다! !	
		<p>주문번호 : <%=shopping_cartId %>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
	</div>
</body>
<%
	session.invalidate();

	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		if(n.equals("Shopping_cartId")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shopping_name")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shopping_shoppingDate")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shopping_country")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shopping_zipCode")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shopping_addressName")){
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}

%>
</html>







