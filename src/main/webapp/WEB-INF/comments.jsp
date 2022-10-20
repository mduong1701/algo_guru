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
					<a href="/dashboard">Home</a> <a href="/algorithm">Content</a> <a href="/profile">Team</a>
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


	<div class="comment-form">
		<h3>Question Details</h3>
		<div>
			<div class="question-items">Question:</div>
			<c:out value="${question.title}"></c:out>
			<hr />
			<div class="question-items">Category:</div>
			<c:out value="${question.category.name}"></c:out>
			<hr />
			<div class="question-items">Content:</div>
			<pre>
				<c:out value="${question.content}"></c:out>
			</pre>
		</div>
		<form:form action="/questions/${question.id}/comments" method="post"
			modelAttribute="com">
			<table>
				<thead>
					<tr>
						<td class="float-left">Add a comment</td>
						<td class="float-left"><form:errors path="comment"
								class="text-danger" /> <form:textarea rows="10" cols="100"
								class="input" path="comment" /></td>
					</tr>
					<tr>
						<td colspan=2><input class="input" class="button"
							type="submit" value="Submit" /></td>
					</tr>
				</thead>
			</table>
		</form:form>
		<h5>
			<a class="button-show" href="/questions/${question.id}">Back</a>
	</h5>
	</div>
	
	<hr>
	<div class="comments-box">
		<c:forEach var="com" items="${comments}">
			<h4>
				<c:out value="${com.writer.firstName}"></c:out>
				(<fmt:formatDate value="${com.createdAt}" pattern="h:mm a MMMM dd" />)
				:
			</h4>
			<%-- <p><c:out value="${com.comment}"></c:out></p> --%>
			<pre>
				<c:out value="${com.comment}" />
			</pre>
		</c:forEach>
	</div>
</body>
</html>