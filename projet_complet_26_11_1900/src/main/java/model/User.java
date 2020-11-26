/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author remyc
 */
public class User {
    
    ///Attributes
    private String username;
    private String password;
    
    
    ///Constructors
    public User(String name, String pword){
        username = name;
        password = pword;
    }
    public User() {
        
    }
    
    
    ///Getters & Setters

    public String getUsername() {
        return username;
    }

    public void setUsername(String name) {
        this.username = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    
    ///Methods
}
