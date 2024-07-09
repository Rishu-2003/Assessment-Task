
package com.mycompany.groco.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int userId;
    @Column(name="Username",length=100)
    private String username;
    @Column(name="Email",length=100)
    private String userEmail;
    @Column(name="Password",length=10)
    private String password;
    @Column(name="Mobile_No",length=12)
    private String useMobile;
    @Column(name="Picture")
    private String userPic;
    @Column(name="Address",length=500)
    private String address;
    
    @Column(name="User_Type",length=50)
    private String userType;
    public User() {
    }

    public User(String username, String userEmail, String password, String useMobile, String userPic, String address,String userType) {
        this.username = username;
        this.userEmail = userEmail;
        this.password = password;
        this.useMobile = useMobile;
        this.userPic = userPic;
        this.address = address;
        this.userType=userType;
    }

    public User(int userId, String username, String userEmail, String password, String useMobile, String userPic, String address,String userType) {
        this.userId = userId;
        this.username = username;
        this.userEmail = userEmail;
        this.password = password;
        this.useMobile = useMobile;
        this.userPic = userPic;
        this.address = address;
        this.userType=userType;
    }

    public int getUserId() {
        return userId;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUseMobile() {
        return useMobile;
    }

    public void setUseMobile(String useMobile) {
        this.useMobile = useMobile;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", username=" + username + ", userEmail=" + userEmail + ", password=" + password + ", useMobile=" + useMobile + ", userPic=" + userPic + ", address=" + address + '}';
    }
    
}
