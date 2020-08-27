<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Other meta tags -->
    <meta name="Description" content="Home page"> <!-- Explanation that shows up in search engines goes here.-->
    <!--<script src="js/time.js"></script>-->
    <!--<link rel="stylesheet" type="text/css" href="CSS/time_styles.css">--><!-- CSS page goes here - check the name of the file and make sure it matches with the one for href!-->
</head>
<body>
	<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
	<p><a href="/logout">Log out</a></p>
	<p>Number of orbs: <c:out value="${user.orbBalance}"/></p>
	<p>Earliest day: <c:out value="${earliestDay.orbDate}"/></p>
	<p>Newest day: <c:out value="${newestDay.orbDate}"/></p>
	<c:choose>
		<c:when test="${days.contains(earliestDay)}">
			<p><a href="/add_oldest_month">Add oldest month</a>: Earliest day is in this month</p>
		</c:when>
		<c:otherwise>
			<p><a href="/prev_month">Previous month</a></p>
		</c:otherwise>
	</c:choose> 
	<c:choose>
		<c:when test="${days.contains(newestDay)}">
			<p><a href="/add_newest_month">Add newest month</a>: Newest day is in this month</p>
		</c:when>
		<c:otherwise>
			<p><a href="/next_month">Next month</a></p>
		</c:otherwise>
	</c:choose>	
	
	<table>
	    <thead>
	        <tr>
	            <th>Type of event</th>
	            <c:forEach items="${days}" var="day">
	            	<th><a href="/days/${day.id}/edit"><fmt:formatDate pattern = "M/d" value = "${day.orbDate}" /></a></th>
	            </c:forEach>
	        </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>Story/Paralogue</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.storyParalogueOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Chain Challenge</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.chainChallengeOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Squad Assault</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.squadAssaultOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Arena</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.arenaOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Rival Domains</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.rivalDomainsOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Hero Battles</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.heroBattleOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Tactics Drills</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.tacticsDrillOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Allegiance Battles</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.allegianceBattleOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Tempest Trials</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.tempestTrialsOrbs}"/></td>
	            </c:forEach>
	        </tr>
	        <tr>
	            <td>Tap Battle</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.tapBattleOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Grand Conquests/Rokkr Sieges</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.grandConquestRokkrSiegesOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Forging Bonds/Hall of Forms</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.forgingBondsHallOfFormsOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Lost Lore</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.lostLoreOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Quests</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.questOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Log-in bonuses</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.loginBonusOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Other events</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.eventOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	        <tr>
	            <td>Compensation</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.compensationOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	    	<tr>
	            <td>DAILY TOTALS</td>
	    		<c:forEach items="${days}" var="day">
	            	<td><c:out value="${day.totalOrbs}"/></td>
	            </c:forEach>
	    	</tr>
	    </tbody>
	</table>
	<form:form action="/edit_orb_count" method="post" modelAttribute="user">
    	<input type="hidden" name="_method" value="put">
    	<p>
	    	<form:label path="orbBalance">Edit orb balance:</form:label>
	        <form:errors path="orbBalance"/>
	        <form:input path="orbBalance"/>
        </p>
    	<input type="submit" value="Submit"/>
   	</form:form>
	<form method="POST" action="/calculate_orbs">
		<p><c:out value="${dateError}"/></p>
		<p>
			<label for="startDate">Starting date:</label>
			<input type="date" id="startDate" name="startDate" value="${startingDate}"/>
		</p>
		<p>
			<label for="endDate">Ending date:</label>
			<input type="date" id="endDate" name="endDate" value="${endingDate}"/>
		</p>
		<input type="submit" value="Submit" />
		<p>Total orbs: <c:out value="${totalOrbs}"/></p>
	</form>
</body>
</html>