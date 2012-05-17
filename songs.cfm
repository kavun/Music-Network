
<cfif NOT IsDefined('SESSION.Access')>
<cflocation url="index.cfm">
</cfif>

<cfquery name="GetSongs" datasource="csc351final">
	SELECT s.*, u.*
    FROM Song s, User u
    WHERE s.UserID = #URL.UserID# AND s.UserID = u.UserID
</cfquery>
<cfquery name="GetUser" datasource="csc351final">
	SELECT *
    FROM User
    WHERE UserID = #URL.UserID#
</cfquery>

<cfset Title="Songs">
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
  <!--- Logged in User --->
  <cfif URL.UserID IS SESSION.UserID>

    <h2>Your Songs <a href="song.cfm?SongID=0" class="tag">Add Song</a></h2>
      <ul>
  <cfoutput query="GetSongs">

  <li>
  <cfform action="SongAction.cfm?SongID=#SongID#&UserID=#UserID#" method="post">
  Title <cfinput type="text" name="SongTitle" value="#SongTitle#"><br>
  URL <cfinput type="text" name="SongURL" value="#SongURL#"><br>
  <cfinput name="Update" type="submit" value="Update"><cfinput name="Delete" type="button" onClick="goTo('SongDelete.cfm?SongID=#SongID#&UserID=#UserID#')" value="Delete">
  </cfform>
  </li>

  </cfoutput>
    </ul>  
    
    
  <!--- Other user --->
  <cfelse>
  <cfoutput>
    <h2>#GetUser.Username#'s Songs</h2>
  </cfoutput>
  <ul>
  <cfinclude template="songDetails.cfm">
  </ul>
  </cfif>
  </div><!-- end container_content -->
</section><!--//end #container//-->


<cfinclude template="footer.cfm">
