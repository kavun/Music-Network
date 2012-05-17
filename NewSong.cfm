<cfif NOT IsDefined('URL.UserID')>
<cflocation url="song.cfm?SongID=0">
</cfif>

<cfquery name="NewSong" datasource="csc351final">
	INSERT INTO Song(SongCreateDateTime, SongTitle, SongUploadDateTime, SongURL, UserID)
    VALUES (#FORM.SongCreateDateTime#, '#FORM.SongTitle#', #NOW()#, '#FORM.SongURL#', '#URL.UserID#')
</cfquery>

<cflocation url="songs.cfm?UserID=#URL.UserID#">