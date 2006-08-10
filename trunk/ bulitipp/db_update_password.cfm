<cfif form.new_passwort is form.new_passwort_replay>

<cfquery name="Usercheck" datasource="bulitipp" dbtype="ODBC">
		SELECT *
		FROM Users
		WHERE ID=#session.userid# AND Password='#form.old_passwort#'
		</cfquery>
<cfif Usercheck.recordcount is 1>

<CFQUERY NAME="updatepassword" datasource="bulitipp">
			UPDATE Users SET 
				Password = '#form.new_passwort#'
			WHERE ID = #session.userid#
</CFQUERY>



<cflocation url="profil.cfm?success=available" addtoken="No">

<cfelse>
<cflocation url="profil.cfm?bad=available" addtoken="No">
</cfif>


<cfelse>

<cflocation url="profil.cfm?bad=available" addtoken="No">
</cfif>