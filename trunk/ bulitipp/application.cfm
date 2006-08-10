<cfapplication name="bulitipp" sessionmanagement="Yes" setclientcookies="Yes" sessiontimeout="#CreateTimeSpan(0,0,30,0)#">

<CFIF GetFileFromPath(GetTemplatePath()) NEQ "index.cfm" AND GetFileFromPath(GetTemplatePath()) NEQ "db_logincheck.cfm" AND GetFileFromPath(GetTemplatePath()) NEQ "db_loginerror.cfm" AND GetFileFromPath(GetTemplatePath()) NEQ "logout.cfm">
	<CFIF NOT IsDefined("session.name") OR NOT IsDefined("session.passwort")>
		<CFLOCATION URL="db_loginerror.cfm" ADDTOKEN="NO">
	<CFELSEIF session.name is "" or session.passwort is "">
		<CFLOCATION URL="db_loginerror.cfm" ADDTOKEN="NO">
	</CFIF>
</CFIF>