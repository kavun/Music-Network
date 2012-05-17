<cfif NOT IsDefined('SESSION.Access') OR NOT IsDefined('URL.SongID')>
<cflocation url="index.cfm">
</cfif>

<cfif URL.SongID IS 0>

<cfoutput>
<cfset Title="New Song">
</cfoutput>
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
    <cfoutput><h2>#Title#</h2></cfoutput>
    <ul>
    	<li>
        	<cfform name="NewSong" action="NewSong.cfm?UserID=#Session.UserID#" method="post">
            <table>
            <tr>
            <td>Song Title</td><td><cfinput type="text" name="SongTitle" required="yes" validateat="onserver,onsubmit"></td></tr>
            <tr><td>Song URL</td><td><cfinput type="text" name="SongURL" required="yes" validate="url" validateat="onserver,onsubmit"></td></tr>
            <tr><td>Song Create Date</td><td><cfinput type="datefield" name="SongCreateDateTime" required="yes" validate="date" validateat="onserver,onsubmit"></td></tr>
            <tr><td colspan="2"><cfinput type="submit" name="Submit" value="Add Song"></td></tr>
            </cfform>
        </li>
    </ul>
  </div><!-- end container_content -->
</section><!--//end #container//-->


<!--- SHOW A SONG --->
<cfelse>

<cfquery name="GetSongs" datasource="csc351final">
	SELECT s.*, u.*
    FROM Song s, User u
    WHERE s.SongID = #URL.SongID# AND s.UserID = u.UserID
</cfquery>

<cfoutput>
<cfset Title="#GetSongs.SongTitle# - #GetSongs.Username#">
</cfoutput>
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
    <ul>
    <cfinclude template="songDetails.cfm">
    </ul>
    <ul>
    <!--- DISPLAY COMMENTS --->
    <li>
    <h2>Comments</h2>
		<a href="##" class="commentToggle tag">Add Comment</a>
            <div style="display:none;" class="commentBox">
                <cfform action="CommentAction.cfm?SongID=#URL.SongID#" method="post">
                <cftextarea cols="40" name="CommentText">Enter your comment here</cftextarea><br>
                <cfinput type="submit" name="AddComment" value="Add Comment">
                </cfform>
            </div>
    <cfquery name="GetSongComments" datasource="csc351final">
    	SELECT c.*, u.*
        FROM Comment c, User u
        WHERE c.SongID = #URL.SongID# AND c.UserID = u.UserID AND Reply = FALSE
    </cfquery>
    
    <cfif GetSongComments.RecordCount IS 0>
        <p>No comments yet!</p>
        
    <cfelse>
        <ul class="comments">
        <cfoutput query="GetSongComments">
            <li>
            #CommentText# - <a href="profile.cfm?UserID=#UserID#" class="tag" id="user">#Username#</a> - #DateFormat(CommentDateTime)#
            <cfquery name="GetCComments" datasource="csc351final">
                SELECT c.*, u.*
                FROM Comment c, User u
                WHERE c.SongID = #URL.SongID# AND c.UserID = u.UserID AND Reply = TRUE AND ReplyToCommentID = #CommentID#
            </cfquery>
            <ul>

            <cfif GetCComments.RecordCount GT 0>

            <cfloop query="GetCComments">
            <li>
            #CommentText# - <a href="profile.cfm?UserID=#UserID#" class="tag" id="user">#Username#</a> - #DateFormat(CommentDateTime)#
            </li>
            </cfloop>

            </cfif><br>
            <a href="##" class="commentToggle tag">Add Comment</a>
            <div style="display:none;" class="commentBox">
                <cfform action="CommentAction.cfm?SongID=#URL.SongID#&CommentID=#CommentID#" method="post">
                <cftextarea cols="40" name="CommentText">Enter your comment here</cftextarea><br>
                <cfinput type="submit" name="AddComment" value="Add Comment">
                </cfform>
            </div>
            </ul>
            </li>
        </cfoutput>
        </ul>
    </cfif>
    </li>
    </ul>
  </div><!-- end container_content -->
</section><!--//end #container//-->

</cfif>

<cfinclude template="footer.cfm">

<script>
$('.commentToggle').toggle(function(){
  $(this).next('.commentBox').show(); 
  $(this).text("Hide Comment");
},function(){
  $(this).next('.commentBox').hide(); 
  $(this).text("Add Comment");
});
</script>
