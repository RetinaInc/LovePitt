
package loveSRC;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 *
 * @author Linqing,Sijia
 */
public class UserServlet extends HttpServlet {
    private Connection conn = null;
    private Statement stmt;
    private String query;
    private ResultSet result;
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/love","root","");
            stmt = conn.createStatement();
        }
        catch( ClassNotFoundException cnfe){cnfe.printStackTrace();}
        catch (SQLException se){se.printStackTrace();}
       
        
        //login
        if(request.getParameter("SessionSet").equals("Login")){
            UserBean userInfo = new UserBean();
            session.setAttribute("userInfo",userInfo);
            try{
                query = "SELECT * FROM user "
                        + "WHERE userName = '" + request.getParameter("username") +"'"
                        + "AND password = '" + request.getParameter("password") +"'";
                result = stmt.executeQuery(query);
            }
            catch (SQLException se){se.printStackTrace();}
            try {
                if (result.next()){
                    userInfo.setID(result.getInt("userID"));
                    userInfo.setPassword(result.getString("password"));
                    userInfo.setAge(result.getInt("age"));
                    userInfo.setUserName(result.getString("userName"));
                    userInfo.setFirstName(result.getString("firstName"));
                    userInfo.setLastName(result.getString("lastName"));
                    userInfo.setGender(result.getString("gender"));
                    userInfo.setEmail(result.getString("email"));
                    userInfo.setName();
                    RequestDispatcher RD = getServletContext().getRequestDispatcher("/home.jsp");
                    RD.forward(request, response);
                }
                else {
                    RequestDispatcher RD = getServletContext().getRequestDispatcher("/error.jsp");
                    RD.forward(request, response);
                }
            }
            catch (SQLException se){se.printStackTrace();}
        }
        
        //register
        if(request.getParameter("SessionSet").equals("Register")){
            RequestDispatcher RD = getServletContext().getRequestDispatcher("/register.jsp");
            RD.forward(request, response);
        }
       //registerSubmit
        if(request.getParameter("SessionSet").equals("RegisterSubmit")){
            UserBean userInfo = new UserBean();
            session.setAttribute("userInfo", userInfo);
            try{
                query = "INSERT INTO user (userID, userName, password, firstName, lastName, gender, age, email)"
                        + " VALUES (null,'" + request.getParameter("username") + "','"
                        + request.getParameter("password") + "','" + request.getParameter("firstname") +
                        "','" + request.getParameter("lastname") + "','" + request.getParameter("gender") +
                        "','" + request.getParameter("age") +"','" + request.getParameter("email") +"');";
                stmt.executeUpdate(query);
                result = stmt.executeQuery("SELECT * FROM user WHERE userID = (SELECT MAX(userID) FROM user);");
            }
            catch (SQLException se){se.printStackTrace();}
            
            try {
                if (result.next()){
                    userInfo.setID(result.getInt("userID"));
                    userInfo.setPassword(result.getString("password"));
                    userInfo.setAge(result.getInt("age"));
                    userInfo.setUserName(result.getString("userName"));
                    userInfo.setFirstName(result.getString("firstName"));
                    userInfo.setLastName(result.getString("lastName"));
                    userInfo.setGender(result.getString("gender"));
                    userInfo.setEmail(result.getString("email"));
                    userInfo.setName();
                    RequestDispatcher RD = getServletContext().getRequestDispatcher("/home.jsp");
                    RD.forward(request, response);
                }
                else {
                    RequestDispatcher RD = getServletContext().getRequestDispatcher("/error.jsp");
                    RD.forward(request, response);
                }
            }
            catch (SQLException se){se.printStackTrace();}
        } 
        
        //logOff
        if(request.getParameter("SessionSet").equals("LogOff")){
            session.invalidate();
            RequestDispatcher RD = getServletContext().getRequestDispatcher("/index.jsp");
            RD.forward(request, response);
        }

        //edit
        if(request.getParameter("SessionSet").equals("EditSubmit")){
            UserBean userInfo = new UserBean();
            session.setAttribute("userInfo", userInfo);
            try{
                query = "UPDATE user SET "
                      + "password='" + request.getParameter("password") + "',"
                      + "firstName='"+ request.getParameter("firstname") +"',"
                      + "lastName='"+ request.getParameter("lastname") + "',"
                      + "gender='" + request.getParameter("gender")+ "',"
                      + "email='" + request.getParameter("email") +"',"
                      + "age='" + request.getParameter("age") + "' "
                      + "WHERE userID = " + request.getParameter("userid") + ";";
                stmt.executeUpdate(query);
                String query1 = "SELECT * FROM user WHERE userID = "+request.getParameter("userid")+";";
                result = stmt.executeQuery(query1);
                }
            catch (SQLException se){se.printStackTrace();}   
 
            try{
                if(result.next()){
                userInfo.setID(result.getInt("userID"));
                userInfo.setPassword(result.getString("password"));
                userInfo.setAge(result.getInt("age"));
                userInfo.setUserName(result.getString("userName"));
                userInfo.setFirstName(result.getString("firstName"));
                userInfo.setLastName(result.getString("lastName"));
                userInfo.setGender(result.getString("gender"));
                userInfo.setEmail(result.getString("email"));
                userInfo.setName();
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/profile.jsp");
                RD.forward(request, response);
             }
                else{
                    RequestDispatcher RD = getServletContext().getRequestDispatcher("/error.jsp");
                    RD.forward(request, response);
                }
            }
            catch (SQLException se){se.printStackTrace();}
        }

        //search
        if(request.getParameter("SessionSet").equals("Search")){
          UserListBean userList = new UserListBean();
          session.setAttribute("userList",userList);
          int top, bottom;
          String type = request.getParameter("searchType");
          if(request.getParameter("age").equals("1")){ top = 20; bottom = 0; }
          else if(request.getParameter("age").equals("2")){ top = 30; bottom = 21; }
               else if(request.getParameter("age").equals("3")){ top = 40; bottom = 31; }
                    else { top = 100; bottom = 41;  }
          try{
            if(type.equals("advance")){
               query = "SELECT * FROM user WHERE "
                    + "userName LIKE '%" + request.getParameter("username") + "%'"
                    + " AND userID <> " + request.getParameter("userid") +";";
            }
            else if(request.getParameter("gender").equals("none")){
              query = "SELECT * FROM user WHERE "
                    + "age BETWEEN " + bottom + " AND " + top +
                      " AND userID <> " + request.getParameter("userid") +";";
            }
            else {
              query = "SELECT * FROM user WHERE "
                    + "age BETWEEN " + bottom + " AND " + top + " AND "
                    + "gender = '" + request.getParameter("gender") + "' AND userID <>  "
                    + request.getParameter("userid") +";";
            }
            result = stmt.executeQuery(query);
            int i = 0;
            while(result.next()){
                userList.setID(result.getInt("userID"));
                userList.setUserName(result.getString("username"));
                userList.setEmail(result.getString("email"));
                userList.setAge(result.getInt("age"));
                userList.setGender(result.getString("gender"));
                userList.setName(result.getString("firstname")+","+result.getString("lastname"));
                i++;
            }
            RequestDispatcher RD = getServletContext().getRequestDispatcher("/searchList.jsp");
            RD.forward(request, response);
          }
          catch (SQLException se){se.printStackTrace();}
        }
        
        //view friend list
        if(request.getParameter("SessionSet").equals("viewFriend")){
            UserListBean userList = new UserListBean();
            session.setAttribute("userList",userList);
            UserBean userInfo = (UserBean) request.getSession().getAttribute("userInfo");
            out.println("gao");
            try{
                query = "SELECT * FROM user,friend WHERE user.userID = friend.friendID AND friend.userID = "+userInfo.getID()+";";
                out.println(query);
                result = stmt.executeQuery(query);
                int i = 0;
            while(result.next()){
                userList.setID(result.getInt("userID"));
                userList.setUserName(result.getString("username"));
                userList.setEmail(result.getString("email"));
                userList.setAge(result.getInt("age"));
                userList.setGender(result.getString("gender"));
                userList.setName(result.getString("firstname")+","+result.getString("lastname"));
                i++;
               }
            RequestDispatcher RD = getServletContext().getRequestDispatcher("/friend.jsp");
            RD.forward(request, response);
            }
            catch (SQLException se){se.printStackTrace();}
        }
        
        //add friend
        if(request.getParameter("SessionSet").equals("addFriend")){
            UserBean userInfo = (UserBean) request.getSession().getAttribute("userInfo");
            try{
                query = "INSERT INTO friend (userID, friendID, friendName) VALUES"
                        + " ("+ userInfo.getID()+", "+request.getParameter("userid")+","
                        + "(SELECT username FROM user WHERE userID = "+request.getParameter("userid")+"));";
                stmt.executeUpdate(query);
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/friendSuccess.jsp");
                RD.forward(request, response);
            }
            catch (SQLException se){se.printStackTrace();}
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
