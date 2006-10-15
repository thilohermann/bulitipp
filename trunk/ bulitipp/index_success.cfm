<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Buli-Tipp</title>
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">	
<link rel="SHORTCUT ICON" HREF="/favicon.ico">		
</head>

<body>

<cfinclude template="includes/__header.cfm">

<cfquery name="Spiele" datasource="bulitipp" dbtype="ODBC">
SELECT TOP 3 Spieltage.ID, Spieltage.Heim, Spieltage.Gast, Spieltage.Spieltag, Spieltage.Tore_Heim, Spieltage.Tore_Gast, Spieltage.ZeitDatum, Teams.Name, Teams2.Name AS away
FROM Teams AS Teams2 INNER JOIN (Teams INNER JOIN Spieltage ON Teams.ID = Spieltage.Heim) ON Teams2.ID = Spieltage.Gast
WHERE Spieltage.ZeitDatum >#aktuell#
</cfquery>

<br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #f8f8f8; width:700px; color: #ffffff;"><script language="JavaScript" type="text/javascript" src="http://www.fussballportal.de/c4u_news_large.php?border_color=f8f8f8&bg_color=f8f8f8&link_color=000000&link_color_over=000000"><noscript><a href="http://www.fussballportal.de" target="_blank">Fussball Datenbank auf www.fussballportal.de</a></noscript></script></div>
	

<br>
<b>Die nächsten Spiele</b>
<br><br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #FFF073; width:700px;">
<table width="100%">
  <tr>
    <td><b>Termin</b></td>
    <td><b>Spiel</b></td>
  </tr>
  <tr>
    <td colspan="2" bgcolor="#000000"></td>
  </tr>
  <cfoutput query="Spiele">
  <tr>
    <td>#DateFormat(zeitdatum, "dd.mm.yyyy")#, #TimeFormat(zeitdatum, "HH:mm")# Uhr</td>
	<td>#name# - #away#</td>
  </tr>
  </cfoutput>
</table>
</div>


<cfinclude template="includes/__footer.cfm">

</body>
</html>
