<%-- 
    Document   : search
    Created on : 2013-11-19, 22:53:14
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
       <input type="hidden" name="SessionSet" id="SessionSet"/>
       </form>
        <div class="searchBody">
          <form name="Search" method="post" action="UserServlet">
              <table class="searchTable">
                   <tr class="defaultTr">
                       <td class="defaultTd" width="250px" height="40px" colspan="2">
                           <input type="radio" name="searchType" value="general" checked/><p class="titleRegiFont">General Search :</p></td>
                       <td class="defaultTd" width="200px" height="40px" colspan="2">
                           <input type="radio" name="searchType" value="advance"/><p class="titleRegiFont">Advaced Search :</p></td>
                   </tr>
                   <tr class="defaultTr">
                       <td><p class="selectFont">Gender:</p></td>
                       <td><select name="gender" id="gender">
                           <option value="female">Female</option>
                           <option value="male">Male</option>
                           <option value="none">Not Specific</option>
                           </select>
                       </td>
                       <td colspan="2"><p class="selectFont">UserName:</p></td>
                       
                   </tr>
                   <tr class="defaultTr">
                       <td><p class="selectFont">Age:</p></td>
                       <td><select name="age" id="age">
                           <option value="1">Under 20</option>
                           <option value="2">21-30</option>
                           <option value="3">31-40</option>
                           <option value="4">Above 40</option>
                           </select>
                       </td>
                       <td colspan="2"><input type="text" name="username" style="width:150px;"/></td>
                   </tr>
                   <tr class="defaultTr">
                       <td  colspan="2">
                           <input class="submitRegi" style="background-image: url('Img/register_submit.png');" type="submit" value="" name="Submit"/>
                       </td>
                   </tr>
              </table>
           <input type="hidden" name="SessionSet" value="Search"/>
           <input type="hidden" name="userid" value="<% out.println(userInfo.getID()); %>" />
           </form>
         </div>
      </div>
    </body>
</html>
