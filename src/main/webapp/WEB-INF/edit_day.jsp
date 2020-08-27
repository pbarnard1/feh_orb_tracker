<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit day</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Other meta tags -->
    <meta name="Description" content="Edit day"> <!-- Explanation that shows up in search engines goes here.-->
    <!--<script src="js/time.js"></script>-->
    <!--<link rel="stylesheet" type="text/css" href="CSS/time_styles.css">--><!-- CSS page goes here - check the name of the file and make sure it matches with the one for href!-->
</head>
<body>
	<h1>Edit <fmt:formatDate pattern = "MMMM d, yyyy" value = "${fehDay.orbDate}" /></h1>
	
	
	<form:form action="/days/${fehDay.id}/edit" method="post" modelAttribute="fehDay">
    	<input type="hidden" name="_method" value="put">
    	<p><c:out value="${errorMessage}"/></p>
        
        <p>
            <form:label path="storyParalogueOrbs">Story/Paralogue orbs:</form:label>
            <form:errors path="storyParalogueOrbs"/>
            <form:input type="number" path="storyParalogueOrbs"/>
            <form:label path="storyParalogueDesc">Description:</form:label>
            <form:errors path="storyParalogueDesc"/>
            <form:input path="storyParalogueDesc"/>
        </p>
        <p>
            <form:label path="chainChallengeOrbs">Chain Challenge orbs:</form:label>
            <form:errors path="chainChallengeOrbs"/>
            <form:input type="number" path="chainChallengeOrbs"/>
            <form:label path="chainChallengeDesc">Description:</form:label>
            <form:errors path="chainChallengeDesc"/>
            <form:input path="chainChallengeDesc"/>
        </p>
        <p>
            <form:label path="squadAssaultOrbs">Squad Assault orbs:</form:label>
            <form:errors path="squadAssaultOrbs"/>
            <form:input type="number" path="squadAssaultOrbs"/>
            <form:label path="squadAssaultDesc">Description:</form:label>
            <form:errors path="squadAssaultDesc"/>
            <form:input path="squadAssaultDesc"/>
        </p>
        <p>
            <form:label path="arenaOrbs">Arena orbs:</form:label>
            <form:errors path="arenaOrbs"/>
            <form:input type="number" path="arenaOrbs"/>
            <form:label path="arenaDesc">Description:</form:label>
            <form:errors path="arenaDesc"/>
            <form:input path="arenaDesc"/>
        </p>
        <p>
            <form:label path="rivalDomainsOrbs">Rival Domains orbs:</form:label>
            <form:errors path="rivalDomainsOrbs"/>
            <form:input type="number" path="rivalDomainsOrbs"/>
            <form:label path="rivalDomainsDesc">Description:</form:label>
            <form:errors path="rivalDomainsDesc"/>
            <form:input path="rivalDomainsDesc"/>
        </p>
        <p>
            <form:label path="heroBattleOrbs">Hero Battle orbs:</form:label>
            <form:errors path="heroBattleOrbs"/>
            <form:input type="number" path="heroBattleOrbs"/>
            <form:label path="heroBattleDesc">Description:</form:label>
            <form:errors path="heroBattleDesc"/>
            <form:input path="heroBattleDesc"/>
        </p>
        <p>
            <form:label path="tacticsDrillOrbs">Tactics Drill orbs:</form:label>
            <form:errors path="tacticsDrillOrbs"/>
            <form:input type="number" path="tacticsDrillOrbs"/>
            <form:label path="tacticsDrillDesc">Description:</form:label>
            <form:errors path="tacticsDrillDesc"/>
            <form:input path="tacticsDrillDesc"/>
        </p>
        <p>
            <form:label path="allegianceBattleOrbs">Allegiance Battle orbs:</form:label>
            <form:errors path="allegianceBattleOrbs"/>
            <form:input type="number" path="allegianceBattleOrbs"/>
            <form:label path="allegianceBattleDesc">Description:</form:label>
            <form:errors path="allegianceBattleDesc"/>
            <form:input path="allegianceBattleDesc"/>
        </p>
        <p>
            <form:label path="tempestTrialsOrbs">Tempest Trial orbs:</form:label>
            <form:errors path="tempestTrialsOrbs"/>
            <form:input type="number" path="tempestTrialsOrbs"/>
            <form:label path="tempestTrialsDesc">Description:</form:label>
            <form:errors path="tempestTrialsDesc"/>
            <form:input path="tempestTrialsDesc"/>
        </p>
        <p>
            <form:label path="tapBattleOrbs">Tap Battle orbs:</form:label>
            <form:errors path="tapBattleOrbs"/>
            <form:input type="number" path="tapBattleOrbs"/>
            <form:label path="tapBattleDesc">Description:</form:label>
            <form:errors path="tapBattleDesc"/>
            <form:input path="tapBattleDesc"/>
        </p>
        <p>
            <form:label path="grandConquestRokkrSiegesOrbs">Grand Conquest/Rokkr Sieges orbs:</form:label>
            <form:errors path="grandConquestRokkrSiegesOrbs"/>
            <form:input type="number" path="grandConquestRokkrSiegesOrbs"/>
            <form:label path="grandConquestRokkrSiegesDesc">Description:</form:label>
            <form:errors path="grandConquestRokkrSiegesDesc"/>
            <form:input path="grandConquestRokkrSiegesDesc"/>
        </p>
        <p>
            <form:label path="forgingBondsHallOfFormsOrbs">Forging Bonds/Hall of Forms orbs:</form:label>
            <form:errors path="forgingBondsHallOfFormsOrbs"/>
            <form:input type="number" path="forgingBondsHallOfFormsOrbs"/>
            <form:label path="forgingBondsHallOfFormsDesc">Description:</form:label>
            <form:errors path="forgingBondsHallOfFormsDesc"/>
            <form:input path="forgingBondsHallOfFormsDesc"/>
        </p>
        <p>
            <form:label path="lostLoreOrbs">Lost Lore orbs:</form:label>
            <form:errors path="lostLoreOrbs"/>
            <form:input type="number" path="lostLoreOrbs"/>
            <form:label path="lostLoreDesc">Description:</form:label>
            <form:errors path="lostLoreDesc"/>
            <form:input path="lostLoreDesc"/>
        </p>
        <p>
            <form:label path="questOrbs">Quest orbs:</form:label>
            <form:errors path="questOrbs"/>
            <form:input type="number" path="questOrbs"/>
            <form:label path="questDesc">Description:</form:label>
            <form:errors path="questDesc"/>
            <form:input path="questDesc"/>
        </p>
        <p>
            <form:label path="loginBonusOrbs">Log-in bonus orbs:</form:label>
            <form:errors path="loginBonusOrbs"/>
            <form:input type="number" path="loginBonusOrbs"/>
            <form:label path="loginBonusDesc">Description:</form:label>
            <form:errors path="loginBonusDesc"/>
            <form:input path="loginBonusDesc"/>
        </p>
        <p>
            <form:label path="eventOrbs">Event orbs:</form:label>
            <form:errors path="eventOrbs"/>
            <form:input type="number" path="eventOrbs"/>
            <form:label path="eventDesc">Description:</form:label>
            <form:errors path="eventDesc"/>
            <form:input path="eventDesc"/>
        </p>
        <p>
            <form:label path="compensationOrbs">Compensation orbs:</form:label>
            <form:errors path="compensationOrbs"/>
            <form:input type="number" path="compensationOrbs"/>
            <form:label path="compensationDesc">Description:</form:label>
            <form:errors path="compensationDesc"/>
            <form:input path="compensationDesc"/>
        </p>
        <input type="submit" value="Submit"/>
   	</form:form>
</body>
</html>