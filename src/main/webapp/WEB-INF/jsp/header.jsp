<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>UrbanAdvisor</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    <c:url var="cssHref" value="/css/site.css" />
		<link rel="stylesheet" href="${cssHref}">
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("time.timeago").timeago();
				
				$("#logoutLink").click(function(event){
					$("#logoutForm").submit();
				});
				
				var pathname = window.location.pathname;
				$("nav a[href='"+pathname+"']").parent().addClass("active");
			});
			
			// When the user scrolls the page, execute myFunction 
			window.onscroll = function() {myFunction()};

			// Get the navbar
			var navbar = document.getElementById("navbar");

			// Get the offset position of the navbar
			var sticky = navbar.offsetTop;

			// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
			function myFunction() {
			  if (window.pageYOffset >= sticky) {
			    navbar.classList.add("sticky")
			  } else {
			    navbar.classList.remove("sticky");
			  }
			};
		</script>
		
		
		
		<script src="//use.edgefonts.net/yeseva-one;source-sans-pro.js"></script>
		
	</head>
	<body>
		<header>
			<div class="container-fluid">
				<c:url var="homePageHref" value="/" />
				<c:url var="imgSrc" value="/img/urban-logo.png" />
				<div id="logo" >
					<a href="${homePageHref}"><img src="${imgSrc}" class="img-responsive logo" />
					<h1 class="logo" >urban</h1><h2 class="logo">advisor</h2></a>
				</div>
			
				<c:if test="${not empty currentUser}">
					<p id="currentUser">Welcome, ${currentUser}</p>
				</c:if>		
			</div>
		</header>
		
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					<c:url var="homePageHref" value="/" />
					<li><a href="${homePageHref}">Home</a></li>
					<c:if test="${not empty currentUser}">
						<c:url var="dashboardHref" value="/users/${currentUser}" />
						<!--  
						<li><a href="${dashboardHref}">Private Messages</a></li>
						<c:url var="newMessageHref" value="/users/${currentUser}/messages/new" />
						<li><a href="${newMessageHref}">New Message</a></li>
						<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
						<li><a href="${sentMessagesHref}">Sent Messages</a></li>
						-->
						<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" />
						<li><a href="${changePasswordHref}">Change Password</a></li>
					</c:if>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty currentUser}">
							<c:url var="newUserHref" value="/users/new" />
							<li><a href="${newUserHref}">Sign Up</a></li>
							<c:url var="loginHref" value="/login" />
							<li><a href="${loginHref}">Log In</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="logoutAction" value="/logout" />
							<form id="logoutForm" action="${logoutAction}" method="POST"></form>
							<li><a id="logoutLink" href="#">Log Out</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	<!--  	<div class="container"> THIS IS THE CODE THAT WAS BREAKING THE MAP --> 