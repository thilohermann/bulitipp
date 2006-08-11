<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Buli-Tipp</title>
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		

<script language="JavaScript" type="text/javascript">
function colorchange(game, reset1, reset2)
{
document.getElementById(game).style.backgroundColor = "#FFCC00";
document.getElementById(reset1).style.backgroundColor = "#f7f7f7";
document.getElementById(reset2).style.backgroundColor = "#f7f7f7";
}

</script>

<script type='text/javascript' src='outsourcing/ajax.js'></script>
<script type='text/javascript' src='outsourcing/waitingmessage.js'></script>

</head>

<body onload="waitingmessage()">
<cfinclude template="includes/__header.cfm">

<cfif spieltag is "now">
<cfquery name="Spieltag" datasource="bulitipp" dbtype="ODBC">
SELECT Top 1 Spieltage.Spieltag, Spieltage.ZeitDatum
FROM Spieltage
WHERE (((Spieltage.ZeitDatum)>#aktuell#))
ORDER BY Spieltage.ZeitDatum, Spieltage.Spieltag ASC
</cfquery>	
<cfset spieltag = Spieltag.spieltag>
</cfif>

<cfquery name="Spiele" datasource="bulitipp" dbtype="ODBC">
SELECT Spieltage.ID, Spieltage.Heim, Spieltage.Gast, Spieltage.Spieltag, Spieltage.Tore_Heim, Spieltage.Tore_Gast, Spieltage.ZeitDatum, Teams.Name, Teams2.Name AS away
FROM Teams AS Teams2 INNER JOIN (Teams INNER JOIN Spieltage ON Teams.ID = Spieltage.Heim) ON Teams2.ID = Spieltage.Gast
WHERE Spieltage.Spieltag=#spieltag#
</cfquery>	

<br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #FFF073; width:700px;">
<table width="100%">
  <tr>
    <td><b>Termin (<cfoutput>#spieltag#. Spieltag</cfoutput>)</b></td>
    <td><b>Spiel</b></td>
	<td><b>Tipp</b></td>
	<td align="center"><img src="pictures/icon_fussball.gif" border="0"></td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#000000"></td>
  </tr>
  <cfoutput query="Spiele">
  
  <tr>
    <td>#DateFormat(zeitdatum, "dd.mm.yyyy")#, #TimeFormat(zeitdatum, "HH:mm")# Uhr</td>
	<td>#name# - #away#</td>
	<td>
	  <table border="0" cellspacing="0" cellpadding="4">
	  
		<cfquery name="Tipps" datasource="bulitipp" dbtype="ODBC">
		SELECT *
		FROM Tipps
		WHERE Tipps.UserID=#session.userid# AND Tipps.SpielID=#id#
		</cfquery>		  
	  
	  
	   <cfif aktuell LT #zeitdatum#>
	  
	   <cfif Tipps.Tendenz is 1>
	    <tr>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','1','game_#ID#_1','game_#ID#_0','game_#ID#_2')"><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FFCC00; width:18px; cursor: pointer;">1</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','0','game_#ID#_0','game_#ID#_1','game_#ID#_2')"><div align="center" id="game_#ID#_0"  style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##f7f7f7; width:18px; cursor: pointer;">0</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','2','game_#ID#_2','game_#ID#_0','game_#ID#_1')"><div align="center" id="game_#ID#_2" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##f7f7f7; width:18px; cursor: pointer;">2</div></td>
		</tr>
	   <cfelseif Tipps.Tendenz is 0>
	    <tr>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','1','game_#ID#_1','game_#ID#_0','game_#ID#_2')"><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##f7f7f7; width:18px; cursor: pointer;">1</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','0','game_#ID#_0','game_#ID#_1','game_#ID#_2')"><div align="center" id="game_#ID#_0"  style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FFCC00; width:18px; cursor: pointer;">0</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','2','game_#ID#_2','game_#ID#_0','game_#ID#_1')"><div align="center" id="game_#ID#_2" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##f7f7f7; width:18px; cursor: pointer;">2</div></td>
		</tr>
	   <cfelseif Tipps.Tendenz is 2>
	    <tr>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','1','game_#ID#_1','game_#ID#_0','game_#ID#_2')"><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##f7f7f7; width:18px; cursor: pointer;">1</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','0','game_#ID#_0','game_#ID#_1','game_#ID#_2')"><div align="center" id="game_#ID#_0"  style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##f7f7f7; width:18px; cursor: pointer;">0</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','2','game_#ID#_2','game_#ID#_0','game_#ID#_1')"><div align="center" id="game_#ID#_2" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FFCC00; width:18px; cursor: pointer;">2</div></td>
		</tr>
	   <cfelse>
	    <tr>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','1','game_#ID#_1','game_#ID#_0','game_#ID#_2')"><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##DDFECC; width:18px; cursor: pointer;">1</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','0','game_#ID#_0','game_#ID#_1','game_#ID#_2')"><div align="center" id="game_#ID#_0"  style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##DDFECC; width:18px; cursor: pointer;">0</div></td>
		  <td onclick="ajax_savetipp('#ID#','#session.userid#','2','game_#ID#_2','game_#ID#_0','game_#ID#_1')"><div align="center" id="game_#ID#_2" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##DDFECC; width:18px; cursor: pointer;">2</div></td>
		</tr>
		</cfif>
		
		<CFELSE>
		
		<cfif Tipps.Tendenz is 1>
	    <tr>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##ffffff; width:18px;">1</div></td>
		  <td colspan="2"><cfif Tore_Heim GTE 0><a href="user_spieltag_details.cfm?spieltag=#spieltag#"><img src="pictures/icon_members_2.gif" border="0" alt=""></a></cfif></td>
		</tr>
	   <cfelseif Tipps.Tendenz is 0>
	    <tr>
		  <td><div align="center" id="game_#ID#_0"  style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##ffffff; width:18px;">0</div></td>
		  <td colspan="2"><cfif Tore_Heim GTE 0><a href="user_spieltag_details.cfm?spieltag=#spieltag#"><img src="pictures/icon_members_2.gif" border="0" alt=""></a></cfif></td>
		</tr>
	   <cfelseif Tipps.Tendenz is 2>
	    <tr>
		  <td><div align="center" id="game_#ID#_2" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##ffffff; width:18px;">2</div></td>
		  <td colspan="2"><cfif Tore_Heim GTE 0><a href="user_spieltag_details.cfm?spieltag=#spieltag#"><img src="pictures/icon_members_2.gif" border="0" alt=""></a></cfif></td>
		</tr>
	   <cfelse>
	    <tr>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FECCCC; width:18px;">x</div></td>
		  <td colspan="2"><cfif Tore_Heim GTE 0><a href="user_spieltag_details.cfm?spieltag=#spieltag#"><img src="pictures/icon_members_2.gif" border="0" alt=""></a></cfif></td>
		</tr>
		</cfif>		
		
		</CFIF>
	  </table>
    </td>
	<cfif Tore_Heim GTE 0>
	<cfset tordifferenz = #Tore_Heim#-#Tore_Gast#>
	<cfif tordifferenz GT 0>
	  <cfif Tipps.Tendenz is 0 OR Tipps.Tendenz is 2 OR Tipps.Tendenz is "">
	  <td align="center"><b style="color:##ff0000">#Tore_Heim#:#Tore_gast#</b></td>	
	  <cfelse>
	  <td align="center"><b style="color:##12BB00">#Tore_Heim#:#Tore_gast#</b></td>
	  </cfif>
	<cfelseif tordifferenz IS 0>
	  <cfif Tipps.Tendenz is 1 OR Tipps.Tendenz is 2 OR Tipps.Tendenz is "">
	  <td align="center"><b style="color:##ff0000">#Tore_Heim#:#Tore_gast#</b></td>	
	  <cfelse>
	  <td align="center"><b style="color:##12BB00">#Tore_Heim#:#Tore_gast#</b></td>
	  </cfif>
	<cfelseif tordifferenz LT 0>
	  <cfif Tipps.Tendenz is 0 OR Tipps.Tendenz is 1 OR Tipps.Tendenz is "">
	  <td align="center"><b style="color:##ff0000">#Tore_Heim#:#Tore_gast#</b></td>	
	  <cfelse>
	  <td align="center"><b style="color:##12BB00">#Tore_Heim#:#Tore_gast#</b></td>
	  </cfif>
	</cfif>
	<cfelse>
	<td align="center"><b>:</b></td>
	</cfif>
  </tr>
  </cfoutput>
</table>
</div>
<cfoutput>
<cfset back = spieltag-1>
<cfset forward = spieltag+1>
<cfif spieltag is 1>
<cfset back = 1>
</cfif>
<cfif spieltag is 34>
<cfset forward = 34>
</cfif>

<br>
<table width="700" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="center" id="back" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##8F8F8F; width:175px; cursor: pointer;"  onclick="location.href='user_spieltag.cfm?spieltag=#back#'"><b style="color: ##ffffff;">&nbsp;<<< Spieltag zurück&nbsp;</b></div></td>
	<td align="right"><div align="center" id="back" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##8F8F8F; width:175px; cursor: pointer;" onclick="location.href='user_spieltag.cfm?spieltag=#forward#'"><b style="color: ##ffffff;">&nbsp;Spieltag vor >>>&nbsp;</b></div></td>
  </tr>
</table>
</cfoutput>


<cfinclude template="includes/__footer.cfm">

</body>
</html>
