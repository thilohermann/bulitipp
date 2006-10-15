<cfif isdefined("form.id")>

<CFQUERY NAME="updatepassword" datasource="bulitipp">
			UPDATE Users SET 
				GroupID = #form.groupid#,
				Status  = #form.status#
			WHERE ID = #form.id#
</CFQUERY>

<cfelse>

<CFQUERY NAME="insertspieltag" datasource="bulitipp">
  INSERT INTO Users
  (Username,
   Status,
   GroupID,
   Spielstatus,
   Password)
   VALUES
   ('#form.username#',
	#form.status#,
	#form.groupid#,
	0,
	'#form.password#')
</CFQUERY>
	
</cfif>	
	
<cflocation url="admin_users.cfm" addtoken="No">