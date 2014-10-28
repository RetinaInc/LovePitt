<%-- 
    Document   : searchList
    Created on : 2013-12-7, 19:23:20
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="userList" class="loveSRC.UserListBean" scope="session"/>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resource/loveJS.js"></script>
        <title>Search Result</title>
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
         <table class="resultTable">
           <tr class="defaultTr">
             <td class="defaultTd" width="100px" height="50px"><p class="titleRegiFont">UserName</p></td>
             <td class="defaultTd" width="150px"><p class="titleRegiFont">Email</p></td>
             <td class="defaultTd" width="100px"><p class="titleRegiFont">Age</p></td>
             <td class="defaultTd" width="100px"><p class="titleRegiFont">Gender</p></td>
             <td class="defaultTd" width="200px"><p class="titleRegiFont">FullName</p></td>
           </tr>
           <% for(int i=0; i<userList.getNum(); i++){
                out.println("<tr class=\"defaultTr\">");
                out.println("<td class=\"defaultTd\" height=\"50px\">" + userList.getUserName(i) + "</td>");
                out.println("<td class=\"defaultTd\">" + userList.getEmail(i) + "</td>");
                out.println("<td class=\"defaultTd\">" + userList.getAge(i) + "</td>");
                out.println("<td class=\"defaultTd\">" + userList.getGender(i) + "</td>");
                out.println("<td class=\"defaultTd\">" + userList.getName(i)+ " "
                            + "<input type=\"submit\" onclick=\"SetSession('addFriend'); SetFriendID('"+userList.getID(i)+"');\" value=\"add\"/></td>");
                out.println("</tr>");
           }%>
         </table>
         <input type="hidden" name="userid" id="userid"/>
         <input type="hidden" name="SessionSet" id="SessionSet"/>
        </form>
    </body>
</html>
