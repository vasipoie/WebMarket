<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listofProducts = dao.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0; i<listofProducts.size(); i++){
					Product product = listofProducts.get(i);
			%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath }/resources/images/<%=product.getFilename() %>" 
				style="width: 100%"/>
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><%=product.getUnitPrice() %>원</p>
				<p>
					<a href="product.jsp?id=<%=product.getProductId() %>" 
					class="btn btn-secondary" role="button">
						상세 정보 &raquo;
					</a>
				</p>
			</div>
			<%
				}
			%>
		</div>
		<hr/>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>








