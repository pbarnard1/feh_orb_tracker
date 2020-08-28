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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="/js/edit_day.js"></script>
    <link rel="stylesheet" type="text/css" href="/CSS/edit_day.css">
</head>
<body>
	<h1>Edit <fmt:formatDate pattern = "MMMM d, yyyy" value = "${fehDay.orbDate}" /></h1>
	<form:form id="editDayForm" action="/days/${fehDay.id}/edit" method="post" modelAttribute="fehDay">
    	<input type="hidden" name="_method" value="put">
    	<p><c:out value="${errorMessage}"/></p>
        
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="storyParalogueOrbs">Story/Paralogue orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="storyParalogueOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="storyParalogueOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="storyParalogueDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="storyParalogueDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="storyParalogueDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="chainChallengeOrbs">Chain Challenge orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="chainChallengeOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="chainChallengeOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="chainChallengeDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="chainChallengeDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="chainChallengeDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="squadAssaultOrbs">Squad Assault orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="squadAssaultOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="squadAssaultOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="squadAssaultDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="squadAssaultDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="squadAssaultDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="arenaOrbs">Arena orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="arenaOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="arenaOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="arenaDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="arenaDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="arenaDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="rivalDomainsOrbs">Rival Domains orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="rivalDomainsOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="rivalDomainsOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="rivalDomainsDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="rivalDomainsDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="rivalDomainsDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="heroBattleOrbs">Hero Battle orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="heroBattleOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="heroBattleOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="heroBattleDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="heroBattleDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="heroBattleDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="tacticsDrillOrbs">Tactics Drill orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="tacticsDrillOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="tacticsDrillOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="tacticsDrillDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="tacticsDrillDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="tacticsDrillDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="allegianceBattleOrbs">Allegiance Battle orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="allegianceBattleOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="allegianceBattleOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="allegianceBattleDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="allegianceBattleDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="allegianceBattleDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="tempestTrialsOrbs">Tempest Trials orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="tempestTrialsOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="tempestTrialsOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="tempestTrialsDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="tempestTrialsDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="tempestTrialsDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="tapBattleOrbs">Tap Battle orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="tapBattleOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="tapBattleOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="tapBattleDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="tapBattleDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="tapBattleDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="grandConquestRokkrSiegesOrbs">Grand Conquest/Rokkr Sieges orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="grandConquestRokkrSiegesOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="grandConquestRokkrSiegesOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="grandConquestRokkrSiegesDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="grandConquestRokkrSiegesDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="grandConquestRokkrSiegesDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="forgingBondsHallOfFormsOrbs">Forging Bonds/Hall of Forms orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="forgingBondsHallOfFormsOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="forgingBondsHallOfFormsOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="forgingBondsHallOfFormsDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="forgingBondsHallOfFormsDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="forgingBondsHallOfFormsDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="lostLoreOrbs">Lost Lore orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="lostLoreOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="lostLoreOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="lostLoreDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="lostLoreDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="lostLoreDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="questOrbs">Quest orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="questOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="questOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="questDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="questDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="questDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="loginBonusOrbs">Log-in bonus orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="loginBonusOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="loginBonusOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="loginBonusDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="loginBonusDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="loginBonusDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="eventOrbs">Event orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="eventOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="eventOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="eventDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="eventDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="eventDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <div class="form-row">
	        <div class="col-md-6 mb-3">
		        <form:label path="compensationOrbs">Compensation orbs:</form:label>
	            <form:input class="form-control inputVal" type="number" path="compensationOrbs"/>
	            <div class="valid-feedback">
		            Value OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="compensationOrbs"/>
		            Value must be non-negative and an integer
		        </div>
	    	</div>
	    	<div class="col-md-6 mb-3">
		        <form:label path="compensationDesc">Description:</form:label>
	            <form:input class="form-control inputDesc" path="compensationDesc"/>
	            <div class="valid-feedback">
		            Text OK
		        </div>
		        <div class="invalid-feedback">
		            <form:errors path="compensationDesc"/>
		            Text field cannot be empty if orb value is positive
		        </div>
	    	</div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
   	</form:form>
</body>
</html>