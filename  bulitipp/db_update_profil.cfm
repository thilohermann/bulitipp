<cfif form.new_passwort is form.new_passwort_replay AND form.new_passwort is not "">

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


<cfelseif form.new_passwort is "">

<CFQUERY NAME="updatelieblingsverein" datasource="bulitipp">
			UPDATE Users SET 
				lieblingsclub = #form.lieblingsverein#
			WHERE ID = #session.userid#
</CFQUERY>


<cflocation url="profil.cfm?success2=available" addtoken="No">

<cfelse>

<cflocation url="profil.cfm?bad2=available" addtoken="No">
</cfif>