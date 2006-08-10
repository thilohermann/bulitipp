<cfset aktuell = #now()#>
<table>
  <tr>
    <td><img src="pictures/logo.gif" width="200" height="90" alt="" border="0"></td>
	<td>&nbsp;&nbsp;&nbsp;</td>
	<td><a href="http://www.spreadfirefox.com/?q=affiliates&id=7229&t=202"><img border="0" alt="Upgrade to Firefox 1.5!" title="Upgrade to Firefox 1.5!" src="http://sfx-images.mozilla.org/affiliates/products/firefox/upgrade_1_5_468b1.jpg"/></a></td>
  </tr>
</table>

<br>
<cfoutput>
<div class="distance" style="border:1px solid ##FFCC00; -moz-border-radius:10px; background-color: ##000000; width:700px; color: ##ffffff;">&nbsp;&nbsp;<a class="first" href="index_success.cfm">Startseite</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="first" href="user_spieltag.cfm?spieltag=now">Spieltage</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="first" href="##">Buli-Tabelle</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="first" href="members.cfm">Members</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="first" href="##">Infos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="first" href="profil.cfm">Profil</a><cfif session.statusid GT 2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="firstadmin" href="spieltag.cfm?spieltagID=1">ADMIN</a></cfif></div>
</cfoutput>