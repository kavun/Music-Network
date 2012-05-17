<cfif NOT ISDEFINED('URL.SongID')>
	<cflocation url="home.cfm">
</cfif>
<cfquery name="DeleteSongTag" datasource="csc351final">
	DELETE FROM SongTag
    WHERE SongID = #URL.SongID#
</cfquery>
<cfquery name="DeleteUps" datasource="csc351final">
	DELETE FROM Up
    WHERE SongID = #URL.SongID#
</cfquery>
<cfquery name="DeleteComments" datasource="csc351final">
	DELETE FROM Comment
    WHERE SongID = #URL.SongID#
</cfquery>
<cfquery name="DeleteSong" datasource="csc351final">
	DELETE FROM Song
    WHERE SongID = #URL.SongID#
</cfquery>

<cfoutput>
<cflocation url="#CGI.HTTP_REFERER#">
</cfoutput>