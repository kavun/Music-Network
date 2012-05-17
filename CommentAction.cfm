<cfif NOT ISDEFINED('URL.SongID') OR NOT ISDEFINED('SESSION.UserID')>
	<cflocation url="home.cfm">
</cfif>

<cfif NOT ISDEFINED('URL.CommentID')>
<!--- ADD COMMENT TO SONG --->
<cfquery name="AddComment" datasource="csc351final">
	INSERT INTO Comment(CommentDateTime, CommentText, SongID, UserID, Reply)
    VALUES (#NOW()#, '#FORM.CommentText#', #URL.SongID#, #Session.UserID#, FALSE)
</cfquery>
<cfoutput>
<cflocation url="#CGI.HTTP_REFERER#">
</cfoutput>


<cfelseif URL.CommentID GT 0>
<!--- ADD COMMENT TO COMMENT --->
<cfquery name="AddComment" datasource="csc351final">
	INSERT INTO Comment(CommentDateTime, CommentText, SongID, UserID, Reply, ReplyToCommentID)
    VALUES (#NOW()#, '#FORM.CommentText#', #URL.SongID#, #Session.UserID#, TRUE, #URL.CommentID#)
</cfquery>
<cfoutput>
<cflocation url="#CGI.HTTP_REFERER#">
</cfoutput>

<cfelse>
<cflocation url="home.cfm">
</cfif>