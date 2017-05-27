<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
	<title>gAn web interface</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<script src="jquery.js"></script>
	<script src="jquery-ui/jquery-ui.js"></script>
	<script src="JS/home.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet" >
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
	<link href="CSS/home.css" rel="stylesheet" media="screen">
</head>

<body>
	<div id = "modalityWell" class="well col-xs-2 fixedTopLeft"> 
	    Sigle Run vs Multiple Run Analysis 
	</div>
	<div id = "commonTop" class="col-xs-12">
	    <div class="row">
	        <div class="col-xs-3"></div>
	        <div class="col-xs-6">
	            <img src="img/aegisLogo-black.gif" class="logoImage">
	        </div>
	        <div class="col-xs-3"></div>
	    </div>
	</div>
	<div id = "commonSemiTop" class="row releaseAegis">
		<div id='chooseModality' class='row'>
			<h3 class = 'center' > Choose your modality: Single Run vs Multiple Runs</h3>
			<div class='col-xs-4'></div>
			<div class='col-xs-4'>
				<div class='row'>
					<div class = 'col-xs-6' >
						<button id='choice0' data-toggle='tooltip' title='This modality allows you to analyze only one run at time, and to access only the single-run pre-existing analyzes' class='btn btn-primary center' onclick='selectSingleVsMultiple(0)'> Work with a Single Run </button>
				  	</div>
				  	<div class = 'col-xs-6' >
				  		<button id='choice1' data-toggle='tooltip' title='This modality allows you to analyze many runs at time, and to access only the multiple-runs pre-existing analyzes' class='btn btn-primary center' onclick='selectSingleVsMultiple(1)'> Work with Multiple Runs </button>
				    </div>
			    </div>
			</div>
		    <div class='col-xs-4'></div>
    	</div>

	    <div hidden id='changeModality' class='row' >
		    <div class='col-xs-4'></div>
			<div class='col-xs-4'>
				<button id='modalityNow' data-toggle = 'tooltip' title = 'Return to the previous screen, where you will able to choose another modality (single run vs multiple run)'  class='btn btn-primary center' onclick='changeModality()'>Return to \"Choose Modality\" Single vs Multiple</button>
		    </div>
		    <div class='col-xs-4'></div>
	    </div>
	</div>
	ciao mondo
</body>