


<cfquery name="updatestatus" datasource="bulitipp" dbtype="ODBC">
UPDATE bulitippadv SET 
clicks = 0
WHERE id=#url.id#
</cfquery>

<cflocation url="admin_adv.cfm" addtoken="No">


