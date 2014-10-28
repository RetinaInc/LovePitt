<%-- 
    Document   : home
    Created on : 2013-11-6, 16:54:18
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Love@Pitt!</title>
        <jsp:useBean id="userInfo" class="loveSRC.UserBean" scope="session"/>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resource/loveJS.js"></script>
    </head>

    <body class="defaultPage">
       <div class="bgDiv" style="background-image: url('Img/home_bg.jpg');"/>
       <form name="showfriend" action="UserServlet" method="post">
       <a href="home.jsp"><img class="logo" src="Img/logo.png"/><a/>
       <a href="profile.jsp"><img class="menu_profile" src="Img/home_profile.png"/></a>
       <a href="search.jsp"><img class="menu_search" src="Img/home_search.png"/></a>
       <input type="submit" class="friend" style="background-image: url('Img/home_friends.png');" value="" onclick="SetSession('viewFriend');"/>
       <a href="BBS.jsp"><img class="menu_BBS" src="Img/home_BBS.png"/></a>
       <a href="help.jsp"><img class="menu_help" src="Img/home_help.png"/></a>
          <input class="logoffSub" type="submit" value="" style="background-image: url('Img/home_logOff.png');" onclick="SetSession('LogOff');"/>
          <input type="hidden" name="SessionSet" id="SessionSet" />
            </form>
           <div class="welcomeBody">
               <p class="welcomeFont"><%out.println("Welcome," + userInfo.getName());%></p>
           </div>
           <div id="floating" style="background-image: url('Img/home_board.png');"></div>
   </div>
    </body>
</html>
