<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Admin Adv</title>
	
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">	


<CFQUERY datasource="bulitipp" NAME="bulitippadv">
SELECT *
FROM bulitippadv
Order BY id, anbieter
</CFQUERY>

</head>

<body>
<cfinclude template="includes/__header.cfm">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="bulitippadv_neu.cfm" target="details">Neuer Anbieter</a><br><br>

<table width="325">
  <tr>
    <td bgcolor="#000040" width="210"><b style="color:#ffffff;">&nbsp;Anbieter</b></td>
	<td bgcolor="#000040" width="97"><b style="color:#ffffff;">&nbsp;Klicks</b></td>
	<td bgcolor="#000040"><img src="../images/dummy.gif" width="18" height="14" alt="" border="0"></td>
  </tr>
<cfoutput query="bulitippadv">  
  <tr>
    <td bgcolor="##E1E2C3" onmouseover="mouseover(this,'##E6B65C');" onmouseout="mouseout(this,'##E1E2C3');" onclick="mouseclick(this)">&nbsp;<a href="bulitippadv_details.cfm?id=#id#" target="details">#anbieter#</a>&nbsp;</td>
    <td bgcolor="##E1E2C3" align="right">&nbsp;&nbsp;#clicks#&nbsp;&nbsp;<a href="admin_db_adv_reset.cfm?id=#id#" style="font-size:8pt;">[Reset]</a>&nbsp;&nbsp;&nbsp;</td>
    <td width="18" align="center" bgcolor="##E1E2C3"><cfif status is 1><a href="admin_db_adv.cfm?action=status&id=#id#&status=0"><img src="adv/button_ok.gif" width="14" height="14" alt="" border="0"></a><cfelse><a href="admin_db_adv.cfm?action=status&id=#id#&status=1"><img src="adv/button_nichtok.gif" width="14" height="14" alt="" border="0"></a></cfif></td>
  </tr>
</CFOUTPUT>
</table>


<cfinclude template="includes/__footer.cfm">

</body>
</html>
