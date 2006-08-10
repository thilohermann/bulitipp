<cfquery name="LoginCheck" datasource="bulitipp" dbtype="ODBC">
SELECT users.ID, Username, Password, Status, users.groupID, userstatus.statusname
FROM Userstatus INNER JOIN users ON userstatus.ID = Users.Status
WHERE Username = '#form.login#'
AND Password = '#form.passwort#'
</cfquery>

<CFSET Checksumme = #LoginCheck.recordcount#>

<CFIF #CheckSumme# is 1 and #logincheck.Password# is not "">

  <CFSET Session.name = LoginCheck.Username>
  <CFSET Session.passwort = form.passwort>
  <CFSET Session.status = LoginCheck.statusname>
  <CFSET Session.statusid = LoginCheck.status>
  <CFSET Session.userid = LoginCheck.id>
  <CFSET Session.groupid = LoginCheck.groupID>




<CFSET #zeitdatum# = createodbcdatetime("#now()#")>



  <cfquery name="LoginDatum" datasource="bulitipp" dbtype="ODBC">
  UPDATE Users SET 
  LastLogin = #zeitdatum#
  WHERE Username = '#form.login#' AND Password = '#form.passwort#'
  </cfquery>




<cflocation url="index_success.cfm" addtoken="Yes">


<cfelse>
<cflocation url="db_loginerror.cfm" addtoken="No">

</cfif>

