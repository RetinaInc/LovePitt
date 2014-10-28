/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loveSRC;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Linqing,Sijia
 */
public class PostServlet extends HttpServlet {
    
    private Connection conn = null;
    private Statement stmt;
    private String query;
    private String query1;
    private ResultSet result;
    private ResultSet rst;

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
            throws ServletException, IOException, ClassNotFoundException {
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
        
        //getPost
        if(request.getParameter("SessionSet").equals("BBS")){
            PostListBean postList = new PostListBean();
            session.setAttribute("postList", postList);
            try{
                if(request.getParameter("type").equals("all")){
                    query = "SELECT * FROM post ORDER BY time desc, postID desc limit "+ request.getParameter("count")+";";
                }
                else{
                    query = "SELECT * FROM post WHERE type = '"+ request.getParameter("type") +"' "
                            + "ORDER BY time desc, postID desc limit "+ request.getParameter("count")+";";
                }
                
                result = stmt.executeQuery(query);
                int i = 0;
                while(result.next()){
                    postList.setPostID(result.getInt("postID"));
                    postList.setAuthor(result.getString("author"));
                    postList.setTitle(result.getString("title"));
                    postList.setContext(result.getString("context"));
                    postList.setTime(result.getDate("time"));
                    i++;
                }
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/postList.jsp");
                RD.forward(request, response);
            }
            catch (SQLException se){se.printStackTrace();} 
            }
        
        //addPost
        if(request.getParameter("SessionSet").equals("addPost")){
            PostBean postInfo = new PostBean();
            session.setAttribute("postInfo", postInfo);
            UserBean userInfo = (UserBean) request.getSession().getAttribute("userInfo");
            try{
                query = "INSERT INTO post (postID, title, context, author, time, type)"
                        + " VALUES (null,'" + request.getParameter("title")+ "','" + request.getParameter("context") + "',"
                        + "'"+ userInfo.getUserName() +"',DATE_FORMAT(NOW(),'%Y-%m-%d'),'"+request.getParameter("type")+"');";
                stmt.executeUpdate(query);
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/success.jsp");
                RD.forward(request, response);
            }
            catch (SQLException se){se.printStackTrace();} 
        }
        
        //viewPost
        if(request.getParameter("SessionSet").equals("viewPost")){
            PostBean postInfo = new PostBean();
            session.setAttribute("postInfo", postInfo);
            try{
                query = "SELECT * FROM post WHERE postID ="+ request.getParameter("postid") +";";
                result = stmt.executeQuery(query);
                if(result.next()){
                    postInfo.setPostID(result.getInt("postID"));
                    postInfo.setTitle(result.getString("title"));
                    postInfo.setAuthor(result.getString("author"));
                    postInfo.setContext(result.getString("context"));
                    postInfo.setTime(result.getDate("time"));
               }
            }
            catch (SQLException se){se.printStackTrace();}
            
            ReplyBean replyInfo = new ReplyBean();
            session.setAttribute("replyInfo", replyInfo);
            try{
                query1 = "SELECT * FROM reply WHERE postID = "+request.getParameter("postid")+" ORDER BY time asc;";
                rst = stmt.executeQuery(query1);
                int i = 0;
                while (rst.next()){
                    replyInfo.setReplyID(rst.getInt("replyID"));
                    replyInfo.setReplyAuthor(rst.getString("author"));
                    replyInfo.setWord(rst.getString("word"));
                    replyInfo.setReplyTime(rst.getDate("time"));
                    replyInfo.setReplyPostID(rst.getInt("postID"));
                    i++;
                }
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/post.jsp");
                RD.forward(request, response);
              }
            catch (SQLException se){se.printStackTrace();}
        }
        
        //replyPost
        if(request.getParameter("SessionSet").equals("replyPost")){
            UserBean userInfo = (UserBean) request.getSession().getAttribute("userInfo");
            PostBean postInfo = (PostBean) request.getSession().getAttribute("postInfo");
            try{
                query = "INSERT INTO reply (replyID, word, postID, author, time) VALUES"
                        + "(null, '"+request.getParameter("word")+"',"+ postInfo.getPostID()+ ",'"
                        + userInfo.getUserName() +"',DATE_FORMAT(NOW(),'%Y-%m-%d'));";
                stmt.executeUpdate(query);
                RequestDispatcher RD = getServletContext().getRequestDispatcher("/success.jsp");
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
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
