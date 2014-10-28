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
public class ReplyBean extends Object implements Serializable {

    private ArrayList<Integer> replyID;
    private ArrayList<String> word;
    private int postID;
    private ArrayList<String> author;
    private ArrayList<Date> time;
    
    public ReplyBean(){
        
         replyID = new ArrayList<Integer>();
         word = new ArrayList<String>();
         postID = 0;
         author = new ArrayList<String>();
         time = new ArrayList<Date>();
    }
    
    public int getReplyID(int i){ return replyID.get(i); }
    public void setReplyID(int value){ replyID.add(value); }
    
    public String getWord(int i){ return word.get(i); }
    public void setWord(String value){ word.add(value); }
    
    public int getReplyPostID(){ return postID; }
    public void setReplyPostID(int value){ postID = value; }
    
    public String getReplyAuthor(int i){ return author.get(i); }
    public void setReplyAuthor(String value){ author.add(value); }
    
    public Date getReplyTime(int i){ return time.get(i); }
    public void setReplyTime(Date value){ time.add(value); }
    
    public int getSize(){ return replyID.size(); }

}
