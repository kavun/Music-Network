<cfif NOT ISDEFINED('URL.SongID')>
  <cflocation url="home.cfm">
</cfif>

<cfif NOT ISDEFINED('URL.Up')>

<cfquery name="AddUp" datasource="csc351final">
	INSERT INTO Up(CreateDate, SongID, UserID)
    VALUES(#NOW()#, '#URL.SongID#', '#SESSION.UserID#')
</cfquery>

<cfelseif URL.UP IS 0>
<cfquery name="DeleteUp" datasource="csc351final">
	DELETE FROM Up
    WHERE SongID = #URL.SongID# AND UserID = #SESSION.UserID#
</cfquery>
</cfif>

<cflocation url="#CGI.HTTP_REFERER#">