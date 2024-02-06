<%@ page pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<title>Login</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				//1.보호할 타겟 URL을 요청 시
				//- [정상]등록된 역할명 안에서 시큐리티 보안 정책으로 설정된 역할명을 가지고 요청 시
				//	정상 접근이 가능하다.
				//- [실패]등록된 역할명 안에서 시큐리티 보안 정책으로 설정된 역할명과 다른 역할명으로
				//	요청 시 403 Forbidden 에러가 발생한다.
				//- [실패]등록되지 않은 역할명으로 요청 시, 잘못된 정보를 통해 요청한 것이므로
				//	로그인 에러 정보를 들고 로그인 실패 페이지로 이동한다.
				//
				//2. 보호할 타겟 URL이 아닌 login.jsp에서 직접 요청 시
				//- 가장 먼저 최종 넘어갈 타겟 정보가 없다.
				//- [실패]등록된 역할명 안에서 시큐리티 보안 정책으로 설정된 역할명을 가지고 요청 시
				// 	400 Bad Request 에러가 발생한다.
				//- [실패]등록된 역할명 안에서 시큐리티 보안 정책으로 설정된 역할명을 가지고 요청 하는데
				//	이때, 비밀번호가 틀리다면 잘못된 요청이므로 로그인 에러 정보를 들고 로그인 실패
				//	페이지로 이동한다.
				//- [실패]등록된 역할명 안에서 시큐리티 보안 정책으로 설정되지 않은 역할명을 가지고
				//	요청 시, 400 Bad Request 에러가 발생한다.
				
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요!");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label> 
					<input	type="text" class="form-control" placeholder="ID" name="j_username" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label> 
					<input 	type="password" class="form-control" placeholder="Password" name="j_password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div> 
</body>
</html>