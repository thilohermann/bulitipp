<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Bulitipp Error</title>

<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
	
</head>

<body>
<cfset aktuell = #now()#>
<table>
  <tr>
    <td><img src="pictures/logo.gif" width="200" height="90" alt="" border="0"></td>
	<td>&nbsp;&nbsp;&nbsp;</td>
	<td><a href="http://www.spreadfirefox.com/?q=affiliates&id=7229&t=202"><img border="0" alt="Upgrade to Firefox 1.5!" title="Upgrade to Firefox 1.5!" src="http://sfx-images.mozilla.org/affiliates/products/firefox/upgrade_1_5_468b1.jpg"/></a></td>
  </tr>
</table>

<br>
<cfoutput>
<div class="distance" style="border:1px solid ##FFCC00; -moz-border-radius:10px; background-color: ##000000; width:700px; color: ##ffffff;">&nbsp;</div>
</cfoutput>
<br>
<b style="color:ff0000;">Entweder war die Eingabe des Benutzernamens und/oder des Passwortes falsch,<br>oder die Session ist abgelaufen!</b>
<br>
<br>
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
</cfform>

</body>
</html>
