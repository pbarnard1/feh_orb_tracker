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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="../js/main.js"></script>
    <link rel="stylesheet" type="text/css" href="../CSS/main_styles.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-info">
		<a class="navbar-brand" href="#"><c:out value="${user.userName}"/>'s page</a>
		<a class="navbar-brand" href="#">Orb count: <c:out value="${user.orbBalance}"/></a>
		<div class="collapse navbar-collapse">
	  		<ul class="navbar-nav">
		        <li class="nav-item">
		            <a class="nav-link" href="#" id="orbBalanceButton" role="button" data-toggle="modal" data-target="#myOrbBalance">Edit orb balance</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link ${preload}" href="#" id="orbDateButton" role="button" data-toggle="modal" data-target="#orbsBetweenDates">Get orbs between dates</a>
		        </li>
		    </ul>
	    </div>
	    <a href="/logout" class="btn btn-danger btn-lg" role="button" aria-pressed="true">Log out</a>
	</nav>
	<div class="main-container">
		<!-- Modal for orb balance -->
		<div class="modal fade" data-backdrop="static" id="myOrbBalance" tabindex="-1" aria-labelledby="viewMyOrbBalance" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		            <h5 class="modal-title" id="viewMyOrbBalnace">Edit orb balance</h5>
		            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>
		            </div>
		            <form:form action="/edit_orb_count" id="editOrbCount" method="post" modelAttribute="user">
		            	<input type="hidden" name="_method" value="put">
			            <div class="modal-body">
			            	<div class="form-group">
						    	<form:label path="orbBalance">Edit orb balance:</form:label>
						        <form:input class="form-control" path="orbBalance"/>
						        <div class="invalid-feedback">
	       							<form:errors path="orbBalance"/>
	       							Value must be an integer
	      						</div>
					        </div>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			                <button type="submit" class="btn btn-primary">Submit</button>
			            </div>
		            </form:form>
		        </div>
		    </div>
		</div>
		<!-- Modal for orbs between dates -->
		<div class="modal fade" data-backdrop="static" id="orbsBetweenDates" tabindex="-1" aria-labelledby="getOrbsBetweenDates" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-centered">
		        <div class="modal-content">
		            <div class="modal-header">
		            <h5 class="modal-title" id="getOrbsBetweenDates">Get orbs between two dates</h5>
		            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>
		            </div>
		            <form method="POST" id="calculateOrbs" action="/calculate_orbs">
		            	<div class="modal-body">
		            		<div class="form-row">
		            			<div class="col-md-6 mb-3">
		            				<label for="startDate">Starting date:</label>
									<input type="date" class="form-control" id="startDate" name="startDate" value="${startingDate}"/>
									<div class="invalid-feedback">
	       								Starting date must be before ending date
	      							</div>
		            			</div>
		            			<div class="col-md-6 mb-3">
		            				<label for="endDate">Ending date:</label>
									<input type="date" class="form-control" id="endDate" name="endDate" value="${endingDate}"/>
									<div class="invalid-feedback">
	       								Starting date must be before ending date
	      							</div>
		            			</div>
		            		</div>
		            		<div class="form-row">
		            			Total orbs: <c:out value="${totalOrbs}"/>
		            		</div>
	            		</div>
	            		<div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			                <button type="submit" class="btn btn-primary">Submit</button>
		            	</div>
					</form>
		        </div>
		    </div>
		</div>
		<!-- 
		<p>Earliest day: <c:out value="${earliestDay.orbDate}"/></p>
		<p>Newest day: <c:out value="${newestDay.orbDate}"/></p>
		-->
		<div class="table_bar">
			<c:choose>
				<c:when test="${days.contains(earliestDay)}">
					<a href="/add_oldest_month" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Add oldest month</a>
				</c:when>
				<c:otherwise>
					<a href="/prev_month" class="btn btn-primary btn-lg" role="button" aria-pressed="true"><c:out value="${prevMonth}"/></a>
				</c:otherwise>
			</c:choose>
			
			<span> <c:out value="${thisMonth}"/> </span>
			
			<c:choose>
				<c:when test="${days.contains(newestDay)}">
					<a href="/add_newest_month" class="btn btn-primary btn-lg" role="button" aria-pressed="true">Add newest month</a>
				</c:when>
				<c:otherwise>
					<a href="/next_month" class="btn btn-primary btn-lg" role="button" aria-pressed="true"><c:out value="${nextMonth}"/></a>
				</c:otherwise>
			</c:choose>
		</div>
		<table class="mainTable">
		    <thead>
		        <tr>
		            <th class="leadCell">Type of event</th>
		            <c:forEach items="${days}" var="day">
		            	<th><a href="/days/${day.id}/edit"><fmt:formatDate pattern = "M/d" value = "${day.orbDate}" /></a></th>
		            </c:forEach>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr>
		    		<td class="leadCell">Story/Paralogue</td>
		    		<c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.storyParalogueOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.storyParalogueDesc}"><c:out value="${day.storyParalogueOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Chain Challenge</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.chainChallengeOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.chainChallengeDesc}"><c:out value="${day.chainChallengeOrbs}"/></a></td>y.storyParalogueOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Squad Assault</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.squadAssaultOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.squadAssaultDesc}"><c:out value="${day.squadAssaultOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Arena</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.arenaOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.arenaDesc}"><c:out value="${day.arenaOrbs}"/></a></td>
		            		</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Rival Domains</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.rivalDomainsOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.rivalDomainsDesc}"><c:out value="${day.rivalDomainsOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Hero Battles</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.heroBattleOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.heroBattleDesc}"><c:out value="${day.heroBattleOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Tactics Drills</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.tacticsDrillOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.tacticsDrillDesc}"><c:out value="${day.tacticsDrillOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Allegiance Battles</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.allegianceBattleOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.allegianceBattleDesc}"><c:out value="${day.allegianceBattleOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Tempest Trials</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.tempestTrialsOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.tempestTrialsDesc}"><c:out value="${day.tempestTrialsOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		        </tr>
		        <tr>
		            <td class="leadCell">Tap Battle</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.tapBattleOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.tapBattleDesc}"><c:out value="${day.tapBattleOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Grand Conquests/Rokkr Sieges</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.grandConquestRokkrSiegesOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.grandConquestRokkrSiegesDesc}"><c:out value="${day.grandConquestRokkrSiegesOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Forging Bonds/Hall of Forms</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.forgingBondsHallOfFormsOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.forgingBondsHallOfFormsDesc}"><c:out value="${day.forgingBondsHallOfFormsOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Lost Lore</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.lostLoreOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.lostLoreDesc}"><c:out value="${day.lostLoreOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Quests</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.questOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.questDesc}"><c:out value="${day.questOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Log-in bonuses</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.loginBonusOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.loginBonusDesc}"><c:out value="${day.loginBonusOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Other events</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.eventOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.eventDesc}"><c:out value="${day.eventOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		        <tr>
		            <td class="leadCell">Compensation</td>
		            <c:forEach items="${days}" var="day">
			    		<c:choose>
							<c:when test="${day.compensationOrbs > 0}">
								<td><a href="#" data-toggle="tooltip" data-placement="right" title="${day.compensationDesc}"><c:out value="${day.compensationOrbs}"/></a></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
		            </c:forEach>
		    	</tr>
		    	<tr>
		            <td class="leadCell boldCell">DAILY TOTALS</td>
		    		<c:forEach items="${days}" var="day">
		            	<td class="boldCell"><c:out value="${day.totalOrbs}"/></td>
		            </c:forEach>
		    	</tr>
		    </tbody>
		</table>
	</div>
</body>
</html>