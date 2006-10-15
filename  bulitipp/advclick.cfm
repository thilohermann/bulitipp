<cfquery name="clickssaugen" datasource="bulitipp" dbtype="ODBC">
SELECT Clicks, link 
FROM bulitippadv
WHERE ID= #url.id#
</cfquery>

<cfoutput query="clickssaugen">
<CFSET newclicks = #clicks#+1>
</cfoutput>
<cfquery name="clickup" datasource="bulitipp" dbtype="ODBC">
UPDATE bulitippadv
SET Clicks = #newclicks#
WHERE ID = #url.id#
</cfquery>



<cflocation url="#clickssaugen.link#" addtoken="No">

