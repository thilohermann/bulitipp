<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>bulitipp</title>

<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
	
</head>

<body>
<cfinclude template="includes/__header.cfm">	

<cfquery name="ranking" datasource="bulitipp" dbtype="ODBC">
SELECT *
FROM Users
WHERE Status > 0 AND groupID = #session.groupID#
Order BY Punkte DESC, Username ASC 
</cfquery>	
	
<br>
<b>Memberliste und aktuelles Ranking</b>
<br><br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #f0f0f0; width:700px;">
<table width="100%">
  <tr>
    <td width="50"><b>Platz</b></td>
    <td width="200"><b>User-Name</b></td>
	<td width="60"><b>Punkte</b></td>
	<td></td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#000000"></td>
  </tr>
  <cfset i = 0>
  <cfset show_i = 0>
  <cfset temppunkte  = -1>
  <cfoutput query="ranking">
  <cfset i = i+1>
  <cfif temppunkte is punkte>
  <cfset show_i = "">
  <cfelse>
  <cfset show_i = i & ".">
  </cfif>
  <tr>
    <td align="right">#show_i#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>#ranking.username#</td>
	<td align="right">#punkte#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td></td>
  </tr>
  <cfset temppunkte=punkte>
  </cfoutput>
</table></div>	


<cfinclude template="includes/__footer.cfm">

</body>
</html>
