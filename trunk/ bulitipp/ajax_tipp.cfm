<cfquery name="ExistsTipp" datasource="bulitipp" dbtype="ODBC">
SELECT *
FROM Tipps
WHERE SpielID = #url.gameID# AND UserID = #url.userID#
</cfquery>

<cfquery name="sicherheitscheck" datasource="bulitipp" dbtype="ODBC">
SELECT Zeitdatum
FROM Spieltage
WHERE ID = #url.gameID#
</cfquery>	

<cfset aktuell = #now()#>

<CFIF sicherheitscheck.zeitdatum GT aktuell>

<cfif ExistsTipp.recordcount is 0>

<CFQUERY NAME="inserttipp" datasource="bulitipp">
  INSERT INTO Tipps
  (UserID,
   SpielID,
   Tendenz)
   VALUES
   (#url.userID#,
	#url.gameID#,
	#url.selectedtipp#)
</CFQUERY>

<CFELSE>

<CFQUERY NAME="updatetipp" datasource="bulitipp">
UPDATE Tipps SET 
	Tendenz = #url.selectedtipp#
WHERE  SpielID = #url.gameID# AND UserID = #url.userID#
</CFQUERY>

		
</cfif>

</CFIF>