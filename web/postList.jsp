<%-- 
    Document   : postList
    Created on : 2013-12-5, 18:46:35
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="userInfo" class="loveSRC.UserBean" scope="session"/>
        <jsp:useBean id="postList" class="loveSRC.PostListBean" scope="session"/>
        <jsp:useBean id="postInfo" class="loveSRC.PostBean" scope="session"/>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resource/loveJS.js"></script>
        <title>Recent Posts</title>
    </head>
    <body class="defaultPage">
      <div class="bgDiv" style="background-image: url('Img/home_bg.jpg');"/>
       <form name="showfriend" action="UserServlet" method="post">
       <a href="home.jsp"><img class="logo" src="Img/logo.png"/><a/>
       <a href="profile.jsp"><img class="menu_profile" src="Img/home_profile.png"/></a>
       <a href="search.jsp"><img class="menu_search" src="Img/home_search.png"/></a>
       <input type="submit" class="friend" style="background-image: url('Img/home_friends.png');" value="" onclick="Session('viewFriend');"/>
       <a href="BBS.jsp"><img class="menu_BBS" src="Img/home_BBS.png"/></a>
       <a href="help.jsp"><img class="menu_help" src="Img/home_help.png"/></a>
       <input type="hidden" name="SessionSet" id="Session" value="viewFriend"/>
       </form>
         <div class="bbsBody">
           <form action="PostServlet" method="post">
              <table class="bbsTable">
               <tr class="defaultTr"><td class="defaultTd" width="500px" height="40px">  
               <p class="titleRegiFont">Title</p></td>
               <td class="defaultTd" width="50px" height="40px">
                <p class="titleRegiFont">Author</p></td>
               <td class="defaultTd" width="100px" height="40px">
                   <p class="titleRegiFont">ReleaseTime</p></td>
               </tr>
               <% for(int i=0; i<postList.getSize(); i++){
                   out.println("<tr class=\"defaultTr\">");
                   out.println("<td width=\"200px\"><input class=\"viewPost\" type=\"submit\" value=\"view\""
                               + " onclick=\"SetSession('viewPost');SetPostID('"+ postList.getPostID(i) +"');\"/>");
                   out.println(postList.getTitle(i)+ "</td>");
                   out.println("<td width=\"100px\">"+postList.getAuthor(i)+"</td>");
                   out.println("<td width=\"100px\">"+postList.getTime(i)+"</td>");
                   //out.println("<td width=\"50px\">"+postList.getReplyCount(i)+"</td>");
                   out.println("</tr>");
               }%>
              </table>
               
           <p class="titleRegiFont">Add a new post.</p>
           <table>
               <tr><td  height="30px"><p class="titleRegiFont">Title</p></td>
                   <td  height="30px"><p class="titleRegiFont">Section:</p></td></tr>
               <tr><td><input type="text" name="title" style="width:400px;"/></td>
                   <td><select name="type">
                         <option value="General-Chat">General-Chat</option>
                         <option value="Rent-house">Rent-House</option>
                         <option value="Find-Companion">Find-Companion</option>
                         <option value="Success-case">Success-Case</option>
                       </select>
                   </td></tr>
            </table>
            <p class="titleRegiFont">Context:</p>
            <textarea name="context" cols="60" rows="6"></textarea>
            <input type="submit" class="addPost" value="" style="background-image: url('Img/BBS_add.png');" onclick="SetSession('addPost');"/>
            <input type="hidden" name="SessionSet" id="SessionSet"/>
            <input type="hidden" name="postid" id="postid"/>
           </form>
      </div>
    </body>
</html>

