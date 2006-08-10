<cfoutput>
<cfloop index="i" from="1" to="9" step="1">

<cfset home = evaluate("form.team_home_"& i)>
<cfset away = evaluate("form.team_away_"& i)>

<CFQUERY NAME="insertspieltag" datasource="bulitipp">
  INSERT INTO Spieltage
  (Spieltag,
   Heim,
   Gast)
   VALUES
   (#form.spieltagID#,
	#home#,
	#away#)
</CFQUERY>


</cfloop>
</cfoutput>

<cflocation url="spieltag.cfm?spieltagID=#form.spieltagID#" addtoken="No">