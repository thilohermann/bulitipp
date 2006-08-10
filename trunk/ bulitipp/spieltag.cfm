<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Admin Spieltag</title>
	
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
	
<cfif session.statusid GT 2>	
	
<cfquery name="Spiele" datasource="bulitipp" dbtype="ODBC">
SELECT Spieltage.ID, Spieltage.Heim, Spieltage.Gast, Spieltage.Spieltag, Spieltage.Tore_Heim, Spieltage.Tore_Gast, Spieltage.ZeitDatum, Teams.Name, Teams2.Name AS away
FROM Teams AS Teams2 INNER JOIN (Teams INNER JOIN Spieltage ON Teams.ID = Spieltage.Heim) ON Teams2.ID = Spieltage.Gast
WHERE (((Spieltage.Spieltag)=#url.spieltagID#))
</cfquery>		
	
<cfquery name="Teams" datasource="bulitipp" dbtype="ODBC">
SELECT *
FROM Teams
ORDER BY Name ASC
</cfquery>	


</head>

<body>
<cfinclude template="includes/__header.cfm">	
	
<cfform action="db_update_spieltag.cfm">
<cfoutput>
<input type="hidden" name="spieltagID" value="#url.spieltagID#">
</cfoutput>
<cfoutput>
#url.spieltagID#. Spieltag</cfoutput>

<cfset i=1>

<table>
<cfoutput query="spiele">

  <tr>
  <input type="hidden" name="gameid_#i#" value="#spiele.id#">
    <td>Spiel #i#</td>
	<td><cfset tempvar1 = spiele.heim><select name="team_home_#i#"><cfloop query="teams"><cfif tempvar1 EQ teams.id><option value="#id#" selected>#name#</option><CFELSE><option value="#id#">#name#</option></cfif></cfloop></select></td>
	<td>&nbsp;-&nbsp;</td>
	<td><cfset tempvar2 = spiele.gast><select name="team_away_#i#"><cfloop query="teams"><cfif tempvar2 EQ teams.id><option value="#id#" selected>#name#</option><CFELSE><option value="#id#">#name#</option></cfif></cfloop></select></td>
    <td><input type="text" name="datum_#i#" value="#DateFormat(zeitdatum, "dd.mm.yyyy")#" size="10"></td>
	<td><input type="text" name="zeit_#i#" value="#TimeFormat(zeitdatum, "HH:mm")#" size="5"> Uhr</td>
	<td><input type="text" name="tore_heim_#i#" value="#Tore_Heim#" size="2"></td>
	<td>:</td>
	<td><input type="text" name="tore_gast_#i#" value="#Tore_Gast#" size="2"></td>
  </tr>

<cfset i=i+1>
</cfoutput>
  <tr>
    <td colspan="5"><input type="submit"></td>
  </tr>

</table>
</cfform>



<br>
<div class="distance" style="background-color: #FFCC00; border-width:2px; border-style: dashed; border-color: #ff0000; width:700px;">
<cfform action="db_new_spieltag.cfm">
<table>
  <tr>
    <td>Spieltag:</td>
	<td><input type="text" name="spieltagID" size="2"></td>
  </tr>
</table>

<cfloop index="i" from="1" to="9">
<table width="100%">
  <tr>
    <td>Spiel <cfoutput>#i#</cfoutput></td>
	<td><select name="team_home_<cfoutput>#i#</cfoutput>">
	<cfoutput query="teams"><option value="#id#">#name#</option></cfoutput></select></td>
	<td>&nbsp;-&nbsp;</td>
	<td><select name="team_away_<cfoutput>#i#</cfoutput>">
	<cfoutput query="teams"><option value="#id#">#name#</option></cfoutput></select></td>
  </tr>
</table>
</cfloop>
<input type="submit">

</cfform>
</div>

<b>ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜabcdefghijklmnopqrstuvwxyzäöü</b>


</cfif>
</body>
</html>
