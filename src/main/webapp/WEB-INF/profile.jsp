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
	<div class="profile">
		<div class="profile-content">
			<h1>Man Duong</h1>
			<h4>Founder</h4>
		</div>
		<div>
			<img class="profile-picture" alt="Founder profile picture"
				src="/images/profile.jpg"> 
			<a href="https://www.linkedin.com/in/man-duong/"><img class="linkedin-icon"
				alt="LinkedIn icon" src="/images/linkedin.png"></a>
		</div>
		<div class="man-background">
			Man is a Full-Stack Software Engineer. After graduating with a degree in Biochemistry from California State University, Long Beach in June 2013, he decided to learn programming and to enroll in Coding Dojo, an immersive coding bootcamp in Sunnyvale, California. While there, he fell in love with full-stack web development using 3 languages: Python, Javascript, and Java. The frustration that he felt during his interview prep led him to creating AlgoGuru. He is using AlgoGuru to prepare for the upcoming Amazon interview. 
		</div>
	</div>

</body>
</html>