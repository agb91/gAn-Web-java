
//when jquery is loaded and document is ready (we can't do nothing before): 
$( document ).ready(function() {

    //to use the tooltip we have to initialize it here
    $('[data-toggle="tooltip"]').tooltip();
       
    //the following commands are always are executed sometimes in single
    //version of the interface, some other times in multiple 
    //validate the inserted runs
    //first of all, disable the run-send-button (until the run number isn't correct)
    $( "#sendRunButtonSingle" ).prop("disabled",true);
    $( "#warningRunNumberSingle" ).hide();
    $( "#sendRunButtonMultiple" ).prop("disabled",true);
    $( "#warningRunNumberMultiple" ).hide();
    $( "#warningSelectAnalysisSingle" ).hide();
    $( "#warningSelectAnalysisMultiple" ).hide();
    
    
    //at the beginning you must choose what kind of analyses do
    $( "#workBlock" ).hide();

    $( "#whichRunSingle" ).keyup(function() {//check every time the user uses the keyboard 
        validate( 0 );
    });  
    $( "#whichRunsMultiple" ).keyup(function() {//check every time the user uses the keyboard 
        validate( 1 );
    });
    $( "#whichRunsMultipleSecond" ).keyup(function() {//check every time the user uses the keyboard 
        validate( 1 );
    });	

    $( "#buttonSelectAnalysisSingle" ).click(function() {//check every time the user click this button
        validate( 0 );
    });
    $( "#buttonSelectAnalysisMultiple" ).click(function() {//check every time the user click this button
        validate( 1 );
    });
    
    $( "#whichRunSingle" ).click(function() {//check every time the user clicks with the mouse on the input form
        validate( 0 );
    });  
    $( "#whichRunsMultiple" ).click(function() {//check every time the user clicks with the mouse on the input form
        validate( 1 );
    });
    $( "#whichRunsMultipleSecond" ).click(function() {//check every time the user clicks with the mouse on the input form
        validate( 1 );
    });

    $( "#mouseOverTargetSingle" ).mouseover(function() {
        validate( 0 );
    });
    $( "#mouseOverTargetMultiple" ).mouseover(function() {
        validate( 1 );
    });


});

function showRange()
{

    $( "#rangeBlock" ).show();
    $( "#areaBlock" ).hide();
}

function showArea()
{
    $( "#rangeBlock" ).hide();
    $( "#areaBlock" ).show();
}

function hideInputNumbers()
{
    if ( $('#sheetSelector').is(':checked') ) 
    {
	$( "#opacityChanges" ).addClass( "transparent" );
    }
    else
    {
	$( "#opacityChanges" ).toggleClass( "transparent" );
    }
}

function saveTextualInput()
{

	var path = $( "#gAnPath" ).text();
	var towrite = $( "#comment" ).val();
	$.get( "PHP/textualInputFunctions.php", 
	    {
		 whereToWrite: path , whatToWrite: towrite 
	    } 
	).done(function( data ) {
	    //alert( " Correctly inserted: " + towrite );
	});
	$( "#modalCloseSheet" ).click();

}

function inputBySheet()
{
	$("#inputSheetModal").modal();
}

//select if you want to work with single or multiple runs
function selectSingleVsMultiple( n )
{
    $( "#chooseModality" ).hide();
    $( "#changeModality" ).show();
    if( n == 0)//and the other red
    {
        $( "#modalityWell").text( "You are working with Single Run Analysis" );
        $( "#modalityWell").show();    
    }
    else
    {
        $( "#modalityWell").text( "You are working with Multiple Runs Analysis" );
        $( "#modalityWell").show();
    }
    showOtherObject(n);    
}

function changeModality()
{
    location.reload();//simple reload the page and re-propose the choice
}

//show all the rest of the page
function showOtherObject( n )
{
    $( "#workBlock" ).show();
    if( n == 0)
    {
        $( "#multiple" ).hide();
        $( "#single" ).show();
    }
    else
    {
        $( "#multiple" ).show();
        $( "#single" ).hide();
    }
    
}

function readCleanRunSecond() // the second run in the multiple case is particular.. 
//we'll think about if this function has reason to exist
{
    var secondRun = $("#whichRunsMultipleSecond").val();
    return secondRun;
}

//it is a good idea if we standardize comma and '-' with semicolon
function readCleanRun( n )
{
    var insertedRun = " ";
    if( n == 0)
    {
        insertedRun = $("#whichRunSingle").val();
    }
    else
    {
        insertedRun = $("#whichRunsMultiple").val();
    }
    insertedRun = insertedRun.replace(new RegExp(",", "g"), ";");// we want to allow the user to separate the run numbers 
    //also with comma and '-' and point
    insertedRun = insertedRun.replace(new RegExp("-", "g"), ";");
    insertedRun = insertedRun.replace(new RegExp(" ", "g"), "");
    if( insertedRun.substr( insertedRun.length - 1 ) == ";" )
    {
        insertedRun = insertedRun.substr( 0 , insertedRun.length - 1 );
    }
    //alert( insertedRun + "---");
    return insertedRun;
}

function selectDate( thisDate )
{
    var dates = $( "#allDates" ).text();
    var dates = dates.split( ";-;" );
    //var rex = /\S/;
    //dates = dates.filter(rex.test.bind(rex));
    //alert(dates[0]);
    for( var i = 0; i < dates.length ; i++)
    {
        $( "#run" + i ).hide();    
    }
    $( "#run" + thisDate ).show();
    //alert($("#run"+thisDate);
}

function validateSingle()
{
    var insertedRun = readCleanRun( 0 );
    var insertedArray = insertedRun.split(";"); 
    var singleRun;
   
    var numberProblems = 0;
    var analysisProblems = 0;
    if ( insertedArray.length > 1 )
    {
        numberProblems++;
    }
    //have you selected an analysis?
    if( $("#spanSelectAnAnalysisS").text() == "Select an analysis"  )
    {
        analysisProblems++;
        //alert("analysis problems");
    }
    for (i in insertedArray) {
        insertedArray[i] = insertedArray[i].trim();
        if ( acceptable ( insertedArray[ i ] ) == 1 )
        {
            numberProblems++;
        }
    }

    if (numberProblems == 0)        
    {
        $("#warningRunNumberSingle").hide();
        $( "#rowOfSingleInput" ).removeClass( "has-error has-feedback" );
    }
    else
    {
        $( "#warningRunNumberSingle" ).show();
        $( "#rowOfSingleInput" ).addClass( "has-error has-feedback" );
    }

    if (analysisProblems == 0)        
    {
        $("#warningSelectAnalysisSingle").hide();
    }
    else
    {
        $("#warningSelectAnalysisSingle").show();
    }

    //alert("not numeric objects: " + noNumeric);
    if(numberProblems==0 && analysisProblems == 0)
    {
        $("#sendRunButtonSingle").prop("disabled",false);
        $("#sendRunButtonSingle").removeClass( "red" ).addClass( "green" );        }
    else
    {
        $("#sendRunButtonSingle").prop("disabled",true);
        $("#sendRunButtonSingle").removeClass( "green" ).addClass( "red" );
    }
}

function validateMultiple()
{
	var insertedRun = readCleanRun( 1 );
	var insertedRunSecond = readCleanRunSecond();
    var insertedArray = insertedRun.split(";"); 
    var MultipleRuns;
   
    var numberProblems = 0;
	var numberProblemsSecond = 0;
    var analysisProblems = 0;

    //have you selected an analysis?
    if( $("#spanSelectAnAnalysisM").text() == "Select an analysis"  )
    {
        analysisProblems++;
    }

    for (i in insertedArray) //work on the first input field
	{
        insertedArray[i] = insertedArray[i].trim();
        if ( acceptable ( insertedArray[ i ] ) == 1 )
        {
            numberProblems++;
        }
    }

	if ( acceptable ( insertedRunSecond ) == 1 )
	{
	    numberProblemsSecond++;
	}

	//related to the first input
    if (numberProblems == 0)        
	{
        //$( "#warningRunNumberMultiple" ).hide();
	    $( "#rowOfMultipleInputFirst" ).removeClass( "has-error has-feedback" );
    }
    else
    {
        //$( "#warningRunNumberMultiple" ).show();
    	$( "#rowOfMultipleInputFirst" ).addClass( "has-error has-feedback" );
    }

	//related to the second input
    if (numberProblemsSecond == 0)        
    {
        //$( "#warningRunNumberMultiple" ).hide();
    	$( "#rowOfMultipleInputSecond" ).removeClass( "has-error has-feedback" );
    }
    else
    {
        //$( "#warningRunNumberMultiple" ).show();
    	$( "#rowOfMultipleInputSecond" ).addClass( "has-error has-feedback" );
    }

	var totNumbersProblems = numberProblems + numberProblemsSecond;
	if( totNumbersProblems == 0 )
	{
	    $( "#warningRunNumberMultiple" ).hide();	
	}
	else
	{
	    $( "#warningRunNumberMultiple" ).show();	
	}

    if (analysisProblems == 0)        
    {
        $("#warningSelectAnalysisMultiple").hide();
    }
    else
    {
        $("#warningSelectAnalysisMultiple").show();
    }

    //alert("not numeric objects: " + noNumeric);
    if(numberProblems==0 && analysisProblems == 0)
    {
        $("#sendRunButtonMultiple").prop("disabled",false);
        $("#sendRunButtonMultiple").removeClass( "red" ).addClass( "green" );        
    }
    else
    {
        $("#sendRunButtonMultiple").prop("disabled",true);
        $("#sendRunButtonMultiple").removeClass( "green" ).addClass( "red" );
    }
}

//divide the string by semi-colon, point, comma (all accepted divisors), check if the chucks are numbers
function validate( n ) 
{
    if( n == 0)// if is single run
    {
    	validateSingle();
    }  
    else // if it is multiple run
    {
        validateMultiple();
    }  

    if( $( "#areaBlock" ).is(":visible") )// special case! if we use input area the validation is different (now a refactor is needed..)
    {
	var analysisProblems = 0;

	//have you selected an analysis?
        if( $("#buttonSelectAnalysisMultiple").text() == "Select an analysis"  )
        {
            analysisProblems++;
        }

        if(analysisProblems == 0)
        {
            $("#sendRunButtonMultiple").prop("disabled",false);
            $("#sendRunButtonMultiple").removeClass( "red" ).addClass( "green" );        }
        else
        {
            $("#sendRunButtonMultiple").prop("disabled",true);
            $("#sendRunButtonMultiple").removeClass( "green" ).addClass( "red" );
        }
		
    } 
}


function startSystem( n )
{
	manageWait( n );
}

function manageWait( n ) {
    $( "#commonTop" ).hide();
    $( "#commonSemiTop" ).hide();
    $( "#workBlock" ).hide();
    $( "#modalityWell").hide();
    //alert( $( "#commonWait") );
    //$( "#commonWait").show();
    w = document.getElementById("commonWait");
    w.style.display = 'block';//show the label with "wait until...."
	//requestToRunnerJson();
   

}

//check if there is another chunk with the same name, (double runs are useless)
function checkAlreadyExist(needle)
{
        needle = " " + needle; //javascript wants a string or it will crash with the trim....
        //alert("needle: " + needle);
        haystack = $("#whichRunsMultiple").val().split(";");
        //alert("haystack: " + haystack);
        var alreadyExist = false;
        for (i in haystack) 
        {
            //console.log("needle " + needle);
            if(haystack[i].trim()==needle.trim())
            {
                alreadyExist = true;
            }
        }
        return alreadyExist;
}


function setAnalysisSingle( name , event )
{
	var toInsert = event.innerHTML;
	$( "#analysisSingle" ).val(toInsert);
	$( "#spanSelectAnAnalysisS").val(toInsert);
	$( "#spanSelectAnAnalysisS").html(toInsert);
	$( "#spanSelectAnAnalysisS").text(toInsert);
}

function setAnalysisMultiple( name , event )
{
	var toInsert = event.innerHTML;
	$( "#analysisMultiple" ).val(toInsert);
	$( "#spanSelectAnAnalysisM").val(toInsert);
	$( "#spanSelectAnAnalysisM").html(toInsert);
	$( "#spanSelectAnAnalysisM").text(toInsert);
}

function acceptable( r )
{
    //alert(r);
    //console.log(r);
    var risp = 1;
    if($.isNumeric(r) )
    {  
        risp = 0;
    }
    //console.log(risp);
    return risp;
}