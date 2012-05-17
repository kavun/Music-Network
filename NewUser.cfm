<cfset Title="New User">
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
  <span style="font-size:4em;">Create New User and Login</span>
    <ul>
	<li>
    <cfform name="newUser" action="EntranceAction.cfm?ID=0" method="post">
        <table>
            <tr>
                <td>
                Choose a User Name
                </td>
                <td>
                <cfinput type="text" name="Username" maxlength="30" validateat="onserver,onsubmit">
                </td>
            </tr>
            <tr>
                <td>
                Choose a Password
                </td>
                <td>
                <cfinput type="password" name="Password" maxlength="30" validateat="onserver,onsubmit">
                </td>
            </tr>
            <tr>
                <td>
                Choose a Email
                </td>
                <td>
                <cfinput type="text" name="Email" maxlength="30" validate="email" validateat="onserver,onsubmit">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <cfinput type="submit" name="NewUser" value="New User">
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
