<cfoutput>
<cfloop index="i" from="1" to="9" step="1">

<cfset home = evaluate("form.team_home_"& i)>
<cfset away = evaluate("form.team_away_"& i)>
<cfset gameID = evaluate("form.gameid_"& i)>
<cfset tore_heim = evaluate("form.tore_heim_"& i)>
<cfset tore_gast = evaluate("form.tore_gast_"& i)>


<cfset jahr = #Right(evaluate("datum_"& i), 4)#>
<cfset monat = #Mid(evaluate("datum_"& i), 4, 2)#>
<cfset tag = #Left(evaluate("datum_"& i), 4)#>
<cfset stunde = #Left(evaluate("zeit_"& i), 2)#>
<cfset minute = #Right(evaluate("zeit_"& i), 2)#>

<cfset termin = CreateDateTime(jahr, monat, tag, stunde, minute, 0)>
<cfset datum = #CreateODBCDateTime(termin)#> 

<cfif tore_heim is "">

<CFQUERY NAME="updatespieltag" datasource="bulitipp">
			UPDATE Spieltage SET 
				Heim = #home#,
				Gast = #away#,
				ZeitDatum = #datum#
			WHERE ID = #gameID#
		</CFQUERY>

<cfelse>	

<CFQUERY NAME="updatespieltag" datasource="bulitipp">
			UPDATE Spieltage SET 
				Heim = #home#,
				Gast = #away#,
				ZeitDatum = #datum#,
				Tore_Heim = #tore_heim#,
				Tore_Gast = #tore_gast#
			WHERE ID = #gameID#
		</CFQUERY>	
		
</cfif>

</cfloop>
</cfoutput>

<cfquery name="ranking" datasource="bulitipp" dbtype="ODBC">
SELECT *
FROM Users
WHERE Status > 0
</cfquery>	
	

<cfoutput query="ranking">

		<cfquery name="points" datasource="bulitipp" dbtype="ODBC">
		SELECT Users.ID, Tipps.SpielID, Spieltage.Tore_Heim, Spieltage.Tore_Gast, Tipps.Tendenz, Users.Status
		FROM Spieltage INNER JOIN (Users INNER JOIN Tipps ON Users.ID = Tipps.UserID) ON Spieltage.ID = Tipps.SpielID
		WHERE Tipps.UserID=#id# AND ((Spieltage.Tore_Heim)>=0) AND ((Users.Status)>0)
		</cfquery>	
		
		<cfset Punkte = 0>
		<cfif points.recordcount GT 0>
		<cfloop query="points">
		<cfset differenz = #points.Tore_Heim#-#points.Tore_Gast#>
		<cfif differenz GT 0 AND Tendenz IS 1>
		<cfset Punkte = Punkte+1>
		</cfif>
		<cfif differenz IS 0 AND Tendenz IS 0>
		<cfset Punkte = Punkte+1>
		</cfif>
		<cfif differenz LT 0 AND Tendenz IS 2>
		<cfset Punkte = Punkte+1>
		</cfif>
		<cfset temppunkte=punkte>
		</cfloop>
		<CFELSE>
		<cfset temppunkte=punkte>
		</cfif>
		<CFQUERY NAME="updatepunkte" datasource="bulitipp">
			UPDATE Users SET 
				Punkte = #temppunkte#
			WHERE ID = #id#
		</CFQUERY>

</cfoutput>


<cflocation url="spieltag.cfm?spieltagID=#form.spieltagID#" addtoken="No">