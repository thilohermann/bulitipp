<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<cfset aktuell = #now()#>
<cfquery name="bannersaugen" datasource="bulitipp" dbtype="ODBC">
SELECT ID, BannerURL
FROM bulitippadv
WHERE Status = 1
</cfquery>
<CFOUTPUT>
<CFSET zufallszahl = RandRange(1, #bannersaugen.recordcount#)>
</cfoutput>
<html>
<head>
	<title>bulitipp</title>

<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
<link rel="SHORTCUT ICON" HREF="/favicon.ico">	
</head>

<body>

<table>
  <tr>
    <td><img src="pictures/logo.gif" width="200" height="90" alt="" border="0"></td>
	<td>&nbsp;</td>
	<TD><img src="adv/werbung_60.gif" width=18 height=60 alt="" border="0"></TD>
	<td><cfoutput query="bannersaugen" startrow=#zufallszahl# maxrows=1><CFIF #Left(bannerURL,7)# IS NOT '<iframe' AND #Left(bannerURL,6)# IS NOT '<scrip'><a href="advclick.cfm?id=#id#" target="_blank" class="ohnestrich"><img src="<CFIF #Left(bannerURL,4)# IS NOT 'http'>adv/</CFIF>#bannerURL#" height=60 alt="" border="0"><cfelse>#bannerurl#</cfif></cfoutput></a></td>
  </tr>
</table>

<br>
<cfoutput>
<div class="distance" style="border:1px solid ##FFCC00; -moz-border-radius:10px; background-color: ##000000; width:700px; color: ##ffffff;">&nbsp;</div>
</cfoutput>
<CFFORM ACTION = "db_logincheck.cfm" METHOD = "POST">
	
<br>
<b>Login</b>
<br><br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #f0f0f0; width:700px;">
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Benutzername:</td>
	<td><CFINPUT TYPE="Text" NAME="login" VALUE="" SIZE = "25"></td>
	<td>&nbsp;&nbsp;&nbsp;</td>
	<td>Passwort:</td>
	<td><CFINPUT TYPE="Password" NAME="passwort" VALUE="" SIZE = "25"></td>
	<td><INPUT TYPE="submit" VALUE="Login"></td>
  </tr>
</table></div>	
<br><br>

<div class="distance" style="background-color: #FFCC00; border-width:2px; border-style: dashed; border-color: #ff0000; width:698px;">

<table>
  <tr>
    <td><img src="pictures/working.gif" width="61" height="48" alt="" border="0"></td>
	<td>&nbsp;&nbsp;&nbsp;</td>
	<td><b>Gastzugang, Passwort-Reminder, Registrierung (mit E-Mail-Verifizierung)...</b></td>
  </tr>
</table>

</div>

</cfform>


<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-110976-3";
urchinTracker();
</script>
</body>
</html>
