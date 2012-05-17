<cfif NOT IsDefined('SESSION.Access')>
<cflocation url="index.cfm">
</cfif>

<cfset Title="Packages">
<cfinclude template="header.cfm">

<section id="container">
  <div id="content">
    <h2>Your Packages</h2>
  </div><!-- end container_content -->
</section><!--//end #container//-->

<cfinclude template="footer.cfm">
