<cfquery name="GetUserUps" datasource="csc351final">
	SELECT s.*, u.*, user.*
    FROM Song s, Up u, User user
    WHERE s.SongID = u.SongID AND u.UserID = #SESSION.UserID# AND user.UserID = s.UserID
</cfquery>
<cfquery name="GetUserSongs" datasource="csc351final">
	SELECT s.*
    FROM Song s
    WHERE s.UserID = #SESSION.UserID#
</cfquery>

<!DOCTYPE html>
<head>
  <!--- <meta> --->
  <meta charset="UTF-8" />
  <meta name="description" content="Social Network for posting music." />
  <meta name="keywords" content="Music,Social Network, MP3" />
  <meta name="author" content="Kevin Reed http://www.kevreed.com" />
  <!--- <link> --->
  <link rel="stylesheet" type="text/css" href="style/style.css" media="all" />
  <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
  <script src="js/jquery-1.7.2.js"></script>
  
  <cfoutput>
    <title>#Title# | Music Network</title>
  </cfoutput>
</head>

<body id="home">
<header>
  <nav> 
    
  </nav><!--//end #nav//-->
</header><!--//end #header//-->

<section id="left">
<div id="content">
      <!--- User Info --->
      <cfoutput>
      <p><span style="font-size:2em;">#SESSION.Username#</span>, you are logged in.</p>
      </cfoutput>
      
      
      <!--- NAV --->
      <cfoutput>
      <ul>
        <li><a href="home.cfm"<cfif Title IS "Home"> id="current"</cfif>>Home</a></li>
        <li><a href="profile.cfm?UserID=#SESSION.UserID#"<cfif Title IS "Profile"> id="current"</cfif>>Profile</a></li>
        <li><a href="songs.cfm?UserID=#SESSION.UserID#"<cfif Title IS "Songs"> id="current"</cfif>>Songs</a></li>
        <li><a href="packages.cfm?UserID=#SESSION.UserID#"<cfif Title IS "Packages"> id="current"</cfif>>Packages</a></li>
        <li><a href="users.cfm"<cfif Title IS "Users"> id="current"</cfif>>Users</a></li>
        <li><a href="logout.cfm">Logout</a></li>
      </ul>
      </cfoutput>
      <!--- Recently uped songs --->
      
      <span style="font-size:2em;">Your Recent Ups</span>
      <ul id="userUps">
      <cfoutput query="GetUserUps">
      <li>
      <a href="song.cfm?SongID=#SongID#">#SongTitle#</a><a href="profile.cfm?UserID=#UserID#" class="tag" id="user">#Username#</a> - up'ed on #DateFormat(CreateDate, "short")#
      </li>
      </cfoutput>
      </ul>
      
      <!--- Recently Uploaded Songs --->
      <span style="font-size:2em;">Your Songs</span>
      <ul id="userUps">
      <cfoutput query="GetUserSongs">
      <li>
      <a href="song.cfm?SongID=#SongID#">#SongTitle#</a> - uploaded on #DateFormat(SongUploadDateTime, "short")#
      </li>
      </cfoutput>
      </ul>
      
      
      
      </div> <!-- end content -->
</section> <!-- end left -->

