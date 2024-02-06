<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("cartId");
	if(id == null || id.equals("")){
		response.sendRedirect("cart.jsp");
	}
	
	session.invalidate();
	response.sendRedirect("cart.jsp");
%>