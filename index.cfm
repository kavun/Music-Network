<cfset Title="Login">
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


<section id="container">
  <div id="content">
  <span style="font-size:4em;">Login</span>
    <ul>
	<li>
    <cfform name="login" action="EntranceAction.cfm" method="post">
        <table>
            <tr>
                <td>
                User Name
                </td>
                <td>
                <cfinput type="text" name="UserName" maxlength="30" validateat="onserver,onsubmit">
                </td>
            </tr>
            <tr>
                <td>
                Password
                </td>
                <td>
                <cfinput type="password" name="Password" maxlength="30" validateat="onserver,onsubmit">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <cfinput type="submit" name="Login" value="Login">
                <cfinput type="button" name="New User" value="New User" onClick="goTo('NewUser.cfm')">
                </td>
            </tr>
        </table>
	</cfform>
	</li>
    </ul>
  </div><!-- end container_content -->
</section><!--//end #container//-->

<script src="js/script.js"></script>
</body>
</html>
