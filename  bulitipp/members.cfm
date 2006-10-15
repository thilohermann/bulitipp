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
<table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr>
    <td width="50"><b>Platz</b></td>
    <td width="200"><b>User-Name</b></td>
	<td width="60"><b>Punkte</b></td>
	<td>&nbsp</td>
	<td>&nbsp</td>
  </tr>
  <tr>
    <td colspan="5" bgcolor="#000000"></td>
  </tr>
 
  <cfset gold = "##FFcc00">
  <cfset silver = "##999999">
  <cfset bronze = "##C87451">
  <cfset standardcolor = "##f0f0f0">

  <cfset currentcolor = "gold">

  <cfset i = 0>
  <cfset show_i = 0>
  <cfset temppunkte  = -1>
  <cfoutput query="ranking">
  <cfset i = i+1>

  <cfif temppunkte is punkte>	
	
  <cfset show_i = "">
  <cfelse>
   <cfif i GT 1>
   <cfif currentcolor is "gold">
   <cfset currentcolor = "silver">
   <cfelseif currentcolor is "silver" AND i LTE 3>
   <cfset currentcolor = "bronze">
   <cfelse>
   <cfset currentcolor = "standardcolor">
   </cfif>
   </cfif>
  <cfset show_i = i & ".">
  </cfif>
  <tr>
  <td colspan="5">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr bgcolor="#evaluate(currentcolor)#">
    <td align="right" width="55">#show_i#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td width="200">#ranking.username#</td>
	<td align="right" width="60">#punkte#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td><table border="0"><tr><td>&nbsp;</td><td bgcolor="##cccccc"><img src="pictures/crashtest.gif" height="12" width="#punkte#" border="0"></td></tr></table></td>
	<td></td>
  </tr>
  <cfset temppunkte=punkte>

    </table>
	</td>	
</tr>


  </cfoutput>
</table></div>	


<cfinclude template="includes/__footer.cfm">

</body>
</html>
