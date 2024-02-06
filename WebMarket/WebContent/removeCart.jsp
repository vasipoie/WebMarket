<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id == null || id.equals("")){
		response.sendRedirect("product.jsp");
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	if(product==null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList"); 
	for(int i=0; i<cartList.size(); i++){
		Product goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>