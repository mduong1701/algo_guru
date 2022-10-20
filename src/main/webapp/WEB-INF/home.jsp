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
				<div class="ace-interview">Ace the Technical Interviews</div>
			</div>


			<div>
				<nav class="nav-bar-items">
					<a href="/">Home</a> <a href="/dashboard">Content</a> <a
						href="/profile">Team</a>
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
	<div class="what-is-algoguru">
		<h1>What is AlgoGuru?</h1>
		<h2>The ultimate resource to prepare for coding interviews.</h2>
		<h2>Everything you need, in one streamlined platform.</h2>
		<div>
			<a class="check-it-out" href="/dashboard">Check it out</a>
		</div>
	</div>
	<div class="hand-picked-questions">
		<h1>50+ Hand-Picked Questions</h1>
		<h2>Coding interview prep is a number game that many candidates
			lose. We've hand-picked 50 of the best coding interview questions to
			prepare you for every interview you could encounter.</h2>
	</div>

</body>
</html>