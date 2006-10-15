<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>bulitipp</title>

<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
	
</head>

<body>
<cfinclude template="includes/__header.cfm">	

<cfquery name="ranking" datasource="bulitipp" dbtype="ODBC">
SELECT Teams.ID, Teams.Name, Teams.Logo, Season2007.Spiele, Season2007.Punkte, Season2007.Tore_Heim, Season2007.Tore_Gast, Season2007.Tordifferenz
FROM Teams INNER JOIN Season2007 ON Teams.ID = Season2007.TeamID
Order BY Punkte DESC, Tordifferenz DESC, Tore_Heim DESC, Teams.Name
</cfquery>	
	
<cfquery name="lieblingsclub" datasource="bulitipp" dbtype="ODBC">
SELECT lieblingsclub
FROM Users
WHERE ID = #session.userid#
</cfquery>	

<cfoutput query="lieblingsclub" maxrows=1>
<cfset lieblingsclubid = #lieblingsclub#>
</cfoutput>
	
<br>
<b>Die aktuelle Bundesligatabelle</b>
<br><br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #f0f0f0; width:700px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50"><b>Platz</b></td>
    <td width="250"><b>Team</b></td>
	<td width="70" align="center"><b>Spiele</b></td>
	<td width="75" align="center"><b>Tore</b></td>
	<td width="70" align="center"><b>Tordiff.</b></td>
	<td width="70" align="center"><b>Punkte</b></td>
	<td><img src="pictures/crashtest.gif" width="1" height="22" alt="" border="0"></td>
  </tr>
  <tr>
    <td colspan="7" bgcolor="#000000"></td>
  </tr>
  <cfset i = 0>
  <cfset show_i = 0>
  <cfset temppunkte  = -1>
  <cfset temptordifferenz  = -1>
  <cfset temptoreheim  = -1>
  <cfoutput query="ranking">
  <cfset i = i+1>
  <cfif temppunkte is punkte AND temptordifferenz IS tordifferenz AND temptoreheim IS tore_heim>
  <cfset show_i = "">
  <cfelse>
  <cfset show_i = i & ".">
  </cfif>
 
  
  <tr>
    <cfif #lieblingsclubid# is #id#><td bgcolor="##FFF073" align="right"><cfelse><td align="right"></cfif>#show_i#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<cfif #lieblingsclubid# is #id#><td bgcolor="##FFF073"><cfelse><td></cfif>#name#</td>
	<cfif #lieblingsclubid# is #id#><td bgcolor="##FFF073" align="right"><cfelse><td align="right"></cfif>#spiele#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<cfif #lieblingsclubid# is #id#><td bgcolor="##FFF073" align="right"><cfelse><td align="right"></cfif>#tore_heim#:#tore_gast#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<cfif #lieblingsclubid# is #id#><td bgcolor="##FFF073" align="right"><cfelse><td align="right"></cfif>#tordifferenz#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<cfif #lieblingsclubid# is #id#><td bgcolor="##FFF073" align="right"><cfelse><td align="right"></cfif>#punkte#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td><img src="pictures/crashtest.gif" width="1" height="22" alt="" border="0"></td>
  </tr>

  <tr>
    <td colspan="6" bgcolor="##cccccc"><img src="pictures/crashtest.gif" width="1" height="1" alt="" border="0"></td>
	<td></td>
  </tr>
  <cfset temppunkte=punkte>
  <cfset temptordifferenz  = tordifferenz>
  <cfset temptoreheim  = tore_heim>
  </cfoutput>
</table></div>	


<cfinclude template="includes/__footer.cfm">

</body>
</html>
