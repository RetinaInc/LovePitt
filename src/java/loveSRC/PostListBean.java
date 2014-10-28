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
public class PostListBean extends Object implements Serializable {
    private ArrayList<Integer> postID;
    private ArrayList<String> title;
    private ArrayList<String> context;
    private ArrayList<String> author;
    private ArrayList<Date> time;
    
    public PostListBean(){
        postID = new ArrayList<Integer>();
        title = new ArrayList<String>();
        context = new ArrayList<String>();
        author = new ArrayList<String>();
        time = new ArrayList<Date>();
    }
    
    public int getPostID(int i){ return postID.get(i); }
    public void setPostID(int value){ postID.add(value); }
    
    public String getTitle(int i){ return title.get(i); }
    public void setTitle(String value){ title.add(value); }
    
    public String getContext(int i){ return context.get(i); }
    public void setContext(String value){ context.add(value); }
    
    public String getAuthor(int i){ return author.get(i); }
    public void setAuthor(String value){ author.add(value); }    
    
    public Date getTime(int i){ return time.get(i); }
    public void setTime(Date value){ time.add(value); }
    
    public int getSize(){ return postID.size(); }
}
