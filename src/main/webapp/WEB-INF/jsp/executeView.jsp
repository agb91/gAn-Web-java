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
	<script src="JS/execute.js"></script>
    <script src="JS/images.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="JSROOTlibraries/scripts/JSRootCore.js" type="text/javascript"></script>
    
    <link href="CSS/execute.css" rel="stylesheet" media="screen">
    <link href="CSS/images.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" media="screen">
</head>
 <body id="body" class="general">
        <div class = "row" >
            <ul class="nav nav-tabs navbar-default">
                <li class="nav-item">
                    <a class = "nav-link active" onclick = "showTextualRunner()" >
                        <h3> Textual Output </h3>    
                    </a>
                </li>
                <li class="nav-item" data-toggle="tooltip" title="Look at the images created by running gAn">
                    <a class = 'nav-link' onclick = 'showImages()' >
                        <h3> Images output </h3>
                    </a>
                </li>
                <li class="nav-item" data-toggle='tooltip' title='Download the .root file related to the selected run'>
                    <a class="nav-link" onclick="rootDownload()">
                        <h3> Download Output File </h3>    
                    </a>
                </li>
                <li class="nav-item" data-toggle='tooltip' title='Download all images as a vector based image files'>
                    <a class="nav-link" onclick="downloadImages()" >
                        <h3> Download All Images </h3>    
                    </a>
                </li>
                <li class="nav-item" data-toggle='tooltip' title='Return to the Homepage of this gAn-Web'>
                    <a class="nav-link" href="../index.php">
                        <h3> New Analysis </h3>    
                    </a>
                </li>
            </ul>
        </div>



 <!-- now starts with textual runner -->


        <div id="runnerTab" class="runnerGeneral">
                           
            <div class="row">
                <div class="col-xs-3">
                    <h1> Results: </h1>
                </div>
                <div class="col-xs-9"></div>
            </div>
            <div>
			    <div id= 'run' style='display:block' name='disappearing'>
			    	<span id="cardinality">${cardinality}</span>
		    		<h4>Runs selected : <span id="getRuns">${runs}</span> <br>
                    Kind of analysis selected: <span id='kindAnalysis'>  ${ analysis } </span></h4><br>
                   
                    ${ textualResult }
		    	</div>
            </div>
        </div>



   <!-- FROM HERE IMAGES! -->








        <div id = "picturesTab" class = "imagesGeneral" >
		    <div id="imagesName" hidden></div>
	   			<div class='centerTextAlign'>
   					<span class='well centerTextAlign'>
						<c:forEach var = "i" begin = "1" end = "20">
						    <label id='inputCheck${i}' style=display:none; class='checkbox-inline'>
						    	<input id='inputCheckValue${i}' checked='checked' type='checkbox' value='${i}' onclick='showSingleImage(${i})' />
						    	<span id='check${i}'></span>
						    </label>
						</c:forEach>
					</span>
				</div>
				<br><br>
                <div id = "tipWell" class="well col-xs-2 fixedMiddleRight"> 
                	"Right-click on the image for more options"  
            	</div>

				<!-- here the image to repeat -->
	            <div class = "row">
	                <div class= "col-xs-12">
	                    <div id = "verticalBlock" style = "display:block" class = "center" >
							<c:forEach var = "i" begin = "1" end = "20">
								<div id='image${i}' style='width: 100%'></div>
							</c:forEach>
						</div>
	                </div>   
	            </div>
 
            	<div class="footer-bottom">
					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<div class="copyright">
									Powered by Andrea Damioli, <a href="http://www.unibs.it/"> University of Brescia </a> 
								</div>
							</div>
						</div>
					</div>
				</div>
        	</div> 
        </div>	
	</body>
</html>