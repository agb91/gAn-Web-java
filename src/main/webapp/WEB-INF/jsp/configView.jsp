<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
    <head>
        <title>gAn web interface</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
		<script src="jquery.js"></script>
        <script src="JS/config.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
      	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
		<link href="CSS/config.css" rel="stylesheet" media="screen">        
		<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
    </head>
    <body class="configurator">  
   		<input type="hidden" id="jsonXml" value="${readXml}"/>
		<div class = "row" >
			<ul class="nav nav-tabs navbar-default">
			    <li class="nav-item" data-toggle="tooltip" title="Write on the file">
			        <a type="submit" value="Submit" class = "nav-link active" onclick="writeToFile()">
			            <h3> Save </h3>    
			        </a>
			    </li>
			    <li class="nav-item" data-toggle="tooltip" title="Set all the default values">
			        <a class = "nav-link active" >
			            <h3> Set Default </h3>    
			        </a>
			    </li>
			    <li class="nav-item" data-toggle='tooltip' title="Return home">
			        <a class="nav-link" href="home">
			            <h3> Back Home </h3>    
			        </a>
			    </li>
			</ul>
		</div>
		      
		<br> 
		<h1>Scales Group</h1> 
		<br>
		<div class='well col-xs-7'>	
			<div class='row'>
				<div class='col-xs-12'> <label for='rebin'><h4>Histogram Scale</h4></label></div>
				<div class='col-xs-8'>
					<input onchange='moveRange(this.value)' type='range' min='1' max='6' value='4' id='rebin'/>
				</div>
				<div class='col-xs-3'>
					<label id='rangeResult'> Selected Scale: 10e4 </label>
				</div>
			</div>
			<br><br>
		</div>	
		
		<div class='down'>
			<br> 
			<h1>Sensor Enabling Group</h1> 
			<br>
		
			<div class="well col-xs-6">
				<h4 class="col-xs-12"> Campo1 possible values: </h4>
				<div class="dropdown col-xs-6">
					<button id="buttonCampo1" class="btn btn-primary dropdown-toggle buttonWidth" type="button" data-toggle="dropdown">
						${readXml.campo1}
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#" onclick="changeCampo1(0)">No</a></li>
						<li><a href="#" onclick="changeCampo1(1)">Yes</a></li>
					</ul>
				</div> 
				<div class="col-xs-6">
					<label id="labelCampo1"> campo1 now: ${readXml.campo1} </label>
				</div>
				
				<h4 class="col-xs-12"> Campo2 possible values: </h4>
				<div class="dropdown col-xs-6">
					<button id="buttonCampo2" class="btn btn-primary dropdown-toggle buttonWidth" type="button" data-toggle="dropdown">
						${readXml.campo2}
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#" onclick="changeCampo2(0)">No</a></li>
						<li><a href="#" onclick="changeCampo2(1)">Yes</a></li>
					</ul>
				</div> 
				<div class="col-xs-6">
					<label id="labelCampo2"> campo2 now: ${readXml.campo2} </label>
				</div>
			</div>
		</div>

    </body>
</html>    