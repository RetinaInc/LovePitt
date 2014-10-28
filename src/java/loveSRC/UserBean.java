
package loveSRC;

import java.io.Serializable;
/**
 *
 * @author Linqing,Sijia
 */
public class UserBean extends Object implements Serializable{
    private int userID, age;
    private String userName, password, firstName, lastName, gender, email;
    private String Name;
    
    public UserBean(){
        userID = 0;  age = 0;
        userName = new String(); password = new String();
        firstName = new String(); lastName = new String();
        gender = new String(); email = new String();
    }
    
    public int getID(){ return userID; }
    public void setID(int value){ userID = value; }
    
    public String getUserName(){ return userName; }
    public void setUserName(String value){ userName = value; }
     
    public String getPassword(){ return password; }
    public void setPassword(String value){ password = value; }
    
    public String getFirstName(){ return firstName; }
    public void setFirstName(String value){ firstName = value; }
    
    public String getLastName(){ return lastName; }
    public void setLastName(String value){ lastName = value; }
    
    public String getGender(){ return gender; }
    public void setGender(String value){ gender = value; }
    
    public int getAge(){ return age; }
    public void setAge(int value){ age = value; }

    public String getEmail(){ return email; }
    public void setEmail(String value){ email = value; }
    
    public String getName(){ return Name; }
    public void setName(){ Name = firstName + ' ' + lastName; }
}
