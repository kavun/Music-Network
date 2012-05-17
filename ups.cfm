
   
<cfif NOT ISDEFINED('URL.SongID')>
<!--- USER UPS --->
<cfif ISDEFINED('URL.UserID')>
    <cfquery name="GetSongs" datasource="csc351final">
        SELECT u.*, s.*, user.*
        FROM Up u, Song s, User user
        WHERE u.UserID = #URL.UserID# AND u.SongID = s.SongID AND s.UserID = user.UserID
    </cfquery>
    <cfquery name="GetUser" datasource="csc351final">
    	SELECT *
        FROM User
        WHERE UserID = #URL.UserID#
    </cfquery>
    <cfoutput>
        <cfset Title = "Songs Up'ed by #GetUser.UserName#">
        </cfoutput>
 <cfinclude template="header.cfm">
    <section id="container">
    <div id="content">
    <cfoutput>
    <span style="font-size:3em;">Songs up'ed by #GetUser.UserName#</span>
    </cfoutput>
    <ul>
    <cfinclude template="songDetails.cfm">
    </ul>
    </div>
    </section>
</cfif>

<cfelse>
    
    <cfquery name="GetSong" datasource="csc351final">
        SELECT *
        FROM Song
        WHERE SongID = #URL.SongID#
    </cfquery>
    <cfquery name="GetUps" datasource="csc351final">
        SELECT p.*, u.*
        FROM Up p, User u
        WHERE p.UserID = u.UserID AND p.SongID = #URL.SongID#
    </cfquery>
    
    
    <cfset Title = "#GetSong.SongTitle#">
 <cfinclude template="header.cfm">
    
    <section id="container">
    <div id="content">
    <ul>
    
    <li>
    <cfoutput>
    <h2>#Title# up'ed by:</h2>
    </cfoutput>
    <cfoutput query="GetUps">
    <a href="profile.cfm?UserID=#UserID#" class="tag" id="user">#Username#</a>
    </cfoutput>
    </li>
    
    </ul>
    </div>
    </section>
</cfif>
<cfinclude template="footer.cfm">