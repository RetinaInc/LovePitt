/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loveSRC;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Linqing,Sijia
 */
public class UserListBean {
    private ArrayList<Integer> userID;
    private ArrayList<String> userName;
    private ArrayList<String> email;
    private ArrayList<Integer> age;
    private ArrayList<String> gender;
    private ArrayList<String> name;
    
    public UserListBean(){
        userID = new ArrayList<Integer>();
        userName = new ArrayList<String>();
        email = new ArrayList<String>();
        age = new ArrayList<Integer>();
        gender = new ArrayList<String>();
        name = new ArrayList<String>();
    }
    
    public int getID(int i){ return userID.get(i); }
    public void setID(int value){ userID.add(value); }
    
    public String getUserName(int i){ return userName.get(i); }
    public void setUserName(String value){ userName.add(value); }
    
    public String getEmail(int i){ return email.get(i); }
    public void setEmail(String value){ email.add(value); }
    
    public int getAge(int i){ return age.get(i); }
    public void setAge(int value){ age.add(value); }
    
    public String getGender(int i){ return gender.get(i); }
    public void setGender(String value){ gender.add(value); }
    
    public String getName(int i){ return name.get(i); }
    public void setName(String value){ name.add(value); }
    
    public int getNum(){ return userName.size(); }
}
