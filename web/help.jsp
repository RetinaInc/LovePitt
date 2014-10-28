<%-- 
    Document   : help
    Created on : 2013-11-30, 23:12:41
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Need Help? Contact Us!</title>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resource/loveJS.js"></script>
    </head>

    <body class="defaultPage">
      <div class="bgDiv" style="background-image: url('Img/home_bg.jpg');">
       <form name="showfriend" action="UserServlet" method="post">
       <a href="home.jsp"><img class="logo" src="Img/logo.png"/><a/>
       <a href="profile.jsp"><img class="menu_profile" src="Img/home_profile.png"/></a>
       <a href="search.jsp"><img class="menu_search" src="Img/home_search.png"/></a>
       <input type="submit" class="friend" style="background-image: url('Img/home_friends.png');" value="" onclick="SetSession('viewFriend');"/>
       <a href="BBS.jsp"><img class="menu_BBS" src="Img/home_BBS.png"/></a>
       <a href="help.jsp"><img class="menu_help" src="Img/home_help.png"/></a>
           <div class="helpBody">
           <p class="titleRegiFont" id="help"><i>Love@Pitt</i> tends to provide opportunity for Pitters and CMUers to get to know each other.<br/>
               Designed by Linqing Wang & Sijia Zhao.®<br/>
               All rights reserved.<br/>
               Do not hesitate to contact us if you have any questions!<br/>
               Contact:</p>
           <a href="mailto:linqing900627@gmail.com">Send Us an Email</a>
               <p><b>Give Us a Call at: 412-(304)-6406</b><p/>
           </div>
       <input type="hidden" name="SessionSet" id="SessionSet"/>
       </form>
      </div>
    </body>
</html>
