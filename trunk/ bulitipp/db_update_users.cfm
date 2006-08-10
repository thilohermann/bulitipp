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
	
<cflocation url="admin_users.cfm" addtoken="No">