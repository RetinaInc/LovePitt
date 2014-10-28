/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loveSRC;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
/**
 *
 * @author Linqing,Sijia
 */
public class PostBean extends Object implements Serializable {
    private int postID;
    private String title, context, author;
    private Date time;
 
    
    public PostBean(){
        postID = 0;
        title = new String(); context = new String();
        author = new String(); 
    }
    
    public int getPostID(){ return postID; }
    public void setPostID(int value){ postID =  value; }
    
    public String getTitle(){ return title; }
    public void setTitle(String value){ title =  value; }
    
    public String getContext(){ return context; }
    public void setContext(String value){ context =  value; }
    
    public String getAuthor(){ return author; }
    public void setAuthor(String value){ author =  value; }    
    
    public Date getTime(){ return time; }
    public void setTime(Date value){ time = value; }
}
