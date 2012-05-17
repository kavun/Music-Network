<cfoutput query="GetSongs">
 <li>
 <table>
      <tr><td><img class="play" src="img/icon/play.png"/><img class="pause" style="display:none;" src="img/icon/pause.png"/>&nbsp;&nbsp;<a style="font-size:3em;" href="song.cfm?SongID=#SongID#">#SongTitle#</a>&nbsp;&nbsp;&nbsp;&nbsp;by&nbsp;&nbsp;<a href="profile.cfm?UserID=#UserID#" class="tag" id="user">#Username#</a></td></tr>
        <cfquery name="GetSongTags" datasource="csc351final">
        	SELECT st.*, t.*
            FROM SongTag st, Tag t
            WHERE st.SongID = #SongID# AND t.TagID = st.TagID
        </cfquery>
        <tr><td>
        <cfloop query="GetSongTags">
        	<a class="tag" href="tag.cfm?TagID=#TagID#">#TagName#</a>
        </cfloop><cfif GetSongTags.RecordCount IS 0><span class="tag" id="notag">0 Tags</span></cfif></td></tr>
        
        <cfquery name="GetNumUps" datasource="csc351final">
        	SELECT COUNT(*) AS NumUps
            FROM Up
            WHERE SongID = #SongID#
        </cfquery>
        <cfquery name="GetUserUp" datasource="csc351final">
        	SELECT *
            FROM Up
            WHERE SongID = #SongID# AND UserID = #SESSION.UserID#
        </cfquery>
        <cfquery name="CheckSongUser" datasource="csc351final">
        	SELECT *
            FROM Song
            WHERE SongID = #SongID# AND UserID = #SESSION.UserID#
        </cfquery>
        <tr><td>
        <cfif CheckSongUser.RecordCount IS 0>

		  <cfif GetUserUp.RecordCount GT 0>
          <a href="up.cfm?SongID=#SongID#&Up=0" class="tag" id="uped">Up'ed!</a>
          <cfelse>
          <a href="up.cfm?SongID=#SongID#" class="tag">Up</a>
          </cfif>
          
        </cfif>
        <a href="ups.cfm?SongID=#SongID#" class="tag ups">#GetNumUps.NumUps# Ups</a></td></tr>
        </table>
        </li>
            </cfoutput>
			
<script>
$('.play').click( function() {
	$(this).hide();
	$(this).next('.pause').show();
});
$('.pause').click( function() {
	$(this).hide();
	$(this).prev('.play').show();
});
</script>