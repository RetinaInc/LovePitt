<%-- 
    Document   : profile
    Created on : 2013-11-12, 20:59:40
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Love@Pitt!</title>
        <jsp:useBean id="userInfo" class="loveSRC.UserBean" scope="session"/>
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
            <a href="profileEdit.jsp"><img class="editProfile" src="Img/profile_edit.png"/></a>
           <div class="profileBody" style="background-image: url('Img/profile_book.png');">  
               <p class="nameFont" id="name"><%out.println(userInfo.getName());%></p>
               <p class="profileFont"><%out.println(userInfo.getUserName());%></p>
               <p class="profileFont"><%out.println(userInfo.getFirstName());%></p>
               <p class="profileFont"><%out.println(userInfo.getLastName());%></p>
               <p class="profileFont"><%out.println(userInfo.getGender());%></p>
               <p class="profileFont"><%out.println(userInfo.getAge());%></p>
               <p class="profileFont" id="Email"><%out.println(userInfo.getEmail());%></p>
           </div>
            <input type="hidden" name="SessionSet" id="SessionSet"/>
       </form>
      </div>
    </body>
</html>
