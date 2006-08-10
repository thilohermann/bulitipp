<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>bulitipp</title>

<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
	
</head>

<body>
<cfinclude template="includes/__header.cfm">	
<CFFORM ACTION = "db_update_password.cfm" METHOD = "POST">
	
<br>
<b>Passwort ändern
<cfif isdefined("url.success")>
	<br><br><b style="color:#ff0000;">Das Passwort wurde geändert</b>
</cfif>	
<cfif isdefined("url.bad")>
	<br><br><b style="color:#ff0000;">Leider ist ein Fehler aufgetreten. Wahrscheinlich nur ein Schreibfehler...</b>
</cfif>
<br><br>
<div class="distance" style="border:1px solid #000000; -moz-border-radius:10px; background-color: #f0f0f0; width:700px;">

<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>altes Passwort:</td>
	<td><CFINPUT TYPE="Password" NAME="old_passwort" VALUE="" SIZE = "25"></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
	<td>neues Passwort:</td>
	<td><CFINPUT TYPE="Password" NAME="new_passwort" VALUE="" SIZE = "25"></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
	<td>neues Passwort (Wiederholung):</td>
	<td><CFINPUT TYPE="Password" NAME="new_passwort_replay" VALUE="" SIZE = "25"></td>	
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
	<td colspan="2"><INPUT TYPE="submit" VALUE="Passwort ändern"></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table></div>	

</cfform>

<cfinclude template="includes/__footer.cfm">

</body>
</html>
