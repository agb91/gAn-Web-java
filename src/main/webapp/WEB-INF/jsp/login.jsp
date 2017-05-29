

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html lang="en">
    <head>
		<title>gAn web interface</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-8">
		<script src="jquery.js"></script>
		<script src="jquery-ui/jquery-ui.js"></script>
		<script src="JS/login.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet" >
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		<link href="CSS/logPage.css" rel="stylesheet" media="screen">
	</head>
    <body class="indexGeneral">
		<div id = "commonTop" class="col-xs-12">
		       <div class="row">
		           <div class="col-xs-3"></div>
		           <div class="col-xs-6">
		               <img src="img/aegisLogo-black.gif" class="logoImage">
		           </div>
		           <div class="col-xs-3"></div>
		       </div>
		   </div>
		   <div class = "space">
		</div>
	    <div class="container">
			<h2 class="form-signin-heading">Insert AEgIS experiment's password to start</h2>
	        <form th:action="@{/login}" method="post" class="form-signin">
	            <div><label> User Name:  </label><input class="form-control" type="text" name="username"/></div>
	            <div><label> Password:  </label><input class="form-control" type="password" name="password"/> </div>
	            <div><input type="submit" value="Sign In"  class="btn btn-lg btn-primary btn-block"/></div>
	        </form>
	    </div>    
    </body>
</html>

