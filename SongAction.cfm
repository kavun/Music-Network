<cfif NOT ISDEFINED('URL.SongID')>
<cflocation url="home.cfm">
</cfif>

<cfquery name="UpdateSong" datasource="csc351final">
	UPDATE Song
    SET SongTitle = '#FORM.SongTitle#', SongURL = '#FORM.SongURL#'
    WHERE SongID = #URL.SongID#
</cfquery>
<cfoutput>
<cflocation url="#CGI.HTTP_REFERER#">
</cfoutput>