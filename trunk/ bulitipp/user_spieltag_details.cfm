<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Buli-Tipp</title>
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		

</head>

<body>
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
WHERE Spieltage.Spieltag=#spieltag# AND Spieltage.Tore_Heim >= 0
ORDER BY Spieltage.ZeitDatum
</cfquery>	

<br>
<b><cfoutput>#spieltag#. Spieltag</cfoutput></b>
<br><br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #FFF073; width:700px;">
<table width="100%">
  <tr>
    <td valign="bottom" width="380"><b>Spiel</b></td>
	<td>
	  <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		  <td><img src="pictures/crashtest.gif" width="6" height="1" alt="" border="0"></td>
<cfquery name="usersvertikal" datasource="bulitipp" dbtype="ODBC">
SELECT *
FROM Users
WHERE Status > 0 AND groupID = #session.groupID#
Order by ID
</cfquery>		
	<cfset userliste = "">
	<cfoutput query="usersvertikal">	
	<cfset Userliste = ListAppend('#userliste#', #id#)>		  
		  <td valign="bottom" width="28">
<cfloop index="i" from="#len(username)#" to="1" step="-1">
<cfif i is 1>
<img src="pictures/letters/big/#Mid(username, i, 1)#.gif" alt="" border="0">
<cfelse>
<img src="pictures/letters/small/#Mid(username, i, 1)#.gif" alt="" border="0"><br>
</cfif>
</cfloop>
</td>
</cfoutput>
		</tr>
	  </table>
	</td>
	<td align="center" valign="bottom"><img src="pictures/icon_fussball.gif" border="0"></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#000000"></td>
  </tr>
  <cfoutput query="Spiele">
  
  <tr>
	<td>#name# - #away#</td>
	<td>
	  <table border="0" cellspacing="0" cellpadding="4">	    
	    <tr>
		<cfset tordifferenz = #Tore_Heim#-#Tore_Gast#>
		  <cfloop index="i" list="#userliste#">
		<cfquery name="Tipps" datasource="bulitipp" dbtype="ODBC">
		SELECT *
		FROM Users INNER JOIN Tipps ON Users.ID = Tipps.UserID
		WHERE (((Tipps.SpielID)=#id#) AND Tipps.UserID=#i#)
		</cfquery>		
		<cfif Tipps.recordcount is 0>
		<td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FECCCC; width:18px;">x</div></td>
		<cfelse>	
	       <cfif tordifferenz GT 0>
	         <cfif Tipps.Tendenz is 0 OR Tipps.Tendenz is 2>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FECCCC; width:18px;">#tipps.tendenz#</div></td>
          <cfelse>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##DDFECC; width:18px;">#tipps.tendenz#</div></td>
		 </cfif> 
		   <cfelseif tordifferenz IS 0>
	         <cfif Tipps.Tendenz is 1 OR Tipps.Tendenz is 2>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FECCCC; width:18px;">#tipps.tendenz#</div></td>
          <cfelse>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##DDFECC; width:18px;">#tipps.tendenz#</div></td>
		 </cfif> 
		   <cfelseif tordifferenz LT 0>
	         <cfif Tipps.Tendenz is 0 OR Tipps.Tendenz is 1>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##FECCCC; width:18px;">#tipps.tendenz#</div></td>
          <cfelse>
		  <td><div align="center" id="game_#ID#_1" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##DDFECC; width:18px;">#tipps.tendenz#</div></td>
		 </cfif> 
		     </cfif>
         </cfif>
         </cfloop>
		</tr>
	  </table>
    </td>
	<cfif Tore_Heim GTE 0>
	  <td align="center"><b style="color:##000000">#Tore_Heim#:#Tore_gast#</b></td>	
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
    <td><div align="center" id="back" style="border:1px solid ##000000; -moz-border-radius:4px; background-color: ##8F8F8F; width:175px; cursor: pointer;"  onclick="javascript:history.back();"><b style="color: ##ffffff;">&nbsp;<<< zurück&nbsp;</b></div></td>
  </tr>
</table>
</cfoutput>


<cfinclude template="includes/__footer.cfm">

</body>
</html>
