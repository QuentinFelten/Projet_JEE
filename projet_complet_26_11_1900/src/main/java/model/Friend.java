/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**Class Friend will for the moment only to test bd requests
 * 
 * @author remyc
 */

public class Friend {
    ///Attributes
    private String lastName;
    private String firstName;
    
    
    ///Constructors
    public Friend () {
        
    }
    public Friend (String lname, String fname) {
        lastName = lname;
        firstName = fname;
    }
    

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    
}