<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AlgoGuru</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="main-content">
		<div class="nav-bar">
			<div class="center">
				<div class="algo-guru">AlgoGuru</div>
				<div class="ace-interview">Ace the technical Interviews</div>
			</div>


			<div>
				<nav class="nav-bar-items">
					<a href="/">Home</a> <a href="/dashboard">Content</a> <a href="/profile">Team</a>
				</nav>
			</div>

			<div class="nav-bar-items">
				<c:if test="${userId == null}">
					<a href="/login_register">Log In</a>
				</c:if>
				<c:if test="${userId != null}">
					<a href="/logout">Logout</a>
				</c:if>
			</div>
		</div>
	</div>

	<div class="registration-login-page">
		<div>
			<h3>Register:</h3>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<form:errors path="*" style="color: red" />
				<div class="form-group">
					<label>First name:</label>
					<form:input path="firstName" class="form-control" />
				</div>
				
				<div class="form-group">
					<label>Last name:</label>
					<form:input path="lastName" class="form-control" />
				</div>

				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
				</div>

				<div class="form-group">
					<label>Password:</label>
					<form:input type="password" path="password" class="form-control" />
				</div>

				<div class="form-group">
					<label>Confirm Password:</label>
					<form:input type="password" path="confirm" class="form-control" />
				</div>
				<input type="submit" value="Register" class="btn btn-primary" />
			</form:form>
		</div>

		<div>
			<h3>Login:</h3>
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<form:errors path="*" style="color: red" />
				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
				</div>

				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
				</div>

				<input type="submit" value="Login" class="btn btn-success" />
			</form:form>
		</div>
	</div>
</body>
</html>