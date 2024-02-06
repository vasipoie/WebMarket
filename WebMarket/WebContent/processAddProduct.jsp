<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	//웹 어플리케이션상의 절대 경로
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType = "utf-8";	//인코딩 타입
	int maxSize = 5 * 1024 * 1024; 	//최대 업로드 될 파일의 크기(5MB)
	
	File file = new File(realFolder);
	if(!file.exists()){
		file.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	/* 일반데이터 + 파일 데이터를 받을 때 방법 */
	String productId="";
	String name="";
	String unitPrice="";
	String description="";
	String manufacturer="";
	String category="";
	String unitsInStock="";
	String condition="";
	String fileName="";
	
	/* 일반 데이터를 받을 때 방법
	String productId = request.getParameter("productId");
	String name = request.getParameter("pname");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	*/
	
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
		
		if(item.isFormField()){ //일반 데이터 일 때
			String fieldName = item.getFieldName(); //파라미터의 이름
			if(fieldName.equals("productId")) 
				productId = item.getString(encType);
			else if(fieldName.equals("pname"))
				name = item.getString(encType);
			else if(fieldName.equals("unitPrice"))
				unitPrice = item.getString(encType);
			else if(fieldName.equals("description"))
				description = item.getString(encType);
			else if(fieldName.equals("manufacturer"))
				manufacturer = item.getString(encType);
			else if(fieldName.equals("category"))
				category = item.getString(encType);
			else if(fieldName.equals("unitsInStock"))
				unitsInStock = item.getString(encType);
			else if(fieldName.equals("condition"))
				condition = item.getString(encType);
			
		}else { //파일 일 때
			String fileFieldName = item.getFieldName();
			fileName = item.getName();
			String contentType = item.getContentType();
			long fileSize = item.getSize();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile);
		}
	}
	
	Integer price;
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	
	long stock;
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	
	//상품 등록 페이지에 입력된 데이터를 가지고 등록할 상품을 만든다.
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);

	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
	
%>