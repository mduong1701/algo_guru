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
<title>Dashboard</title>
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
					<a href="/">Home</a> <a href="dashboard">Content</a> <a
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
	<div class="dashboard-boxes">

		<div class="dashboard-box center">
			<h3>Algorithm</h3>
			<div>
				<a class="check-it-out" href="/algorithm">Let the fun begin</a>
			</div>
		</div>

		<div class="dashboard-box">
			<h3 class="center">Behavioral Prep</h3>
			<ul>
				<li>Tell me about yourself</li>
				<li>Tell me about a time when you had to work closely with
					someone whose personality was very different from yours.</li>
				<li>Give me an example of a time you faced a conflict with a
					coworker. How did you handle that?</li>
				<li>Describe a time when you had to step up and demonstrate
					leadership skills.</li>
				<li>Tell me about a time you made a mistake and wish you’d
					handled a situation with a colleague differently.</li>
				<li>Tell me about a time you needed to get information from
					someone who wasn’t very responsive. What did you do?</li>
				<li>Describe a time when it was especially important to make a
					good impression on a client. How did you go about doing so?</li>
				<li>Give me an example of a time when you didn’t meet a
					client’s expectation. What happened, and how did you attempt to
					rectify the situation?</li>
				<li>Tell me about a time when you made sure a customer was
					pleased with your service.</li>
				<li>Describe a time when you had to interact with a difficult
					client or customer. What was the situation, and how did you handle
					it?</li>
			</ul>
		</div>
	</div>

</body>
</html>