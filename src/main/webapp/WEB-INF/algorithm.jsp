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
<title>Mango</title>
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

	<div class="dashboard-boxes">
		<div class="algo-box">
			<h3 class="center" style="color: green">Array</h3>
			<c:forEach items="${questions}" var="question">
				<c:if test="${question.category.name.equals('array')}">
					<a class="questions" href="/questions/${question.id}">${question.id} - ${question.title}</a>
				</c:if>
			</c:forEach>
		</div>

		<div class="algo-box">
			<h3 class="center" style="color: yellow">Binary Search Tree</h3>
			<c:forEach items="${questions}" var="question">
				<c:if test="${question.category.name.equals('binary_search_tree')}">
					<a class="questions" href="/questions/${question.id}">${question.id} - ${question.title}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="algo-box">
			<h3 class="center" style="color: pink">Linked List</h3>
			<c:forEach items="${questions}" var="question">
				<c:if test="${question.category.name.equals('linked_list')}">
					<a class="questions" href="/questions/${question.id}">${question.id} - ${question.title}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="algo-box">
			<h3 class="center" style="color: orange">Recursion</h3>
			<c:forEach items="${questions}" var="question">
				<c:if test="${question.category.name.equals('recursion')}">
					<a class="questions" href="/questions/${question.id}">${question.id} - ${question.title}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="algo-box">
			<h3 class="center" style="color: purple">Stack</h3>
			<c:forEach items="${questions}" var="question">
				<c:if test="${question.category.name.equals('stack')}">
					<a class="questions" href="/questions/${question.id}">${question.id} - ${question.title}</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="algo-box">
			<h3 class="center" style="color: red">Queue</h3>
			<c:forEach items="${questions}" var="question">
				<c:if test="${question.category.name.equals('queue')}">
					<a class="questions" href="/questions/${question.id}">${question.id} - ${question.title}</a>
				</c:if>
			</c:forEach>
		</div>
	</div>

</body>
</html>