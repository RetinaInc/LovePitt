<%-- 
    Document   : BBS
    Created on : 2013-12-3, 21:19:57
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Love@Pitt!</title>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <jsp:useBean id="userInfo" class="loveSRC.UserBean" scope="session"/>
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
          <input type="hidden" name="SessionSet" id="SessionSet" />
          </form>
           <div class="bbsBody">
               <img src="Img/BBS_Welcome.png"/>
               <form action="PostServlet" method="post">
                 <div class="selection">
                   <p class="titleRegiFont">View Latest</p>
                   <select name="count">
                       <option value="5">5 posts</option>
                       <option value="10">10 posts</option>
                       <option value="15">15 posts</option>
                       <option value="20">20 posts</option>
                   </select>
                   <p class="titleRegiFont">Section:</p>
                   <select name="type">
                       <option value="all">All</option>
                         <option value="General-Chat">General-Chat</option>
                         <option value="Rent-house">Rent-House</option>
                         <option value="Find-Companion">Find-Companion</option>
                         <option value="Success-case">Success-Case</option>
                       </select>
                   <input type="submit" class="goBBS" value="" style="background-image:url('Img/BBS_GO.png');"/>
                 </div>
                   <input type="hidden" value="BBS" name="SessionSet"/>
               </form>
           </div>
   </div>
    </body>
</html>
