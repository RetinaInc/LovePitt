<%-- 
    Document   : post
    Created on : 2013-12-5, 2:43:39
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="userInfo" class="loveSRC.UserBean" scope="session"/>
        <jsp:useBean id="postInfo" class="loveSRC.PostBean" scope="session"/>
        <jsp:useBean id="replyInfo" class="loveSRC.ReplyBean" scope="session"/>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resource/loveJS.js"></script>
        <title><% out.println(postInfo.getTitle()); %></title>
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
       <input type="hidden" name="SessionSet" id="SessionSet"/>
       </form>
           <div class="postBody">
               <h2><% out.println(postInfo.getTitle()); %></h2>
               <p class="postSub"><b>Author:</b> <% out.println(postInfo.getAuthor()); %>
                   <b>Time: </b><% out.println(postInfo.getTime()); %></p>
               <div class="postContent"><p class="postFont"><% out.println(postInfo.getContext()); %></p></div>
               <form method="post" action="PostServlet"/>
               <table class="replyTable">
               <% for(int i=0; i<replyInfo.getSize(); i++){ 
                   out.println("<tr class=\"defaultTr\">");
                   out.println("<td width=\"100px\">"+replyInfo.getReplyAuthor(i)+ ":</td>");
                   out.println("<td width=\"300px\">"+replyInfo.getWord(i)+"</td>");
                   out.println("<td width=\"100px\">"+replyInfo.getReplyTime(i)+"</td>");
                   out.println("</tr>");
                   }%>
                   <tr class="defaultTr">
                       <td colspan="2"><input type="text" name="word" style="width:300px;"/></td>
                       <td><input type="submit" class="replySub" value="" style="background-image: url('Img/post_reply.png');"/></td>
                   </tr>
               </table>
               <input type="hidden" name="SessionSet" value="replyPost"/>
               <input type="hidden" name="postid" value="<% out.println(postInfo.getPostID());%>"/>
           </form>
           </div>
          
      </div>
    </body>
</html>
