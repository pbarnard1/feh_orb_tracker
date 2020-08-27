<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Log-in/registration page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Other meta tags -->
    <meta name="Description" content="Log-in/registration page"> <!-- Explanation that shows up in search engines goes here.-->
    <!--<script src="js/time.js"></script>-->
    <!--<link rel="stylesheet" type="text/css" href="CSS/time_styles.css">--><!-- CSS page goes here - check the name of the file and make sure it matches with the one for href!-->
</head>
<body>
	<h1>Registration</h1>
    <p><form:errors path="user.*"/></p>
    <p><c:out value="${registrationError}"/></p>
    <form:form method="POST" action="/registration" modelAttribute="user">
        <p>
            <form:label path="userName">User name:</form:label>
            <form:input path="userName" />
        </p>
        <p>
            <form:label path="email">E-mail:</form:label>
            <form:input type="email" path="email" />
        </p>
        <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <input type="submit" value="Register!"/>
    </form:form>
    <p><c:out value="${loginError}" /></p>
    <form method="post" action="/login">
        <p>
            <label for="email">E-mail:</label>
            <input type="text" id="email" name="email" value=<c:out value="${email}"></c:out>>
        </p>
        <p>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"/>
        </p>
        <input type="submit" value="Log in"/>
    </form>
</body>
</html>