<cfif NOT IsDefined('SESSION.Access')>
<cflocation url="index.cfm">
</cfif>

<cfquery name="GetSongs" datasource="csc351final">
	SELECT s.*, u.*
    FROM Song s, User u
    WHERE s.UserID = u.UserID
    ORDER BY SongUploadDateTime
</cfquery>

<cfset Title="Home">
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
    <span style="font-size:3em;">Recently Added Songs</span>
    <ul>
		<cfinclude template="songDetails.cfm">
    </ul>
  </div><!-- end container_content -->
</section><!--//end #container//-->

<cfinclude template="footer.cfm">

