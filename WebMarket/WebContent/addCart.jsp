<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	//상품 id 얻어오기
	String id = request.getParameter("id");

	//id가 존재하지 않는 경우, 상품 목록 화면으로 이동
	if(id == null || id.equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	//상품 id로 상품 조회
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	//카트 목록 꺼내기
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartList");
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
	}
	
	int cnt = 0;
	for(int i=0; i<list.size(); i++){
		Product goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			goodsQnt.setQuantity(goodsQnt.getQuantity()+1);
		}
	}
	
	//첫 상품 주문일 경우
	if(cnt == 0){
		product.setQuantity(1);
		list.add(product);
	}
	
	response.sendRedirect("product.jsp?id="+id);
%>