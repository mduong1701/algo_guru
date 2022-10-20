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
	<h1>Create a new question</h1>

	<form:form action="/submit_question" method="post"
		modelAttribute="newQuestion">

		<table>
			<thead>
				<tr>
					<td class="float-left">Title:</td>
					<td class="float-left"><form:errors path="title"
							class="text-danger" /> <form:input class="input" path="title" />
					</td>
				</tr>
				<tr>
					<td class="float-left">Content:</td>
					<td class="float-left"><form:errors path="content"
							class="text-danger" /> <form:textarea rows="4" class="input"
							path="content" /></td>
				</tr>

				<tr>
					<td class="float-left">Answer:</td>
					<td class="float-left"><form:errors path="answer"
							class="text-danger" /> <form:textarea rows="4" class="input"
							path="answer" /></td>
				</tr>

				<tr>
					<td class="float-left">Category:</td>
					<td class="float-left">
						<form:errors path="category" class="text-danger" /> 
						<form:select path="category">
							<c:forEach items="${allCategories}" var="cat">
								<form:option value="${cat}">${cat.name}</form:option>
							</c:forEach>
						</form:select></td>
				</tr>

				<tr>
					<td colspan=2><input class="input" class="button"
						type="submit" value="Submit" /></td>
				</tr>
			</thead>
		</table>
	</form:form>
</body>
</html>