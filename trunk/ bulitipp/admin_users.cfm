<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Admin Spieltag</title>
	
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">		
	
	
</head>

<body>
	
	
<cfif session.statusid GT 2>	
	
<cfquery name="Users" datasource="bulitipp" dbtype="ODBC">
SELECT *
FROM Users
ORDER BY Username ASC
</cfquery>	

<cfform action="db_update_users.cfm">
<table>
  <tr>
	<td>Name</td>
	<td>Letztes Login</td>
	<td>GroupID</td>
	<td>Status</td>
  </tr>
<cfoutput query="users">
  <tr>
    <td>#username#</td>
	<td>#LastLogin#</td>
	<td>#groupid#</td>
	<td>#Status#</td>
	<td>#password#</td>
  </tr>
 </cfoutput> 
  <tr>
    <td><input type="text" name="username" value="" size="10"></td>
	<td></td>
	<td><input type="text" name="groupid" value="" size="2"></td>
	<td><input type="text" name="status" value="1" size="2"></td>
	<td><input type="text" name="password" value="1" size="10"></td>
  </tr>
  <tr>
    <td colspan="3"><input type="submit"></td>
  </tr>
</table>
</cfform>
</cfif>
</body>
</html>
