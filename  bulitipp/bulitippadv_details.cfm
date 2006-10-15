<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Admin Adv</title>
	
<link rel="stylesheet" type="text/css" href="outsourcing/standard.css">	


<cfif isdefined ("url.id")>

<CFQUERY datasource="bulitipp" NAME="detailssaugen">
SELECT *
FROM bulitippadv
Where id = #url.id#
</CFQUERY>
</cfif>

</head>

<body>
<cfinclude template="includes/__header.cfm">

<br>
<cfif isdefined ("url.id")>
<cfform action="admin_db_adv.cfm" method="POST" enablecab="Yes" enctype="multipart/form-data">
<cfoutput query="detailssaugen">
<table>
  <tr>
    <td>Anbieter</td>
	<td colspan="2"><cfinput type="Text" name="anbieter" value="#anbieter#" required="No" size="40"></td>
  </tr>
  <tr>
    <td>BannerURL:</td>
	<td colspan="2"><cfinput type="Text" name="bannerurl" value="#bannerurl#" required="No" size="80"></td>
  </tr>
  <tr>
    <td>Link:</td>
	<td colspan="2"><cfinput type="Text" name="link" value="#link#" required="No" size="80"></td>
  </tr>
  <tr>
    <td>Bildupload</td>
	<td colspan="2"><input type="file" name="bildfile" SIZE="40">&nbsp;<cfinput type="Checkbox" name="bildupload" value="ja"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
	<td colspan="2"><a href="#link#" target="_blank" class="ohnestrich"><img src="<CFIF #Left(bannerURL,4)# IS NOT 'http'>../adv/</CFIF>#bannerURL#" width=468 height=60 alt="" border="0"></td>
  </tr>
  <tr>
    <td colspan="3"><input type="submit" value="update"></td>
  </tr>
</table>
<input type="hidden" name="id" value="#id#">
</cfoutput>
</cfform>
</cfif>
</body>
</html>
