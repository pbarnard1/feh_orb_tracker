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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="/js/login.js"></script>
    <link rel="stylesheet" type="text/css" href="../CSS/login.css"> <!-- CSS page goes here - check the name of the file and make sure it matches with the one for href!-->
</head>
<body>
	<div class="headline">
		<h1>Fire Emblem Heroes orb organizer and tracker</h1>
	</div>
    <div class="mainContainer">
    	<div class="registerLeft">
    		<h1>Registration</h1>
		    <!-- 
		    <p><form:errors path="user.*"/></p>
		    <p><c:out value="${registrationError}"/></p>
		     -->
		    <form:form method="POST" action="/registration" modelAttribute="user">
		        <div class="form-group">
		            <form:label path="userName">User name:</form:label>
		            <form:input class="form-control ${invalidUserName}" path="userName" />
		            <div class="invalid-feedback">
		        		<c:out value="${userError}" />
		        	</div>
		        </div>
		        <div class="form-group">
		            <form:label path="email">E-mail:</form:label>
		            <form:input type="email" class="form-control ${invalidEmail}" path="email" />
		            <div class="invalid-feedback">
		        		<c:out value="${emailError}" />
		        	</div>
		        </div>
		        <div class="form-group">
		            <form:label path="password">Password:</form:label>
		            <form:password class="form-control ${invalidPassword}" path="password"/>
		            <div class="invalid-feedback">
		        		<c:out value="${passwordError}" />
		        	</div>
		        </div>
		        <div class="form-group">
		            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
		            <form:password class="form-control ${invalidPassword}" path="passwordConfirmation"/>
		            <div class="invalid-feedback">
		        		<c:out value="${passwordError}" />
		        	</div>
		        </div>
		        <button type="submit" class="btn btn-primary">Register</button>
		    </form:form>  	
    	</div>
    	<div class="loginRight">
    		<h1>Log in</h1>
		    <form method="post" action="/login">
		        <div class="form-group">
		            <label for="email">E-mail:</label>
		            <input type="text" class="form-control ${invalidLogin}" id="email" name="email" value=<c:out value="${email}"/>>
		            <div class="invalid-feedback">
		        		<c:out value="${loginError}" />
		        	</div>
		        </div>
		        <div class="form-group">
		            <label for="password">Password:</label>
		            <input type="password" class="form-control ${invalidLogin}" id="password" name="password"/>
		            <div class="invalid-feedback">
		        		<c:out value="${loginError}" />
		        	</div>
		        </div>
		        <button type="submit" class="btn btn-primary">Log in</button>
		    </form>
    	</div>
    </div>
</body>
</html>