<%-- 
    Document   : profileEdit
    Created on : 2013-11-12, 20:59:50
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
      <div class="bgDiv" style="background-image: url('Img/home_bg.jpg');"/>
       <a href="home.jsp"><img class="logo" src="Img/logo.png"/><a/>
        <div class="formRegister"><form name="editForm" method="post" action="UserServlet">
        <table class="registerTable">
                <tr class="defaultTr">
                    <td class="defaultTd" width="150px" height="40px"><p class="titleRegiFont">User Name :</p></td>
                    <td class="defaultTd" width="200px" colspan="2">
                        <p><%out.println(userInfo.getUserName());%></p>
                    </td>
                </tr>
                <tr class="defaultTr">
                    <td class="defaultTd" width="150px" height="40px"><p class="titleRegiFont">Passord :</p></td>
                    <td class="defaultTd" width="200px" colspan="2">
                        <input type="password" name="password" style="width:150px;" />
                    </td>
                </tr>
                <tr class="defaultTr">
                    <td class="defaultTd" width="120px" height="40px"><p class="titleRegiFont">First Name :</p></td>
                    <td class="defaultTd" width="150px"><input type="text" name="firstname" style="width:100px";/></td>
                    <td class="defaultTd" width="120px" height="40px"><p class="titleRegiFont">Last Name :</p></td>
                    <td class="defaultTd" width="150px"><input type="text" name="lastname" style="width:100px";/></td>
                </td>
               <tr class="defaultTr">
                    <td class="defaultTd" width="150px" height="40px"><p class="titleRegiFont">Email :</p></td>
                    <td class="defaultTd" width="200px" colspan="2"><input type="text" name="email" id="email" style="width:150px";/></td>
               </tr>
                <tr class="defaultTr">
                    <td class="defaultTd" width="150px" height="40px"><p class="titleRegiFont">Age :</p></td>
                    <td class="defaultTd" width="200px" colspan="2"><input type="text" name="age" id="age" style="width:150px";/></td>
                </tr>
                <tr class="defaultTr">
                    <td class="defaultTd" height="40px"><p class="titleRegiFont">Gender :</p></td>
                    <td class="defaultTd"><p class="tdRegiFont" style="font-size: 18px;"><input name="gender" type="radio" value="female" />Female</p></td>
                    <td class="defaultTd"><p class="tdRegiFont" style="font-size: 18px;"><input name="gender" type="radio" value="male" />Male</p></td>
                </tr>
                <input type="hidden" name="SessionSet" id="SessionSet" value="EditSubmit" />
                <input type="hidden" name="userid" id="userid" value="<% out.println(userInfo.getID()); %>"/>
                <tr class="defaultTr">
                    <td class="defaultTd" width="200px" height="80px">
                    <input class="submitRegi" style="background-image: url('Img/register_submit.png');" type="submit" value="" name="Submit"/>
                    <td class="defaultTd" width="200px" height="80px" colspan="2">
                        <a href="profile.jsp"><img class="cancelEdit" src="Img/profile_cancel.png"/><a/>
                    </td>
                </tr>
            </table></form>
        </div>
      </div>
    </body>
</html>
