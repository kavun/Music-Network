<cfif NOT IsDefined('SESSION.Access')>
<cflocation url="index.cfm">
</cfif>

<cfquery name="GetUser" datasource="csc351final">
	SELECT *
    FROM User
    WHERE UserID = #URL.UserID#
</cfquery>

<cfset Title="Profile">
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
  <!--- Logged in User --->
  <cfif URL.UserID IS SESSION.UserID>
    <h2>Your Profile</h2>
    
    <cfoutput query="GetUser">
    <cfform action="UserAction.cfm?UserID=#URL.UserID#" method="post">
    <ul>
    <li>
    Account Created on: #DateFormat(UserCreateDateTime, "long")#<br>
    Username<cfinput type="text" name="username" value="#Session.Username#"><br>
    Email address<cfinput type="text" name="email" value="#UserEmail#" validate="email" validateat="onserver,onsubmit"><br>
    <cfinput type="submit" name="Update" value="Update">
    
    </li>
    <li><a href="songs.cfm?UserID=#UserID#" class="tag">
    My Songs</a><br><a href="ups.cfm?UserID=#UserID#" class="tag">
    My Ups</a>
    </li>
    </ul>
    </cfform>
    </cfoutput>
    
    
  <!--- Other user --->
  <cfelse>
  <cfoutput query="GetUser">
  <h2>#GetUser.Username#'s Profile</h2>
  <ul>
  <li>
  Account Created on #DateFormat(UserCreateDateTime, "long")#<br>
  Username: #Username#<br>
  Email address: #UserEmail#<br>
  </li>
  <li><a href="songs.cfm?UserID=#UserID#" class="tag">
  #Username#'s Songs
  </a><br><a href="ups.cfm?UserID=#UserID#" class="tag">
  #Username#'s Ups
  </a></li>
  </ul>
  </cfoutput>
  </cfif>
  </div><!-- end container_content -->
</section><!--//end #container//-->

<cfinclude template="footer.cfm">
