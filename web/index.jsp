<%-- 
    Document   : index
    Created on : 2013-10-29, 18:11:19
    Author     : Linqing,Sijia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Love@Pitt</title>
        <link href="Resource/loveCSS.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="Resource/loveJS.js"></script>
    </head>
    
    <body class="defaultPage">
     <div class="bgDiv" style="background-image: url('Img/index_bg.jpg');"/>
       <img class="imgJoin" src="Img/index_join.png" onclick="showLogin();" style="cursor:pointer"/>
       <div class="formLogin" id="formLogin" style="display:none; background-image: url('Img/index_logform.png');">
        <img class="imgClose" id="imgClose" src="Img/index_close.png" onclick="closeLogin();" onmouseover="changeColor();" onmouseout="changeBack();" style="cursor:pointer"/>
         <form name="loginForm" method="post" action="UserServlet">
          <table class="loginTable">
            <tr class="defaultTr">
                <td class="defaultTd" width="100px" height="41px"><p class="titleLoginFont">User Name :</p></td>
                <td class="defaultTd" width="100px"><input type="text" name="username" style="width:100px;"/></td>
            </tr>
            <tr>
                <td class="defaultTd" width="100px" height="41px"><p class="titleLoginFont">Passord :</p></td>
                <td class="defaultTd" width="100px"><input type="password" name="password" style="width:100px;"/></td>
            </tr>
           </table>
        <div class="register">
            <input class="submitLogin" style="background-image: url('Img/index_login.png');" value="" type="submit" name="loginSubmit"
                   onclick="SetSession('Login');"/>
            <input class="goReg" style="background-image: url('Img/index_register.png');" value="" type="submit" name="regSubmit"
                   onclick="SetSession('Register');"/>
            <input type="hidden" name="SessionSet" id="SessionSet" />
        </div>
        </form>
      </div>
    </div>
    </body>
</html>
