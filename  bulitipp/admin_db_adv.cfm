<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfif isdefined("url.action")>
<cfquery name="updatestatus" datasource="bulitipp" dbtype="ODBC">
UPDATE bulitippadv SET 
status = #url.status#
WHERE id=#url.id#
</cfquery>
<cflocation url="admin_adv.cfm" addtoken="No">

<CFELSE>

<cfquery name="update" datasource="bulitipp" dbtype="ODBC">
UPDATE bulitippadv SET 
Anbieter = '#form.anbieter#',
BannerURL = '#form.bannerurl#',
Link = '#form.link#'
WHERE id=#form.id#
</cfquery>

<cfif isdefined("form.bildupload")>

<cffile action="UPLOAD" filefield="bildfile" destination="e:\cfwww\moviesite\bulitipp\adv\" nameconflict="OVERWRITE" accept="image/gif, image/pjpeg">
</cfif>
<br><br>
<TABLE>
<TR><TD><b>Das Update wurde erfolgreich ausgeführt</b></td></tr>
</table>
</cfif>

</body>
</html>
