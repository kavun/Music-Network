<cfif ISDEFINED('URL.ID')>
  <cfif URL.ID IS 0>
	<!--- IF NEW USER --->
    <cfquery name="NewUser" datasource="csc351final">
    	INSERT INTO User(Password, UserEmail, Username, UserCreateDateTime)
        VALUES ('#FORM.Password#', '#FORM.Email#', '#FORM.Username#', #NOW()#)
    </cfquery>
    <cfquery name="NewUserID" datasource="csc351final">
    	SELECT @@IDENTITY
    </cfquery>
	<cfoutput>
	  <cfset SESSION.access = 1>
      <cfset SESSION.UserName = "#FORM.Username#">
      <cfset SESSION.UserID = "#NewUserID.EXPR1000#">
      <cfquery name="UpdateLoginTime" datasource="csc351final">
      	UPDATE User
        SET UserLoginDateTime = #NOW()#
        WHERE UserID = #SESSION.UserID#
      </cfquery>
      <cflocation url="home.cfm">
    </cfoutput>
  <cfelse>
  	<cflocation url="index.cfm">
  </cfif> <!-- end url.id is 0 -->
<cfelse>
<!--- ATTEMPT LOGIN PREXISTING USER --->
  <cfquery name="GetUser" datasource="csc351final">
    SELECT *
    FROM User
    WHERE Username = '#FORM.Username#' AND Password = '#FORM.Password#'
  </cfquery>
  <cfif GetUser.RecordCount GT 0 AND GetUser.RecordCount LT 2>
    <cfif FORM.Password IS "kavun">
	  <cfoutput>
		<cfset session.access = 9>
        <cfset session.UserName = "#FORM.Username#">
        <cfset session.UserID = "#GetUser.UserID#">
        <cfquery name="UpdateLoginTime" datasource="csc351final">
          UPDATE User
          SET UserLoginDateTime = #NOW()#
          WHERE UserID = #GetUser.UserID#
      	</cfquery>
        <cflocation url="home.cfm">
      </cfoutput>
    <cfelse>
      <cfoutput>
		<cfset session.access = 1>
        <cfset session.UserName = "#FORM.Username#">
        <cfset session.UserID = "#GetUser.UserID#">
        <cfquery name="UpdateLoginTime" datasource="csc351final">
          UPDATE User
          SET UserLoginDateTime = #NOW()#
          WHERE UserID = #GetUser.UserID#
      	</cfquery>
        <cflocation url="home.cfm">
      </cfoutput>
    </cfif> <!-- end form.password is kavun -->
  <cfelse>
    <cflocation url="index.cfm">
  </cfif> <!-- end is recordcount -->
</cfif> <!-- end is defined url.id -->