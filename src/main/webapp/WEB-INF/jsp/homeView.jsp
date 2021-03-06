<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
	<title>gAn web interface</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<script src="jquery.js"></script>
	<script src="JS/home.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet" >
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
	<link href="CSS/home.css" rel="stylesheet" media="screen">
</head>

<body class="indexGeneral">
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
				<button id='modalityNow' data-toggle = 'tooltip' title = 'Return to the previous screen, where you will able to choose another modality (single run vs multiple run)'  class='btn btn-primary center' onclick='changeModality()'>Return to "Choose Modality" Single vs Multiple</button>
		    </div>
		    <div class='col-xs-4'></div>
	    </div>
	</div>
	


	<div id="workBlock" >
            <div class="row">
                <div class="col-xs-7" style="margin-left: 20.8%;">
                    <div class="borderGroup">






<!-- MULTIPLE RUNS -->





                 		<div id="multiple"> 
                            <div class="col-xs-12">    
                                <div class="row"><!-- run row -->
                                    <h3> 
                                        <span data-toggle='tooltip' title='This is the most recent run in the database'>
                                            Last existing run: 
                                            ${lastRun.num}  in ${lastRun.date} 
                                        </span>
                                    </h3>
                                </div>
                                
                                <form class = "well well-height-extra" action="/execute" th:action="@{/execute}" th:object="${sendToExecute}" method="post">
                                    <div class = "row" >
                                        <div id="opacityChanges" class = "col-xs-6 ridge borderLightLeft">
                                            <div class = "col-xs-12 height50">
                                                <ul class="nav nav-tabs navbar-default width240 center">
                                                    <li class="nav-item width120">
                                                        <a class = "nav-link active" onclick="showRange()">
                                                            By Range    
                                                        </a>
                                                    </li>
                                                    <li class="nav-item width120">
                                                        <a class = "nav-link active" onclick="showArea()">
                                                            By InputArea    
                                                        </a>    
                                                    </li>
                                                </ul>    
                                            </div>
                                            <div id="rangeBlock" class="centerTextAlign">
                                                <div class = "row centerTextAlign" >
                                                    <label for="runM1" class="form-control-label">Insert some Runs: </label>
                                                </div>   
                                                <div class = "row centerTextAlign" id="rowOfMultipleInputFirst">
                                                    <input type="text" data-toggle="tooltip" title="Insert here some run numbers, on which the selected multiple-run analyzes will be applied."  id="whichRunsMultiple" name="runM1" class="form-control" placeholder="example: 58880">
                                                </div> 

                    		  			        <div class = "row  centerTextAlign" id="rowOfMultipleInputSecond">
                                                    <input type="text" id="whichRunsMultipleSecond" name="runM2" class="form-control" placeholder="example: 58883">
                                                </div>

                                                <div class = "row centerTextAlign" >
                                                    <h4 id="warningRunNumberMultiple">
                                                        <div style="color: red;"><span class="glyphicon glyphicon-remove"></span> Insert numbers, without letters!</div>
                                                    </h4>
                                                </div>
                                            </div> 
                                            <div id="areaBlock" hidden >
                                                <textarea class="form-control styleArea" rows="5" id="inputArea" name="inputArea"></textarea>
                                            </div>   
                                        </div>
                                        <div class = "col-xs-4 ridge" data-toggle='tooltip' title='Select an analysis from the dropdown menu; this will be applied to the selected run'>
                                            <div class = "row centerTextAlign" >
                                                <label for="buttonSelectAnalysisMultiple" class="form-control-label">Choose an analysis</label>
                                            </div>   
                                            <div class = "row centerTextAlign" >
   												<div class='dropdown col-xs-12'>
   													<button id='buttonSelectAnalysisMultiple' class='btn btn-default dropdown-toggle littlePadding' type='button' data-toggle='dropdown'>
														<span id="spanSelectAnAnalysisM">Select an analysis</span>
														<span class='caret'></span>
													</button>
	    											<ul class='dropdown-menu'>
	    												<c:forEach items="${multipleList}" var="item" varStatus="loop">
														    <li><a href='#' onclick=setAnalysisMultiple(${loop.index},this)> ${item} </a></li>    
														</c:forEach>
													</ul>
													<input hidden name="analysisMultiple" id="analysisMultiple"/>
												</div>
                                            </div> 
                                            <div class = "row centerTextAlign" >
                                                <h4 id="warningSelectAnalysisMultiple">
                                                    <div style="color: red;"><span class="glyphicon glyphicon-remove"></span> Select an analysis!</div>
                                                </h4>
                                            </div>
                                        </div>    
                                        <div class = "col-xs-2">
                                            <div class = "row" >
                                                <label class="form-control-label littleRight"><div hidden class = "col-xs-2"> place </div></label> 
                                            </div>   
                                            <div class = "row" >
                                                <div id = "mouseOverTargetMultiple" class="col-xs-6 starter">
                                                    <input type="submit" value="Submit" id="sendRunButtonMultiple" data-toggle="tooltip" title="Start the program with the inserted runs" onclick="manageWait( 1 )" class="btn btn-primary starterButton"/>
                                                </div>
                                            </div> 
                                        </div>    
                                    </div>    
                                </form>
                                <br><br>
                            </div>
                            
                            <div class="row">
                                <div class="modal fade" id="addRangeModal" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" id="modalCloseRange">&times;</button>
                                                <h4><span class="glyphicon"></span> Add runs by range </h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="newRun"><span class="glyphicon"></span> First run </label>
                                                    <input type="text" class="form-control" id="first"></input>
                                                    <label for="newRun"><span class="glyphicon"></span> Last run </label>
                                                    <input type="text" class="form-control" id="last"></input>
                                                </div>
                                                <button class="btn btn-default btn-success btn-block" onclick="addRange()"> Add </button>
                                            </div>
                                        </div>    
                                    </div>   
                                </div>
                            </div>
							<div class="row">
                            	<div class="modal fade" id="inputSheetModal" role="dialog">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" id="modalCloseSheet">&times;</button>
                                                <h4><span class="glyphicon"></span> Insert one or more ranges of runs </h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <textarea id="runsTextualInput" class="form-control" rows="5" id="comment"></textarea>
                                                </div>
                                                <button class="btn btn-default btn-success btn-block" onclick="saveTextualInput()"> 
                                                	Confirm
                                                </button>
												<span id="gAnPath" hidden><?php echo $gAnPath; ?></span>
	                                        </div>
                                        </div>    
                                    </div>   
                                </div>
                            </div>
						    <div class="row">	
			   			        <div class = "col-xs-4 centerTextAlign" >
							    </div>    
						        <div class="col-xs-4 centerTextAlign">
							    </div>
						        <div class="col-xs-4 centerTextAlign">
			                        <button onclick="window.location.href='config'" type="submit" class="settingButton btn btn-primary moveUpSetting"> Advanced Settings</button>     
			                    </div>
					    	</div>   
                        </div>











<!-- single input -->











                        <div id="single">    
                            <div class="col-xs-12">    
                                <div class="row"><!-- run row -->
                                    <h3>  
                                        <span data-toggle='tooltip' title='This is the most recent run in the database'>
                                            Last existing run: 
                                             ${lastRun.num}  in  ${lastRun.date} 
                                        </span>
                                    </h3>
                                </div>
                                
                                <form action="/execute" th:action="@{/execute}" th:object="${sendToExecute}" method="post" class = "well well-height">
                                    <div class = "row" >
                                        <div class = "col-xs-6 ridge">
                                            <div class = "row  centerTextAlign" >
                                                <label for="whichRunSingle" class="form-control-label">Insert a Run: </label>
                                            </div>   
                                            <div id="rowOfSingleInput" class = "row" >
                                                <input type="text" data-toggle="tooltip" title="Insert here a run number, on which the selected single-run analysis will be applied." id="whichRunSingle" name="runS1" class="form-control littlePadding" placeholder="example: 30000">
                                            </div> 
                                            <div class = "row  centerTextAlign" >
                                                <h4 id="warningRunNumberSingle">
                                                    <div style="color: red;"><span class="glyphicon glyphicon-remove"></span> Insert a number (only one!), without letters!</div>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class = "col-xs-4 ridge" data-toggle='tooltip' title='Select an analysis from the dropdown menu; this will be applied to the selected run'>
                                            <div class = "row centerTextAlign" >
                                                <label for="buttonSelectAnalysisSingle" class="form-control-label">Choose an analysis</label>
                                            </div>   
                                            <div class = "row centerTextAlign" >
   												<div class='dropdown col-xs-12'>
													<button id='buttonSelectAnalysisSingle' class='btn btn-default dropdown-toggle littlePadding' type='button' data-toggle='dropdown'>
														<span id="spanSelectAnAnalysisS">Select an analysis</span>
														<span class='caret'></span>
													</button>
	    											<ul class='dropdown-menu'>
			   											<c:forEach items="${singleList}" var="item" varStatus="loop" >
															<li><a href='#' onclick=setAnalysisSingle(${loop.index},this)> ${item} </a></li>    
														</c:forEach>
													</ul>
													<input hidden name="analysisSingle" id="analysisSingle"/>
												</div>
                                            </div>  
                                            <div class = "row centerTextAlign" >
                                                <h4 id="warningSelectAnalysisSingle">
                                                    <div style="color: red;"><span class="glyphicon glyphicon-remove"></span> Select an analysis!</div>
                                                </h4>
                                            </div>
                                        </div>    
                                        <div class = "col-xs-2">
                                            <div class = "row" >
                                                <label class="form-control-label littleRight"><div hidden class = "col-xs-2"> place </div></label> 
                                            </div>   
                                            <div class = "row" >
                                                <div id = "mouseOverTargetSingle" class="col-xs-6 starter">
                                                    <input type="submit" value="Submit" id="sendRunButtonSingle" data-toggle="tooltip" title="Start the program with the inserted run" onclick="manageWait( 0 )" class="btn btn-primary starterButton"/>
                                           		</div>
                                            </div> 
                                            <div class = "row" >
                                            </div>
                                        </div>    
                                    </div>       
                                </form>
                                <br><br>
                            </div>    
			 			    <div class="row">	
			   			        <div class = "col-xs-4 centerTextAlign" ></div>    
						        <div class = "col-xs-4 centerTextAlign"></div>
						        <div class = "col-xs-4 centerTextAlign">
									<button onclick="window.location.href='config.php'" type="submit" class="settingButton btn btn-primary moveUpSetting"> Advanced Settings</button>	
								</div>
				            </div>                         
						</div> 
                		<br><br>




<!-- Single part finishes here -->


<!-- next part is a TODO -->

                    </div>       
                </div>    
                        
                <div hidden class="col-xs-5">
                    <div class="borderGroup">
                        <p>Chose the date around which to search: <input type="text" id="datepicker"></p>
                        <pre class="scrollable">
                            words.. a lot
                        </pre> 
                    </div>                   
                </div>
            </div>    
        </div>  <!-- close block-->  







        <div style="display:none" id="commonWait" class="absoluteCenter" >
            <div class="container">
                <h1>Just a moment i'm working...</h1>
                <div class="progress progress-striped active">
                    <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                    </div>
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
</body>