
package model;

public class UserBean {
  
   private String username;
   private String password;
   private String mobile;
   private String role;

    public UserBean() {
    }
    
    
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getMobile() {
        return mobile;
    }

    public String getRole() {
        return role;
    }
    
     
   
}
