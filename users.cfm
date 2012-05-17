<cfif NOT IsDefined('SESSION.Access')>
<cflocation url="index.cfm">
</cfif>

<cfquery name="GetUsers" datasource="csc351final">
	SELECT *
    FROM User
    ORDER BY UserCreateDateTime
</cfquery>

<cfset Title="Users">
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
    <h2>All Users</h2>
    <ul>
    <cfoutput query="GetUsers">
    	<li>
        	#Username# - #UserEmail# <br>
            Last Logged in on #DateFormat(UserLogInDateTime, "short")#<br>
            Account created on #DateFormat(UserCreateDateTime, "short")#<br>
            <a href="songs.cfm?UserID=#UserID#" class="tag">Songs</a>
            <a href="ups.cfm?UserID=#UserID#" class="tag">Ups</a>
            <a href="profile.cfm?UserID=#UserID#" class="tag">Profile</a>
            <cfif SESSION.Access IS 9>
            <a href="UserDeleteCheck.cfm?UserID=#UserID#" class="tag">Delete</a>
            </cfif>
        </li>
    </cfoutput>
    </ul>
  </div><!-- end container_content -->
</section><!--//end #container//-->

<cfinclude template="footer.cfm">
