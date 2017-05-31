var campo1 = "2";
var campo2 = "2";

function writeToFile()
{
	alert("The current configuration is saved!");
	console.log( $( "#jsonXml" ).val() );
	url = "config/set?";
	url += "campo1=" + campo1;
	url += "&campo2=" + campo2;
	$.get( url, function( data ) {});
}

function changeCampo1(n)
{
	campo1 = n;
	$( "#buttonCampo1" ).text(n);
	$( "#labelCampo1" ).text("campo1 now: " + n);
}

function changeCampo2(n)
{
	campo2 = n;
	$( "#buttonCampo2" ).text(n);
	$( "#labelCampo2" ).text("campo2 now: " + n);
}